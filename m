Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F95F318454
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 05:26:23 +0100 (CET)
Received: from localhost ([::1]:44424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA3Yc-0006GI-2a
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 23:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lA3Wo-0005l5-ED; Wed, 10 Feb 2021 23:24:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:50566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lA3Wm-0002NP-Pv; Wed, 10 Feb 2021 23:24:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FC0164DF0;
 Thu, 11 Feb 2021 04:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613017466;
 bh=87LdYSXuAihNoPvfQ0/RqtayN29alOVrWy2jcEUomhc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DtEosbjyugnHN+gOrYU6QPlD+hK8fWnTPKHxWTRyr6hC0d1Nc+BS9ue27S1vX+shJ
 ++Axd092Zk5uKcFeyRiAkIO9cDQzzUfrZHBMktsfyiN8TqG0+E537CdC+Tqs7R73ai
 lZIkSXDe0T18QmzbURNEDe1ARANypn+D+1VrsqKe6jXj2vrlgfnsulZOQav/ME7jSd
 qDd4pbHo6zCTKLwcMacXyjwCqchgPjDcVTw4HEiK4i1ICHo9vxTxbjqeFVNNM/hkNc
 E44LN6I7H8jqm3CdupZ/zx8EIPAJXn+eA/dBNks/1gQjS5hRGQyqAZqU4vVQoGT0d8
 shswmrmmM/ACg==
Date: Thu, 11 Feb 2021 13:24:22 +0900
From: Keith Busch <kbusch@kernel.org>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH 3/3] hw/block/nvme: add nvme_inject_state HMP command
Message-ID: <20210211042422.GA28207@redsun51.ssa.fujisawa.hgst.com>
References: <20210210195252.19339-1-minwoo.im.dev@gmail.com>
 <20210210195252.19339-4-minwoo.im.dev@gmail.com>
 <20210211030011.GD23363@redsun51.ssa.fujisawa.hgst.com>
 <20210211033848.GE24885@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211033848.GE24885@localhost.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 12:38:48PM +0900, Minwoo Im wrote:
> On 21-02-11 12:00:11, Keith Busch wrote:
> > But I would prefer to see advanced retry tied to real errors that can be
> > retried, like if we got an EBUSY or EAGAIN errno or something like that.
> 
> I have seen a thread [1] about ACRE.  Forgive me If I misunderstood this
> thread or missed something after this thread.  It looks like CRD field in
> the CQE can be set for any NVMe error state which means it *may* depend on
> the device status.

Right! Setting CRD values is at the controller's discretion for any
error status as long as the host enables ACRE.

> And this patch just introduced a internal temporarily error state of
> the controller by returning Command Intrrupted status.

It's just purely synthetic, though. I was hoping something more natural
could trigger the status. That might not provide the deterministic
scenario you're looking for, though.

I'm not completely against using QEMU as a development/test vehicle for
corner cases like this, but we are introducing a whole lot of knobs
recently, and you practically need to be a QEMU developer to even find
them. We probably should step up the documentation in the wiki along
with these types of features.
 
> I think, in this stage, we can go with some errors in the middle of the
> AIO (nvme_aio_err()) for advanced retry.  Shouldn't AIO errors are
> retry-able and supposed to be retried ?

Sure, we can assume that receiving an error in the AIO callback means
the lower layers exhausted available recovery mechanisms.

