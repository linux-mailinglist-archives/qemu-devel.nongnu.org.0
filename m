Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F23321FD4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 20:15:21 +0100 (CET)
Received: from localhost ([::1]:43088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEGfw-0000Es-Ek
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 14:15:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@kernel.org>) id 1lEGZ5-00015z-48
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 14:08:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:32850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@kernel.org>) id 1lEGZ0-0004Hs-TJ
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 14:08:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9596D64E31;
 Mon, 22 Feb 2021 19:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614020887;
 bh=0iXDwSFE0l7X7i5uwg4J4i7IsMti3m0+Zo64C0wFYWA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DCjRqWbnZJdBgK6c57YUhZ+RhW6pzrW5IE5MBD+uC+8gRvoSiUSDNvWBPIlzZtUFF
 cIy7FodUflGNCBs8STHoHU7gLn0BG4tzE2all7fRfSeYdBgwnsJpreOYBGR4ER2shr
 ShTglOoHyVx66KMMz6eI5TQmOZ85cCjkJYM4Qj51IdIMcoDirs/RbV6tPvgDrm0TKj
 2XAS3NiTK7Dh7HyooE5t17bYnKZrSZqui2yK+auejSUE2xAVE0IqBwadaa4yPFxEI/
 yihbqDs/wRLYrm+iG7QG4Y9rl0OBMkB4Il8BYEM+/b3wNDYtL/78gZlPOmWqZik/Gn
 I6CdqWnegeTHQ==
Date: Mon, 22 Feb 2021 12:08:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] qemu_fw_cfg: Make fw_cfg_rev_attr a proper kobj_attribute
Message-ID: <20210222190806.GA41637@24bbad8f3778>
References: <20210211194258.4137998-1-nathan@kernel.org>
 <CAKwvOdkJfJ+LDspz04tsjd=55LxF5rgTOAXt0cPxTyCCUBqgBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdkJfJ+LDspz04tsjd=55LxF5rgTOAXt0cPxTyCCUBqgBw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Kees Cook <keescook@chromium.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gabriel Somlo <somlo@cmu.edu>, qemu-devel@nongnu.org,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Sami Tolvanen <samitolvanen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 11:02:34AM -0800, Nick Desaulniers wrote:
> Did this happen to get picked up already? EOM

I have not gotten an email saying it has been picked up nor does it
appear to be in -next.

Cheers,
Nathan

> On Thu, Feb 11, 2021 at 11:43 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > fw_cfg_showrev() is called by an indirect call in kobj_attr_show(),
> > which violates clang's CFI checking because fw_cfg_showrev()'s second
> > parameter is 'struct attribute', whereas the ->show() member of 'struct
> > kobj_structure' expects the second parameter to be of type 'struct
> > kobj_attribute'.
> >
> > $ cat /sys/firmware/qemu_fw_cfg/rev
> > 3
> >
> > $ dmesg | grep "CFI failure"
> > [   26.016832] CFI failure (target: fw_cfg_showrev+0x0/0x8):
> >
> > Fix this by converting fw_cfg_rev_attr to 'struct kobj_attribute' where
> > this would have been caught automatically by the incompatible pointer
> > types compiler warning. Update fw_cfg_showrev() accordingly.
> >
> > Fixes: 75f3e8e47f38 ("firmware: introduce sysfs driver for QEMU's fw_cfg device")
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1299
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >  drivers/firmware/qemu_fw_cfg.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
> > index 0078260fbabe..172c751a4f6c 100644
> > --- a/drivers/firmware/qemu_fw_cfg.c
> > +++ b/drivers/firmware/qemu_fw_cfg.c
> > @@ -299,15 +299,13 @@ static int fw_cfg_do_platform_probe(struct platform_device *pdev)
> >         return 0;
> >  }
> >
> > -static ssize_t fw_cfg_showrev(struct kobject *k, struct attribute *a, char *buf)
> > +static ssize_t fw_cfg_showrev(struct kobject *k, struct kobj_attribute *a,
> > +                             char *buf)
> >  {
> >         return sprintf(buf, "%u\n", fw_cfg_rev);
> >  }
> >
> > -static const struct {
> > -       struct attribute attr;
> > -       ssize_t (*show)(struct kobject *k, struct attribute *a, char *buf);
> > -} fw_cfg_rev_attr = {
> > +static const struct kobj_attribute fw_cfg_rev_attr = {
> >         .attr = { .name = "rev", .mode = S_IRUSR },
> >         .show = fw_cfg_showrev,
> >  };
> >
> > base-commit: 92bf22614b21a2706f4993b278017e437f7785b3
> > --
> > 2.30.1
> >

