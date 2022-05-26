Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B3F534DDE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 13:10:59 +0200 (CEST)
Received: from localhost ([::1]:42186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuBOL-00083x-Ga
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 07:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuB2R-0001we-A9
 for qemu-devel@nongnu.org; Thu, 26 May 2022 06:48:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuB2O-0008Jr-MG
 for qemu-devel@nongnu.org; Thu, 26 May 2022 06:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653562096;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=iY6TLi9j3EtbpFppDRYVa18CyWmCV0e7SOJyukhK/4E=;
 b=RCEKYs2V8EnaMBTw5Sbhgop38lqi+7zqmrVAGgJVKgZFShK0gPtRau/VZJT0bI2IZyw31M
 thiGI5CDIwdS6+V0cYLeFe1i/A8GBCX4Tr7UV6YZJrZ+QHDEf8u5pADbDVsITtKiGyU/Sr
 VlRW5j3+4tTUrQddk3EzPeOesgPHDY0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-IkwihCT4Noe0Twih3UinoA-1; Thu, 26 May 2022 06:48:12 -0400
X-MC-Unique: IkwihCT4Noe0Twih3UinoA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26B88801228;
 Thu, 26 May 2022 10:48:12 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D2AC2166B26;
 Thu, 26 May 2022 10:48:10 +0000 (UTC)
Date: Thu, 26 May 2022 11:48:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Lei He <helei.sig11@bytedance.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org, jasowang@redhat.com,
 cohuck@redhat.com, pizhenwei@bytedance.com
Subject: Re: [PATCH v7 0/9] Introduce akcipher service for virtio-crypto
Message-ID: <Yo9a50mWNcopioEr@redhat.com>
References: <20220525090118.43403-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220525090118.43403-1-helei.sig11@bytedance.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've sent a pull request containing all the crypto/ changes,
as that covers stuff I maintain. ie patches 2-8

Patches 1 and 9, I'll leave for MST to review & queue since the
virtual hardware is not my area of knowledge.

On Wed, May 25, 2022 at 05:01:09PM +0800, Lei He wrote:
> v6 -> v7:
> - Fix serval build errors for some specific platforms/configurations.
> - Use '%zu' instead of '%lu' for size_t parameters.
> - AkCipher-gcrypt: avoid setting wrong error messages when parsing RSA
>   keys.
> - AkCipher-benchmark: process constant amount of sign/verify instead
>  of running sign/verify for a constant duration.
> 
> v5 -> v6:
> - Fix build errors and codestyles.
> - Add parameter 'Error **errp' for qcrypto_akcipher_rsakey_parse.
> - Report more detailed errors.
> - Fix buffer length check and return values of akcipher-nettle, allows caller to
>  pass a buffer with larger size than actual needed.
> 
> A million thanks to Daniel!
> 
> v4 -> v5:
> - Move QCryptoAkCipher into akcipherpriv.h, and modify the related comments.
> - Rename asn1_decoder.c to der.c.
> - Code style fix: use 'cleanup' & 'error' lables.
> - Allow autoptr type to auto-free.
> - Add test cases for rsakey to handle DER error.
> - Other minor fixes.
> 
> v3 -> v4:
> - Coding style fix: Akcipher -> AkCipher, struct XXX -> XXX, Rsa -> RSA,
> XXX-alg -> XXX-algo.
> - Change version info in qapi/crypto.json, from 7.0 -> 7.1.
> - Remove ecdsa from qapi/crypto.json, it would be introduced with the implemetion later.
> - Use QCryptoHashAlgothrim instead of QCryptoRSAHashAlgorithm(removed) in qapi/crypto.json.
> - Rename arguments of qcrypto_akcipher_XXX to keep aligned with qcrypto_cipher_XXX(dec/enc/sign/vefiry -> in/out/in2), and add qcrypto_akcipher_max_XXX APIs.
> - Add new API: qcrypto_akcipher_supports.
> - Change the return value of qcrypto_akcipher_enc/dec/sign, these functions return the actual length of result.
> - Separate ASN.1 source code and test case clean.
> - Disable RSA raw encoding for akcipher-nettle.
> - Separate RSA key parser into rsakey.{hc}, and implememts it with builtin-asn1-decoder and nettle respectivly.
> - Implement RSA(pkcs1 and raw encoding) algorithm by gcrypt. This has higher priority than nettle.
> - For some akcipher operations(eg, decryption of pkcs1pad(rsa)), the length of returned result maybe less than the dst buffer size, return the actual length of result instead of the buffer length to the guest side. (in function virtio_crypto_akcipher_input_data_helper)
> - Other minor changes.
> 
> Thanks to Daniel!
> 
> Eric pointed out this missing part of use case, send it here again.
> 
> In our plan, the feature is designed for HTTPS offloading case and other applications which use kernel RSA/ecdsa by keyctl syscall. The full picture shows bellow:
> 
> 
>                  Nginx/openssl[1] ... Apps
> Guest   -----------------------------------------
>                   virtio-crypto driver[2]
> -------------------------------------------------
>                   virtio-crypto backend[3]
> Host    -----------------------------------------
>                  /          |          \
>              builtin[4]   vhost     keyctl[5] ...
> 
> 
> [1] User applications can offload RSA calculation to kernel by keyctl syscall. There is no keyctl engine in openssl currently, we developed a engine and tried to contribute it to openssl upstream, but openssl 1.x does not accept new feature. Link:
>    https://github.com/openssl/openssl/pull/16689
> 
> This branch is available and maintained by Lei <helei.sig11@bytedance.com>
>    https://github.com/TousakaRin/openssl/tree/OpenSSL_1_1_1-kctl_engine
> 
> We tested nginx(change config file only) with openssl keyctl engine, it works fine.
> 
> [2] virtio-crypto driver is used to communicate with host side, send requests to host side to do asymmetric calculation.
>    https://lkml.org/lkml/2022/3/1/1425
> 
> [3] virtio-crypto backend handles requests from guest side, and forwards request to crypto backend driver of QEMU.
> 
> [4] Currently RSA is supported only in builtin driver. This driver is supposed to test the full feature without other software(Ex vhost process) and hardware dependence. ecdsa is introduced into qapi type without implementation, this may be implemented in Q3-2022 or later. If ecdsa type definition should be added with the implementation together, I'll remove this in next version.
> 
> [5] keyctl backend is in development, we will post this feature in Q2-2022. keyctl backend can use hardware acceleration(Ex, Intel QAT).
> 
> Setup the full environment, tested with Intel QAT on host side, the QPS of HTTPS increase to ~200% in a guest.
> 
> VS PCI passthrough: the most important benefit of this solution makes the VM migratable.
> 
> v2 -> v3:
> - Introduce akcipher types to qapi
> - Add test/benchmark suite for akcipher class
> - Seperate 'virtio_crypto: Support virtio crypto asym operation' into:
>  - crypto: Introduce akcipher crypto class
>  - virtio-crypto: Introduce RSA algorithm
> 
> v1 -> v2:
> - Update virtio_crypto.h from v2 version of related kernel patch.
> 
> v1:
> - Support akcipher for virtio-crypto.
> - Introduce akcipher class.
> - Introduce ASN1 decoder into QEMU.
> - Implement RSA backend by nettle/hogweed.
> 
> Lei He (6):
>   qapi: crypto-akcipher: Introduce akcipher types to qapi
>   crypto: add ASN.1 DER decoder
>   crypto: Implement RSA algorithm by hogweed
>   crypto: Implement RSA algorithm by gcrypt
>   test/crypto: Add test suite for crypto akcipher
>   tests/crypto: Add test suite for RSA keys
> 
> Zhenwei Pi (3):
>   virtio-crypto: header update
>   crypto: Introduce akcipher crypto class
>   crypto: Introduce RSA algorithm
> 
>  backends/cryptodev-builtin.c                   | 272 ++++++-
>  backends/cryptodev-vhost-user.c                |  34 +-
>  backends/cryptodev.c                           |  32 +-
>  crypto/akcipher-gcrypt.c.inc                   | 595 +++++++++++++++
>  crypto/akcipher-nettle.c.inc                   | 451 +++++++++++
>  crypto/akcipher.c                              | 108 +++
>  crypto/akcipherpriv.h                          |  55 ++
>  crypto/der.c                                   | 189 +++++
>  crypto/der.h                                   |  81 ++
>  crypto/meson.build                             |   6 +
>  crypto/rsakey-builtin.c.inc                    | 200 +++++
>  crypto/rsakey-nettle.c.inc                     | 158 ++++
>  crypto/rsakey.c                                |  44 ++
>  crypto/rsakey.h                                |  92 +++
>  hw/virtio/virtio-crypto.c                      | 323 ++++++--
>  include/crypto/akcipher.h                      | 158 ++++
>  include/hw/virtio/virtio-crypto.h              |   5 +-
>  include/standard-headers/linux/virtio_crypto.h |  82 +-
>  include/sysemu/cryptodev.h                     |  83 ++-
>  meson.build                                    |  11 +
>  qapi/crypto.json                               |  64 ++
>  tests/bench/benchmark-crypto-akcipher.c        | 137 ++++
>  tests/bench/meson.build                        |   1 +
>  tests/bench/test_akcipher_keys.inc             | 537 ++++++++++++++
>  tests/unit/meson.build                         |   2 +
>  tests/unit/test-crypto-akcipher.c              | 990 +++++++++++++++++++++++++
>  tests/unit/test-crypto-der.c                   | 290 ++++++++
>  27 files changed, 4854 insertions(+), 146 deletions(-)
>  create mode 100644 crypto/akcipher-gcrypt.c.inc
>  create mode 100644 crypto/akcipher-nettle.c.inc
>  create mode 100644 crypto/akcipher.c
>  create mode 100644 crypto/akcipherpriv.h
>  create mode 100644 crypto/der.c
>  create mode 100644 crypto/der.h
>  create mode 100644 crypto/rsakey-builtin.c.inc
>  create mode 100644 crypto/rsakey-nettle.c.inc
>  create mode 100644 crypto/rsakey.c
>  create mode 100644 crypto/rsakey.h
>  create mode 100644 include/crypto/akcipher.h
>  create mode 100644 tests/bench/benchmark-crypto-akcipher.c
>  create mode 100644 tests/bench/test_akcipher_keys.inc
>  create mode 100644 tests/unit/test-crypto-akcipher.c
>  create mode 100644 tests/unit/test-crypto-der.c
> 
> -- 
> 2.11.0
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


