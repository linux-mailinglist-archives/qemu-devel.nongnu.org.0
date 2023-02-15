Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D0C69873A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 22:18:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSP9O-0006fP-L6; Wed, 15 Feb 2023 16:17:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pSP9L-0006fH-3O
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 16:17:11 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pSP9I-0001Lj-G9
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 16:17:10 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6DBF261DBC;
 Wed, 15 Feb 2023 21:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E394C433EF;
 Wed, 15 Feb 2023 21:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676495825;
 bh=uSjfdzmsc1sRw+bkKglzN2j2OhMDVPZb0llJRCwU/S4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=hvR7qZi/L2/MbM6DGMeqR+x22AicT/nboZWHE0DspaXQawKzhM3fuLzeWo/reOPTq
 3w5g5xyu7RoLNz4fS6tJMIUvfoYTIbETQ5z5vb5dD4hHJuVVBxZbHUyuCQcTxYHxRV
 CMLFNmVAqjFviQ8H8T2YMX3dSZauk+IYbwEpZZxtDUwlcKLyUKm42fW8b2mq3Dc63j
 W6TQJY3A8w4g8yD2VUcPwTqUi5u8Y6MuZczPwR/O9W492TPUOKZ3LMnfFURzYRoL6Q
 AWiBLUqi0ZLpzqjm5M5KaJ9OJ5zf2eNYD9mf+mNbgMBid1kmdOLmbWNSSemisuPjRD
 baNtVGMGK3xnQ==
Date: Wed, 15 Feb 2023 13:17:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Fabiano Rosas <farosas@suse.de>, peter.maydell@linaro.org
cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, 
 vikram.garhwal@amd.com
Subject: Re: [PULL v2 0/10] xenpvh
In-Reply-To: <87bkluelt7.fsf@suse.de>
Message-ID: <alpine.DEB.2.22.394.2302151316570.2127160@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2302141541100.2025117@ubuntu-linux-20-04-desktop>
 <CAFEAcA96Mb5KAdPQrncqh9SM2iRc7aE2f4deoiF_2vChdMF0rw@mail.gmail.com>
 <87bkluelt7.fsf@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-298822432-1676495538=:2127160"
Content-ID: <alpine.DEB.2.22.394.2302151312250.2127160@ubuntu-linux-20-04-desktop>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-298822432-1676495538=:2127160
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2302151312251.2127160@ubuntu-linux-20-04-desktop>

On Wed, 15 Feb 2023, Fabiano Rosas wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
> > On Tue, 14 Feb 2023 at 23:43, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >>
> >> The following changes since commit 6a50f64ca01d0a7b97f14f069762bfd88160f31e:
> >>
> >>   Merge tag 'pull-request-2023-02-14' of https://gitlab.com/thuth/qemu into staging (2023-02-14 14:46:10 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://gitlab.com/sstabellini/qemu xenpvh2
> >>
> >> for you to fetch changes up to 86b01d58ca2840bea6e4e7260aad450a660fbd46:
> >>
> >>   meson.build: enable xenpv machine build for ARM (2023-02-14 15:39:25 -0800)
> >>
> >> ----------------------------------------------------------------
> >
> > Fails to compile for some configs, eg:
> >
> > https://gitlab.com/qemu-project/qemu/-/jobs/3775820949
> > https://gitlab.com/qemu-project/qemu/-/jobs/3775820984
> >
> > In file included from ../target/arm/machine.c:6:
> > ../target/arm/internals.h:1141:21: error: field ‘f’ has incomplete type
> > 1141 | CPUTLBEntryFull f;
> >
> 
> For this to work we'll probably need to cherry-pick some parts of my
> disable-tcg series:
> 
> https://lore.kernel.org/r/20230213202927.28992-1-farosas@suse.de
> 
> For this error specifically, patch 16.

Thanks for the quick reply!

Peter, how would you like to proceed? Vikram (the original contributor)
will be AFK for a few weeks but I might be able to have a look this in
the meantime. But if this is a known issue with already a fix available,
then what should be the action for me?
--8323329-298822432-1676495538=:2127160--

