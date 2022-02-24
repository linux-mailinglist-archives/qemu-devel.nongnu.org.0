Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DE94C3656
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:59:07 +0100 (CET)
Received: from localhost ([::1]:48490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNKGT-0001fM-RX
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:59:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nNKF9-00010Z-S7
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:57:39 -0500
Received: from [2a00:1450:4864:20::431] (port=42973
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nNKF7-00081I-SP
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:57:39 -0500
Received: by mail-wr1-x431.google.com with SMTP id d17so1289053wrc.9
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 11:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cOFcCJCSUCU9TcFcBgiP7JgPkXIaBLPnBT5tuGxMrBg=;
 b=fh/quB4sc9Nz3ITbcCOGAh786phq1iqtvIswYSX87wO4HL4Od7Yh2cdGVyNyEHxNwM
 Iqw6uuSsS9XdsAjUpuz1L9RXSdvD6EDDmZHXYeASpjOUFc4UchKoJgxePniVn/K2PCb+
 fw/lI+Ntku3J/wrITBZjq2tYwe5l56q4GXSYjku5fhY3Oiwr+yJW6yQq26PCiRnPzFmq
 4BaYFdoVkxAd90Blb0Ac5GJhGhNm74gJvk9b0SetZkJNMmW3MKCZuL5NuxiRYWWuH5TQ
 Iio93U711VGU2Sijsh4Mvo6DF3JG1Y/1pk8Nl1WeRHzfE0/UIPKVI8t8eSupWbKubXPZ
 dv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cOFcCJCSUCU9TcFcBgiP7JgPkXIaBLPnBT5tuGxMrBg=;
 b=UYuvwFCX7Aze25ZRYo5fLo0yVDXoaiLfYe3XM9t6my5aaSekGVeU0IKrk+fTyQBT4w
 ex3Smz1a6GwjwzM97cM7ShHRBC7N4dvOt9yIgY/uhcYFW7fI2PhHw/FV/6Em28/rKYyZ
 +RDUB0pxNA5npucN8KA+tFSSyQZohZJpGg1IBKI2nGfKGa4J82qxhzsITBYzdYOQF9kT
 fJ1kkLeewNOcIHAIv5cHN41ApZ1WOB0T8cBf2A1xAJadadw6eRLdzP/rvL4baKEZg1Oo
 nrcxI9qq7K2zPT6hSsXMuGEwKrI2o5xnPjZC6d0xjV+bpmAP0U45VnfVCDjMKDNxhkYa
 HkrA==
X-Gm-Message-State: AOAM530r8qw3WsKu8322cVyJQEDwyOR4WNA3Gi6TnCkvIoIJhEgB1f9o
 W2WgyAp1jtKkFIGW8tFE0AB4aBNGXfpWh8SnmqU=
X-Google-Smtp-Source: ABdhPJzeIBOmwjUo3gItct/YjffgDt3a2RnuI1qbHx/Tgse8Trr2b8V+imcyvhNBZ039pjYHkcAX9hUMOe24/FaU1Zg=
X-Received: by 2002:a5d:6d87:0:b0:1e3:ed2:cf4e with SMTP id
 l7-20020a5d6d87000000b001e30ed2cf4emr3628644wrs.326.1645732656050; Thu, 24
 Feb 2022 11:57:36 -0800 (PST)
MIME-Version: 1.0
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
 <20220224183701.608720-5-marcandre.lureau@redhat.com>
 <6af27303-1a30-991e-570f-1d594846738a@linaro.org>
In-Reply-To: <6af27303-1a30-991e-570f-1d594846738a@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 24 Feb 2022 23:57:23 +0400
Message-ID: <CAJ+F1CLzWO7-AeM7sXZ-rgN3Rva3_wTvsAg53E9OtX0GL+Pf+Q@mail.gmail.com>
Subject: Re: [PATCH 04/12] compiler.h: replace QEMU_NORETURN with G_NORETURN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005bf71b05d8c8fe72"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005bf71b05d8c8fe72
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Feb 24, 2022 at 11:37 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/24/22 08:36, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > G_NORETURN was introduced in glib 2.68, fallback to G_GNUC_NORETURN in
> > glib-compat.
> >
> > Note that this attribute must be placed before the function declaration
> > (bringing a bit of consistency in qemu codebase usage).
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> For C11, G_NORETURN is a wrapper for _Noreturn.
> Since we're using C11, we should just use _Noreturn.
>

G_NORETURN has several flavours, one of them is the c++ [[noreturn]], but
also MSVC specific etc.

Might be worth considering if we think about making code usable in
different contexts.


>
> >   void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> >                                       MMUAccessType access_type, int
> mmu_idx,
> > -                                    uintptr_t retaddr) QEMU_NORETURN;
> > +                                    uintptr_t retaddr) G_NORETURN;
>
> Incorrect placement.  I didn't scan the whole patch; I assume that using
> _Noreturn will
> flag this up as an error.
>

Right, bad regexp search, will fix.


>
> > -static void QEMU_NORETURN dump_core_and_abort(int target_sig)
> > +G_NORETURN static void dump_core_and_abort(int target_sig)
>
> I guess this can go either place, but I think I prefer the scope specifie=
r
> first.
>

Ok, I'll change it to "static G_NORETURN"

--=20
Marc-Andr=C3=A9 Lureau

--0000000000005bf71b05d8c8fe72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 24, 2022 at 11:37 PM Ri=
chard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard=
.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On 2/24/22 08:36, <a href=3D"mailto:marcandre.lureau@r=
edhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; G_NORETURN was introduced in glib 2.68, fallback to G_GNUC_NORETURN in=
<br>
&gt; glib-compat.<br>
&gt; <br>
&gt; Note that this attribute must be placed before the function declaratio=
n<br>
&gt; (bringing a bit of consistency in qemu codebase usage).<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
<br>
For C11, G_NORETURN is a wrapper for _Noreturn.<br>
Since we&#39;re using C11, we should just use _Noreturn.<br></blockquote><d=
iv><br></div><div>G_NORETURN has several flavours, one of them is the c++ [=
[noreturn]], but also MSVC specific etc.</div><div><br></div><div>Might be =
worth considering if we think about making code usable in different context=
s.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
&gt;=C2=A0 =C2=A0void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr a=
ddr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAcc=
essType access_type, int mmu_idx,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_t retaddr)=
 QEMU_NORETURN;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_t retaddr)=
 G_NORETURN;<br>
<br>
Incorrect placement.=C2=A0 I didn&#39;t scan the whole patch; I assume that=
 using _Noreturn will <br>
flag this up as an error.<br></blockquote><div><br></div><div>Right, bad re=
gexp search, will fix.</div><div>=C2=A0<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
&gt; -static void QEMU_NORETURN dump_core_and_abort(int target_sig)<br>
&gt; +G_NORETURN static void dump_core_and_abort(int target_sig)<br>
<br>
I guess this can go either place, but I think I prefer the scope specifier =
first.<br>
</blockquote></div><div><br></div><div>Ok, I&#39;ll change it to &quot;stat=
ic G_NORETURN&quot;<br></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_sig=
nature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000005bf71b05d8c8fe72--

