Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF994D2AB4
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 09:34:59 +0100 (CET)
Received: from localhost ([::1]:54952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRrmc-0001n2-G1
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 03:34:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRrky-00015Y-L7
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:33:16 -0500
Received: from [2a00:1450:4864:20::42a] (port=40912
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRrkx-000647-7m
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:33:16 -0500
Received: by mail-wr1-x42a.google.com with SMTP id k24so1792989wrd.7
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 00:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7kRyljUm2v9iP/fUdukWHwL2KXELW7MB8C4/yfbkaPo=;
 b=GJrjv3km6dYp7UcxmZHcpQmmw2SaPt/n8+BaaE7R7xcFyEVWRME+27V4s9DX0dFS8U
 qX6bcZq3+iFhOkxiIGRL0hC1QN34jfuQIa+qmySXr72f2EaLJlGBq8sns/kam8OcMekt
 hSSpSwO1WowjmVllfuJVpBfPcnMpCViABn8lapyCz3bFFThoGfDRGtXIiKptrKxxHHg+
 3wqmfUjn30wWfwE8LcbBu5Jrv4WDxaUUVoYobvmJ0BfjLzo5y1CiRHRpRr31JvvW3xj6
 uT2P7Gxs5ZYOJ2wN0yjQkvF9qK3vdnA7SY/rms7bfRAsYRYNsNzcoFbDtHivhCVOLc82
 aw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7kRyljUm2v9iP/fUdukWHwL2KXELW7MB8C4/yfbkaPo=;
 b=19lEZfY47eeEmIr8TNQ6ADVMtCYU7n1Ro96ezwbScxyEtHEcK3svDrwaXgoGiWrot3
 3BHJKYOQ9vAlUGfzEBG7QvJi3kIGS1qSG3d6cUaVBgprkQgMEjsys6RvkplNDXaZW1El
 yLrvLWBadJpDmmvPosDtYJOgJ8/9tkjneoXRwaK8IJo7OvscWLmXE8wNUSu3B/JlC45n
 gjbULsMHddCGxuvUn7Hi0eVbQRRwhdnI4dewAcZLtyVOlz5k5PKM/zkZixWPfSxJuwxM
 0GfWvPtpMPTGpMV6F3DIfT6meeCtlfrka/baoFJu9MeT2sSjCzg9M/Sa/d2XfSbbyH1l
 ZxXw==
X-Gm-Message-State: AOAM532/sxfJLKO9ODRXbeJrdaZ+ciOtOpzQ+H4k3hfY+s6Fn2tc6B6d
 jwdqlaY7xEs3XNdQKHL+BO9phzNEsvbhxqJmiYo=
X-Google-Smtp-Source: ABdhPJzzLB9HVYG7pf3l7hVaQRtCiXYaEgcmgYcMiYfwLb5uv+6pava7jxFq4LO/EwkbqRz2rDTmExO+3OzwrWYfXKM=
X-Received: by 2002:a5d:4704:0:b0:1fb:768d:7b6 with SMTP id
 y4-20020a5d4704000000b001fb768d07b6mr8120155wrq.187.1646814793867; Wed, 09
 Mar 2022 00:33:13 -0800 (PST)
MIME-Version: 1.0
References: <20220307074632.238049-1-marcandre.lureau@redhat.com>
 <20220307074632.238049-13-marcandre.lureau@redhat.com>
 <c80fde18-bb3e-e780-356c-f935e7390e4d@gmail.com>
 <CAMxuvaw_QT4wEGLZRNJEd1m-58JV-8AOc6CHKkMw4i_yrVNgew@mail.gmail.com>
 <28ef9b06-3225-112f-b664-176e67c824d9@gmail.com>
 <CAMxuvaz3+ySgiOxawVT=P7x4ikDcap0o5Ux78_HdewL0XXa5Kg@mail.gmail.com>
 <d7df9ba7-40db-7b2a-63d7-eacf811da4f2@gmail.com>
 <CAMxuvaxU56M9AvS9XfZWVBNYSORBTqWmZf3yteK8KfVcdh9Ltw@mail.gmail.com>
 <f06f3b30-eb9d-17c7-3bac-ee2a31c158f2@gmail.com>
 <CAMxuvawuMvxWx7xtsf=PbWnu7UypNfVWf+Bufeqbi4J=SjsU9w@mail.gmail.com>
 <1fa142fb-7988-db25-c283-a6b16278f628@gmail.com>
 <CAJ+F1CLDm9+myAJdNQdU2y64Fa-2+ew2oGih_cWim1=vO=sLMw@mail.gmail.com>
 <e1a9ab86-912b-2628-1e60-4aec4eac25d3@gmail.com>
 <CAJ+F1CKJHqA5DJv1WvY8q0k2rNW+ERFbFgMGKggMuMUJCPs5vg@mail.gmail.com>
 <2517a6b9-cc34-3bb1-d17e-d4e30f0e68b7@gmail.com>
In-Reply-To: <2517a6b9-cc34-3bb1-d17e-d4e30f0e68b7@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 9 Mar 2022 12:33:01 +0400
Message-ID: <CAJ+F1CKrDnYdMKNh1nu8LjnQ=gJ9-umgGHW-E1D1sFO1gf=Rdg@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000cca53d05d9c4f284"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cca53d05d9c4f284
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 9, 2022 at 12:21 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

>
> If it is expected that dpy_gfx_update is required, it should call
> dpy_gfx_update. I agree it is not a right timing to fix vnc to remove
> the implicit update as it is pre-existing.
> However the lack of dpy_gfx_update call is a regression and should be
> fixed.
>
>
Calling dpy_gfx_update is done when the scanount.kind is SURFACE.

dpy_gfx_update is specific to SURFACE, GL uses dpy_gl_update.

--=20
Marc-Andr=C3=A9 Lureau

--000000000000cca53d05d9c4f284
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 9, 2022 at 12:21 PM Aki=
hiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br>
If it is expected that dpy_gfx_update is required, it should call <br>
dpy_gfx_update. I agree it is not a right timing to fix vnc to remove <br>
the implicit update as it is pre-existing.<br>
However the lack of dpy_gfx_update call is a regression and should be fixed=
.<br clear=3D"all"><br></blockquote></div><div><br></div><div>Calling dpy_g=
fx_update is done when the scanount.kind is SURFACE.</div><div><br></div><d=
iv>dpy_gfx_update is specific to SURFACE, GL uses dpy_gl_update.<br></div><=
div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000cca53d05d9c4f284--

