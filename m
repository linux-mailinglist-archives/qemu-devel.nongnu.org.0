Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FB850FBC7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 13:14:10 +0200 (CEST)
Received: from localhost ([::1]:60566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njJ8z-0000Vq-Fr
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 07:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njIdH-0005gI-Js
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 06:41:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njIdE-0000jF-Hp
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 06:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650969679;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LzcR4oZfwZMTHbb6j/VNuKteazvnRy6lFF1T4dO+868=;
 b=auJTBYJTEORuADX7l8NNs0JcF+a6ORlIOM92IokQUw6kV52bsN2aIknTIA/YKcRSUlos6O
 4ai88a936Ga7Cd41GbVhrymEfyA2qYCqhJvkgIHybluS2M1JF5jD2YKMEvWmQFl9e/fWl9
 6F893778djRUayi+WM+k5EAH9a38410=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-zqu51MFcMFK5wM-l1iOZuA-1; Tue, 26 Apr 2022 06:41:14 -0400
X-MC-Unique: zqu51MFcMFK5wM-l1iOZuA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B36B086B8A4;
 Tue, 26 Apr 2022 10:41:13 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E341B43E77A;
 Tue, 26 Apr 2022 10:41:11 +0000 (UTC)
Date: Tue, 26 Apr 2022 11:41:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH v4 3/8] crypto: Introduce akcipher crypto class
Message-ID: <YmfMRd/45DUjRJsC@redhat.com>
References: <20220411104327.197048-1-pizhenwei@bytedance.com>
 <20220411104327.197048-4-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220411104327.197048-4-pizhenwei@bytedance.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: helei.sig11@bytedance.com, mst@redhat.com, jasowang@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org, arei.gonglei@huawei.com,
 linux-crypto@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 11, 2022 at 06:43:22PM +0800, zhenwei pi wrote:
> Support basic asymmetric operations: encrypt, decrypt, sign and
> verify.
> 
> Co-developed-by: lei he <helei.sig11@bytedance.com>
> Signed-off-by: lei he <helei.sig11@bytedance.com>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  crypto/akcipher.c         | 102 +++++++++++++++++++++++++
>  crypto/akcipherpriv.h     |  43 +++++++++++
>  crypto/meson.build        |   1 +
>  include/crypto/akcipher.h | 151 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 297 insertions(+)
>  create mode 100644 crypto/akcipher.c
>  create mode 100644 crypto/akcipherpriv.h
>  create mode 100644 include/crypto/akcipher.h


> diff --git a/crypto/akcipherpriv.h b/crypto/akcipherpriv.h
> new file mode 100644
> index 0000000000..da9e54a796
> --- /dev/null
> +++ b/crypto/akcipherpriv.h
> @@ -0,0 +1,43 @@
> +/*
> + * QEMU Crypto asymmetric algorithms
> + *
> + * Copyright (c) 2022 Bytedance
> + * Author: zhenwei pi <pizhenwei@bytedance.com>
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + *
> + */
> +
> +#ifndef QCRYPTO_AKCIPHERPRIV_H
> +#define QCRYPTO_AKCIPHERPRIV_H
> +
> +#include "qapi/qapi-types-crypto.h"
> +
> +struct QCryptoAkCipherDriver {
> +    int (*encrypt)(QCryptoAkCipher *akcipher,
> +                   const void *in, size_t in_len,
> +                   void *out, size_t out_len, Error **errp);
> +    int (*decrypt)(QCryptoAkCipher *akcipher,
> +                   const void *out, size_t out_len,
> +                   void *in, size_t in_len, Error **errp);
> +    int (*sign)(QCryptoAkCipher *akcipher,
> +                const void *in, size_t in_len,
> +                void *out, size_t out_len, Error **errp);
> +    int (*verify)(QCryptoAkCipher *akcipher,
> +                  const void *in, size_t in_len,
> +                  const void *in2, size_t in2_len, Error **errp);
> +    int (*free)(QCryptoAkCipher *akcipher, Error **errp);
> +};
> +
> +#endif /* QCRYPTO_AKCIPHER_H */


> diff --git a/include/crypto/akcipher.h b/include/crypto/akcipher.h
> new file mode 100644
> index 0000000000..c1970b3b3b
> --- /dev/null
> +++ b/include/crypto/akcipher.h
> @@ -0,0 +1,151 @@
> +/*
> + * QEMU Crypto asymmetric algorithms
> + *
> + * Copyright (c) 2022 Bytedance
> + * Author: zhenwei pi <pizhenwei@bytedance.com>
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + *
> + */
> +
> +#ifndef QCRYPTO_AKCIPHER_H
> +#define QCRYPTO_AKCIPHER_H
> +
> +#include "qapi/qapi-types-crypto.h"
> +
> +typedef struct QCryptoAkCipher QCryptoAkCipher;

This belongs here.

> +typedef struct QCryptoAkCipherDriver QCryptoAkCipherDriver;

This and...

> +
> +struct QCryptoAkCipher {
> +    QCryptoAkCipherAlgorithm alg;
> +    QCryptoAkCipherKeyType type;
> +    int max_plaintext_len;
> +    int max_ciphertext_len;
> +    int max_signature_len;
> +    int max_dgst_len;
> +    QCryptoAkCipherDriver *driver;
> +};

...this should be in the akcipherpriv.h file though, since
they're only for internal usage.



> +/**
> + * qcrypto_akcipher_encrypt:
> + * @akcipher: akcipher context
> + * @in: plaintext pending to be encrypted
> + * @in_len: length of the plaintext, MUST less or equal to max_plaintext_len
> + * @out: buffer to store the ciphertext
> + * @out_len: the length of ciphertext buffer, usually equals to
> + *           max_ciphertext_len
> + * @errp: error pointer
> + *
> + * Encrypt data and write ciphertext into out
> + *
> + * Returns: length of ciphertext if encrypt succeed, otherwise -1 is returned
> + */
> +int qcrypto_akcipher_encrypt(QCryptoAkCipher *akcipher,
> +                             const void *in, size_t in_len,
> +                             void *out, size_t out_len, Error **errp);
> +
> +/**
> + * qcrypto_akcipher_decrypt:
> + * @akcipher: akcipher context
> + * @in: ciphertext to be decrypted
> + * @in_len: the length of ciphertext
> + * @out: buffer to store the plaintext
> + * @out_len: length of the plaintext buffer, usually less or equals to
> + *           max_plaintext_len

This field should be private, so we need to point people to the
methods instead. Rather than making this line so long...

> + * @errp: error pointer
> + *
> + * Decrypt ciphertext and write plaintext into out

...put here

  "@out_len should be less or equal to the size reported
   by a call to qcrypto_akcipher_max_plaintext_len()'

The same for other places where you mention limits.

> + *
> + * Returns: length of plaintext if decrypt succeed, otherwise -1 is returned
> + */
> +int qcrypto_akcipher_decrypt(QCryptoAkCipher *akcipher,
> +                             const void *in, size_t in_len,
> +                             void *out, size_t out_len, Error **errp);
> +
> +/**
> + * qcrypto_akcipher_sign:
> + * @akcipher: akcipher context
> + * @in: data to be signed
> + * @in_len: the length of data
> + * @out: buffer to store the signature
> + * @out_len: length of the signature buffer, usually equals to max_signature_len
> + * @errp: error pointer
> + *
> + * Generate signature for data using akcipher
> + *
> + * Returns: length of signature if succeed, otherwise -1 is returned
> + */
> +int qcrypto_akcipher_sign(QCryptoAkCipher *akcipher,
> +                          const void *in, size_t in_len,
> +                          void *out, size_t out_len, Error **errp);
> +
> +/**
> + * qcrypto_akcipher_verify:
> + * @akcipher: akcipher used to do verifycation
> + * @in: pointer to the signature
> + * @in_len: length of the signature
> + * @in2: pointer to original data
> + * @in2_len: the length of original data
> + * @errp: error pointer
> + *
> + * Verify the signature and the data match or not
> + *
> + * Returns: 0 for succeed, otherwise -1 is returned
> + */
> +int qcrypto_akcipher_verify(QCryptoAkCipher *akcipher,
> +                            const void *in, size_t in_len,
> +                            const void *in2, size_t in2_len, Error **errp);
> +
> +int qcrypto_akcipher_max_plaintext_len(QCryptoAkCipher *akcipher);
> +
> +int qcrypto_akcipher_max_ciphertext_len(QCryptoAkCipher *akcipher);
> +
> +int qcrypto_akcipher_max_signature_len(QCryptoAkCipher *akcipher);
> +
> +int qcrypto_akcipher_max_dgst_len(QCryptoAkCipher *akcipher);
> +
> +int qcrypto_akcipher_free(QCryptoAkCipher *akcipher, Error **errp);

Add in

G_DEFINE_AUTOPTR_CLEANUP_FUNC(QCryptoAkCipher, qcrypto_akcipher_free)


This allows users to do

   g_autoptr(QCryptoAkCIpher) cipher = qcrypto_akcipher_new(...)


and get automatic free'ing when exiting the scope.

> +
> +
> +#endif /* QCRYPTO_AKCIPHER_H */
> -- 
> 2.20.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


