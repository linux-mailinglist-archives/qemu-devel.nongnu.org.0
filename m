Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B59654CEF
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 08:41:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8cfG-0003vq-Sx; Fri, 23 Dec 2022 02:40:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a36cbb7ae26730e9169d+7061+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1p8cf5-0003sw-RJ; Fri, 23 Dec 2022 02:40:12 -0500
Received: from bombadil.infradead.org ([2607:7c80:54:3::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a36cbb7ae26730e9169d+7061+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1p8cf0-0006OM-Ub; Fri, 23 Dec 2022 02:40:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Ad7Wi61cdhI81QBZ5+3P4bJPPYWD5DrY92FM55lMwjY=; b=z+X+/aKD+mYrSXaSU3J1r4c5hA
 WRrkOfUOPkBqUCELfs2HO0igIrG/ysu+m14ir+ZerY93q4Mpb9ayM4t9EN8BIhwk54sDQCTtRqUFT
 Uirsa53TuPvXi9mAEGscyp4Yft8uTrcD8s0l/tZQwsEKaIgj/GShV1cX07vwTqy2Ij53LRChLVjS1
 9rkBy2FMtnYRJoxgQRXm+ItowbbZvUvmS5JvWgEIu9gEGYPTCEOzdDxQ4jkFl4UEfMWT87i8u/XQC
 X4dkV1s41OnAUvBBkzd0dT8ZLz0NquTSeQ0X1+gdDQa6GHOt4eYSCGShdguyB8HQ34LF70lCMC9J8
 hutEswtA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p8ceo-004r1Q-Qf; Fri, 23 Dec 2022 07:39:54 +0000
Date: Thu, 22 Dec 2022 23:39:54 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Joel Granados <j.granados@samsung.com>
Cc: k.jensen@samsung.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 linux-nvme@lists.infradead.org, kbusch@kernel.org
Subject: Re: [PATCH v2 0/3] Add OCP extended log to nvme QEMU
Message-ID: <Y6VbSjV3l+/3CWmb@infradead.org>
References: <CGME20221114135426eucas1p271a54e44af5a53a45a7393ed34585ee0@eucas1p2.samsung.com>
 <20221114135043.2958100-1-j.granados@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114135043.2958100-1-j.granados@samsung.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2607:7c80:54:3::133;
 envelope-from=BATV+a36cbb7ae26730e9169d+7061+infradead.org+hch@bombadil.srs.infradead.org;
 helo=bombadil.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Please don't do this.  OCP is acting as a counter standard to the
proper NVMe standard here and should in absolutely no way be supported
by open source projects that needs to stick to the actual standards.

Please work with the NVMe technical working group to add this (very
useful) functionality to NVMe proper first.

On Mon, Nov 14, 2022 at 02:50:40PM +0100, Joel Granados wrote:
> The motivation and description are contained in the last patch in this set.
> Will copy paste it here for convenience:
> 
>     In order to evaluate write amplification factor (WAF) within the storage
>     stack it is important to know the number of bytes written to the
>     controller. The existing SMART log value of Data Units Written is too
>     coarse (given in units of 500 Kb) and so we add the SMART health
>     information extended from the OCP specification (given in units of bytes).
> 
>     To accommodate different vendor specific specifications like OCP, we add a
>     multiplexing function (nvme_vendor_specific_log) which will route to the
>     different log functions based on arguments and log ids. We only return the
>     OCP extended smart log when the command is 0xC0 and ocp has been turned on
>     in the args.
> 
>     Though we add the whole nvme smart log extended structure, we only populate
>     the physical_media_units_{read,written}, log_page_version and
>     log_page_uuid.
> 
> V1 changes:
> 1. I moved the ocp parameter from the namespace to the subsystem as it is
>    defined there in the OCP specification
> 2. I now accumulate statistics from all namespaces and report them back on
>    the extended log as per the spec.
> 3. I removed the default case in the switch in nvme_vendor_specific_log as
>    it does not have any special function.
> 
> Joel Granados (3):
>   nvme: Move adjustment of data_units{read,written}
>   nvme: Add ocp to the subsys
>   nvme: Add physical writes/reads from OCP log
> 
>  hw/nvme/ctrl.c       | 70 ++++++++++++++++++++++++++++++++++++++++----
>  hw/nvme/nvme.h       |  1 +
>  hw/nvme/subsys.c     |  4 +--
>  include/block/nvme.h | 36 +++++++++++++++++++++++
>  4 files changed, 103 insertions(+), 8 deletions(-)
> 
> -- 
> 2.30.2
> 
> 
---end quoted text---

