Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E83328322
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:11:24 +0100 (CET)
Received: from localhost ([::1]:37820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGl8l-0000ig-L2
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:11:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lGl7D-0007zW-SB; Mon, 01 Mar 2021 11:09:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:36328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lGl7C-0002Zg-5S; Mon, 01 Mar 2021 11:09:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1613C64DBD;
 Mon,  1 Mar 2021 16:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614614984;
 bh=Ff/jZOqt4F9OD5N1uOKO6cuVd/7Sf3dy5XD4IVxAgxM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KrBnYf4WxZ3b9iOzbrB4X09lg0p/Ff+rZRGOJKOxUiNcX4C6hdtPw5+GxfWZwEOP6
 4zj14MHxG48sQRDwv1W6fYBKkUUpIKI5YcamfgzwTG9ew2WkzPk0gY7TtAWGwfSqN/
 O1nBXxHouR8vun0+auok7wjvvbgYfZiZdHl47WAPoYbg1HVT9i8dFzLlGZn/UGugM4
 VIruRthYwdR7aifFWMDRC3ZoPxKl7TcHd8Xbpm8Zo20ZpKEkyJ9ECmQpeL/ijsyCvX
 /SA8q8DtCRp425/o6UKi3lElYaENgmTHcXIlnPY4/h0Xg3F66upH1hnG7v42QcXoSF
 oyAF/6znsM+tw==
Date: Tue, 2 Mar 2021 01:09:40 +0900
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC v3 12/12] hw/block/nvme: add support for the format
 nvm command
Message-ID: <20210301160940.GC17228@redsun51.ssa.fujisawa.hgst.com>
References: <20210214230240.301275-1-its@irrelevant.dk>
 <20210214230240.301275-13-its@irrelevant.dk>
 <20210216231632.GG2708768@dhcp-10-100-145-180.wdc.com>
 <YCzTPdmLgQywAtf0@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCzTPdmLgQywAtf0@apples.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Minwoo Im <minwoo.im@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 17, 2021 at 09:26:37AM +0100, Klaus Jensen wrote:
> On Feb 16 15:16, Keith Busch wrote:
> > On Mon, Feb 15, 2021 at 12:02:40AM +0100, Klaus Jensen wrote:
> > > From: Minwoo Im <minwoo.im@samsung.com>
> > > 
> > > Format NVM admin command can make a namespace or namespaces to be
> > > with different LBA size and metadata size with protection information
> > > types.
> > > 
> > > This patch introduces Format NVM command with LBA format, Metadata, and
> > > Protection Information for the device. The secure erase operation things
> > > are yet to be added.
> > > 
> > > The parameter checks inside of this patch has been referred from
> > > Keith's old branch.
> > 
> > Oh, and here's the format command now, so my previous comment on patch
> > 11 doesn't matter.
> > 
> > > +struct nvme_aio_format_ctx {
> > > +    NvmeRequest   *req;
> > > +    NvmeNamespace *ns;
> > > +
> > > +    /* number of outstanding write zeroes for this namespace */
> > > +    int *count;
> > 
> > Shouldn't this count be the NvmeRequest's opaque value?
> 
> That is already occupied by `num_formats` which tracks formats of
> individual namespaces. `count` is for outstanding write zeroes on one
> particular namespace.

But why are they tracked separately? It looks like we only care about
the number of outstanding zero-out commands. It doesn't matter how that
number is spread across multiple namespaces.

