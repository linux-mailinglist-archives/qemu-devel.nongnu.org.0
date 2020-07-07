Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE02216648
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 08:17:54 +0200 (CEST)
Received: from localhost ([::1]:50896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsgvR-0003Vu-ON
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 02:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jsgtr-0002Ps-AD; Tue, 07 Jul 2020 02:16:15 -0400
Received: from charlie.dont.surf ([128.199.63.193]:59860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jsgtp-0004Q3-1o; Tue, 07 Jul 2020 02:16:15 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 00639BF442;
 Tue,  7 Jul 2020 06:16:08 +0000 (UTC)
Date: Tue, 7 Jul 2020 08:16:03 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: update nvme entry
Message-ID: <20200707061603.GA463745@apples.localdomain>
References: <20200706194342.1996219-1-kbusch@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200706194342.1996219-1-kbusch@kernel.org>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 02:16:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jul  6 12:43, Keith Busch wrote:
> The nvme emulated device development pace has increased recently.  Klaus
> has offered to co-maintain, and since we have many new contributions
> coming through, we're adding a repository to accumulate and test new
> features.
> 
> Cc: Klaus Jensen <its@irrelevant.dk>
> Signed-off-by: Keith Busch <kbusch@kernel.org>

Acked-by: <k.jensen@samsung.com>

> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c31c878c63..fbeba04dc5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1793,10 +1793,12 @@ F: include/hw/virtio/virtio-crypto.h
>  
>  nvme
>  M: Keith Busch <kbusch@kernel.org>
> +M: Klaus Jensen <its@irrelevant.dk>
>  L: qemu-block@nongnu.org
>  S: Supported
>  F: hw/block/nvme*
>  F: tests/qtest/nvme-test.c
> +T: git git://git.infradead.org/qemu-nvme.git nvme-next
>  
>  megasas
>  M: Hannes Reinecke <hare@suse.com>
> -- 
> 2.24.1
> 
> 

