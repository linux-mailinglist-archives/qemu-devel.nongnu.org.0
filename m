Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B5E5823B7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 12:02:28 +0200 (CEST)
Received: from localhost ([::1]:56388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGds2-0002rj-Vf
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 06:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGdoP-0000SN-Ll
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:58:41 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:45625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGdoK-0008FJ-5y
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:58:41 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id v2so2333078qvs.12
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 02:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0VSNh2EZ1pzn8Y4uGtmL/8vplEwpO/gddFyHDhnhso8=;
 b=S1HJpUl03QAvTStfVwAbXs30QPwYMO0fVR0UhlQdip2qHdHqy+zj2KkXCHDaC07XVw
 zgcmlU6hipK5wJxnqLqLsVc3MEDD4MC6iAM0MrfdywVeV3G//JVo/i9jo8XVPzWNiUc7
 rNMKa745taNTbUKu917rP+Q6e7kKQhQ/rNORbMPxIjeYuR2wNUoWynLksLwkknb6Hdzs
 H8O5Ia4X8f1YMMomiHb8OhsJL2cbmiNMa1ALpsL3hEXFi5Ixr9G65CSAEDpVTe5yU2gL
 jhK9clt5TdgjXGs9OdRl5iPbYgFUnA6PMdoAkyyVllIUQT5NK4dLklnC1AxmVIaCbXIJ
 CI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0VSNh2EZ1pzn8Y4uGtmL/8vplEwpO/gddFyHDhnhso8=;
 b=eNWfpB/Ny4pMGEV11Jps/icOgnzPnzfrwp5O61Fxukeg4bLsj2WdZzQCo4ftCBctoN
 WBHuxS8jHABkWmFsp4YwYrlZf3z0N7XnMp7PwpPblPoU9KXNXJi1z1EPEmqgQ19wXbgE
 AXY4RyvX64rK992CBczWfTeVKSbHY7tT/MVXUV0fNvZf9bnTRVTUByutSPYKGEhmtDDU
 ZnR+SmahAaEPr/BHWjE+NBOb+sD8EYNSXE3/lWj1alKCwx5vGSLpmnm98r4vzc6E5ZCb
 HxAY7SRLRf/LVCl+jLB4PKtVrrjUrVjRnvRqjPMrSWcUYsEfoZZdkZCY81mvKwUooT0r
 rJuw==
X-Gm-Message-State: AJIora/BWKou0afKI1S7lXhHt8ZYU0vpmc3qJik3NAAkejZBinIAdpal
 VtXwgKQV3Troj/TsE6vNKPKyJ/RJIP7OlCzFk/Y=
X-Google-Smtp-Source: AGRyM1s9O4PZBAHLmNoX2f7pOGXFQfTZuJ0x8PZYur39UY7KfkLuCFuR9uuHsowAByfXv+/i8mE/87DAl7fXmVjP4E8=
X-Received: by 2002:a05:6214:1bca:b0:474:4a5:6ba8 with SMTP id
 m10-20020a0562141bca00b0047404a56ba8mr18322074qvc.114.1658915915193; Wed, 27
 Jul 2022 02:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
 <20220727073542.811420-5-bmeng.cn@gmail.com>
 <CAGoVJZyoG3y831NPTxi1eDozKbr9Z5DVOaGpHthoWkTsbf-rsA@mail.gmail.com>
In-Reply-To: <CAGoVJZyoG3y831NPTxi1eDozKbr9Z5DVOaGpHthoWkTsbf-rsA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 27 Jul 2022 17:58:23 +0800
Message-ID: <CAEUhbmVKduXLHpiSURNFO1V4yb6YELghFNV=Z8FWwui9F6vJNQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] util/qemu-sockets: Enable unix socket support on
 Windows
To: Yan Vugenfirer <yvugenfi@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Jul 27, 2022 at 4:51 PM Yan Vugenfirer <yvugenfi@redhat.com> wrote:
>
> On Wed, Jul 27, 2022 at 10:46 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Support for the unix socket has existed both in BSD and Linux for the
> > longest time, but not on Windows. Since Windows 10 build 17063 [1],
> > the native support for the unix socket has came to Windows. Starting
> > this build, two Win32 processes can use the AF_UNIX address family
> > over Winsock API to communicate with each other.
> >
> > Introduce a new build time config option CONFIG_AF_UNIX when the build
> > host has such a capability, and a run-time check afunix_available() for
> > Windows host in the QEMU sockets util codes.
> >
> > [1] https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/
> >
> > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  meson.build         |  6 ++++++
> >  util/qemu-sockets.c | 48 ++++++++++++++++++++++++++++++++++++++-------
> >  2 files changed, 47 insertions(+), 7 deletions(-)
> >
> > diff --git a/meson.build b/meson.build
> > index 75aaca8462..73e5de5957 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -2327,6 +2327,12 @@ have_afalg = get_option('crypto_afalg') \
> >    '''), error_message: 'AF_ALG requested but could not be detected').allowed()
> >  config_host_data.set('CONFIG_AF_ALG', have_afalg)
> >
> > +if targetos != 'windows'
> > +  config_host_data.set('CONFIG_AF_UNIX', true)
> > +else
> > +  config_host_data.set('CONFIG_AF_UNIX', cc.has_header('afunix.h'))
> > +endif
> > +
> >  config_host_data.set('CONFIG_AF_VSOCK', cc.has_header_symbol(
> >    'linux/vm_sockets.h', 'AF_VSOCK',
> >    prefix: '#include <sys/socket.h>',
> > diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> > index 0e2298278f..d85f3ea3ee 100644
> > --- a/util/qemu-sockets.c
> > +++ b/util/qemu-sockets.c
> > @@ -17,6 +17,15 @@
> >   */
> >  #include "qemu/osdep.h"
> >
> > +#if defined(CONFIG_WIN32) && defined(CONFIG_AF_UNIX)
> > +# include <afunix.h>
> > +/*
> > + * AF_UNIX support is available since Windows 10 build 17063
> > + * See https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/
> > + */
> > +# define WIN_BUILD_AF_UNIX 17063
> > +#endif /* CONFIG_WIN32 && CONFIG_AF_UNIX */
> > +
> >  #ifdef CONFIG_AF_VSOCK
> >  #include <linux/vm_sockets.h>
> >  #endif /* CONFIG_AF_VSOCK */
> > @@ -880,7 +889,7 @@ static int vsock_parse(VsockSocketAddress *addr, const char *str,
> >  }
> >  #endif /* CONFIG_AF_VSOCK */
> >
> > -#ifndef _WIN32
> > +#ifdef CONFIG_AF_UNIX
> >
> >  static bool saddr_is_abstract(UnixSocketAddress *saddr)
> >  {
> > @@ -900,6 +909,17 @@ static bool saddr_is_tight(UnixSocketAddress *saddr)
> >  #endif
> >  }
> >
> > +#ifdef CONFIG_WIN32
> > +static bool afunix_available(void)
> > +{
> > +    OSVERSIONINFOEXW os_version = { 0 };
> > +
> > +    os_get_win_version(&os_version);
> > +
> > +    return os_version.dwBuildNumber >= WIN_BUILD_AF_UNIX;
> It can be that CONFIG_WIN32 is defined,but CONFIG_AF_UNIX is not. In
> this case WIN_BUILD_AF_UNIX will be undefined.
> Also, WIN_BUILD_AF_UNIX is just a build constant, why not define it
> always under CONFIG_WIN32?
>

Thanks for the review.

Will put WIN_BUILD_AF_UNIX under CONFIG_WIN32 only.

Regards,
Bin

