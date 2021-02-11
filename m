Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42C2318EE5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 16:40:29 +0100 (CET)
Received: from localhost ([::1]:38744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAE4z-0001z1-0T
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 10:40:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lAE2e-0000IY-Lq; Thu, 11 Feb 2021 10:38:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:40762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lAE2c-0002Uj-W5; Thu, 11 Feb 2021 10:38:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44D2E64E08;
 Thu, 11 Feb 2021 15:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613057881;
 bh=vI0AfmBHxqKX5AuKOswHayFec7wSdKjq+jxgY1RBxBY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FMvh2CTX2l2iMcEanetcZx//QYWPtkDJlCNeXtH3nhLNXf50ZmJZmyKAfgWdohU+s
 ldbVjtqnJciFCv0W2q3kcT0goHfo10kP4D/oGK2t184eX7AHQqg1HP6dh+P2bKc14J
 jXhLAsgC+VBmT4Sz6u1kPq01cs0Cr7b03RIDcO8LLD+NN456PACrg7nKyOqEwDHvkb
 TeS/B8PNqdkvVwJAXz0i857qeaFpEB9ALXjdVe42IIyp0HvMATOrPTd3eDgN7QO3S3
 3WdMvbOLsvnaeqWSVSGeCstOMqNonqX1MzgoATbwWbWA/PX/lXDzAOk3owL1HUdk/a
 I8trvMoc2VPjQ==
Date: Fri, 12 Feb 2021 00:37:54 +0900
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 2/2] hw/block/nvme: add write uncorrectable command
Message-ID: <20210211153754.GC28207@redsun51.ssa.fujisawa.hgst.com>
References: <20210210070646.730110-1-its@irrelevant.dk>
 <20210210070646.730110-3-its@irrelevant.dk>
 <20210211033732.GE23363@redsun51.ssa.fujisawa.hgst.com>
 <YCTuGUtwJweVQkXN@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCTuGUtwJweVQkXN@apples.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 09:43:05AM +0100, Klaus Jensen wrote:
> On Feb 11 12:37, Keith Busch wrote:
> 
> > Is there a use case with a real qemu guest wanting this?
> 
> Like for the extended metadata case (which also does not have a lot of
> "public" exposure, but definitely have enterprise use), our main
> motivation here was to ease testing for compliance suites and frameworks
> like SPDK. 

I'm okay with the metadata patches.

> I'm honestly have no clue what so ever what a real world use
> of Write Uncorrectable would be. It's been in the spec since 1.0, so
> there must have been some reason, Is it just to align with SCSI WRITE
> LONG? I'm not SCSI expert at all, but from what I can read it looks like
> that was also intended as a feature for testing read error conditions.

I don't think it's for testing purposes.

If you need to send a burst of non-atomic writes (ex: writing a RAID
stripe), a power failure can result in an inconsistent state where you
don't know at a block level which ones have old data or new data. If you
Write Uncorrectable first, you can never read old data, and thus have no
"write hole".

Journalling solves this better, and I'm not aware of any real
implementation relying on uncorrectable.

