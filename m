Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBD6553161
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 13:51:42 +0200 (CEST)
Received: from localhost ([::1]:56976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3cPz-00066l-NZ
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 07:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o3cOU-0005N6-Od
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 07:50:06 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:37726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o3cOT-0002hJ-5M
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 07:50:06 -0400
Received: by mail-lf1-x12d.google.com with SMTP id t24so9688859lfr.4
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 04:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a6nj/SWnKef09eovYrUdgRarEPgXF/jHK0JP65uKHjM=;
 b=JQT0g3jSNQx+E1RyX+dZFswjMoe+lRMxY9qmjT5C0jZOJXY3YKE8GlGSILuvwsGk+I
 Soh6899RF6HdPOvqNgEXhqxSn1EHltr7hmO/VgVLvJewkgjX//pjwYOKfrq1E1t3/Frt
 ydXqUKfkkSNT4rfFpSh4aCG50aWSMe/XCIRFBQxdeIzBmvNgSthR0oyiFswC2IvWJ30j
 LNXClOV01ekgHm0uCl7Dp0j0ZTrFGnk7wpcRiTfTX+DgbBmrgR+YPJtJKrCsv1JrW4x/
 XMygJpesnhSYQ3UeycGv1j3fKG/JblM1sUWZOGofovGDhWylx5ZCpJbDhF3OVVN5OI6H
 m7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a6nj/SWnKef09eovYrUdgRarEPgXF/jHK0JP65uKHjM=;
 b=jV2OGlE850zEZ4YJ8yy8ywl/TNywXmC/ehD/7oIl+wqW063mpNQBA18t0aDQn6Qatd
 nYBTmGXZikQyIlG9O5MPG9Ncs8NkUUruRPU1HStudwbafs4tV6A4JsSl2LE8YhsstIlg
 kGafSTuiF5nGgwc/5n66GTphuCEMn+MlSb0wFAo5NFpTHuePtOY1Wi9v78idukxlzsdz
 PmaGyOi1D4kai4Xw7BGE2A3NeW+JoXBbmDlqz7+jOPgyQgjaNpLOlSq3Qf0fMIrVJy48
 Ci7zz6VqoxExEoRtJzmuTixuSj3VX8mq3PqJjYqlBZOrhcPa2wZjQ+l/aLgKkjRfs05X
 Smgg==
X-Gm-Message-State: AJIora9VZXz/bsYZ6WsDSZ6jXPAW37knA64D5sxngz5nTBbQjHGpbkYI
 L+Szr72hNnbGenkoEN70oHhmOBz1+jVga9Kh4L4=
X-Google-Smtp-Source: AGRyM1tr5wHavmbPOGe1Jp4vV6nqYZM4hFWTaz21iSWRwnI1AxICPRs86fTYODl3g/bpiPbpibpTqFjetB8mW3sKdIk=
X-Received: by 2002:a05:6512:3f27:b0:47f:77d9:f23b with SMTP id
 y39-20020a0565123f2700b0047f77d9f23bmr3744155lfa.94.1655812202712; Tue, 21
 Jun 2022 04:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220621083420.66365-1-marcandre.lureau@redhat.com>
 <CAFEAcA9SyfaMYkH2RvELExUJF_V-XbnhCmJa_m7RA0rOTOvEQQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9SyfaMYkH2RvELExUJF_V-XbnhCmJa_m7RA0rOTOvEQQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 21 Jun 2022 15:49:50 +0400
Message-ID: <CAJ+F1C+AYGZmT0RVfc4Vc2o+sw2dcRXOmvCO3vZXUf3Np5zENA@mail.gmail.com>
Subject: Re: [PATCH] tests: fix test-cutils leaks
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000028530905e1f3d268"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000028530905e1f3d268
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Jun 21, 2022 at 3:46 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 21 Jun 2022 at 09:36, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Reported by ASAN.
> >
> > Fixes commit cfb34489 ("cutils: add functions for IEC and SI prefixes")=
.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> g_autofree would be neater, but this works, so:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
>
sadly, not really, since you have to call g_free() before new
assignments... (yes it makes me sad too :)


--=20
Marc-Andr=C3=A9 Lureau

--00000000000028530905e1f3d268
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 21, 2022 at 3:46 PM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Tue, 21 Jun 2022 at 09:36, &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:<=
br>
&gt;<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Reported by ASAN.<br>
&gt;<br>
&gt; Fixes commit cfb34489 (&quot;cutils: add functions for IEC and SI pref=
ixes&quot;).<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
<br>
g_autofree would be neater, but this works, so:<br>
Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" =
target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
<br></blockquote><div><br></div><div>sadly, not really, since you have to c=
all g_free() before new assignments... (yes it makes me sad too :)<br></div=
><br clear=3D"all"></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signatu=
re">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000028530905e1f3d268--

