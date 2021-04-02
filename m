Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75F2352F54
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 20:33:23 +0200 (CEST)
Received: from localhost ([::1]:56484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSObi-0007pC-Ow
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 14:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@kernel.org>) id 1lSOZk-0007Hu-BB
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 14:31:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:45398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@kernel.org>) id 1lSOZi-0007kF-H2
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 14:31:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAA0A60C3E;
 Fri,  2 Apr 2021 18:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617388275;
 bh=G+2nOl79scLD+kYdNuqIJhgA2fdneiBHVrqYHJ5YnWU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VYEa4qrp5E7BqwGIREzQa6QHMIL62RC9GWaA80fg3V4ptxUyN5E9ivdbUp7PzKSAj
 8tJ6/X6feN03DIszVWhcnok4d4vAkAruK6Baas9VjJNHfd62UJlL2nN7k1Ijg/nQgi
 Gt5xfII83qwxYPeHoUQr56kElNWZCa7LdD23Z3KQNxB7qbYNk1L4YwAPDK/DQlHNvO
 iUNUmMlNkk2HlDDDwekwezuYbqyNko5sQDNH7uDtEuZM6XjMNEDbqO/uNBPboX6o9o
 XBZq1zbLOfWBmy5N1fCyzzBZOeeFFnHNejl6Ww4r1mYuc8QvUERX64B7+N0tfDfp7d
 1H5M+N8YsdQDw==
Date: Fri, 2 Apr 2021 11:31:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] qemu_fw_cfg: Make fw_cfg_rev_attr a proper kobj_attribute
Message-ID: <20210402183110.zmnuoc74mzil3tml@archlinux-ax161>
References: <20210211194258.4137998-1-nathan@kernel.org>
 <161428829728.2305454.15456455443457551559.b4-ty@chromium.org>
 <CA+icZUWdeWSy52bU4cjHau1hn5NiFAozaHgDb=geaaCYOET9+w@mail.gmail.com>
 <202104021125.53164550A@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202104021125.53164550A@keescook>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=nathan@kernel.org;
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gabriel Somlo <somlo@cmu.edu>,
 Nick Desaulniers <ndesaulniers@google.com>, qemu-devel@nongnu.org,
 linux-kernel@vger.kernel.org,
 Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
 Sami Tolvanen <samitolvanen@google.com>, Sedat Dilek <sedat.dilek@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 02, 2021 at 11:25:42AM -0700, Kees Cook wrote:
> On Fri, Apr 02, 2021 at 08:42:07AM +0200, Sedat Dilek wrote:
> > On Thu, Feb 25, 2021 at 10:25 PM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > On Thu, 11 Feb 2021 12:42:58 -0700, Nathan Chancellor wrote:
> > > > fw_cfg_showrev() is called by an indirect call in kobj_attr_show(),
> > > > which violates clang's CFI checking because fw_cfg_showrev()'s second
> > > > parameter is 'struct attribute', whereas the ->show() member of 'struct
> > > > kobj_structure' expects the second parameter to be of type 'struct
> > > > kobj_attribute'.
> > > >
> > > > $ cat /sys/firmware/qemu_fw_cfg/rev
> > > > 3
> > > >
> > > > [...]
> > >
> > > Applied to kspp/cfi/cleanups, thanks!
> > >
> > > [1/1] qemu_fw_cfg: Make fw_cfg_rev_attr a proper kobj_attribute
> > >       https://git.kernel.org/kees/c/f5c4679d6c49
> > >
> > 
> > I have queued this up in my custom patchset
> > (for-5.12/kspp-cfi-cleanups-20210225).
> > 
> > What is the plan to get this upstream?
> 
> I haven't sent it to Linus yet -- I was expecting to batch more of these
> and send them for v5.13. (But if the kvm folks snag it, that's good
> too.)

I am going to be putting the CFI series through its paces on both arm64
and x86_64 over the next week or so on several different machines (in
fact, I am writing up a report right now) so I will probably have some
more of these as I find them.

Cheers,
Nathan

