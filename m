Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53936509B5C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 11:00:24 +0200 (CEST)
Received: from localhost ([::1]:51762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhSfm-0003wz-Qc
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 05:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhRu8-00080K-KF
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 04:11:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhRu2-00050r-HZ
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 04:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650528661;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=JZy9WiibqUuTKglYnuq9Ezc/wMdYUtsp9hB0KJ/eWJY=;
 b=hDWw+X3+qkPNoEC3rZAA+vzkQdTdutPbpGpB0Uf+rFjASOGcNudjTtxI55QiLeKVGlhAD1
 VjDIvXkMZU0eyG/TMKwzdb9PytJO+Rjtrlx9N0rCwdCo6xb0S/D+emA+5NoVRy+HXVTVtN
 jLBYcu6heQJ67FIWNV5oVVHXnLOEAsE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-fggkGlS5PrCoCN5DAICRdg-1; Thu, 21 Apr 2022 04:10:57 -0400
X-MC-Unique: fggkGlS5PrCoCN5DAICRdg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 770652801EBF;
 Thu, 21 Apr 2022 08:10:54 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C388A2166B46;
 Thu, 21 Apr 2022 08:10:47 +0000 (UTC)
Date: Thu, 21 Apr 2022 09:10:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: PING: [PATCH v4 0/8] Introduce akcipher service for virtio-crypto
Message-ID: <YmERhZJkeKIGZEyf@redhat.com>
References: <20220411104327.197048-1-pizhenwei@bytedance.com>
 <ed446ba2-75a0-aa0d-535e-0bb3501f558f@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ed446ba2-75a0-aa0d-535e-0bb3501f558f@bytedance.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: helei.sig11@bytedance.com, mst@redhat.com, jasowang@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org, arei.gonglei@huawei.com,
 linux-crypto@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 21, 2022 at 09:41:40AM +0800, zhenwei pi wrote:
> Hi Daniel,
> Could you please review this series?

Yes, its on my to do. I've been on holiday for 2 weeks, so still catching
up on the backlog of reviews.

> On 4/11/22 18:43, zhenwei pi wrote:
> > v3 -> v4:
> > - Coding style fix: Akcipher -> AkCipher, struct XXX -> XXX, Rsa -> RSA,
> > XXX-alg -> XXX-algo.
> > - Change version info in qapi/crypto.json, from 7.0 -> 7.1.
> > - Remove ecdsa from qapi/crypto.json, it would be introduced with the implemetion later.
> > - Use QCryptoHashAlgothrim instead of QCryptoRSAHashAlgorithm(removed) in qapi/crypto.json.
> > - Rename arguments of qcrypto_akcipher_XXX to keep aligned with qcrypto_cipher_XXX(dec/enc/sign/vefiry -> in/out/in2), and add qcrypto_akcipher_max_XXX APIs.
> > - Add new API: qcrypto_akcipher_supports.
> > - Change the return value of qcrypto_akcipher_enc/dec/sign, these functions return the actual length of result.
> > - Separate ASN.1 source code and test case clean.
> > - Disable RSA raw encoding for akcipher-nettle.
> > - Separate RSA key parser into rsakey.{hc}, and implememts it with builtin-asn1-decoder and nettle respectivly.
> > - Implement RSA(pkcs1 and raw encoding) algorithm by gcrypt. This has higher priority than nettle.
> > - For some akcipher operations(eg, decryption of pkcs1pad(rsa)), the length of returned result maybe less than the dst buffer size, return the actual length of result instead of the buffer length to the guest side. (in function virtio_crypto_akcipher_input_data_helper)
> > - Other minor changes.
> > 
> > Thanks to Daniel!
> > 
> > Eric pointed out this missing part of use case, send it here again.
> > 
> > In our plan, the feature is designed for HTTPS offloading case and other applications which use kernel RSA/ecdsa by keyctl syscall. The full picture shows bellow:
> > 
> > 
> >                    Nginx/openssl[1] ... Apps
> > Guest   -----------------------------------------
> >                     virtio-crypto driver[2]
> > -------------------------------------------------
> >                     virtio-crypto backend[3]
> > Host    -----------------------------------------
> >                    /          |          \
> >                builtin[4]   vhost     keyctl[5] ...
> > 
> > 
> > [1] User applications can offload RSA calculation to kernel by keyctl syscall. There is no keyctl engine in openssl currently, we developed a engine and tried to contribute it to openssl upstream, but openssl 1.x does not accept new feature. Link:
> >      https://github.com/openssl/openssl/pull/16689
> > 
> > This branch is available and maintained by Lei <helei.sig11@bytedance.com>
> >      https://github.com/TousakaRin/openssl/tree/OpenSSL_1_1_1-kctl_engine
> > 
> > We tested nginx(change config file only) with openssl keyctl engine, it works fine.
> > 
> > [2] virtio-crypto driver is used to communicate with host side, send requests to host side to do asymmetric calculation.
> >      https://lkml.org/lkml/2022/3/1/1425
> > 
> > [3] virtio-crypto backend handles requests from guest side, and forwards request to crypto backend driver of QEMU.
> > 
> > [4] Currently RSA is supported only in builtin driver. This driver is supposed to test the full feature without other software(Ex vhost process) and hardware dependence. ecdsa is introduced into qapi type without implementation, this may be implemented in Q3-2022 or later. If ecdsa type definition should be added with the implementation together, I'll remove this in next version.
> > 
> > [5] keyctl backend is in development, we will post this feature in Q2-2022. keyctl backend can use hardware acceleration(Ex, Intel QAT).
> > 
> > Setup the full environment, tested with Intel QAT on host side, the QPS of HTTPS increase to ~200% in a guest.
> > 
> > VS PCI passthrough: the most important benefit of this solution makes the VM migratable.
> > 
> > v2 -> v3:
> > - Introduce akcipher types to qapi
> > - Add test/benchmark suite for akcipher class
> > - Seperate 'virtio_crypto: Support virtio crypto asym operation' into:
> >    - crypto: Introduce akcipher crypto class
> >    - virtio-crypto: Introduce RSA algorithm
> > 
> > v1 -> v2:
> > - Update virtio_crypto.h from v2 version of related kernel patch.
> > 
> > v1:
> > - Support akcipher for virtio-crypto.
> > - Introduce akcipher class.
> > - Introduce ASN1 decoder into QEMU.
> > - Implement RSA backend by nettle/hogweed.
> > 
> > Lei He (4):
> >    crypto-akcipher: Introduce akcipher types to qapi
> >    crypto: add ASN.1 decoder
> >    crypto: Implement RSA algorithm by hogweed
> >    crypto: Implement RSA algorithm by gcrypt
> > 
> > Zhenwei Pi (3):
> >    virtio-crypto: header update
> >    crypto: Introduce akcipher crypto class
> >    crypto: Introduce RSA algorithm
> > 
> > lei he (1):
> >    tests/crypto: Add test suite for crypto akcipher
> > 
> >   backends/cryptodev-builtin.c                  | 261 ++++++-
> >   backends/cryptodev-vhost-user.c               |  34 +-
> >   backends/cryptodev.c                          |  32 +-
> >   crypto/akcipher-gcrypt.c.inc                  | 531 +++++++++++++
> >   crypto/akcipher-nettle.c.inc                  | 448 +++++++++++
> >   crypto/akcipher.c                             | 108 +++
> >   crypto/akcipherpriv.h                         |  43 ++
> >   crypto/asn1_decoder.c                         | 161 ++++
> >   crypto/asn1_decoder.h                         |  75 ++
> >   crypto/meson.build                            |   6 +
> >   crypto/rsakey-builtin.c.inc                   | 150 ++++
> >   crypto/rsakey-nettle.c.inc                    | 141 ++++
> >   crypto/rsakey.c                               |  43 ++
> >   crypto/rsakey.h                               |  96 +++
> >   hw/virtio/virtio-crypto.c                     | 323 ++++++--
> >   include/crypto/akcipher.h                     | 151 ++++
> >   include/hw/virtio/virtio-crypto.h             |   5 +-
> >   .../standard-headers/linux/virtio_crypto.h    |  82 +-
> >   include/sysemu/cryptodev.h                    |  83 +-
> >   meson.build                                   |  11 +
> >   qapi/crypto.json                              |  64 ++
> >   tests/bench/benchmark-crypto-akcipher.c       | 161 ++++
> >   tests/bench/meson.build                       |   4 +
> >   tests/bench/test_akcipher_keys.inc            | 537 +++++++++++++
> >   tests/unit/meson.build                        |   2 +
> >   tests/unit/test-crypto-akcipher.c             | 708 ++++++++++++++++++
> >   tests/unit/test-crypto-asn1-decoder.c         | 289 +++++++
> >   27 files changed, 4404 insertions(+), 145 deletions(-)
> >   create mode 100644 crypto/akcipher-gcrypt.c.inc
> >   create mode 100644 crypto/akcipher-nettle.c.inc
> >   create mode 100644 crypto/akcipher.c
> >   create mode 100644 crypto/akcipherpriv.h
> >   create mode 100644 crypto/asn1_decoder.c
> >   create mode 100644 crypto/asn1_decoder.h
> >   create mode 100644 crypto/rsakey-builtin.c.inc
> >   create mode 100644 crypto/rsakey-nettle.c.inc
> >   create mode 100644 crypto/rsakey.c
> >   create mode 100644 crypto/rsakey.h
> >   create mode 100644 include/crypto/akcipher.h
> >   create mode 100644 tests/bench/benchmark-crypto-akcipher.c
> >   create mode 100644 tests/bench/test_akcipher_keys.inc
> >   create mode 100644 tests/unit/test-crypto-akcipher.c
> >   create mode 100644 tests/unit/test-crypto-asn1-decoder.c
> > 
> 
> -- 
> zhenwei pi
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


