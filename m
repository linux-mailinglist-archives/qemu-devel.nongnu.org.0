Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17028610315
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 22:46:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo9it-0006SP-Fc; Thu, 27 Oct 2022 16:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oo9ii-0006Mk-EP
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:43:20 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oo9if-0006ge-GH
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:43:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=hJbz0Pjpiu7Px4nv3GhFZwfCFUrdQGDRoMv+lwe/PZ8=; b=mqiXxRmTzRwE/UP57MzQViDnJj
 dHkjHz0x6LZ7NCkIfCAzWVYKR8LJ4nfv/aum3vHaFMfu9TFGUEKtepwjjKGApBcp2aFLX4Ya8LQaM
 2gHT8/1s3uWR2O99wmp5jY/i0VY6y+4kX3VANQEWTLqHl17yp3QUDcBgrwie0Z3nU3DP+tlAcztIz
 hlNIyfthgemYbluTxGntytgBLnUn/MCPLQoDfLJ31CDjRaOKXP12e6gR+VrY6Jo+BBtub7mNQ9fgs
 rYnu95IjcWptRsF2XaseMeEF9Iryjj54cKdj9XvODm3idEiwFx7Rvk7EXofMAmGL27GYAJa050E7U
 47KLDkcy8kBi340w9TcgUXPyqnEK0+l7/iH0eI/IHLt8eJPi4LJ/yFfu+CSp3LdQh+Xshl5NZh+0W
 ZhogP+7lQ6jXF8esE7UKEyfE/P1Ssmi7SRX0h30U4zAAOci2oGM1CNoYjFxxxB+c/w1mSZp6dLKJb
 R37uyBVVueTzt25SjoMh+9aDeSIqEqTVdLAqJCGnCuiVYx3btxZ2xpDYKihC5JODIh2YQ4da/1u2Q
 5MJFq0csAY3focxq81bJrnbM8qyRQbXOT6JLIY2KWRLw9qOall3JbTFN5LlzKTdmOpGBPQ/IuLdIO
 9gjDj8cYuwxegw89yy9Tr5OKhIW60Zzca0VYPCZEU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>,
 Linus Heckemann <git@sphalerite.org>, Bin Meng <bin.meng@windriver.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PULL 00/23] 9p queue 2022-10-24
Date: Thu, 27 Oct 2022 22:42:11 +0200
Message-ID: <11340963.ZY6gCF45se@silver>
In-Reply-To: <CAJSP0QU62wy6sN7CULhDtcXMufQvpF8CgRQDOSVw5w7JYC_p-g@mail.gmail.com>
References: <cover.1666608862.git.qemu_oss@crudebyte.com>
 <3438372.x9l1EUDYgq@silver>
 <CAJSP0QU62wy6sN7CULhDtcXMufQvpF8CgRQDOSVw5w7JYC_p-g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thursday, October 27, 2022 7:37:07 PM CEST Stefan Hajnoczi wrote:
> On Thu, 27 Oct 2022 at 12:38, Christian Schoenebeck
> <qemu_oss@crudebyte.com> wrote:
> >
> > On Thursday, October 27, 2022 5:53:47 PM CEST Thomas Huth wrote:
> > > On 24/10/2022 12.54, Christian Schoenebeck wrote:
> > > > The following changes since commit 0529245488865038344d64fff7ee05864d3d17f6:
> > > >
> > > >    Merge tag 'pull-target-arm-20221020' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-10-20 14:36:12 -0400)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >    https://github.com/cschoenebeck/qemu.git tags/pull-9p-20221024
> > > >
> > > > for you to fetch changes up to 3ce77865bf813f313cf79c00fd951bfc95a50165:
> > > >
> > > >    tests/9p: remove unnecessary g_strdup() calls (2022-10-24 12:24:32 +0200)
> > > >
> > > > ----------------------------------------------------------------
> > > > 9pfs: performance, Windows host prep, tests restructure
> > > >
> > > > * Highlight of this PR is Linus Heckemann's GHashTable patch which
> > > >    brings massive general performance improvements of 9p server
> > > >    somewhere between factor 6 .. 12.
> > > >
> > > > * Bin Meng's g_mkdir patch is a preparatory patch for upcoming
> > > >    Windows host support of 9p server.
> > > >
> > > > * The rest of the patches in this PR are 9p test code restructuring
> > > >    and refactoring changes to improve readability and to ease
> > > >    maintenance of 9p test code on the long-term.
> > >
> > >   Hi Christian,
> > >
> > > I think this PR broke the FreeBSD CI jobs:
> > >
> > >   https://gitlab.com/qemu-project/qemu/-/jobs/3219611457#L3116
> > >
> > >   https://gitlab.com/qemu-project/qemu/-/jobs/3219611460#L3372
> > >
> > > Could you please have a look?
> > >
> > >   Thanks!
> > >    Thomas
> >
> > I try, but will certainly take some days, especially as I currently don't have
> > a BSD installation at hand to try the changes.
> 
> QEMU has the automation to run FreeBSD builds locally (in a VM):
> $ make vm-build-freebsd
> 
> Not sure if that FreeBSD environment matches the one in Cirrus CI
> though. If they are different then maybe it won't reproduce locally.

Something must be different, because e750a7ace492f0b450653d4ad368a77d6f660fb8
compiles fine locally with `make vm-build-freebsd` and all tests pass, too.

Ideas?

Best regards,
Christian Schoenebeck



