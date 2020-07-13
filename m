Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A1121D0EF
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 09:52:34 +0200 (CEST)
Received: from localhost ([::1]:55852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jutGL-0006Sd-D2
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 03:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jutFV-0005Yu-Oi; Mon, 13 Jul 2020 03:51:41 -0400
Received: from charlie.dont.surf ([128.199.63.193]:41572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jutFT-00026G-EW; Mon, 13 Jul 2020 03:51:41 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 7B21DBF506;
 Mon, 13 Jul 2020 07:51:35 +0000 (UTC)
Date: Mon, 13 Jul 2020 09:51:32 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 0/4] hw/block/nvme: Fix I/O BAR structure
Message-ID: <20200713075132.GA35777@apples.localdomain>
References: <20200630110429.19972-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200630110429.19972-1-philmd@redhat.com>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 03:51:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jun 30 13:04, Philippe Mathieu-Daudé wrote:
> Improvements for the I/O BAR structure:
> - correct pmrmsc register size (Klaus)
> - pack structures
> - align to 4KB
> 
> Since v2:
> - Added Klaus' tags with correct address
> 
> $ git backport-diff -u v2
> Key:
> [----] : patches are identical
> [####] : number of functional differences between upstream/downstream patch
> [down] : patch is downstream-only
> The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
> 
> 001/4:[----] [--] 'hw/block/nvme: Update specification URL'
> 002/4:[----] [--] 'hw/block/nvme: Use QEMU_PACKED on hardware/packet structures'
> 003/4:[----] [--] 'hw/block/nvme: Fix pmrmsc register size'
> 004/4:[----] [--] 'hw/block/nvme: Align I/O BAR to 4 KiB'
> 
> Philippe Mathieu-Daudé (4):
>   hw/block/nvme: Update specification URL
>   hw/block/nvme: Use QEMU_PACKED on hardware/packet structures
>   hw/block/nvme: Fix pmrmsc register size
>   hw/block/nvme: Align I/O BAR to 4 KiB
> 
>  include/block/nvme.h | 42 ++++++++++++++++++++++--------------------
>  hw/block/nvme.c      |  7 +++----
>  2 files changed, 25 insertions(+), 24 deletions(-)
> 
> -- 
> 2.21.3
> 
> 

Thanks Philippe! Applied to nvme-next.

