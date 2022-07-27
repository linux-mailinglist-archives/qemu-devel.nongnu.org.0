Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AC0582505
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 12:59:26 +0200 (CEST)
Received: from localhost ([::1]:44434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGelB-0002lC-AL
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 06:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvugenfi@redhat.com>)
 id 1oGejw-0001PT-IL
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 06:58:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvugenfi@redhat.com>)
 id 1oGejt-0001NV-0c
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 06:58:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658919483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ylN6eWJrykTn8Fm2VBKpO+xEiN2oxF3J+Sd8xiswdYk=;
 b=Peqb/+ADTjRDIkRwA+1i+JB1tIz05hGX3w0MrnOS1+uWxnF0LsqUrTUG0m3+oD8obXtpKm
 u5cpoAGz7swlvtH627EA23bbaAcv67dospAbJ5g49CJ+g6+SOWxTTELMDDKe5hjHpUulfc
 TnpW+Qwh7N9oklCEfza1bQQVv+d9FXI=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-8vr_SvKlMomAQR2v1OHgiw-1; Wed, 27 Jul 2022 06:57:59 -0400
X-MC-Unique: 8vr_SvKlMomAQR2v1OHgiw-1
Received: by mail-lf1-f72.google.com with SMTP id
 a19-20020a19f813000000b0048a7379e38bso4566806lff.5
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 03:57:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=ylN6eWJrykTn8Fm2VBKpO+xEiN2oxF3J+Sd8xiswdYk=;
 b=6ICNGgSImgAqP5T6jX7dPFsv+9xXpg2Hj612HThyXi70cg+FjR8SfVAh9tnq4yoPxx
 /2c321V5Dlauf0ZCfnMbKaL3a6KfpQ95wGiUz4jL8LKvPw/RRuIzVPIdYEAFG2O4cvaa
 62rYSLx5KecFXJIpSTjFPwX43pUHm4SZFkz5pNz3owgLPtWqgO+dqBb7VghZFJ7/Etqh
 Vbz4pJ0uayOu/WxEiJtID1vuZ9iGcasRYhdLGjHmsZL6QQNQUNVtD1TwKiPMRtoByjUu
 Jle2ovdfAdQPbXDcejf+QOPyLaKb8yGZKvSjuDCZIJ8zmKN/I3QOX5kpSVtuSDveEOb5
 zWBA==
X-Gm-Message-State: AJIora9oUho/bxawP+m8l+T2KtKlfG4rgE9b2ol4dOg8585/zerdpccA
 IsxLtWF9543VVot0AHTTTbkM+RwZlUxcTwxYHvS3jdlfvW687cHuHX9ib/XC+roALOkOzWufzn0
 RORTB1qW2ImLoMoSaJBEs/3fRg9L09DA=
X-Received: by 2002:a05:651c:220a:b0:25d:5f87:1ed7 with SMTP id
 y10-20020a05651c220a00b0025d5f871ed7mr6983417ljq.20.1658919478011; 
 Wed, 27 Jul 2022 03:57:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uiK73EtAbVSUlJ6bmompOYWDEh2oBO8lhzRrc5vCQM7hXLSAXrzEFSmkm2o3CCOBazyMyLT1XGBXFlvdcWxNU=
X-Received: by 2002:a05:651c:220a:b0:25d:5f87:1ed7 with SMTP id
 y10-20020a05651c220a00b0025d5f871ed7mr6983405ljq.20.1658919477531; Wed, 27
 Jul 2022 03:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
 <20220727073542.811420-3-bmeng.cn@gmail.com>
 <CAGoVJZzZN5CNoURh4-uMqkPwUd-Z03PmZZ04v8M+BYi2tX37_g@mail.gmail.com>
 <CAEUhbmWv1zdYFJ-ojWxH_KnJygS2ceQyPPBvDwQ4rEqzR534EQ@mail.gmail.com>
 <YuEMnI/Sji1/r7bk@redhat.com>
In-Reply-To: <YuEMnI/Sji1/r7bk@redhat.com>
From: Yan Vugenfirer <yvugenfi@redhat.com>
Date: Wed, 27 Jul 2022 13:57:46 +0300
Message-ID: <CAGoVJZx6By31HdTHdRE1BQ3riFO13Z8QGd4avFSwfYPnhScaKg@mail.gmail.com>
Subject: Re: [PATCH 2/5] util/oslib-win32: Add a helper to get the Windows
 version
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=yvugenfi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, Jul 27, 2022 at 1:00 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
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
Yes.
https://docs.microsoft.com/en-us/windows-hardware/drivers/ddi/wdm/nf-wdm-rt=
lgetversion
- RtlGetVersion is available from Windows 2000.

Best regards,
Yan.

>
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


