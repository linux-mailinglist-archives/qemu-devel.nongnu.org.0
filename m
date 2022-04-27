Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EB3511375
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 10:27:28 +0200 (CEST)
Received: from localhost ([::1]:33112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njd1D-000427-2b
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 04:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1njcyp-0003DE-GD
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:24:59 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:38821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1njcyn-0004vE-S2
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:24:59 -0400
Received: by mail-qt1-x836.google.com with SMTP id fu47so631001qtb.5
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 01:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gbjOjA5eKujdmlK7QglCGVO7G4HzxnlOhbBdQE9FT5A=;
 b=jfCkRvGaFUBUXPgMAoAlrvHXFhjQ07agyUOkoc9doVrnARYxaT5x98ATQkdYrZ+9bd
 12AaLBImur1fcmZE0BKPNu+unlcXC2OF6xH0vCSyy6J3ZfyKF5OIskDiu1o8/8hjxRHC
 dEoSnYtD/4wUlF0IEAoVChJVrFpEMF8+ePRX+0VfBc3LIssXD9DZXVJ/R41UvpYa/48i
 c9rEyttone2dxf7DrqueE26Pl/mcBFF3QjjG6Jxy1HUOxuK7wUDGN6KXnMj1SiII2OCV
 m3a5qtDSspbtDQl5FH++gro/DoiA9l21uKosEje9uswU1beLKgRRgew4Ct6TCW9RtpM3
 Ezvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gbjOjA5eKujdmlK7QglCGVO7G4HzxnlOhbBdQE9FT5A=;
 b=Wyj9nTrvtEUViMzCaabYv1GX0warXj8CpPio8m7JGcFu3wvDz92v+Et/PAdd0WZvfj
 82CyP4fYaA3fHBRFxm+glX3s/E19AFJ+P2InYCG5fjk/LiFsIjqX8YkvQTnIg9V/fdRQ
 FajcjygI66p9j3i7+J4ALhw4RjL1LhDYzN2Faxz6Gk/ezkPXNpXM7QLujKafBRa8n42j
 M+iZyVx/TTriiOri1iXlY34ja/Fqq2qDo1pNq4xK+n82CRD8FeGe3BnNmxbTnaKj34qa
 IJTHkKBimbEq3qeG/2oC8USY0Zi4iErnZt17tIKoiEQs+8Mt8D6LrXOYzCZ3HQkVf1R0
 x1tQ==
X-Gm-Message-State: AOAM532sK/dyVIRkSlWTs6FXP7mMUaI2p9fH+wMvqRpr4TqPMUzO2Kzd
 unGUcPFceW2M27C0hP9kIiAQE9Ljw8gSQQApJoQ=
X-Google-Smtp-Source: ABdhPJxoM6S4BV5sLvJV+/4cEJNXQHbB9x2BnrjIYJbqNo18WKbamwc8nE+rySGQW/zaUZdZ1VLEpdxiYNzxS5X5uwk=
X-Received: by 2002:a05:622a:2c5:b0:2f3:6354:28e2 with SMTP id
 a5-20020a05622a02c500b002f3635428e2mr12196190qtx.560.1651047895662; Wed, 27
 Apr 2022 01:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-13-marcandre.lureau@redhat.com>
 <50b57e00-b805-5868-1dff-f4ed67a77a03@linaro.org>
In-Reply-To: <50b57e00-b805-5868-1dff-f4ed67a77a03@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 27 Apr 2022 12:24:44 +0400
Message-ID: <CAJ+F1CLE9GKZ5of1xVTGs3Khf6KSC+--FB9Z4-JWuVEVYZqDCg@mail.gmail.com>
Subject: Re: [PATCH v2 12/26] qga: replace pipe() with
 g_unix_open_pipe(CLOEXEC)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000054027505dd9e8bd7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x836.google.com
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
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000054027505dd9e8bd7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Apr 27, 2022 at 5:08 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 4/26/22 02:27, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   qga/commands-posix.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> > index 77f4672ca2c9..094487c2c395 100644
> > --- a/qga/commands-posix.c
> > +++ b/qga/commands-posix.c
> > @@ -2529,7 +2529,7 @@ void qmp_guest_set_user_password(const char
> *username,
> >           goto out;
> >       }
> >
> > -    if (pipe(datafd) < 0) {
> > +    if (!g_unix_open_pipe(datafd, FD_CLOEXEC, NULL)) {
> >           error_setg(errp, "cannot create pipe FDs");
> >           goto out;
> >       }
>
> This looks wrong, since the next thing that happens is fork+execl.
>
>
Before exec(), it does
        close(datafd[1]);
        dup2(datafd[0], 0);

0, the newfd, does not share file descriptor flags (the close-on-exec flag)=
.

I did a quick test, and it seems to be fine.


--=20
Marc-Andr=C3=A9 Lureau

--00000000000054027505dd9e8bd7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 27, 2022 at 5:08 AM Ric=
hard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.=
henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On 4/26/22 02:27, <a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Suggested-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@r=
edhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 =C2=A0qga/commands-posix.c | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
&gt; index 77f4672ca2c9..094487c2c395 100644<br>
&gt; --- a/qga/commands-posix.c<br>
&gt; +++ b/qga/commands-posix.c<br>
&gt; @@ -2529,7 +2529,7 @@ void qmp_guest_set_user_password(const char *use=
rname,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 if (pipe(datafd) &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 if (!g_unix_open_pipe(datafd, FD_CLOEXEC, NULL)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;cannot =
create pipe FDs&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
This looks wrong, since the next thing that happens is fork+execl.<br>
<br></blockquote><div><br></div><div>Before exec(), it does<br></div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(datafd[1]);<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dup2(datafd[0], 0);<br></div><div><br></div><div>0, the newfd, does not=
 share file descriptor flags (the close-on-exec flag).</div><div><br></div>=
<div>I did a quick test, and it seems to be fine.<br></div></div><br clear=
=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=
=A9 Lureau<br></div></div>

--00000000000054027505dd9e8bd7--

