Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5A03B52F8
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Jun 2021 13:02:39 +0200 (CEST)
Received: from localhost ([::1]:58446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxSYf-0008P8-La
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 07:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lxSWc-0006vj-KS; Sun, 27 Jun 2021 07:00:30 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:40690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lxSWa-0004gN-D0; Sun, 27 Jun 2021 07:00:30 -0400
Received: by mail-il1-x12b.google.com with SMTP id g3so5647660ilj.7;
 Sun, 27 Jun 2021 04:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rqORg3KVnkZdge+uDaAbnRPwmaFvDqpbYZIWwctt+JA=;
 b=lZhdUVnWEwQRAbHRl9nm1+gDB4jfdIndQMnddb/rIYzlx3Pg4YoIISZDTIDv8T2XGh
 G/QCpZdJM+FqEgsvy2mgusuUHth1H0oOwJvn1aVY/XRiAOMk0A1WSVOytFuP0yWCg2/8
 K3GmcvVHqbGCnLAttXtFLWo9gm6yAVEvdHe+QjeAWFfy5PGSrFACOGzR7MmQS9Nf0cRt
 IocFYtmEZWfUHl3T1WwIpGQKoXN0nHcsdRBi6xGg9WN7pQn8Qs1DUDX/e6uOmbixfh/h
 8Ej6Pz2n5BMb0SvqdBhxtbyg2gOFV4YLXw+9tEiqdWRkSQ5fuLx+hCHnH9Y+Qg+qD3ID
 DUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rqORg3KVnkZdge+uDaAbnRPwmaFvDqpbYZIWwctt+JA=;
 b=NNS5Ebqum7iWLD47kg73CNc5wywU/+Yc4FcKpNd0r4X0m6cJiLuUpWHpZsqlvkekbN
 HYx//q2Der+Pv3f/HIaxsSjRmHcZeTVBIVlKksLKoxWJchvDr7GN++zsS+iAasFEhsAA
 YZPUqDhs6onxLyxL6cCKt7dqFc05OzEyZddsLsruZmWHY4AXSwEUzrqFj6Lv/uspUsOQ
 xlm1I/MKJHHv65hwEs2h75SYMgqUtqPO6abEuF0x200/LW1abtWYCKA29H528/0ZyDTk
 eZO+ciBiIU1UHs5PewrOT1I06HnrU9YyXMeO8vCUg2dbfQ7iNR7mzkwP4CVGDrqZLzlZ
 FFtA==
X-Gm-Message-State: AOAM532KxQIG+40UDWXQ7Gnv9L02MqwTDkWFGLLjCX4qBXpRAaZrtlrG
 MXwcJv3cQG3GXtJzSCGJ53Eqjpspo66WBYFYqYk=
X-Google-Smtp-Source: ABdhPJynMdLahJRE59hM0q/auvDwrmG0ZlQKf/FJtqeig3we648oQCXOto6dIvUsfWX8OH6vMF4og3vEKcZl+lWrlbk=
X-Received: by 2002:a92:c708:: with SMTP id a8mr5486035ilp.177.1624791626134; 
 Sun, 27 Jun 2021 04:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210627083054.3920288-1-oro@il.ibm.com>
 <OFDCE9D738.9662FBDF-ON00258701.002FE1AF-00258701.00300179@ibm.com>
In-Reply-To: <OFDCE9D738.9662FBDF-ON00258701.002FE1AF-00258701.00300179@ibm.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Sun, 27 Jun 2021 13:00:09 +0200
Message-ID: <CAOi1vP-pZrqFyjh4cDoNy5pC=4ooQPp=9yXcZxzoDNj8W4=YGA@mail.gmail.com>
Subject: Re: [PATCH] block/rbd: Add support for rbd image encryption
To: Or Ozeri <ORO@il.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=idryomov@gmail.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Mykola Golub <to.my.trociny@gmail.com>, Danny Harnik <DANNYH@il.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jun 27, 2021 at 10:44 AM Or Ozeri <ORO@il.ibm.com> wrote:
>
> Ilya,
>
> I fixed according to your suggestions, except for the passphrase zeroing.
> Looks like it's not a one-liner, but rather a long list of ifdefs to try and cover all possible platforms/compilers (this is what I've seen they do in k5-int.h).
> I didn't want to copy this into rbd.c.
> I guess that the right solution would be adding a qemu utility function (not sure where exactly), but anyways perhaps this, like the changes I previously made to raw_format.c, should be made in different patch.

Hi Or,

Yes, given that there doesn't seem to be an existing straightforward
API for it, I don't think it is a blocker.  Just something to keep in
mind.

You also implemented one change that I didn't suggest -- storing
the encryption status in BDRVRBDState.  BTW it is a good practice
to include the version in the subject (e.g. [PATCH v3] ...) and
a per-version changelog in the description.

The way the encryption format is reported in this patch actually begs
more questions because now I think we need to differentiate between an
encrypted image for which the encryption profile has been loaded and
one for which it hasn't been loaded and probably also report the raw
size...

The previous approach of reporting the encryption format only for "raw"
images was a good starting point IMO.  I'd keep the bit that switches
from rbd_get_size() to s->image_size and drop everything else for now.

>
> Thanks,
> Or
>
> -----"Or Ozeri" <oro@il.ibm.com> wrote: -----
> To: qemu-devel@nongnu.org
> From: "Or Ozeri" <oro@il.ibm.com>
> Date: 06/27/2021 11:31AM
> Cc: qemu-block@nongnu.org, oro@il.ibm.com, kwolf@redhat.com, to.my.trociny@gmail.com, dannyh@il.ibm.com, berrange@redhat.com, idryomov@gmail.com
> Subject: [PATCH] block/rbd: Add support for rbd image encryption
>
> Starting from ceph Pacific, RBD has built-in support for image-level encryption.
> Currently supported formats are LUKS version 1 and 2.
>
> There are 2 new relevant librbd APIs for controlling encryption, both expect an
> open image context:
>
> rbd_encryption_format: formats an image (i.e. writes the LUKS header)
> rbd_encryption_load: loads encryptor/decryptor to the image IO stack
>
> This commit extends the qemu rbd driver API to support the above.
>
> Signed-off-by: Or Ozeri <oro@il.ibm.com>
> ---
>  block/rbd.c          | 380 ++++++++++++++++++++++++++++++++++++++++++-
>  qapi/block-core.json | 110 ++++++++++++-
>  2 files changed, 484 insertions(+), 6 deletions(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index f098a89c7b..dadecaf3da 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -73,6 +73,18 @@
>  #define LIBRBD_USE_IOVEC 0
>  #endif
>
> +#define RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN 8
> +
> +static const char rbd_luks_header_verification[
> +        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] = {
> +    'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 1
> +};
> +
> +static const char rbd_luks2_header_verification[
> +        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] = {
> +    'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 2
> +};
> +
>  typedef enum {
>      RBD_AIO_READ,
>      RBD_AIO_WRITE,
> @@ -106,6 +118,7 @@ typedef struct BDRVRBDState {
>      char *snap;
>      char *namespace;
>      uint64_t image_size;
> +    ImageInfoSpecificRbd image_info;
>  } BDRVRBDState;
>
>  static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
> @@ -341,6 +354,207 @@ static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
>      }
>  }
>
> +#ifdef LIBRBD_SUPPORTS_ENCRYPTION
> +static int qemu_rbd_convert_luks_options(
> +        RbdEncryptionOptionsLUKSBase *luks_opts,
> +        char **passphrase,
> +        size_t *passphrase_len,
> +        Error **errp)
> +{
> +    return qcrypto_secret_lookup(luks_opts->key_secret, (uint8_t **)passphrase,
> +                                 passphrase_len, errp);
> +}
> +
> +static int qemu_rbd_convert_luks_create_options(
> +        RbdEncryptionCreateOptionsLUKSBase *luks_opts,
> +        rbd_encryption_algorithm_t *alg,
> +        char **passphrase,
> +        size_t *passphrase_len,
> +        Error **errp)
> +{
> +    int r = 0;
> +
> +    r = qemu_rbd_convert_luks_options(
> +            qapi_RbdEncryptionCreateOptionsLUKSBase_base(luks_opts),
> +            passphrase, passphrase_len, errp);
> +    if (r < 0) {
> +        return r;
> +    }
> +
> +    if (luks_opts->has_cipher_alg) {
> +        switch (luks_opts->cipher_alg) {
> +            case QCRYPTO_CIPHER_ALG_AES_128: {
> +                *alg = RBD_ENCRYPTION_ALGORITHM_AES128;
> +                break;
> +            }
> +            case QCRYPTO_CIPHER_ALG_AES_256: {
> +                *alg = RBD_ENCRYPTION_ALGORITHM_AES256;
> +                break;
> +            }
> +            default: {
> +                r = -ENOTSUP;
> +                error_setg_errno(errp, -r, "unknown encryption algorithm: %u",
> +                                 luks_opts->cipher_alg);
> +                return r;
> +            }
> +        }
> +    } else {
> +        /* default alg */
> +        *alg = RBD_ENCRYPTION_ALGORITHM_AES256;
> +    }
> +
> +    return 0;
> +}
> +
> +static int qemu_rbd_encryption_format(rbd_image_t image,
> +                                      RbdEncryptionCreateOptions *encrypt,
> +                                      Error **errp)
> +{
> +    int r = 0;
> +    g_autofree char *passphrase = NULL;
> +    size_t passphrase_len;
> +    rbd_encryption_format_t format;
> +    rbd_encryption_options_t opts;
> +    rbd_encryption_luks1_format_options_t luks_opts;
> +    rbd_encryption_luks2_format_options_t luks2_opts;
> +    size_t opts_size;
> +    uint64_t raw_size, effective_size;
> +
> +    r = rbd_get_size(image, &raw_size);
> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "cannot get raw image size");
> +        return r;
> +    }
> +
> +    switch (encrypt->format) {
> +        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS: {
> +            memset(&luks_opts, 0, sizeof(luks_opts));
> +            format = RBD_ENCRYPTION_FORMAT_LUKS1;
> +            opts = &luks_opts;
> +            opts_size = sizeof(luks_opts);
> +            r = qemu_rbd_convert_luks_create_options(
> +                    qapi_RbdEncryptionCreateOptionsLUKS_base(&encrypt->u.luks),
> +                    &luks_opts.alg, &passphrase, &passphrase_len, errp);
> +            if (r < 0) {
> +                return r;
> +            }
> +            luks_opts.passphrase = passphrase;
> +            luks_opts.passphrase_size = passphrase_len;
> +            break;
> +        }
> +        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
> +            memset(&luks2_opts, 0, sizeof(luks2_opts));
> +            format = RBD_ENCRYPTION_FORMAT_LUKS2;
> +            opts = &luks2_opts;
> +            opts_size = sizeof(luks2_opts);
> +            r = qemu_rbd_convert_luks_create_options(
> +                    qapi_RbdEncryptionCreateOptionsLUKS2_base(
> +                            &encrypt->u.luks2),
> +                    &luks2_opts.alg, &passphrase, &passphrase_len, errp);
> +            if (r < 0) {
> +                return r;
> +            }
> +            luks2_opts.passphrase = passphrase;
> +            luks2_opts.passphrase_size = passphrase_len;
> +            break;
> +        }
> +        default: {
> +            r = -ENOTSUP;
> +            error_setg_errno(
> +                    errp, -r, "unknown image encryption format: %u",
> +                    encrypt->format);
> +            return r;
> +        }
> +    }
> +
> +    r = rbd_encryption_format(image, format, opts, opts_size);
> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "encryption format fail");
> +        return r;
> +    }
> +
> +    r = rbd_get_size(image, &effective_size);
> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "cannot get effective image size");
> +        return r;
> +    }
> +
> +    r = rbd_resize(image, raw_size + (raw_size - effective_size));
> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "cannot resize image after format");
> +        return r;
> +    }
> +
> +    return 0;
> +}
> +
> +static int qemu_rbd_encryption_load(rbd_image_t image,
> +                                    RbdEncryptionOptions *encrypt,
> +                                    ImageInfoSpecificRbd *image_info,
> +                                    Error **errp)
> +{
> +    int r = 0;
> +    g_autofree char *passphrase = NULL;
> +    size_t passphrase_len;
> +    rbd_encryption_luks1_format_options_t luks_opts;
> +    rbd_encryption_luks2_format_options_t luks2_opts;
> +    rbd_encryption_format_t format;
> +    rbd_encryption_options_t opts;
> +    size_t opts_size;
> +
> +    switch (encrypt->format) {
> +        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS: {
> +            memset(&luks_opts, 0, sizeof(luks_opts));
> +            format = RBD_ENCRYPTION_FORMAT_LUKS1;
> +            opts = &luks_opts;
> +            opts_size = sizeof(luks_opts);
> +            r = qemu_rbd_convert_luks_options(
> +                    qapi_RbdEncryptionOptionsLUKS_base(&encrypt->u.luks),
> +                    &passphrase, &passphrase_len, errp);
> +            if (r < 0) {
> +                return r;
> +            }
> +            luks_opts.passphrase = passphrase;
> +            luks_opts.passphrase_size = passphrase_len;
> +            image_info->encryption_format = RBD_IMAGE_ENCRYPTION_FORMAT_LUKS;
> +            break;
> +        }
> +        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
> +            memset(&luks2_opts, 0, sizeof(luks2_opts));
> +            format = RBD_ENCRYPTION_FORMAT_LUKS2;
> +            opts = &luks2_opts;
> +            opts_size = sizeof(luks2_opts);
> +            r = qemu_rbd_convert_luks_options(
> +                    qapi_RbdEncryptionOptionsLUKS2_base(&encrypt->u.luks2),
> +                    &passphrase, &passphrase_len, errp);
> +            if (r < 0) {
> +                return r;
> +            }
> +            luks2_opts.passphrase = passphrase;
> +            luks2_opts.passphrase_size = passphrase_len;
> +            image_info->encryption_format = RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2;
> +            break;
> +        }
> +        default: {
> +            r = -ENOTSUP;
> +            error_setg_errno(
> +                    errp, -r, "unknown image encryption format: %u",
> +                    encrypt->format);
> +            return r;
> +        }
> +    }
> +
> +    r = rbd_encryption_load(image, format, opts, opts_size);
> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "encryption load fail");
> +        return r;
> +    }
> +
> +    image_info->has_encryption_format = true;
> +    return 0;
> +}
> +#endif
> +
>  /* FIXME Deprecate and remove keypairs or make it available in QMP. */
>  static int qemu_rbd_do_create(BlockdevCreateOptions *options,
>                                const char *keypairs, const char *password_secret,
> @@ -358,6 +572,13 @@ static int qemu_rbd_do_create(BlockdevCreateOptions *options,
>          return -EINVAL;
>      }
>
> +#ifndef LIBRBD_SUPPORTS_ENCRYPTION
> +    if (opts->has_encrypt) {
> +        error_setg(errp, "RBD library does not support image encryption");
> +        return -ENOTSUP;
> +    }
> +#endif
> +
>      if (opts->has_cluster_size) {
>          int64_t objsize = opts->cluster_size;
>          if ((objsize - 1) & objsize) {    /* not a power of 2? */
> @@ -383,6 +604,28 @@ static int qemu_rbd_do_create(BlockdevCreateOptions *options,
>          goto out;
>      }
>
> +#ifdef LIBRBD_SUPPORTS_ENCRYPTION
> +    if (opts->has_encrypt) {
> +        rbd_image_t image;
> +
> +        ret = rbd_open(io_ctx, opts->location->image, &image, NULL);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret,
> +                             "error opening image '%s' for encryption format",
> +                             opts->location->image);

No need to include image name here.

Thanks,

                Ilya

