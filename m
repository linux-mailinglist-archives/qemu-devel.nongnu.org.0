Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997E4338651
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 08:03:09 +0100 (CET)
Received: from localhost ([::1]:58666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKbpE-0003pl-Mr
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 02:03:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lKbnN-0003IK-Mm
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 02:01:13 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:37348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lKbnM-0008RO-1p
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 02:01:13 -0500
Received: by mail-ej1-x632.google.com with SMTP id bm21so51314638ejb.4
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 23:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Ew4BLBUe8VpBtwuVreRH7MeTYH0jyVj/HX4tIr0KQ4=;
 b=jIsen+EY7OLlWglFgspv+wTkDa+H7yCkmNt3ScsfTdlCL9sl7LBOisCxg5H8Y8mr+b
 q6QjOUbPp9xh0DSV3ZCilQGEPb2eOCXsJ9zFrb1/buVTj1vQG5KTIe9BZ0xzBgraiHwm
 ZUlZYZJuSuIjGEsRtHwIT13tCg+QN5hYp4sVtT44ygCFGhhhOCn9MxUJW14M74Ga43Gs
 DMbHybOgu4Im6seKV1K3jn5W1W6bYOSJCx72Hr93TN0CNPqkSH5C09gmxkX80xm+lvpL
 Rb63ELATwiH/SNWiVDwVbhUBDk01mlLUXVVRlZGo9okX9y+YZgwRaqJb6jsTNfU8VM3W
 d20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Ew4BLBUe8VpBtwuVreRH7MeTYH0jyVj/HX4tIr0KQ4=;
 b=CjJdXsb4P3qw2YZuJrCxH+rh2gXaCGKOi5NS2XZqMHcPrAgzw09NARUKOKCZmS07Qw
 h+d8KxYpZgPr3KRL/OIpIPmO2XBJqCZurZr4o/vgG8jrulD+hCo1SrNrlQy94tMrcRSN
 RdsDwSBEqqOjHRVRPXQ0pACcSllmWFZELQM8PNfVq+Q4NP+i/H99iE/h3XFtM3mUkERB
 7+UOqTADf8mSlHIlZ3WYl2lCrUovnQNCESt7OA+te3HRnoumMsWD3euEf+balSR1/c/Z
 7a4JqmJyBAT9vnujRKgl5qtti4XLBjvwgkPoPmi2f+8LwkT3DagniBrjtLzWzgaBF9mP
 R+8A==
X-Gm-Message-State: AOAM530pe+eaUFHHT0+U+kV0gI4XQtgplWaWpbcFROV2MCx/9ValS76l
 zqtSK6cyMayV7o5UjHkuHnkfgumosV91Axl+Nig=
X-Google-Smtp-Source: ABdhPJwPdven6mOZR+4BvIu0h9ADk2CapT37ilAuKVfyagWcrkqBYGn+EQaGXKOxssrjFwCLE6+kDPdeaHC+NHPMxm8=
X-Received: by 2002:a17:907:3e8c:: with SMTP id
 hs12mr7036049ejc.105.1615532470210; 
 Thu, 11 Mar 2021 23:01:10 -0800 (PST)
MIME-Version: 1.0
References: <CAOEv1kaN60EjpbxjMq6=K2FFLiW3DbufiTg0evcA72h-2qyW_g@mail.gmail.com>
In-Reply-To: <CAOEv1kaN60EjpbxjMq6=K2FFLiW3DbufiTg0evcA72h-2qyW_g@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 12 Mar 2021 11:00:58 +0400
Message-ID: <CAJ+F1CJH9807P1fJ1rKR3Kvg2P8-SN3s8sCxkQ9w+Py2uvev=w@mail.gmail.com>
Subject: Re: 3D Acceleration for Windows hosts?
To: John Klimek <jklimek@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000002969e05bd51772e"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000002969e05bd51772e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Mar 12, 2021 at 2:44 AM John Klimek <jklimek@gmail.com> wrote:

> Does QEMU have any support for 3D acceleration on Windows hosts?
>
> I'm not too familiar with video/graphics libraries, but it seems like
> QEMU OpenGL support requires Mesa GBM which is only available for
> Linux (DRM/KMS).
>

In theory, the SDL and GTK3 backends should work on Windows with gl=3Don. B=
ut
I don't think anyone really tried it, so a few fixes are to be expected.


> The other option is the Virgl3D renderer but that also requires Linux
> (DRM).
>
>
Not so long ago, it was possible to cross-compile virgl for windows. But
virgl depends on a functioning QEMU GL backend, so getting the above is a
preliminary. Note that OpenGL drivers on Windows have been notoriously bad,
and you may need to use ANGLE.


> I'm not really sure if I know what I'm talking about so please correct
> me if I'm wrong and also let me know if there is a way to enable 3D
> acceleration under Windows hosts.
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000002969e05bd51772e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 12, 2021 at 2:44 AM Joh=
n Klimek &lt;<a href=3D"mailto:jklimek@gmail.com">jklimek@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Does QEM=
U have any support for 3D acceleration on Windows hosts?<br>
<br>
I&#39;m not too familiar with video/graphics libraries, but it seems like<b=
r>
QEMU OpenGL support requires Mesa GBM which is only available for<br>
Linux (DRM/KMS).<br></blockquote><div><br></div><div>In theory, the SDL and=
 GTK3 backends should work on Windows with gl=3Don. But I don&#39;t think a=
nyone really tried it, so a few fixes are to be expected.<br></div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
The other option is the Virgl3D renderer but that also requires Linux (DRM)=
.<br>
<br></blockquote><div><br></div><div>Not so long ago, it was possible to cr=
oss-compile virgl for windows. But virgl depends on a functioning QEMU GL b=
ackend, so getting the above is a preliminary. Note that OpenGL drivers on =
Windows have been notoriously bad, and you may need to use ANGLE.<br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I&#39;m not really sure if I know what I&#39;m talking about so please corr=
ect<br>
me if I&#39;m wrong and also let me know if there is a way to enable 3D<br>
acceleration under Windows hosts.<br>
</blockquote></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Ma=
rc-Andr=C3=A9 Lureau<br></div></div>

--00000000000002969e05bd51772e--

