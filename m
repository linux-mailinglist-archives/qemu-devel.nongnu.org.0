Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B544318511
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 07:09:07 +0100 (CET)
Received: from localhost ([::1]:60940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA5A2-0000XN-1E
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 01:09:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lA57e-0008PZ-1p; Thu, 11 Feb 2021 01:06:38 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:32831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lA57c-0002X2-93; Thu, 11 Feb 2021 01:06:37 -0500
Received: by mail-pj1-x102b.google.com with SMTP id lw17so4156439pjb.0;
 Wed, 10 Feb 2021 22:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XQhvhpH1rshtG+OBfi83JJZ0ObXoh2md/1Qw9XZHXyU=;
 b=MQ0cCDFaJot8QKFzbrYD2RIt/EegxOSHd6JE3uw+G6MHB0Mws+wCOIpRetV2Ux1SvJ
 IFRS4fq7CgrnBxfWFC4NjBbku+SXldUNpzYNKOPOR4N6cGceGUduworGy7fq0qEjB8XI
 IsTN25OhYyFDzAhppHSuuHzYCmoMUAfCALfO/l8/E0z3Gjw8o+DCfNgIyxvmAB4y94K7
 SB9363XFxI4gLVdD05NOXffiH2tdNLZMaFeojL9MKc7Z2RWfk2dxTVXS3G9UQujkYWcv
 xppsluSpyZIvqBbUiAD898bCxQuJ7d9/uIlxcwL2cYIQk8HmLhJkpqEPuSE+mKN72BI7
 jrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XQhvhpH1rshtG+OBfi83JJZ0ObXoh2md/1Qw9XZHXyU=;
 b=RLa2RyLtqvzTKVcBp5fc2c4K/NH22diTdzvCxjp+gAYRKBwQKOIxXG4Na+rNuZjaUE
 gd9p1rNb6BUFMNlZhwRQ5fm2kCPX9Wu+xO2rpKb+UCBv2+IxLj3b4bbc6mEHaD4E3/g8
 /kkvjReiFaN3nL2ncoICt8Mmn3wj287DSzT8Qxqti3N4cyt+vw5RAIp0UTe0OoH5b1j/
 4i9oFUlbkG6sK633fSeEd6Hw5VT9W2rl3Ew6PHAMwp/aJgUcATBT19oYz5GMd2rqt5+6
 lj+Q2KYBkP7doK6PEdNBE1f3xpz7EFy1Z2ENEvc05rh1J3olvV4/QzH2UOOpyz07HwPc
 2P8g==
X-Gm-Message-State: AOAM531Hpv80hw52vhFNEcONk9yFJGmonHywghdeRCfJHe5OXgh6RGfA
 jMuV3LuWGkzKpmGBaqI2Ufs=
X-Google-Smtp-Source: ABdhPJw4TzmGCcx3Z5+f0coMk0Z5WKGKPlkhtLIyNZzuqBr0Idv1+Qw90iDUtAMeP42uyaaLxlb95g==
X-Received: by 2002:a17:90a:9dc5:: with SMTP id
 x5mr2453032pjv.133.1613023594525; 
 Wed, 10 Feb 2021 22:06:34 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id 3sm3691387pjk.26.2021.02.10.22.06.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Feb 2021 22:06:34 -0800 (PST)
Date: Thu, 11 Feb 2021 15:06:32 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [RFC PATCH 3/3] hw/block/nvme: add nvme_inject_state HMP command
Message-ID: <20210211060632.GG24885@localhost.localdomain>
References: <20210210195252.19339-1-minwoo.im.dev@gmail.com>
 <20210210195252.19339-4-minwoo.im.dev@gmail.com>
 <20210211030011.GD23363@redsun51.ssa.fujisawa.hgst.com>
 <20210211033848.GE24885@localhost.localdomain>
 <20210211042422.GA28207@redsun51.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210211042422.GA28207@redsun51.ssa.fujisawa.hgst.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 21-02-11 13:24:22, Keith Busch wrote:
> On Thu, Feb 11, 2021 at 12:38:48PM +0900, Minwoo Im wrote:
> > On 21-02-11 12:00:11, Keith Busch wrote:
> > > But I would prefer to see advanced retry tied to real errors that can be
> > > retried, like if we got an EBUSY or EAGAIN errno or something like that.
> > 
> > I have seen a thread [1] about ACRE.  Forgive me If I misunderstood this
> > thread or missed something after this thread.  It looks like CRD field in
> > the CQE can be set for any NVMe error state which means it *may* depend on
> > the device status.
> 
> Right! Setting CRD values is at the controller's discretion for any
> error status as long as the host enables ACRE.
> 
> > And this patch just introduced a internal temporarily error state of
> > the controller by returning Command Intrrupted status.
> 
> It's just purely synthetic, though. I was hoping something more natural
> could trigger the status. That might not provide the deterministic
> scenario you're looking for, though.

That makes snese.  If some status can be triggered more naturally,  that
would be much better.

> I'm not completely against using QEMU as a development/test vehicle for
> corner cases like this, but we are introducing a whole lot of knobs
> recently, and you practically need to be a QEMU developer to even find
> them. We probably should step up the documentation in the wiki along
> with these types of features.

Oh, that's a really good advice, really appreciate that one.

> > I think, in this stage, we can go with some errors in the middle of the
> > AIO (nvme_aio_err()) for advanced retry.  Shouldn't AIO errors are
> > retry-able and supposed to be retried ?
> 
> Sure, we can assume that receiving an error in the AIO callback means
> the lower layers exhausted available recovery mechanisms.

Okay, please let me find a way to trigger this kind of errors more
naturally.  I think this HMP command should be the last one to try if
there's nothing we can do really.

