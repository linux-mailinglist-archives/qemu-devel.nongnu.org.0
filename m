Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB98D58279F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 15:25:00 +0200 (CEST)
Received: from localhost ([::1]:40996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGh23-0001rP-KT
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 09:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGgyW-0006Xa-Fp
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:21:20 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:37573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGgyU-0000st-Pe
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:21:20 -0400
Received: by mail-qk1-x72d.google.com with SMTP id c24so13205492qkm.4
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 06:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q0XS905Lrc9FOXC/PmJaxmggzaI315crBaI3h/GCoQs=;
 b=qDyzkS5lXmBfK9bk79+CvUAP3SEkvHSJKWr+ILCgVH9ZtUi1vDJlXazP1+MbPqYtfp
 5KkfkzVIx8UBKVPsEPgSTl+VO8M0ifB5MuCzBrt5vkK2fCAOZxRlwpBqE4nSoL/qGpGY
 z7cWJbV8jjhsslZbsCmDE8hmvlyHm3c8QSLx3MoVa6kfH/4AMr4s/WK9pimaKJk7dATt
 Ar8h/FhjzuuLC3Jk+TT6/WeNRrmj7aMtpvSqGFxdIMavM1p2QaoF3TBNjAzTHwBhTJgD
 zAEYPk85Kc+hq/jMUV+c2XTVlMAi1a1Vw85M5c5AMcQNQm8Vs7/TQyzDK3Zt4rC8VlzZ
 vf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q0XS905Lrc9FOXC/PmJaxmggzaI315crBaI3h/GCoQs=;
 b=dUCYaPOYCWqnvv6S1gOu07+IPfoqGvyj7Dz/DKeibpP37GRQQL0t8fe7LQHYKdtsxR
 09j5s21vcwS+YMrFmzd0CuKv9pVNojsJWb5Wte57BOnR7IYINfuyw8Gbz4+bOOw5JxrW
 HDQ3R5TR9NNW/kidFa0tdAsPzzK0pKUjaCDUgRV5+vLAVUTnEvwueO9iBxevq8f2wd2W
 rTyQLcRlV9Pb4VnHibsMHvuV17MtCcqLQKht3MfemhtnhcCsljtS83DaCaky7ViVhE78
 /yFFy+CA5s4UI4sQ5sZYfFCEU4uSpwPjMZpT1l5xQ8AzE1bJHnPUl2Obv0fclhoNw0BY
 fPkQ==
X-Gm-Message-State: AJIora/9H6iBa/fwR931GXGWi2Sm2ycnbRwMUghUnFqOAtwJ4lxdRuJl
 iiEVZrtjeQ2cCNlN7gcK2lD+xtWXgk1HRkNuCrU=
X-Google-Smtp-Source: AGRyM1u2opzIEQ6I3CE1iYLMxJIlFOo8v6sK5yGtAJZ0sBLqE7y0SIrUIS1idVTk6pJoQsu09Jhl015xBW3/yIAGZ9c=
X-Received: by 2002:a05:620a:4402:b0:6b5:d59e:f192 with SMTP id
 v2-20020a05620a440200b006b5d59ef192mr15986559qkp.342.1658928077835; Wed, 27
 Jul 2022 06:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
 <20220727073542.811420-3-bmeng.cn@gmail.com>
 <CAGoVJZzZN5CNoURh4-uMqkPwUd-Z03PmZZ04v8M+BYi2tX37_g@mail.gmail.com>
 <CAEUhbmWv1zdYFJ-ojWxH_KnJygS2ceQyPPBvDwQ4rEqzR534EQ@mail.gmail.com>
 <YuEMnI/Sji1/r7bk@redhat.com>
 <CAEUhbmVT6bwMObhW59Oxf6nfPazDziXYbuqxC=pLBEbd26r_NQ@mail.gmail.com>
 <CAPMcbCr_hS1apvgH8-mpguEps1Q0P7wtGp_u_fSZ6TxMFRvitQ@mail.gmail.com>
In-Reply-To: <CAPMcbCr_hS1apvgH8-mpguEps1Q0P7wtGp_u_fSZ6TxMFRvitQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 27 Jul 2022 21:21:06 +0800
Message-ID: <CAEUhbmUQLEj=GBB1DOoG5UPKrOPvdz8w3=02e5hfbP=g4nU0ew@mail.gmail.com>
Subject: Re: [PATCH 2/5] util/oslib-win32: Add a helper to get the Windows
 version
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Yan Vugenfirer <yvugenfi@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72d.google.com
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

On Wed, Jul 27, 2022 at 9:18 PM Konstantin Kostiuk <kkostiuk@redhat.com> wr=
ote:
>
>
>
> On Wed, Jul 27, 2022 at 2:58 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> On Wed, Jul 27, 2022 at 6:00 PM Daniel P. Berrang=C3=A9 <berrange@redhat=
.com> wrote:
>> >
>> > On Wed, Jul 27, 2022 at 05:38:27PM +0800, Bin Meng wrote:
>> > > On Wed, Jul 27, 2022 at 4:50 PM Yan Vugenfirer <yvugenfi@redhat.com>=
 wrote:
>> > > >
>> > > > On Wed, Jul 27, 2022 at 10:43 AM Bin Meng <bmeng.cn@gmail.com> wro=
te:
>> > > > >
>> > > > > From: Bin Meng <bin.meng@windriver.com>
>> > > > >
>> > > > > This adds a helper to get the Windows version via the RtlGetVers=
ion
>> > > > > call, for QEMU codes to determine the Windows version at run-tim=
e.
>> > > > >
>> > > > > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> > > > > ---
>> > > > >
>> > > > >  include/sysemu/os-win32.h |  2 ++
>> > > > >  util/oslib-win32.c        | 15 +++++++++++++++
>> > > > >  2 files changed, 17 insertions(+)
>> > > > >
>> > > > > diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32=
.h
>> > > > > index edc3b38a57..1e324026a4 100644
>> > > > > --- a/include/sysemu/os-win32.h
>> > > > > +++ b/include/sysemu/os-win32.h
>> > > > > @@ -204,6 +204,8 @@ ssize_t qemu_recv_wrap(int sockfd, void *buf=
, size_t len, int flags);
>> > > > >  ssize_t qemu_recvfrom_wrap(int sockfd, void *buf, size_t len, i=
nt flags,
>> > > > >                             struct sockaddr *addr, socklen_t *ad=
drlen);
>> > > > >
>> > > > > +void os_get_win_version(RTL_OSVERSIONINFOEXW *info);
>> > > > > +
>> > > > >  #ifdef __cplusplus
>> > > > >  }
>> > > > >  #endif
>> > > > > diff --git a/util/oslib-win32.c b/util/oslib-win32.c
>> > > > > index 5723d3eb4c..6d2387b9ff 100644
>> > > > > --- a/util/oslib-win32.c
>> > > > > +++ b/util/oslib-win32.c
>> > > > > @@ -547,3 +547,18 @@ int qemu_msync(void *addr, size_t length, i=
nt fd)
>> > > > >       */
>> > > > >      return qemu_fdatasync(fd);
>> > > > >  }
>> > > > > +
>> > > > > +void os_get_win_version(RTL_OSVERSIONINFOEXW *info)
>> > > > > +{
>> > > > > +    typedef LONG (WINAPI *rtl_get_version_t)(PRTL_OSVERSIONINFO=
EXW);
>> > > > > +
>> > > > > +    /* RtlGetVersion is available starting with Windows 2000 */
>> > > > > +    HMODULE module =3D GetModuleHandle("ntdll");
>> > > > > +    PVOID fun =3D GetProcAddress(module, "RtlGetVersion");
>> > > > > +    rtl_get_version_t rtl_get_version =3D (rtl_get_version_t)fu=
n;
>> > > > > +
>> > > > > +    info->dwOSVersionInfoSize =3D sizeof(RTL_OSVERSIONINFOEXW);
>> > > > > +    rtl_get_version(info);
>> > > > The original function, when it was present in qemu-ga, tested that
>> > > > getting the function address succeeded.
>> > > > I think this test should be kept.
>> > > > See below:
>> > > > -    PVOID fun =3D GetProcAddress(module, "RtlGetVersion");
>> > > > -    if (fun =3D=3D NULL) {
>> > > > -        error_setg(errp, QERR_QGA_COMMAND_FAILED,
>> > > > -            "Failed to get address of RtlGetVersion");
>> > > > -        return;
>> > > > -    }
>> > > >
>> > >
>> > > Please see the comment:
>> > >
>> > > /* RtlGetVersion is available starting with Windows 2000 */
>> > >
>> > > I don't think we need that check.
>> >
>> > In include/qemu/osdep.h we have
>> >
>> > /* as defined in sdkddkver.h */
>> > #ifndef _WIN32_WINNT
>> > #define _WIN32_WINNT 0x0601 /* Windows 7 API (should be in sync with g=
lib) */
>> > #endif
>> >
>> > so do we even need to have the GetProcAddress calls at all ?
>> >
>> > Surely we can just  '#include <ddk/ntddk.h>' and call
>> > RtlGetVersion directly at compile time ?
>> >
>>
>> I believe #include <ddk/ntddk.h> is used in the kernel mode driver
>> programming environment.
>> In the user space we will have to use the ntdll exported symbol.
>>
>> I cannot locate a Microsoft doc that tells us to call RtlGetVersion
>> directly in the user space.
>
>
> From MS docs: RtlGetVersion is the kernel-mode equivalent of the user-mod=
e GetVersionEx function in the Windows SDK.
> So you can use GetVersionEx instread.
>

Unfortunately this does not work. GetVersionEx is deprecated since Windows =
8.1

Regards,
Bin

