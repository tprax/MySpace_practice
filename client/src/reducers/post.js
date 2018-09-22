import axios from 'axios'

const POST = 'POST'
const ADD_POST ='ADD_POST'
const UPDATE_POST = 'UPDATE_POST'
const DELETE_POST = 'DELETE_POST'

export default (state = [], action) => {
  switch(action.type){
    case 'POST':
      return action.posts
    case 'ADD_POST':
      return [action.post, ...state]
    case 'UPDATE_POST':
      return state.map( a => {
        if (a.id === action.post.id)
          return action.post
        return a
      })
    case 'DELETE_POST':
      return state.filter(a => a.id !== action.id)
    default:
      return state
  }
}