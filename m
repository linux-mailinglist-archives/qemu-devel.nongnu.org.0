Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B08D6A6726
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 05:53:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXERA-00064Y-4h; Tue, 28 Feb 2023 23:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eldon-qemu@eldondev.com>)
 id 1pXER7-000643-Mu
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 23:51:29 -0500
Received: from [209.195.0.149] (helo=npcomp.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eldon-qemu@eldondev.com>)
 id 1pXER5-0002vX-Iw
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 23:51:29 -0500
Received: by npcomp.net (Postfix, from userid 1000)
 id B05E41091C; Wed,  1 Mar 2023 04:51:24 +0000 ()
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eldondev.com;
 s=eldondev; t=1677646284;
 bh=lJKQ6kVC8D6bTJDKYHz3l8xYVKFK+QwgOcMAe2XW95w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=l2cOJxxOy7/gDR5Qkz83T3m/4kDxW9XTu0kbfHfx6OuFKBFTLVDzmgp/jEJSS7v0h
 xyr9QMPkwDy1izNUD9UBbCpVHhxM2dRQDuIEbgxNlldPS+yxTbxaLri04EgCeyDxSF
 Y6XjGY+FIw350UYGHq9E1sCg+oPe7ArxbtN78/EA=
Date: Wed, 1 Mar 2023 04:51:24 +0000
From: Eldon Stegall <eldon-qemu@eldondev.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Ben Dooks <qemu@ben.fluff.org>, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: out of CI pipeline minutes again
Message-ID: <Y/7ZzH/X5eb3vhPG@invalid>
References: <CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com>
 <20230223152836.dpn4z5fy6jg44wqi@hetzy.fluff.org>
 <Y/eHLCKcdYk0V4Tt@redhat.com> <Y/fkf3Cya1NOopQA@invalid>
 <Y/zhZ4brfdQ7nwLI@redhat.com>
 <CAJSP0QX2tkaVZh0FX4Ke8EWn7tO9qm76YnRCHe6-UxWJg6LzTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QX2tkaVZh0FX4Ke8EWn7tO9qm76YnRCHe6-UxWJg6LzTQ@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 209.195.0.149 (failed)
Received-SPF: pass client-ip=209.195.0.149;
 envelope-from=eldon-qemu@eldondev.com; helo=npcomp.net
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, Feb 27, 2023 at 12:43:55PM -0500, Stefan Hajnoczi wrote:
> - Personally, I don't think this should exclude other efforts like
> Eldon's. We can always add more private runners!

Hi!
Thanks so much to Alex, Thomas, Gerd, et al for the pointers.

Although the month has passed and presumably gitlab credits have
replenished, I am interested in continuing my efforts to replicate the
shared runner capabilities. After some tinkering I was able to utilise
Gerd's stateless runner strategy with a few changes, and had a number of
tests pass in a pipeline on my repo:

https://gitlab.com/eldondev/qemu/-/pipelines/791573670

Looking at the failures, it seems that some may already be addressed in
patchsets, and some may be attributable to things like open file handle
count, which would be useful to configure directly on the d-in-d
runners, so I will investigate those after integrating the changes from
the past couple of days.

I have been reading through Alex's patchsets to lower CI time in the
hopes that I might be able to contribute something there from my
learnings on these pipelines. If there is an intent to switch to the
kubernetes gitlab executor, I have worked with kubernetes a number of
times in the past, and I can trial that as well.

Even with the possibility of turning on Azure and avoiding these monthly
crunches, maybe I can provide some help improving the turnaround time of
some of the jobs themselves, once I polish off greening the remaining
failures on my fork.

Forgive me if I knock around a bit here while I figure out how to be
useful.

Best,
Eldon

