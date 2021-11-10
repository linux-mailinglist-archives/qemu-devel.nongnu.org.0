Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E47044C4C7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 17:04:51 +0100 (CET)
Received: from localhost ([::1]:40272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkq5i-0004T8-4v
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 11:04:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkq4M-0003n2-Cr
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:03:26 -0500
Received: from [2607:f8b0:4864:20::a2f] (port=33405
 helo=mail-vk1-xa2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkq4K-0001Dm-3C
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:03:26 -0500
Received: by mail-vk1-xa2f.google.com with SMTP id d130so1648099vke.0
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 08:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OKrbhqKR92xyQziwY+EUM0vvhPyzuxbi4Lp9RcpOI5k=;
 b=4OuM1zZ/S7mC3DUCiSFSu4zp1dHjyORZ5sh5Q7mTVAN1y6i5gOA+CFt9noy3B9HBIp
 Qw6huQfUFPziCNeBwHdoRY/caj9tLV2/2uBpP33gb+bolUis+jhkJIoummzQnifKUxdk
 /mmUhfepK4A8Jcqj9mrAx5KXAJOs9r9b/wylXZ0V3aQL5f2+3rreVygAHqlmc29Td7Cu
 jEAMKyNaLBvAR/r83ZRFTjknUQFcG1QYrL/qGid2ri/bftDHHaW4KI6BQ6eZQiIwAHBK
 3eOA4EcdTivRfl/8mHXIdyq3ybPnVHqmNq8IWiQil6MHe8Q79jN+03iCFsn1nozAMzJo
 RMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OKrbhqKR92xyQziwY+EUM0vvhPyzuxbi4Lp9RcpOI5k=;
 b=NfjWFd2WsEhFEeAAOPWmMY2dm+piQhU2Tx8vuboiiNz0pSUIcsm6nQVK16tTHO2jcy
 wdgZfV7z1MzXpV+TMpKOur5xFP7gJfFIaIKylVfZ91tgzX/rNbZPR9cz7BT10y0lk/FL
 oJFILPYTE0fTOKkrGD1s035v+ET0WHDf32zHgcyMkFN/scPYVFGVEYSaoIuKazpnmBhL
 95o2oJ+mVcTrpkFhpZ606K3byQeslAAVKm7W1K2uRmGixywCsL+yRh3yFY8QBXU+b/FJ
 Rdf3QBjNvfyEo+vadFooUJJg3K9JRMUZPOGA/ltgJeijAQKvay1F0/3V95NkzLXvSeVT
 FFog==
X-Gm-Message-State: AOAM533FxUu6QTQo6vfLlq4CyHMeB1OwmCmwvJUlyLrAU4h9l1R7hkma
 mUADRDIYIQav5e+ixvMYCRNx7QZp11kRtgKOdLozZg==
X-Google-Smtp-Source: ABdhPJzfoi51cbxXSK4fpBQDWO4yCo1HzNPNtMAPb+8Ttoc6cfniyxAWKD9RRhf6n2LRc5so2+oA6LCX3uyQjaIyHNs=
X-Received: by 2002:a05:6122:78c:: with SMTP id
 k12mr340140vkr.22.1636560202781; 
 Wed, 10 Nov 2021 08:03:22 -0800 (PST)
MIME-Version: 1.0
References: <20211108194230.1836262-1-raj.khem@gmail.com>
 <0242a761-cd00-1a22-e64c-952befad9988@linaro.org>
 <01900319-d1fc-b677-1f35-5ee2da5bc8a4@linaro.org>
 <cda72b6b-e34c-2c99-834a-5897f128a5ae@linaro.org>
In-Reply-To: <cda72b6b-e34c-2c99-834a-5897f128a5ae@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 10 Nov 2021 09:03:11 -0700
Message-ID: <CANCZdfp0tkdsoEp7_AYZ=0MsiN9hg=pY5hf_AhqYpCiiKYqoAg@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Replace __u64 with uint64_t
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000008a66db05d0715d45"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>, Khem Raj <raj.khem@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008a66db05d0715d45
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 10, 2021 at 8:19 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/10/21 4:12 PM, Richard Henderson wrote:
> > On 11/10/21 10:25 AM, Richard Henderson wrote:
> >> On 11/8/21 8:42 PM, Khem Raj wrote:
> >>> uint64_t is available in all userspaces via compiler include stdint.h
> >>> therefore use it instead of __u64 which is linux internal type, it
> fixes
> >>> build on some platforms eg. aarch64 systems using musl C library
> >>>
> >>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ---
> >>>   linux-user/host/aarch64/hostdep.h | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/linux-user/host/aarch64/hostdep.h
> b/linux-user/host/aarch64/hostdep.h
> >>> index a8d41a21ad..34d934f665 100644
> >>> --- a/linux-user/host/aarch64/hostdep.h
> >>> +++ b/linux-user/host/aarch64/hostdep.h
> >>> @@ -25,7 +25,7 @@ extern char safe_syscall_end[];
> >>>   static inline void rewind_if_in_safe_syscall(void *puc)
> >>>   {
> >>>       ucontext_t *uc = puc;
> >>> -    __u64 *pcreg = &uc->uc_mcontext.pc;
> >>> +    uint64_t *pcreg = &uc->uc_mcontext.pc;
> >>>       if (*pcreg > (uintptr_t)safe_syscall_start
> >>>           && *pcreg < (uintptr_t)safe_syscall_end) {
> >>
> >> Queued to tcg-next, since that's where the original patch came from.
> >
> > Dequeued.  We need something more, because on debian we now get:
> >
> > ../linux-user/host/aarch64/hostdep.h:28:23: error: initialization of
> 'uint64_t *' {aka
> > 'long unsigned int *'} from incompatible pointer type 'long long
> unsigned int *'
> > [-Werror=incompatible-pointer-types]
> >       uint64_t *pcreg = &uc->uc_mcontext.pc;
> >                         ^
> > cc1: all warnings being treated as errors
> >
> > Perhaps we need to use __typeof() to get the correct pointer type?  Oh
> for c++11 auto
> > declarations... :-)
>
> No, we need to not use a pointer at all and grab Warner's
>
>    https://patchew.org/QEMU/20211108023738.42125-1-imp@bsdimp.com/
>
> Even grabbing the first two patches of that series for 6.2 would fix this.
>

I tried to do a pointer for this stuff, only to find several places where
there
were mismatches like's reported there.

I also have an improvement to that series I was going to send later today
that fixes the check-patch warning by moving some externs around.  I was
going to do that after looking through my inbox to see if there'd been more
comments or not. I'll make sure the relevant fixes are first for this issue.

Warner

--0000000000008a66db05d0715d45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 10, 2021 at 8:19 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 11/10/21 4:12 PM, Richard Henderson wrote:<br>
&gt; On 11/10/21 10:25 AM, Richard Henderson wrote:<br>
&gt;&gt; On 11/8/21 8:42 PM, Khem Raj wrote:<br>
&gt;&gt;&gt; uint64_t is available in all userspaces via compiler include s=
tdint.h<br>
&gt;&gt;&gt; therefore use it instead of __u64 which is linux internal type=
, it fixes<br>
&gt;&gt;&gt; build on some platforms eg. aarch64 systems using musl C libra=
ry<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.c=
om" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; =C2=A0 linux-user/host/aarch64/hostdep.h | 2 +-<br>
&gt;&gt;&gt; =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/linux-user/host/aarch64/hostdep.h b/linux-user/ho=
st/aarch64/hostdep.h<br>
&gt;&gt;&gt; index a8d41a21ad..34d934f665 100644<br>
&gt;&gt;&gt; --- a/linux-user/host/aarch64/hostdep.h<br>
&gt;&gt;&gt; +++ b/linux-user/host/aarch64/hostdep.h<br>
&gt;&gt;&gt; @@ -25,7 +25,7 @@ extern char safe_syscall_end[];<br>
&gt;&gt;&gt; =C2=A0 static inline void rewind_if_in_safe_syscall(void *puc)=
<br>
&gt;&gt;&gt; =C2=A0 {<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ucontext_t *uc =3D puc;<br>
&gt;&gt;&gt; -=C2=A0=C2=A0=C2=A0 __u64 *pcreg =3D &amp;uc-&gt;uc_mcontext.p=
c;<br>
&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint64_t *pcreg =3D &amp;uc-&gt;uc_mcontex=
t.pc;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (*pcreg &gt; (uintptr_t)safe=
_syscall_start<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;&a=
mp; *pcreg &lt; (uintptr_t)safe_syscall_end) {<br>
&gt;&gt;<br>
&gt;&gt; Queued to tcg-next, since that&#39;s where the original patch came=
 from.<br>
&gt; <br>
&gt; Dequeued.=C2=A0 We need something more, because on debian we now get:<=
br>
&gt; <br>
&gt; ../linux-user/host/aarch64/hostdep.h:28:23: error: initialization of &=
#39;uint64_t *&#39; {aka <br>
&gt; &#39;long unsigned int *&#39;} from incompatible pointer type &#39;lon=
g long unsigned int *&#39; <br>
&gt; [-Werror=3Dincompatible-pointer-types]<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 uint64_t *pcreg =3D &amp;uc-&gt;uc_mcon=
text.pc;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>
&gt; cc1: all warnings being treated as errors<br>
&gt; <br>
&gt; Perhaps we need to use __typeof() to get the correct pointer type?=C2=
=A0 Oh for c++11 auto <br>
&gt; declarations... :-)<br>
<br>
No, we need to not use a pointer at all and grab Warner&#39;s<br>
<br>
=C2=A0 =C2=A0<a href=3D"https://patchew.org/QEMU/20211108023738.42125-1-imp=
@bsdimp.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU=
/20211108023738.42125-1-imp@bsdimp.com/</a><br>
<br>
Even grabbing the first two patches of that series for 6.2 would fix this.<=
br></blockquote><div><br></div><div>I tried to do a pointer for this stuff,=
 only to find several places where there</div><div>were mismatches like&#39=
;s reported there.</div><div><br></div><div>I also have an improvement to t=
hat series I was going to send later today</div><div>that fixes the check-p=
atch warning by moving some externs around.=C2=A0 I was</div><div>going to =
do that after looking through my inbox to see if there&#39;d been more</div=
><div>comments or not. I&#39;ll make sure the relevant fixes are first for =
this issue.</div><div><br></div><div>Warner</div></div></div>

--0000000000008a66db05d0715d45--

