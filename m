Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8D04E4C13
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 06:19:08 +0100 (CET)
Received: from localhost ([::1]:45712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWtOl-0007g3-BY
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 01:19:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1nWtNB-0006bE-0E
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 01:17:29 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:40462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1nWtN8-0005Kf-VX
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 01:17:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C0E4A612C6;
 Wed, 23 Mar 2022 05:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB3BBC340E8;
 Wed, 23 Mar 2022 05:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648012638;
 bh=hWV7WPxG+2ZGxja3LKM0OHYGVJ2ahN4nlybJUl5BMHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i3XH7/7994YkqMJmgz1L6t/vZMI6iEzWgHmeX5pBiS8xE/Le5DdCQauB8x5GhFI5y
 IwV9M/rGJv9m/AKH/r2SX7KEyEmCn1l6pADPsJm1YU4tESaQejlk4tsFULSTFktNn9
 rNnjwafQs7aZGTJbAxLA7F77DTKdzxZAMXjTyZPFy1kXYUdvdKPK4SiprCT6ZSdp0n
 2X1k+skAcRqHD9AliTTODJzVIvNkqbqQkDCqNix/dprqwZ54UY9TA/TD3onsfYr+SC
 5N6oOUoGBtQouBinR+TXFm/FoBy58suXx3E5gbmFSEl6Qh7BOys7NfODR4bY2zU9gS
 ojDmEBg4D7T6g==
Date: Tue, 22 Mar 2022 22:17:16 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH v3 0/6] Support akcipher for virtio-crypto
Message-ID: <YjqtXFvfDq0kELl7@sol.localdomain>
References: <20220323024912.249789-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220323024912.249789-1-pizhenwei@bytedance.com>
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
 arei.gonglei@huawei.com, linux-crypto@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 23, 2022 at 10:49:06AM +0800, zhenwei pi wrote:
> v2 -> v3:
> - Introduce akcipher types to qapi
> - Add test/benchmark suite for akcipher class
> - Seperate 'virtio_crypto: Support virtio crypto asym operation' into:
>   - crypto: Introduce akcipher crypto class
>   - virtio-crypto: Introduce RSA algorithm
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
> Lei He (3):
>   crypto-akcipher: Introduce akcipher types to qapi
>   crypto: Implement RSA algorithm by hogweed
>   tests/crypto: Add test suite for crypto akcipher
> 
> Zhenwei Pi (3):
>   virtio-crypto: header update
>   crypto: Introduce akcipher crypto class
>   virtio-crypto: Introduce RSA algorithm

You forgot to describe the point of this patchset and what its use case is.
Like any other Linux kernel patchset, that needs to be in the cover letter.

- Eric

