Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCA2582782
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 15:18:29 +0200 (CEST)
Received: from localhost ([::1]:32878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGgvk-0004XG-1E
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 09:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGgsx-000326-2H
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:15:35 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:33696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGgsv-0008TX-7R
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:15:34 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id cx10so714461qvb.0
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 06:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LsYfSF8Bt0jHRI0ESAaDHCzmN3NbVyjb2mHvjpWRE+w=;
 b=hlKpDI9/xqZ6e+R1iGcO/67B9iS254E7Ds5c43CN1afGXFW22GsjwfDxpBh3+hPp7m
 0kcTLPzcZmfaSWnO7uNMgSs2EM0FxspxR6eOtqokx/GVQyend4iBcFrL9UjEEmbfcCDA
 ezTw7pueXGAOCS9ePpmxUl62BWG5JEx9P4yOMpHG5EMakdttR+QKE5fM3iBBLIJI+xdd
 +fdq2Vl5zyr0jUt2QbSyO0GjmhWj3wj3rg7gCu1dFchgN8KIMDyPG3j0yUE8krklFvmW
 1IsStpWryQWpMNT/YGDIoat2QxwIWUxtoKWtSYNBYiH6G7a7Gm/FlHpSdLPA69/rllFH
 WKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LsYfSF8Bt0jHRI0ESAaDHCzmN3NbVyjb2mHvjpWRE+w=;
 b=VelAvY7f9GVe1PU5hp7Zppu6iYVIPfG0Vygwnv4OUYXpKqjtTnOaBGIzqrZS8xhPft
 F0pVgpfU6LSejjE7SJaI8i4Fnu+9KeZCERsst52o0a/xkqa759PqIP8EXOsyYzyX2g5B
 KX1UYeMdf8oVMsT8FFvtk5b0fevOl05QCknAb1ZZVOcg0f+PcztLXO2lR5NUoli+Fjni
 48EX/AR2xnh0NTrYsBBQNMtcrhWnbTbNJLM5X+MJM0jEAuqNQRhAmTYaRUtpRQU14Ea+
 2n9JBfJgvHmPUYjPWLWgQbaPdjWXl36zskIUrHgokDDQmveWnqvP4YptdWRJxFPJ8jE2
 V2CA==
X-Gm-Message-State: AJIora8KC16zyl+j511e2QOTN9yKuWh1EgjbIyR4Ww/Ey5ztOAkREbDb
 TXYMlRmjNnhXhQTza80ysTsPbxdeakgoOtN804k5bQu1S6M=
X-Google-Smtp-Source: AGRyM1sXDOhS51Vre3A8ncMbsnkMAp66M8a6CpNEYgpCM8v508dAi+f8cw5wx1RZQki6bc38ebNllJ9c1kukTrpX6s0=
X-Received: by 2002:a05:6214:242d:b0:473:7c45:635e with SMTP id
 gy13-20020a056214242d00b004737c45635emr18716307qvb.12.1658927732253; Wed, 27
 Jul 2022 06:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
 <20220727073542.811420-3-bmeng.cn@gmail.com>
 <CAGoVJZzZN5CNoURh4-uMqkPwUd-Z03PmZZ04v8M+BYi2tX37_g@mail.gmail.com>
 <CAEUhbmWv1zdYFJ-ojWxH_KnJygS2ceQyPPBvDwQ4rEqzR534EQ@mail.gmail.com>
 <YuEMnI/Sji1/r7bk@redhat.com>
 <CAEUhbmVT6bwMObhW59Oxf6nfPazDziXYbuqxC=pLBEbd26r_NQ@mail.gmail.com>
 <YuE1Rx1tOOwuS4SV@redhat.com>
In-Reply-To: <YuE1Rx1tOOwuS4SV@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 27 Jul 2022 21:15:21 +0800
Message-ID: <CAEUhbmW0fqZQRPiUGftM38JkAp6qjP7XcriqcpwfSF9PpSEj_A@mail.gmail.com>
Subject: Re: [PATCH 2/5] util/oslib-win32: Add a helper to get the Windows
 version
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Yan Vugenfirer <yvugenfi@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jul 27, 2022 at 8:53 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Jul 27, 2022 at 07:55:40PM +0800, Bin Meng wrote:
> > On Wed, Jul 27, 2022 at 6:00 PM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> > >
> > > On Wed, Jul 27, 2022 at 05:38:27PM +0800, Bin Meng wrote:
> > > > On Wed, Jul 27, 2022 at 4:50 PM Yan Vugenfirer <yvugenfi@redhat.com=
> wrote:
> > > > >
> > > > > On Wed, Jul 27, 2022 at 10:43 AM Bin Meng <bmeng.cn@gmail.com> wr=
ote:
> > > > > >
> > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > >
> > > > > > This adds a helper to get the Windows version via the RtlGetVer=
sion
> > > > > > call, for QEMU codes to determine the Windows version at run-ti=
me.
> > > > > >
> > > > > > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > > ---
> > > > > >
> > > > > >  include/sysemu/os-win32.h |  2 ++
> > > > > >  util/oslib-win32.c        | 15 +++++++++++++++
> > > > > >  2 files changed, 17 insertions(+)
> > > > > >
> > > > > > diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win3=
2.h
> > > > > > index edc3b38a57..1e324026a4 100644
> > > > > > --- a/include/sysemu/os-win32.h
> > > > > > +++ b/include/sysemu/os-win32.h
> > > > > > @@ -204,6 +204,8 @@ ssize_t qemu_recv_wrap(int sockfd, void *bu=
f, size_t len, int flags);
> > > > > >  ssize_t qemu_recvfrom_wrap(int sockfd, void *buf, size_t len, =
int flags,
> > > > > >                             struct sockaddr *addr, socklen_t *a=
ddrlen);
> > > > > >
> > > > > > +void os_get_win_version(RTL_OSVERSIONINFOEXW *info);
> > > > > > +
> > > > > >  #ifdef __cplusplus
> > > > > >  }
> > > > > >  #endif
> > > > > > diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> > > > > > index 5723d3eb4c..6d2387b9ff 100644
> > > > > > --- a/util/oslib-win32.c
> > > > > > +++ b/util/oslib-win32.c
> > > > > > @@ -547,3 +547,18 @@ int qemu_msync(void *addr, size_t length, =
int fd)
> > > > > >       */
> > > > > >      return qemu_fdatasync(fd);
> > > > > >  }
> > > > > > +
> > > > > > +void os_get_win_version(RTL_OSVERSIONINFOEXW *info)
> > > > > > +{
> > > > > > +    typedef LONG (WINAPI *rtl_get_version_t)(PRTL_OSVERSIONINF=
OEXW);
> > > > > > +
> > > > > > +    /* RtlGetVersion is available starting with Windows 2000 *=
/
> > > > > > +    HMODULE module =3D GetModuleHandle("ntdll");
> > > > > > +    PVOID fun =3D GetProcAddress(module, "RtlGetVersion");
> > > > > > +    rtl_get_version_t rtl_get_version =3D (rtl_get_version_t)f=
un;
> > > > > > +
> > > > > > +    info->dwOSVersionInfoSize =3D sizeof(RTL_OSVERSIONINFOEXW)=
;
> > > > > > +    rtl_get_version(info);
> > > > > The original function, when it was present in qemu-ga, tested tha=
t
> > > > > getting the function address succeeded.
> > > > > I think this test should be kept.
> > > > > See below:
> > > > > -    PVOID fun =3D GetProcAddress(module, "RtlGetVersion");
> > > > > -    if (fun =3D=3D NULL) {
> > > > > -        error_setg(errp, QERR_QGA_COMMAND_FAILED,
> > > > > -            "Failed to get address of RtlGetVersion");
> > > > > -        return;
> > > > > -    }
> > > > >
> > > >
> > > > Please see the comment:
> > > >
> > > > /* RtlGetVersion is available starting with Windows 2000 */
> > > >
> > > > I don't think we need that check.
> > >
> > > In include/qemu/osdep.h we have
> > >
> > > /* as defined in sdkddkver.h */
> > > #ifndef _WIN32_WINNT
> > > #define _WIN32_WINNT 0x0601 /* Windows 7 API (should be in sync with =
glib) */
> > > #endif
> > >
> > > so do we even need to have the GetProcAddress calls at all ?
> > >
> > > Surely we can just  '#include <ddk/ntddk.h>' and call
> > > RtlGetVersion directly at compile time ?
> > >
> >
> > I believe #include <ddk/ntddk.h> is used in the kernel mode driver
> > programming environment.
> > In the user space we will have to use the ntdll exported symbol.
> >
> > I cannot locate a Microsoft doc that tells us to call RtlGetVersion
> > directly in the user space.
>
> I wonder if we actually need to add this helper API to QEMU at all.
>
> Would it be possible to use GLib 's  g_win32_check_windows_version API
> instead ?
>
> https://developer-old.gnome.org/glib/unstable/glib-Windows-Compatibility-=
Functions.html#g-win32-check-windows-version
>

I am afraid not. g_win32_check_windows_version API does not provide
detailed build number like RtlGetVersion does.

Regards,
Bin

