provider "kubernetes-alpha" {
  host                   = "https://172.16.55.101:6443"
  client_key             = base64decode(LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFb2dJQkFBS0NBUUVBeEl2RnJGVmZxRytBVjZCRGxHUHloVWRoQm1LdnBJcmV5OXhvUVNEUzY2YXVyeWRUCmtUWTYzYTRDTEU4Z25HOG9RdFk0eW8rWVAweFRpMUNxVFhGMlJuRW1hODR3bkV4Qkx4Y2F5aHFFaG5HVWNxdkcKUHcxU1pJVEZoVmpYOWdtbjdJWjVycElZSThvVWwwM2JPZDBrU0dBeTlud1FRT09EQjhncUpKMU1GVGIvSjVvdwpqcDZZSkc4OHliYXhPS2hNcmdTaW9IZHlpYUdJY3dQa1dBd084YWYyM3FkQytUTTZvYWh4Z1c5K1hteFVZQkdVCkM4TUtqSWtLVm1KUEpxRFFVZmhuWEhvZzF5UW1QU3ZTb2FPWklXN3R4Q0M2UDdqNXdKWDBuNGJmTUwxUU05U2EKTVFxWmNCc1NpZ28yaFhrVzIwN0l0TXFrMHI5YWZ6ZEI0OWpiaVFJREFRQUJBb0lCQUdzTXNlS1dNVjY5TkVzRgp1Q2tuY3QwU3JvN2F5MDIwY1hyWmxsTDZ2TWFxNTNQdzJIdzc3RDMzVzZta2cxK1F6MzN2emNqT0F4OWV4QllhCkhsZkYxNlN3Vmp2YmR2QjZPL3FZKy9kZUVCWmw0SFBBaVY2b005c1owYmM2VjQzalhubmVHSUp6Z2dCa1BXalgKZC9NQk5wVFJDSkRscTdpYjhpOFgzNVJIdER2TTNweUVRb0hTMGllSzFDZEI4MkVxaU51VUtvbTRaMDRUQ0tqUQpjMFF0ZWVLQXBoSS96UWFGNGZxN1dmVFhEbkwwRzhCY3lXcEhyYWpLdCs3QnFQZTB5cStLdERMVDVDMmlyZVo4CkptL1hzTWtMQ2QwQUtOV2dDSHlRa3ZIbGI3U3FTSFFjcHlCeElNRFBuU2JDdzFCUjgxOUM3YlJyYlRsYkJCYTQKdFpzOEt5MENnWUVBME01RHBYN3NRSUxtNEt5bFhGTWgvRDdJQnpsU1RndFJER3JocHBoMUNSRXZmT29pUjY1awppWG5jenB6a0NIVU11cjc1ZjNWU3JEbmVCYzNHaHRzUDNsdWxDa2wwd01ISFBrbHgxakZSWlBEczNnSHNyK2gwClA1RmZ5QlVFQUhaeFpwU3NLa0R5S0F1OTB0eUVjSURrWXdIMjlyRmRWOUdFSXdrUEMrM3BRQzhDZ1lFQThQZ2wKVUxld01OOGY5REZHL0t5dVZ4cUNFTmZZSlNndldGMzh5Z0xxQmNpa1RvZTY4TmovWXF0VFFqYnJ1Z0JWY21WUQpDWGF1WkNoTzZVeHlWTG1aU2xpU0FTdU1WQkx1dzRaaVB2Y1F1aktsZzBhVENrclAxdHhHa0xNM1RZaE5MbUFvCjBxVElKUzhsZFlIWXNiVGd3Vm9qKzNpelVvV0R5Ui9Kbzk2NnVjY0NnWUJpRklFeCs2eDlvUDlTQ2NhaTEybmYKVXA0aXhvb2lucTR6WndFWGdBVjVmTmtSaytrR1FxUjI3d2NKQmlrV3orUnEwOG5lVlAzQWFHNGh5OGExRWJFaQpnV25FcXp4c1RwbUlhSGRRWlZvV1VCVHpNM1E2TExadUpac1lJTWNBY0tKVHpRSVIxdS9vWDV1S3NJcUZUZ1g1CmU3TEZyZ3BxZGIvYnRTV2NOT1NiZ1FLQmdDQnRGQUJucDRMOEUzMjF2OXF5bGdkTW51SUxXWit1WjZpWmhUSGQKOElYMHVQK0VUa2lvdXIwWlZ1dmJIaDk2ZWdVWjB3cGkrUmFyUWVzdENWbVRYQ2hnQU0yOWdYV3kwb1JuS2dOVgpGZUFvZnBOS3hQQ21ubzlJTndxend5Wmd5Qm9NZ0pIUDhNcm9MRDlDeU5rcEFQR2o0cUd0WFZ3bWNWUjRQWmNhCm1yL3pBb0dBRGErZ2M5ajRKUVBPYytONVhMVFN3bDNKU1B3Z2R6NWRqbW41c0Q2a0hOYmhiajYyUy9FWnI5Y2gKMSt6Y1VNQlNEU2Vhb0JlWlJCNGtyeWNucG9Dd0JtWW5jREhuQXBYT3JjUjk1SjJpQTFUY21WakJvalRzMXg3SApXYldHdW9DWVZqMmMva2l0c1IwN0VqcCtQa2tid2dTRFVTdkMxUFpkOE1SSDZ2QzQydG89Ci0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0tCg==)
  client_certificate     = base64decode(LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUM4akNDQWRxZ0F3SUJBZ0lJVVF2NnBMOUkxMVV3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TURBNU1qTXhNalV5TWpoYUZ3MHlNVEE1TWpNeE1qVTNNamhhTURReApGekFWQmdOVkJBb1REbk41YzNSbGJUcHRZWE4wWlhKek1Sa3dGd1lEVlFRREV4QnJkV0psY201bGRHVnpMV0ZrCmJXbHVNSUlCSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tDQVFFQXhJdkZyRlZmcUcrQVY2QkQKbEdQeWhVZGhCbUt2cElyZXk5eG9RU0RTNjZhdXJ5ZFRrVFk2M2E0Q0xFOGduRzhvUXRZNHlvK1lQMHhUaTFDcQpUWEYyUm5FbWE4NHduRXhCTHhjYXlocUVobkdVY3F2R1B3MVNaSVRGaFZqWDlnbW43SVo1cnBJWUk4b1VsMDNiCk9kMGtTR0F5OW53UVFPT0RCOGdxSkoxTUZUYi9KNW93anA2WUpHODh5YmF4T0toTXJnU2lvSGR5aWFHSWN3UGsKV0F3TzhhZjIzcWRDK1RNNm9haHhnVzkrWG14VVlCR1VDOE1LaklrS1ZtSlBKcURRVWZoblhIb2cxeVFtUFN2UwpvYU9aSVc3dHhDQzZQN2o1d0pYMG40YmZNTDFRTTlTYU1RcVpjQnNTaWdvMmhYa1cyMDdJdE1xazByOWFmemRCCjQ5amJpUUlEQVFBQm95Y3dKVEFPQmdOVkhROEJBZjhFQkFNQ0JhQXdFd1lEVlIwbEJBd3dDZ1lJS3dZQkJRVUgKQXdJd0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dFQkFMeXR4YmxCdnRPT3lHNkVmQUladWZkZy9FMFAxOG5CTUZCVgpXSXhEcGs0OFJ2WkZWaHNuY0hvOFkvdXRRcnZrd21XRUVOTzlMZmZLOUFWcURleDZTZmJLN1JUVVd1WjF1OHMxClp1ZzlDdjNzVVN2Zll2cXYxZDRweVlIV05ONit0UWRxMHo1RG5rTStuNi9MdkZ4SWFTVmhzLzBBT2ZodjRzck8KbU1vUHJGWkhqS01jN3BMTXVpTC9PU0Q3Slo0WmZobUpYL2NqSk43SUpEYldPRzN5Y3RVbjREa2lZekFQSmszTApoUk9pMXM0WDJxZGRqNndCMFN5TEJsUU1SZy9KZFptV21OY3RTcTY1b1BVK3Q1TEVtZjVrS1Y2ckJIWm5MWE1hCmx4Y1JBTENOaWhXQUlFMGViQnpPZERvYWlTS2VDWS9ybnNCaFpVeTZJYnVpYmhQd0RUUT0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=)
  cluster_ca_certificate = base64decode(LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN5ekNDQWJPZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJd01Ea3lNekV5TlRJeU9Gb1hEVE13TURreU1URXlOVGN5T0Zvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTWh6CmFML0QrNEYwT2FMMmlEdnlNbzhCUFVGUWpXS3hzSEgzd2paV29xMlY4MFhTY1ZIY2F5WXRCdHg3MVgrN2lnOXMKNzhDZVgvZTNBMFFiRXkyMXB2M1libHNjbWJBd2ZpdTVmMFhSRHlpVmFVK0UzdnlhaVA2NFlHVk9WWk9NbHI2bwpaTk8rdnc3MUFkV1NLY0ZUWngrNlcybFlCbGJHbjhMclB0YzFsSkREWkdVMGpod0taU3pVSXZpdmlyUGhySW0yCmJKZDdVNGN1UHEwb25IR3R0ZHpZaGJXOGpSTTl3UG50TE5qSFNXYk5nL1FtZXZpYmhYOUZJb1U2UmtzR1ZKcUsKQWp3dTJtQmFqQXl3bUR2U2JKY1ZxaTViYXhJbEE4bXFJaEl1NXY0bGNHKzBoZkdIc2t4RDN4dkxGQWg0bHJ2Ugo1WXpWRSs2STRTZXF6bGNOMHcwQ0F3RUFBYU1tTUNRd0RnWURWUjBQQVFIL0JBUURBZ0trTUJJR0ExVWRFd0VCCi93UUlNQVlCQWY4Q0FRQXdEUVlKS29aSWh2Y05BUUVMQlFBRGdnRUJBQmRqNG5JWE9hY3pVRzBPVWMvc3NRaVAKci9NSjRiU1pNdjJ2cW04eitneUpjWE9CajhCd2xGbnN6d3JWb1NJMGVoWkJkbFVoOVJMVENzNGpESFVyTFFGSApIUkRLdmVTdnIwWWZtT3Z1NUt5dG5tNE1ubVJteUd2N0ZUNllhbXFsS3dvK3B0QzdkUFJOR3o5aFFqQ0lENmhRClN1U1Z0T3RJRisrS04zQ0hhY0x5L21xakVFMkVJU3ZyVUFBTzBGT0RTWnRoclQ3K0htdW0zMEJ2eDFmeWd6VkMKaElrbjJIblpSRWh1N3oxbyt5dFJDQkRJMzFXTWtJZFVpblAvN2xaWmJUaXpFTjhEVVBoTWtTUk1rS1JnR2VFcwp2akJPcmFDaGtXaVhVUUFkQ0QvTkFxcERXRGVGZVV1Z1luaTlUeXFOT3FmaVpEWk9WUDg5OSs3MXN3SmdPaFE9Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K)
  server_side_planning   = true
}
provider "kubectl" {
  load_config_file = "false"
}
provider "kubernetes" {
  load_config_file = "false"
}
terraform {
  required_version = ">= 0.13"
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.6.2"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 1.13.1"
    }
    kubernetes-alpha = {
      source = "hashicorp/kubernetes-alpha"
      version = "~> 0.2.0"
    }
  }
}
