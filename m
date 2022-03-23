Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5BD4E5317
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 14:24:41 +0100 (CET)
Received: from localhost ([::1]:38756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX0ye-0006IJ-EU
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 09:24:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nX0iz-0006EB-3a
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 09:08:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nX0iw-000775-F9
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 09:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648040905;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=70BVFp/ay2GtzV9l/8pyutFT6h5mVJO5vmRO+wXGVxo=;
 b=A+2wORLWua9ujo08E2gKeVTN37PQzvbcV31/Ke/d4iIn3aY2ZQGqqbQUTxATpaWDukZ1uJ
 A6souul3uiqnW4o/ujjEcBPcg/nKvN4FLzQ/1Z8tDPx6wedQYObHodQ+0006rj4V3uLTRV
 iRbgmBnOELyvKEgovlWuOQWqgM69Rmc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-NABzQSV7NqqciiVi62vQng-1; Wed, 23 Mar 2022 09:08:22 -0400
X-MC-Unique: NABzQSV7NqqciiVi62vQng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8FAD29ABA29;
 Wed, 23 Mar 2022 13:08:21 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A93B1400E70;
 Wed, 23 Mar 2022 13:08:19 +0000 (UTC)
Date: Wed, 23 Mar 2022 13:08:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH v3 2/6] crypto-akcipher: Introduce akcipher types to qapi
Message-ID: <YjsbwNhayhkVJ9G0@redhat.com>
References: <20220323024912.249789-1-pizhenwei@bytedance.com>
 <20220323024912.249789-3-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220323024912.249789-3-pizhenwei@bytedance.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: herbert@gondor.apana.org.au, mst@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 arei.gonglei@huawei.com, linux-crypto@vger.kernel.org,
 Lei He <helei.sig11@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 23, 2022 at 10:49:08AM +0800, zhenwei pi wrote:
> From: Lei He <helei.sig11@bytedance.com>
> 
> Introduce akcipher types, also include RSA & ECDSA related types.
> 
> Signed-off-by: Lei He <helei.sig11@bytedance.com>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  qapi/crypto.json | 86 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/qapi/crypto.json b/qapi/crypto.json
> index 1ec54c15ca..d44c38e3b1 100644
> --- a/qapi/crypto.json
> +++ b/qapi/crypto.json
> @@ -540,3 +540,89 @@
>    'data': { '*loaded': { 'type': 'bool', 'features': ['deprecated'] },
>              '*sanity-check': 'bool',
>              '*passwordid': 'str' } }
> +##
> +# @QCryptoAkcipherAlgorithm:

Should be named  QCryptoAkCipherAlgorithm

> +#
> +# The supported algorithms for asymmetric encryption ciphers
> +#
> +# @rsa: RSA algorithm
> +# @ecdsa: ECDSA algorithm
> +#
> +# Since: 7.0
> +##
> +{ 'enum': 'QCryptoAkcipherAlgorithm',
> +  'prefix': 'QCRYPTO_AKCIPHER_ALG',
> +  'data': ['rsa', 'ecdsa']}
> +
> +##
> +# @QCryptoAkcipherKeyType:

Should be named  QCryptoAkCipherKeyType

> +#
> +# The type of asymmetric keys.
> +#
> +# Since: 7.0
> +##
> +{ 'enum': 'QCryptoAkcipherKeyType',
> +  'prefix': 'QCRYPTO_AKCIPHER_KEY_TYPE',
> +  'data': ['public', 'private']}
> +
> +##
> +# @QCryptoRsaHashAlgorithm:
> +#
> +# The hash algorithm for RSA pkcs1 padding algothrim
> +#
> +# Since: 7.0
> +##
> +{ 'enum': 'QCryptoRsaHashAlgorithm',
> +  'prefix': 'QCRYPTO_RSA_HASH_ALG',
> +  'data': [ 'md2', 'md3', 'md4', 'md5', 'sha1', 'sha256', 'sha384', 'sha512', 'sha224' ]}

We already have QCryptoHashAlgorithm and I don't see the
benefit in duplicating it here.

We don't have md2, md3, and md4 in QCryptoHashAlgorithm, but
that doesn't look like a real negative as I can't imagine
those should be used today.

> +##
> +# @QCryptoRsaPaddingAlgorithm:
> +#
> +# The padding algorithm for RSA.
> +#
> +# @raw: no padding used
> +# @pkcs1: pkcs1#v1.5
> +#
> +# Since: 7.0
> +##
> +{ 'enum': 'QCryptoRsaPaddingAlgorithm',
> +  'prefix': 'QCRYPTO_RSA_PADDING_ALG',
> +  'data': ['raw', 'pkcs1']}
> +
> +##
> +# @QCryptoCurveId:

Should be named  QCryptoCurveID

> +#
> +# The well-known curves, referenced from https://csrc.nist.gov/csrc/media/publications/fips/186/3/archive/2009-06-25/documents/fips_186-3.pdf
> +#
> +# Since: 7.0
> +##
> +{ 'enum': 'QCryptoCurveId',
> +  'prefix': 'QCRYPTO_CURVE_ID',
> +  'data': ['nist-p192', 'nist-p224', 'nist-p256', 'nist-p384', 'nist-p521']}


> +
> +##
> +# @QCryptoRsaOptions:

This should be named  QCryptoAkCipherOptionsRSA

> +#
> +# Specific parameters for RSA algorithm.
> +#
> +# @hash-algo: QCryptoRsaHashAlgorithm
> +# @padding-algo: QCryptoRsaPaddingAlgorithm
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'QCryptoRsaOptions',
> +  'data': { 'hash-algo':'QCryptoRsaHashAlgorithm',
> +            'padding-algo': 'QCryptoRsaPaddingAlgorithm'}}

Our naming convention is  'XXX-alg' rather than 'XXX-algo'.

> +
> +##
> +# @QCryptoEcdsaOptions:

This should be named  QCryptoAkCipherOptionsECDSA

> +#
> +# Specific parameter for ECDSA algorithm.
> +#
> +# @curve-id: QCryptoCurveId
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'QCryptoEcdsaOptions',
> +  'data': { 'curve-id': 'QCryptoCurveId' }}

Having these two structs standalone looks wrong to me. I suspect that
callers will need to be able to conditionally pass in either one, and
so require the API to use a discriminated union

  { 'union': 'QCryptoAkCipherOptions'
    'base': { 'algorithm': 'QCryptoAkCipherAlgorithm' },
    'discriminator': 'algorithm',
    'data': { 'rsa': 'QCryptoAkCipherOptionsRSA' ,
              'ecdsa': 'QCryptoAkCipherOptionsECDSA' } }


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


