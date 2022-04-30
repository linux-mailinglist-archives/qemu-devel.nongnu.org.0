Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623D551601C
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 21:32:23 +0200 (CEST)
Received: from localhost ([::1]:58228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkspK-00035R-2D
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 15:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nksnC-0002LO-Q1
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 15:30:10 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:58757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nksnA-0003R0-Ru
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 15:30:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=0rrrjuKWecyUp55Z9Ib+P7o3018+AF3fyWrpc36IgiY=; b=Ogebxzi3+ppE7w98uoW8lN6yrS
 b39fs/95OlWI/WStCDmaHYG1WDP/f+N8a7wEMR/7pal1EC5bCWKtoTNf9Ybi9tu/6Uas4UNMgZiOw
 4EPaMfRj6D3D9JtbQUdIcg9+8T6jyVse0pcSyXc1tG8KpDjQ6q2M1hILl1KTSOoY5KOd+5nHG78li
 ruXqIFGxl7Dv3tj/jDAxB6673zblxPqCNvtk/GJSlWH/agIq7lXwzUz34uTRZHsdAG0XqPciJ2dj3
 49C2Q0jZFCar5iaz+3VdNleHWJG0OF3VvEqWosfnV/DEXOmiKQOYj4PRZIvFSTpxpgCA+g9iwvDKk
 4IJWuL8g==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Greg Kurz <groug@kaod.org>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Will Cohen <wwcohen@gmail.com>
Subject: Re: [PULL 0/7] 9p queue 2022-04-30
Date: Sat, 30 Apr 2022 21:29:57 +0200
Message-ID: <3704033.BMyLRrx2Jx@silver>
In-Reply-To: <d218e8b7-2d0c-a24c-7fff-c33d175549c8@linaro.org>
References: <cover.1651319081.git.qemu_oss@crudebyte.com>
 <d218e8b7-2d0c-a24c-7fff-c33d175549c8@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Samstag, 30. April 2022 18:37:40 CEST Richard Henderson wrote:
> On 4/30/22 04:44, Christian Schoenebeck wrote:
> > The following changes since commit 
731340813fdb4cb8339edb8630e3f923b7d987ec:
> >    Merge tag 'pull-riscv-to-apply-20220429' of github.com:alistair23/qemu
> >    into staging (2022-04-29 08:46:55 -0700)> 
> > are available in the Git repository at:
> >    https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220430
> > 
> > for you to fetch changes up to e8fb9ed725fe2ed00a275674a84beb5ba6e538a7:
> >    9pfs: fix qemu_mknodat() to always return -1 on error on macOS host
> >    (2022-04-30 13:11:48 +0200)> 
> > ----------------------------------------------------------------
> > 9pfs: various fixes
> > 
> > * macOS: Fix recently (in QEMU 7.0) added 9p support for macOS hosts.
> > 
> > * Tests: Fix inode sequencing in 'synth' driver.
> > 
> > ----------------------------------------------------------------
> > 
> > Christian Schoenebeck (7):
> >        9pfs: fix inode sequencing in 'synth' driver
> >        9pfs: fix qemu_mknodat(S_IFREG) on macOS
> >        9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
> >        9pfs: fix wrong encoding of rdev field in Rgetattr on macOS
> >        9pfs: fix wrong errno being sent to Linux client on macOS host
> >        9pfs: fix removing non-existent POSIX ACL xattr on macOS host
> >        9pfs: fix qemu_mknodat() to always return -1 on error on macOS host
> >   
> >   hw/9pfs/9p-posix-acl.c   | 12 +++++++--
> >   hw/9pfs/9p-synth.c       |  4 +--
> >   hw/9pfs/9p-util-darwin.c | 54 +++++++++++++++++++++++++++++++++++--
> >   hw/9pfs/9p-util.h        | 69
> >   ++++++++++++++++++++++++++++++++++++++++++++++++ hw/9pfs/9p.c          
> >     |  4 ++-
> >   5 files changed, 136 insertions(+), 7 deletions(-)
> 
> Fails with
> 
> ../hw/9pfs/9p-util-darwin.c:107:46: error: use of undeclared identifier
> 'AT_SYMLINK_NOFOLLOW_ANY'
>      err = fchmodat(AT_FDCWD, filename, mode, AT_SYMLINK_NOFOLLOW_ANY);
>                                               ^
> 1 error generated.
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/2398467527
> 
> 
> r~

Nice. I just realized AT_SYMLINK_NOFOLLOW_ANY was added with Xcode 13.3, which 
supposedly means >= macOS 12.3. And it wasn't marked by Apple as such. :/

I suggest I just s/AT_SYMLINK_NOFOLLOW_ANY/AT_SYMLINK_NOFOLLOW/ on my end and 
post v2 PR, for consistency and as it does not really make a huge difference 
IMO which one of the two is used in create_socket_file_at_cwd().

Any objections?

Best regards,
Christian Schoenebeck



