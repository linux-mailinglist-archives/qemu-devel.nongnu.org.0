Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA396953F0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 23:36:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRhPL-00078R-MW; Mon, 13 Feb 2023 17:34:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pRhPK-000784-0N
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 17:34:46 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pRhPH-0004jN-KR
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 17:34:45 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CBA60B815D2;
 Mon, 13 Feb 2023 22:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16EC9C433EF;
 Mon, 13 Feb 2023 22:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676327672;
 bh=Wu0Eyxrco/kCqT5T62hiVZGKGDdQXt+rEmnPpo+rXy0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ZgueUsf1omf35G8KIAB9ZfcSHh94VhfUHlEOgo7hPG85hoZ3i09aky3OOAySiW8Ks
 b6rmh+4TH7A8tg1Oi0vHdq5mFL8efPs3cKzJkNkhNMDK0U8uQd5IHqVw+vrNYOgKZM
 ceTDbhIUBbmZGf4HNJ/mjZZ5tyq98fWiN1HP8xFX16RmIVfi0E4YGJOnqkZKHwtFvd
 85hGOdXRuuQ2eQxaAGbEhkgCdTD2nCL/UMQgf61iO9llxrfmMrzvJy0hlYKHpAv/bz
 Ql10JIMyocjTzq/v4lmYKmFvInWr/NFR3OdpuSmkn706iV61XKN+vTtLH0SyqRy0vY
 vsXqBmSLaEKTA==
Date: Mon, 13 Feb 2023 14:34:30 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Peter Maydell <peter.maydell@linaro.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org
Subject: Re: [PULL 00/10] xenpvh machine
In-Reply-To: <CAFEAcA9kshowaoWFCPRmVy4G2dD+EqiG5cKAAgkJO63MNrEheQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2302131431430.4661@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2302101420510.4661@ubuntu-linux-20-04-desktop>
 <CAFEAcA9kshowaoWFCPRmVy4G2dD+EqiG5cKAAgkJO63MNrEheQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=sstabellini@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On Mon, 13 Feb 2023, Peter Maydell wrote:
> On Fri, 10 Feb 2023 at 22:27, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >
> > The following changes since commit 90595cc9396bb910b148391fea2e78dd8c6c8b27:
> >
> >   Merge tag 'migration-20230209-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-10 10:50:21 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/sstabellini/qemu.git xenpvh
> >
> > for you to fetch changes up to 3f8ee848693872e3783cdcf2862be5421bb9cbcb:
> >
> >   meson.build: enable xenpv machine build for ARM (2023-02-10 14:23:47 -0800)
> 
> Hi -- 'xenpvh' doesn't appear to be a signed tag:
> 
> >From https://gitlab.com/sstabellini/qemu
>  * branch                    xenpvh     -> FETCH_HEAD
> error: FETCH_HEAD: cannot verify a non-tag object of type commit.
> Does not appear to be a signed tag

Sorry "xenpvh" was a branch name. Here is the corresponding signed tag:

https://gitlab.com/sstabellini/qemu xenpvh-tag

