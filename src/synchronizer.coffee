class Synchronizer
   diffs: (local_items, remote_items) ->
      results = []
      results.push item for item, i in remote_items when item not in local_items
      return results

root = exports ? window
root.Synchronizer = Synchronizer
