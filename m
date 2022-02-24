Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 061C04C367D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 21:05:26 +0100 (CET)
Received: from localhost ([::1]:34774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNKMe-0001dA-UK
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 15:05:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nNKGi-0002Q6-Fr
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:59:17 -0500
Received: from [2a00:1450:4864:20::431] (port=44862
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nNKGf-0008B0-7E
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:59:16 -0500
Received: by mail-wr1-x431.google.com with SMTP id u1so1282320wrg.11
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 11:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4o+seTfZP5MVb3JPMjG/nl5zrm8fYQB/fwfblXZUIRM=;
 b=dx3M55HMkB06zABMOT/Gxya0jgPDJ3qG1R3z4PCapIDrfi7VPqJBZhg0WzUU7jBtFv
 QNS8ywhjihAmwZyAMoOwmauWWqCsLStOlR2aXczO+RzlbZ516P7mKsNQirKno3FnLOJs
 7RUo5AZLL1Ls/homfEAJ6Dn5CHYhxoOSLLpmzujXT97GN39zTCuxMqnvC+O7q29GgDU1
 fmH2VoYYx6VK5f+Du5wmrFC0Q49S8unWd0GyhGMW9pOIbtgtlYoL7yK4o0VYVVahNmUT
 UinOrqkBU4MwCtDYw0Og1yLP+MuC/ZkSczwntvziUU9Fh83htzqxpApIei2xrFGNYXlx
 manQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4o+seTfZP5MVb3JPMjG/nl5zrm8fYQB/fwfblXZUIRM=;
 b=XrhapMCFFzAVXVudbTl9JRjY4EAzkzwiAB0qldCgVkcJt85XBzxGVmiZ38rbrnzxiG
 qGplkgwnZnPShpTxiSFkHGLG+sJVormpxA22EdTddKl5puwj0RLNqkbksLQ5i1jK8kk2
 sZGr3lMqJvDap/JhgoXSfMS+K5c96DkhjRqyVulHt9G+M+MN+7+BWTk1cmifCd1+Vf9M
 TkkMHSM3PK9iLSL3I02CU1ZlU6tI+ucd+7LN7Ox/dCbvdYXGK77rK5YpRQC25XDZpenb
 k5EoA/EaorUn+OFwRp4/GDYDOKP0jUdO6JWRPbaAaaTZC3GrCiMtf0eIYFj130uRp7vK
 4UPw==
X-Gm-Message-State: AOAM531lDW1GLA4cvSE/8eqAHhDB/kRO90eCYICGa85khlBlQa71UYV1
 0vumETvz/DUMAtMIwhbyjACRpTn3Lb6M9XKuFDrt7enn
X-Google-Smtp-Source: ABdhPJznnizu9JlvTw3JMyON3r7cwbRHCIaoQd1zILXTgJTC817AbUj/8yJL25zy76WTawUWCR2SjnLCMvfokAqcNo8=
X-Received: by 2002:a5d:4ed1:0:b0:1ed:ab16:12e3 with SMTP id
 s17-20020a5d4ed1000000b001edab1612e3mr3556362wrv.421.1645732748544; Thu, 24
 Feb 2022 11:59:08 -0800 (PST)
MIME-Version: 1.0
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
 <20220224183701.608720-4-marcandre.lureau@redhat.com>
 <3dc1bb04-a749-34df-87da-c6c99d3ecd73@linaro.org>
In-Reply-To: <3dc1bb04-a749-34df-87da-c6c99d3ecd73@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 24 Feb 2022 23:58:55 +0400
Message-ID: <CAJ+F1C+7m3wh5ryLCg+oukaX1SiSKzo1w0Bet-5XQwDJ0uL6uQ@mail.gmail.com>
Subject: Re: [PATCH 03/12] osdep.h: move qemu_build_not_reached()
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000df4e3005d8c90339"
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

--000000000000df4e3005d8c90339
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Feb 24, 2022 at 11:43 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/24/22 08:36, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau<marcandre.lureau@redhat.com>
> >
> > Move the macro and declaration so it can use glib in the following
> > patch.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau<marcandre.lureau@redhat.com>
> > ---
> >   include/qemu/compiler.h | 16 ----------------
> >   include/qemu/osdep.h    | 16 ++++++++++++++++
> >   2 files changed, 16 insertions(+), 16 deletions(-)
>
> Would this be obviated by a change to _Noreturn?
>

Yes. Or we could just switch this one to _Noreturn if we decide to use
G_NORETURN elsewhere.

--=20
Marc-Andr=C3=A9 Lureau

--000000000000df4e3005d8c90339
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 24, 2022 at 11:43 PM Ri=
chard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard=
.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On 2/24/22 08:36, <a href=3D"mailto:marcandre.lureau@r=
edhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau&lt;<a href=3D"mailto:marcandre.lureau@red=
hat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Move the macro and declaration so it can use glib in the following<br>
&gt; patch.<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau&lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0include/qemu/compiler.h | 16 ----------------<br>
&gt;=C2=A0 =C2=A0include/qemu/osdep.h=C2=A0 =C2=A0 | 16 ++++++++++++++++<br=
>
&gt;=C2=A0 =C2=A02 files changed, 16 insertions(+), 16 deletions(-)<br>
<br>
Would this be obviated by a change to _Noreturn?<br></blockquote><div><br><=
/div><div>Yes. Or we could just switch this one to _Noreturn if we decide t=
o use G_NORETURN elsewhere.</div><div>=C2=A0<br></div></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000df4e3005d8c90339--

