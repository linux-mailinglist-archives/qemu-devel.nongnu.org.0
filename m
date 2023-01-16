Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE85F66BCCB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 12:24:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHNa2-0003H1-JJ; Mon, 16 Jan 2023 06:23:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHNZb-0003Ec-Q1
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 06:22:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHNZV-0007H3-Sj
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 06:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673868157;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=VQdKSXz/5PqLlU+/l0YaxRd444bHysXNkj8+rNViuQE=;
 b=Y+6oW8blsQHXgnk9U95IKhRQYurnQOQZkUOFaA962ikUXGjRlP0OEyRiE+WL4pFr8XrJar
 bltlX+7tRk8oF3+fcPawa3JOLfUiiW1Ayl57TEaqpspNfJbag+Fhry3i2qQS5JHixpQAL5
 QN3XOMAeAznRgf+cnalJMehwcH4H9TA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-DwE2tfsYMla-ggfDGjz1-w-1; Mon, 16 Jan 2023 06:22:33 -0500
X-MC-Unique: DwE2tfsYMla-ggfDGjz1-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79C4380D0E3;
 Mon, 16 Jan 2023 11:22:32 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03CEC1121314;
 Mon, 16 Jan 2023 11:22:30 +0000 (UTC)
Date: Mon, 16 Jan 2023 11:22:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 eblake@redhat.com, armbru@redhat.com, michael.roth@amd.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [for-8.0 v2 06/11] cryptodev: Support statistics
Message-ID: <Y8UzdBuO8outKyyN@redhat.com>
References: <20221122140756.686982-1-pizhenwei@bytedance.com>
 <20221122140756.686982-7-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221122140756.686982-7-pizhenwei@bytedance.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 22, 2022 at 10:07:51PM +0800, zhenwei pi wrote:
> Introduce cryptodev statistics in QAPI, and record OPS/Bandwidth for
> each crypto device.
> 
> Example of this feature:
> virsh qemu-monitor-command vm '{"execute": "query-cryptodev"}' | jq
> {
>   "return": [
>     {
>       "service": [
>         "akcipher",
>         "mac",
>         "hash",
>         "cipher"
>       ],
>       "asym-stat": {
>         "encrypt-ops": 0,
>         "verify-bytes": 0,
>         "sign-ops": 0,
>         "verify-ops": 0,
>         "sign-bytes": 0,
>         "decrypt-bytes": 0,
>         "decrypt-ops": 0,
>         "encrypt-bytes": 0
>       },
>       "sym-stat": {
>         "encrypt-ops": 40,
>         "decrypt-bytes": 5376,
>         "decrypt-ops": 40,
>         "encrypt-bytes": 5376
>       },
>       "id": "cryptodev1",
>       "client": [
>         {
>           "queue": 0,
>           "type": "builtin",
>           "info": "cryptodev-builtin0"
>         }
>       ]
>     },
>     {
>       "service": [
>         "akcipher"
>       ],
>       "asym-stat": {
>         "encrypt-ops": 54,
>         "verify-bytes": 8704,
>         "sign-ops": 17,
>         "verify-ops": 34,
>         "sign-bytes": 340,
>         "decrypt-bytes": 9215,
>         "decrypt-ops": 36,
>         "encrypt-bytes": 13294
>       },
>       "id": "cryptodev0",
>       "client": [
>         {
>           "queue": 0,
>           "type": "lkcf",
>           "info": "cryptodev-lkcf0"
>         }
>       ]
>     }
>   ],
>   "id": "libvirt-424"
> }

In 7.1,  Paolo introduced the 'query-stats' command which was designed
as a pretty flexible/extensible mechanism for statistic reporting for
anything in QEMU. I think there's a decent argument to be made for
wiring cryptodev upto query-stats, rather than putting stats intot he
query-cryptodev command. This gives separation between querying
configuration info (which is what query-cryptodev does prior to this
patch) and querying runtime performance info.

> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  backends/cryptodev.c       | 81 +++++++++++++++++++++++++++++++++++---
>  include/sysemu/cryptodev.h | 30 ++++++++++++++
>  qapi/cryptodev.json        | 58 ++++++++++++++++++++++++++-
>  3 files changed, 162 insertions(+), 7 deletions(-)
> 
> diff --git a/backends/cryptodev.c b/backends/cryptodev.c
> index bf2f3234c9..d623bf3bff 100644
> --- a/backends/cryptodev.c
> +++ b/backends/cryptodev.c
> @@ -48,6 +48,18 @@ static int qmp_query_cryptodev_foreach(Object *obj, void *data)
>      info->id = g_strdup(object_get_canonical_path_component(obj));
>  
>      backend = CRYPTODEV_BACKEND(obj);
> +    if (backend->sym_stat) {
> +        info->has_sym_stat = true;
> +        info->sym_stat = g_memdup2(backend->sym_stat,
> +                                sizeof(QCryptodevBackendSymStat));
> +    }
> +
> +    if (backend->asym_stat) {
> +        info->has_asym_stat = true;
> +        info->asym_stat = g_memdup2(backend->asym_stat,
> +                                sizeof(QCryptodevBackendAsymStat));
> +    }
> +
>      services = backend->conf.crypto_services;
>      for (uint32_t i = 0; i < QCRYPTODEV_BACKEND_SERVICE__MAX; i++) {
>          if (services & (1 << i)) {
> @@ -111,6 +123,9 @@ void cryptodev_backend_cleanup(
>      if (bc->cleanup) {
>          bc->cleanup(backend, errp);
>      }
> +
> +    g_free(backend->sym_stat);
> +    g_free(backend->asym_stat);
>  }
>  
>  int cryptodev_backend_create_session(
> @@ -161,6 +176,52 @@ static int cryptodev_backend_operation(
>      return -VIRTIO_CRYPTO_NOTSUPP;
>  }
>  
> +static int cryptodev_backend_account(CryptoDevBackend *backend,
> +                 CryptoDevBackendOpInfo *op_info)
> +{
> +    enum QCryptodevBackendAlgType algtype = op_info->algtype;
> +    int len;
> +
> +    if (algtype == QCRYPTODEV_BACKEND_ALG_ASYM) {
> +        CryptoDevBackendAsymOpInfo *asym_op_info = op_info->u.asym_op_info;
> +        len = asym_op_info->src_len;
> +        switch (op_info->op_code) {
> +        case VIRTIO_CRYPTO_AKCIPHER_ENCRYPT:
> +            QCryptodevAsymStatIncEncrypt(backend, len);
> +            break;
> +        case VIRTIO_CRYPTO_AKCIPHER_DECRYPT:
> +            QCryptodevAsymStatIncDecrypt(backend, len);
> +            break;
> +        case VIRTIO_CRYPTO_AKCIPHER_SIGN:
> +            QCryptodevAsymStatIncSign(backend, len);
> +            break;
> +        case VIRTIO_CRYPTO_AKCIPHER_VERIFY:
> +            QCryptodevAsymStatIncVerify(backend, len);
> +            break;
> +        default:
> +            return -VIRTIO_CRYPTO_NOTSUPP;
> +        }
> +    } else if (algtype == QCRYPTODEV_BACKEND_ALG_SYM) {
> +        CryptoDevBackendSymOpInfo *sym_op_info = op_info->u.sym_op_info;
> +        len = sym_op_info->src_len;
> +        switch (op_info->op_code) {
> +        case VIRTIO_CRYPTO_CIPHER_ENCRYPT:
> +            QCryptodevSymStatIncEncrypt(backend, len);
> +            break;
> +        case VIRTIO_CRYPTO_CIPHER_DECRYPT:
> +            QCryptodevSymStatIncDecrypt(backend, len);
> +            break;
> +        default:
> +            return -VIRTIO_CRYPTO_NOTSUPP;
> +        }
> +    } else {
> +        error_report("Unsupported cryptodev alg type: %" PRIu32 "", algtype);
> +        return -VIRTIO_CRYPTO_NOTSUPP;
> +    }
> +
> +    return len;
> +}
> +
>  int cryptodev_backend_crypto_operation(
>                   CryptoDevBackend *backend,
>                   void *opaque1,
> @@ -169,14 +230,12 @@ int cryptodev_backend_crypto_operation(
>  {
>      VirtIOCryptoReq *req = opaque1;
>      CryptoDevBackendOpInfo *op_info = &req->op_info;
> -    enum QCryptodevBackendAlgType algtype = req->flags;
> +    int ret;
>  
> -    if ((algtype != QCRYPTODEV_BACKEND_ALG_SYM)
> -        && (algtype != QCRYPTODEV_BACKEND_ALG_ASYM)) {
> -        error_report("Unsupported cryptodev alg type: %" PRIu32 "", algtype);
> -        return -VIRTIO_CRYPTO_NOTSUPP;
> +    ret = cryptodev_backend_account(backend, op_info);
> +    if (ret < 0) {
> +        return ret;
>      }
> -
>      return cryptodev_backend_operation(backend, op_info, queue_index,
>                                         cb, opaque2);
>  }
> @@ -214,10 +273,20 @@ cryptodev_backend_complete(UserCreatable *uc, Error **errp)
>  {
>      CryptoDevBackend *backend = CRYPTODEV_BACKEND(uc);
>      CryptoDevBackendClass *bc = CRYPTODEV_BACKEND_GET_CLASS(uc);
> +    uint32_t services;
>  
>      if (bc->init) {
>          bc->init(backend, errp);
>      }
> +
> +    services = backend->conf.crypto_services;
> +    if (services & (1 << QCRYPTODEV_BACKEND_SERVICE_CIPHER)) {
> +        backend->sym_stat = g_new0(QCryptodevBackendSymStat, 1);
> +    }
> +
> +    if (services & (1 << QCRYPTODEV_BACKEND_SERVICE_AKCIPHER)) {
> +        backend->asym_stat = g_new0(QCryptodevBackendAsymStat, 1);
> +    }
>  }
>  
>  void cryptodev_backend_set_used(CryptoDevBackend *backend, bool used)
> diff --git a/include/sysemu/cryptodev.h b/include/sysemu/cryptodev.h
> index f68a4baf13..c154c52039 100644
> --- a/include/sysemu/cryptodev.h
> +++ b/include/sysemu/cryptodev.h
> @@ -252,8 +252,38 @@ struct CryptoDevBackend {
>      /* Tag the cryptodev backend is used by virtio-crypto or not */
>      bool is_used;
>      CryptoDevBackendConf conf;
> +    QCryptodevBackendSymStat *sym_stat;
> +    QCryptodevBackendAsymStat *asym_stat;
>  };
>  
> +#define QCryptodevSymStatInc(be, op, bytes) do { \
> +   be->sym_stat->op##_bytes += (bytes); \
> +   be->sym_stat->op##_ops += 1; \
> +} while (/*CONSTCOND*/0)
> +
> +#define QCryptodevSymStatIncEncrypt(be, bytes) \
> +            QCryptodevSymStatInc(be, encrypt, bytes)
> +
> +#define QCryptodevSymStatIncDecrypt(be, bytes) \
> +            QCryptodevSymStatInc(be, decrypt, bytes)
> +
> +#define QCryptodevAsymStatInc(be, op, bytes) do { \
> +    be->asym_stat->op##_bytes += (bytes); \
> +    be->asym_stat->op##_ops += 1; \
> +} while (/*CONSTCOND*/0)
> +
> +#define QCryptodevAsymStatIncEncrypt(be, bytes) \
> +            QCryptodevAsymStatInc(be, encrypt, bytes)
> +
> +#define QCryptodevAsymStatIncDecrypt(be, bytes) \
> +            QCryptodevAsymStatInc(be, decrypt, bytes)
> +
> +#define QCryptodevAsymStatIncSign(be, bytes) \
> +            QCryptodevAsymStatInc(be, sign, bytes)
> +
> +#define QCryptodevAsymStatIncVerify(be, bytes) \
> +            QCryptodevAsymStatInc(be, verify, bytes)
> +
>  /**
>   * cryptodev_backend_new_client:
>   *
> diff --git a/qapi/cryptodev.json b/qapi/cryptodev.json
> index 4cc4f4f0ed..f01f2d017a 100644
> --- a/qapi/cryptodev.json
> +++ b/qapi/cryptodev.json
> @@ -60,6 +60,60 @@
>              'type': 'QCryptodevBackendType',
>              '*info': 'str' } }
>  
> +##
> +# @QCryptodevBackendSymStat:
> +#
> +# The statistics of symmetric operation.
> +#
> +# @encrypt-ops: the operations of symmetric encryption
> +#
> +# @decrypt-ops: the operations of symmetric decryption
> +#
> +# @encrypt-bytes: the bytes of symmetric encryption
> +#
> +# @decrypt-bytes: the bytes of symmetric decryption
> +#
> +# Since: 8.0
> +##
> +{ 'struct': 'QCryptodevBackendSymStat',
> +  'data': { 'encrypt-ops': 'int',
> +            'decrypt-ops': 'int',
> +            'encrypt-bytes': 'int',
> +            'decrypt-bytes': 'int' } }
> +
> +##
> +# @QCryptodevBackendAsymStat:
> +#
> +# The statistics of asymmetric operation.
> +#
> +# @encrypt-ops: the operations of asymmetric encryption
> +#
> +# @decrypt-ops: the operations of asymmetric decryption
> +#
> +# @sign-ops: the operations of asymmetric signature
> +#
> +# @verify-ops: the operations of asymmetric verification
> +#
> +# @encrypt-bytes: the bytes of asymmetric encryption
> +#
> +# @decrypt-bytes: the bytes of asymmetric decryption
> +#
> +# @sign-bytes: the bytes of asymmetric signature
> +#
> +# @verify-bytes: the bytes of asymmetric verification
> +#
> +# Since: 8.0
> +##
> +{ 'struct': 'QCryptodevBackendAsymStat',
> +  'data': { 'encrypt-ops': 'int',
> +            'decrypt-ops': 'int',
> +            'sign-ops': 'int',
> +            'verify-ops': 'int',
> +            'encrypt-bytes': 'int',
> +            'decrypt-bytes': 'int',
> +            'sign-bytes': 'int',
> +            'verify-bytes': 'int' } }
> +
>  ##
>  # @CryptodevInfo:
>  #
> @@ -74,7 +128,9 @@
>  { 'struct': 'CryptodevInfo',
>    'data': { 'id': 'str',
>              'service': ['QCryptodevBackendServiceType'],
> -            'client': ['CryptodevBackendClient'] } }
> +            'client': ['CryptodevBackendClient'],
> +            '*sym-stat': 'QCryptodevBackendSymStat',
> +            '*asym-stat': 'QCryptodevBackendAsymStat' } }
>  
>  ##
>  # @query-cryptodev:
> -- 
> 2.20.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


