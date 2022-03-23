Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C554E5814
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 19:04:28 +0100 (CET)
Received: from localhost ([::1]:60664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX5LO-00018O-PQ
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 14:04:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1nX5KU-0000Em-GO
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:03:30 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:36848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1nX5KS-0005tX-BB
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:03:30 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A1F2A612B4;
 Wed, 23 Mar 2022 18:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C119EC340E8;
 Wed, 23 Mar 2022 18:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648058605;
 bh=EW4AB6xPTi40ANVZMlu7Sat4T8RvhWvsc+5fxPd45SY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o4ybcsa7vXc14Dyxl5fgbNolkDLm6G9cBknp39APgL9rnbwfWprQa54cS+tnex7wq
 tMPv7FKeIfQsSUUJNva322spB+3Q6IwKJv2GsTNMKoxGU0oYrCkUBe3BRJ0kZzimDG
 XcIzE/mUiPXAVzvDXfHfdEXf3vcxLJCFnDUxerGRE69PRLcgNH54k4Teh4MZnvwms9
 7O9u9loWFJV1wMBh38iTVcESVRlOxst/YbtYaxMDCnxnZZcdKRyLq/AKKsH4YaV50+
 WafbaJZTbHa3P5TJX/sKhy586N12/4dZo+YPTqab6rHxhx6jSa0LAlFqfSJ68/o0Z4
 eace91XFYZ6xg==
Date: Wed, 23 Mar 2022 11:03:23 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: Re: [PATCH v3 0/6] Support akcipher for virtio-crypto
Message-ID: <Yjtg65rsnrzgyS5a@sol.localdomain>
References: <20220323024912.249789-1-pizhenwei@bytedance.com>
 <YjqtXFvfDq0kELl7@sol.localdomain>
 <f806c17c-cc7e-e2eb-e187-e83148160322@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f806c17c-cc7e-e2eb-e187-e83148160322@bytedance.com>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=ebiggers@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: herbert@gondor.apana.org.au, mst@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 arei.gonglei@huawei.com, linux-crypto@vger.kernel.org,
 "helei.sig11@bytedance.com" <helei.sig11@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 23, 2022 at 03:32:37PM +0800, zhenwei pi wrote:
> 
> On 3/23/22 13:17, Eric Biggers wrote:
> > On Wed, Mar 23, 2022 at 10:49:06AM +0800, zhenwei pi wrote:
> > > v2 -> v3:
> > > - Introduce akcipher types to qapi
> > > - Add test/benchmark suite for akcipher class
> > > - Seperate 'virtio_crypto: Support virtio crypto asym operation' into:
> > >    - crypto: Introduce akcipher crypto class
> > >    - virtio-crypto: Introduce RSA algorithm
> > > 
> > > v1 -> v2:
> > > - Update virtio_crypto.h from v2 version of related kernel patch.
> > > 
> > > v1:
> > > - Support akcipher for virtio-crypto.
> > > - Introduce akcipher class.
> > > - Introduce ASN1 decoder into QEMU.
> > > - Implement RSA backend by nettle/hogweed.
> > > 
> > > Lei He (3):
> > >    crypto-akcipher: Introduce akcipher types to qapi
> > >    crypto: Implement RSA algorithm by hogweed
> > >    tests/crypto: Add test suite for crypto akcipher
> > > 
> > > Zhenwei Pi (3):
> > >    virtio-crypto: header update
> > >    crypto: Introduce akcipher crypto class
> > >    virtio-crypto: Introduce RSA algorithm
> > 
> > You forgot to describe the point of this patchset and what its use case is.
> > Like any other Linux kernel patchset, that needs to be in the cover letter.
> > 
> > - Eric
> Thanks Eric for pointing this missing part.
> 
> This feature provides akcipher service offloading capability. QEMU side
> handles asymmetric requests via virtio-crypto devices from guest side, do
> encrypt/decrypt/sign/verify operations on host side, and return the result
> to guest.
> 
> This patchset implements a RSA backend by hogweed from nettle, it works
> together with guest patch:
> https://lkml.org/lkml/2022/3/1/1425

So what is the use case?

- Eric

