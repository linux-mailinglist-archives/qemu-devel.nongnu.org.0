Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D09F352F70
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 20:49:13 +0200 (CEST)
Received: from localhost ([::1]:40764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSOr2-0005dz-4L
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 14:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sedat.dilek@gmail.com>)
 id 1lSOnX-0003qa-Ge
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 14:45:35 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:36652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sedat.dilek@gmail.com>)
 id 1lSOnQ-0008AY-Vr
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 14:45:35 -0400
Received: by mail-io1-xd2d.google.com with SMTP id f19so6186615ion.3
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 11:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=/OThl2TJ86i+d/Z9onNMKzzml/86evlKk1D8sXUWm3s=;
 b=spoXp4ymwf+FzwwvTbLnfHRGKw2cJp5whg010ZpGpMj7Je/U9GpUX6h6Shj6vEnj2V
 2pp5bM13UMj8HBbM4e2Vp0mulbICA5btgWbxg5n8kuhbvRBwdQ2Sqxcr4EXaXFrFyGCy
 hzWx5OJj9NkNVwIpEQSB2Nmw9EqP5y6PpWTSmkRP0+RAxS5p4DSEeMb/nOfHbuZjXzSn
 aFIusYmUpIEbZM8XuaIqO1SXNamHYjSKcmwZSKPDq9TbxZs8POr5ji4EDRBgo9lLzglR
 q1FL2F4XNE+T4ISBWzkZfA8NAk3Tcm7mFWPxpn/Y6/+fa9GcFZBsUPajvlorufdoNmpS
 VoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=/OThl2TJ86i+d/Z9onNMKzzml/86evlKk1D8sXUWm3s=;
 b=i923GyueEPBmOTRt5MRPA/FyBBAR3eXePrYTNtAGuPCOHMktO2mIvjZbUkE8upJPm2
 GHjB2dbn13J8yfy+J1im2+uFqQ01VbmiE99uiaN78EuQP57hm5Byta8iXsvX/NGjRpeF
 Ol1SJXbaoyK4FZ7s2iJ8BbhpxNz21d46JHDspTU0HilqX6ZRdOp24Y4uw/km5hv1mdPQ
 O91Z2oiyW+H9FCz6LSi6UoOR8Z3UKa0AEkOcLsgRRPZ1a7I8f/PXXuSkSkrzzbkgb3ep
 7+G8TkNTTm8XLDhaeX5Zfs4greUHSlVM5Yeu9vOPslPIBodi6TvFkk9O6+t2ifrqY/Nq
 JCvA==
X-Gm-Message-State: AOAM531WrnLnaWrJ7B1yeXPOW61+hwX6bZDGWyWgQH5LHoZP4rKJKzx3
 s7MOS6+n2KsLAVNw53Mpu8JZKHx5xkucTOLRBT0=
X-Google-Smtp-Source: ABdhPJwIz5lMeJXF/ig31xaHINMB9NbZhAF9rqQ90Plamzp40mgR8F+megcIBShLyOw7K3egXeMkAPSODarClDsRkNY=
X-Received: by 2002:a5d:9d13:: with SMTP id j19mr12186378ioj.110.1617389125411; 
 Fri, 02 Apr 2021 11:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210211194258.4137998-1-nathan@kernel.org>
 <161428829728.2305454.15456455443457551559.b4-ty@chromium.org>
 <CA+icZUWdeWSy52bU4cjHau1hn5NiFAozaHgDb=geaaCYOET9+w@mail.gmail.com>
 <202104021125.53164550A@keescook>
 <20210402183110.zmnuoc74mzil3tml@archlinux-ax161>
In-Reply-To: <20210402183110.zmnuoc74mzil3tml@archlinux-ax161>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 2 Apr 2021 20:44:49 +0200
Message-ID: <CA+icZUXvqF79a=zSOxrshSK3gZHFpPQa=U=MqrK6cnu7Cvmq0A@mail.gmail.com>
Subject: Re: [PATCH] qemu_fw_cfg: Make fw_cfg_rev_attr a proper kobj_attribute
To: Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=sedat.dilek@gmail.com; helo=mail-io1-xd2d.google.com
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
Reply-To: sedat.dilek@gmail.com
Cc: Kees Cook <keescook@chromium.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gabriel Somlo <somlo@cmu.edu>, Nick Desaulniers <ndesaulniers@google.com>,
 qemu-devel@nongnu.org, linux-kernel@vger.kernel.org,
 Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
 Sami Tolvanen <samitolvanen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 2, 2021 at 8:31 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Fri, Apr 02, 2021 at 11:25:42AM -0700, Kees Cook wrote:
> > On Fri, Apr 02, 2021 at 08:42:07AM +0200, Sedat Dilek wrote:
> > > On Thu, Feb 25, 2021 at 10:25 PM Kees Cook <keescook@chromium.org> wrote:
> > > >
> > > > On Thu, 11 Feb 2021 12:42:58 -0700, Nathan Chancellor wrote:
> > > > > fw_cfg_showrev() is called by an indirect call in kobj_attr_show(),
> > > > > which violates clang's CFI checking because fw_cfg_showrev()'s second
> > > > > parameter is 'struct attribute', whereas the ->show() member of 'struct
> > > > > kobj_structure' expects the second parameter to be of type 'struct
> > > > > kobj_attribute'.
> > > > >
> > > > > $ cat /sys/firmware/qemu_fw_cfg/rev
> > > > > 3
> > > > >
> > > > > [...]
> > > >
> > > > Applied to kspp/cfi/cleanups, thanks!
> > > >
> > > > [1/1] qemu_fw_cfg: Make fw_cfg_rev_attr a proper kobj_attribute
> > > >       https://git.kernel.org/kees/c/f5c4679d6c49
> > > >
> > >
> > > I have queued this up in my custom patchset
> > > (for-5.12/kspp-cfi-cleanups-20210225).
> > >
> > > What is the plan to get this upstream?
> >
> > I haven't sent it to Linus yet -- I was expecting to batch more of these
> > and send them for v5.13. (But if the kvm folks snag it, that's good
> > too.)
>
> I am going to be putting the CFI series through its paces on both arm64
> and x86_64 over the next week or so on several different machines (in
> fact, I am writing up a report right now) so I will probably have some
> more of these as I find them.
>

This was just a friendly ping.

Sami has sent some patches which I reported in the early stage of
clang-cfi (x86-64) through subtree maintainers.
It's up to you Nathan or kvm folks.

Upstreamed patches means to me a RDC-ed custom patchset.

- Sedat -

