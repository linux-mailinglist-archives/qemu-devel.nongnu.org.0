Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353055825FC
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 13:59:25 +0200 (CEST)
Received: from localhost ([::1]:47300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGfhE-0002sz-0H
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 07:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGfdq-00087I-Lu
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 07:55:55 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:35622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGfdo-0002wo-Of
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 07:55:54 -0400
Received: by mail-qt1-x82c.google.com with SMTP id g24so12431478qtu.2
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 04:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xL3tn7551xGs23uLHtdBWNQk7jRFeWC3TZRYUptPfR4=;
 b=FECDpc3uCUXBYB8YOe1IpgHeMLR71zOyzF87cXPGVGgdausPTDrDQefXx6XK67qKZC
 vnL6UajS5mRtAYbCNsFxs4L+8b4ck2CTBOplh8FuYxgVykHzrp4ZPuh3Gs29CGEj9NA4
 u6Qo2TnVWXIDaVylDCYF3Q+0VfM16NPKg9KJrWJiBNnBY5vJ4+s/XrDP9Z2jKnoXnA6D
 MaLaqZpw5eCm/xgx1SbR7i+0128Nzvu1aMJ60bVk6c0HlDiZgjLWX9xxici/u3CBpKvM
 XYkH5mwtmWKpAribeLMORKOWI0hL+jAwC+d/aQKVemJ3cdnKBd/tNTRJJnRy30hXkmVh
 l7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xL3tn7551xGs23uLHtdBWNQk7jRFeWC3TZRYUptPfR4=;
 b=gDWMSd54wtY9T2SWKG9Wso85WmoiUinwnBmB4sVl7WtMfd9vpYXCbbsMi4eEDwhWa2
 TbZISHgZ2JLnjx6pGGPkHfTYyhajgPCADvNXFfzT4Kdg6L17N46dy/9pf+9QMGUAcP+S
 RCanlFLSFEhmnBIiolz4oLEbmZI4b5TOOW6YaxPcNMeSBHVHWAe1v46i31tS36IZRkVu
 zKMbtX2hFPhVQqEa7H2c7FubUTdDVgjlMRVOnMBDuUivMXjUp/v9L3+daIB3lYh7hXt4
 WmfPtHxIdI4ItkgK6su0jlCqT/kerHo+oTI6MQkbwyCYxouD9qArMt2PjPYM21xVWsCN
 9WxQ==
X-Gm-Message-State: AJIora/rxspCM9nmkwx7gnWyGOl1C32poom9OBCB1vCAEBpAKu+yrGmH
 Z4zolR5togWQLNEZXNiEgVbg0bEu/hs7V+FMp/9vf/rV
X-Google-Smtp-Source: AGRyM1sVJk4iPqJUG3hV7pgr1A8FN2w1fydZOpaajsXQhpidV4UxFJvGbSzG4QS5ltotD5vD7LDWqEwTceRjRRHS1Hg=
X-Received: by 2002:a05:622a:152:b0:31f:1ff1:b394 with SMTP id
 v18-20020a05622a015200b0031f1ff1b394mr18171794qtw.543.1658922951547; Wed, 27
 Jul 2022 04:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
 <20220727073542.811420-3-bmeng.cn@gmail.com>
 <CAGoVJZzZN5CNoURh4-uMqkPwUd-Z03PmZZ04v8M+BYi2tX37_g@mail.gmail.com>
 <CAEUhbmWv1zdYFJ-ojWxH_KnJygS2ceQyPPBvDwQ4rEqzR534EQ@mail.gmail.com>
 <YuEMnI/Sji1/r7bk@redhat.com>
In-Reply-To: <YuEMnI/Sji1/r7bk@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 27 Jul 2022 19:55:40 +0800
Message-ID: <CAEUhbmVT6bwMObhW59Oxf6nfPazDziXYbuqxC=pLBEbd26r_NQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] util/oslib-win32: Add a helper to get the Windows
 version
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Yan Vugenfirer <yvugenfi@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82c.google.com
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

On Wed, Jul 27, 2022 at 6:00 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Jul 27, 2022 at 05:38:27PM +0800, Bin Meng wrote:
> > On Wed, Jul 27, 2022 at 4:50 PM Yan Vugenfirer <yvugenfi@redhat.com> wr=
ote:
> > >
> > > On Wed, Jul 27, 2022 at 10:43 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > From: Bin Meng <bin.meng@windriver.com>
> > > >
> > > > This adds a helper to get the Windows version via the RtlGetVersion
> > > > call, for QEMU codes to determine the Windows version at run-time.
> > > >
> > > > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > ---
> > > >
> > > >  include/sysemu/os-win32.h |  2 ++
> > > >  util/oslib-win32.c        | 15 +++++++++++++++
> > > >  2 files changed, 17 insertions(+)
> > > >
> > > > diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
> > > > index edc3b38a57..1e324026a4 100644
> > > > --- a/include/sysemu/os-win32.h
> > > > +++ b/include/sysemu/os-win32.h
> > > > @@ -204,6 +204,8 @@ ssize_t qemu_recv_wrap(int sockfd, void *buf, s=
ize_t len, int flags);
> > > >  ssize_t qemu_recvfrom_wrap(int sockfd, void *buf, size_t len, int =
flags,
> > > >                             struct sockaddr *addr, socklen_t *addrl=
en);
> > > >
> > > > +void os_get_win_version(RTL_OSVERSIONINFOEXW *info);
> > > > +
> > > >  #ifdef __cplusplus
> > > >  }
> > > >  #endif
> > > > diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> > > > index 5723d3eb4c..6d2387b9ff 100644
> > > > --- a/util/oslib-win32.c
> > > > +++ b/util/oslib-win32.c
> > > > @@ -547,3 +547,18 @@ int qemu_msync(void *addr, size_t length, int =
fd)
> > > >       */
> > > >      return qemu_fdatasync(fd);
> > > >  }
> > > > +
> > > > +void os_get_win_version(RTL_OSVERSIONINFOEXW *info)
> > > > +{
> > > > +    typedef LONG (WINAPI *rtl_get_version_t)(PRTL_OSVERSIONINFOEXW=
);
> > > > +
> > > > +    /* RtlGetVersion is available starting with Windows 2000 */
> > > > +    HMODULE module =3D GetModuleHandle("ntdll");
> > > > +    PVOID fun =3D GetProcAddress(module, "RtlGetVersion");
> > > > +    rtl_get_version_t rtl_get_version =3D (rtl_get_version_t)fun;
> > > > +
> > > > +    info->dwOSVersionInfoSize =3D sizeof(RTL_OSVERSIONINFOEXW);
> > > > +    rtl_get_version(info);
> > > The original function, when it was present in qemu-ga, tested that
> > > getting the function address succeeded.
> > > I think this test should be kept.
> > > See below:
> > > -    PVOID fun =3D GetProcAddress(module, "RtlGetVersion");
> > > -    if (fun =3D=3D NULL) {
> > > -        error_setg(errp, QERR_QGA_COMMAND_FAILED,
> > > -            "Failed to get address of RtlGetVersion");
> > > -        return;
> > > -    }
> > >
> >
> > Please see the comment:
> >
> > /* RtlGetVersion is available starting with Windows 2000 */
> >
> > I don't think we need that check.
>
> In include/qemu/osdep.h we have
>
> /* as defined in sdkddkver.h */
> #ifndef _WIN32_WINNT
> #define _WIN32_WINNT 0x0601 /* Windows 7 API (should be in sync with glib=
) */
> #endif
>
> so do we even need to have the GetProcAddress calls at all ?
>
> Surely we can just  '#include <ddk/ntddk.h>' and call
> RtlGetVersion directly at compile time ?
>

I believe #include <ddk/ntddk.h> is used in the kernel mode driver
programming environment.
In the user space we will have to use the ntdll exported symbol.

I cannot locate a Microsoft doc that tells us to call RtlGetVersion
directly in the user space.

Regards,
Bin

