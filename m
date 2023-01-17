Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C295266DE5B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 14:05:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHle6-0006ID-7g; Tue, 17 Jan 2023 08:04:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pyr@spootnik.org>) id 1pHle2-0006I4-1y
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:04:54 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pyr@spootnik.org>) id 1pHldx-0004rv-R9
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:04:51 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-4d59d518505so251849337b3.1
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 05:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=spootnik-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l3jNQz0lsJUU3TuGg/4gxkTQnOA0XJXmcUbBAkZgP48=;
 b=vToykI1eH9thppGcHG6Ami2eTryI7GYs8GuSDdClADJZrfM2JBdZ79w/VIDxudAy+W
 AaL35WeHns8crkVRXkZjWLhUmg57R+95LAVetiFnGPuQr7k2njZRJOsOtfiTdBe7gHYo
 q1FPNYrxqhx2JsULRPuQHY6L9ZkovrElU+dU/s+pMh1+dfw31bCOyyFeKwweGDbtq12+
 6uZLVWqnnx1IRpbAIIS5i4CV+LK5dkgokz1K6VDivC1EByhqBdsNdJBqbHV0bx9dQS8K
 PADfuq/BI6+dWme6s9RyCbg/1aEjeQvZOBq6Nh16xlfKXGs+lP8shZuNRj0H71NuhecT
 TIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l3jNQz0lsJUU3TuGg/4gxkTQnOA0XJXmcUbBAkZgP48=;
 b=1/WjRfLXyOXcjDC+MPgLmlZHCzxlbOgIohZm245YoNDsgcS7FqDk60K3D4KwG1JaRm
 CF66MWxa4JNsvFNrjWm9xs0px4o/jiUjE5ZEzKIZDbNq+ViHppU8To1EltNaFj8kBOTT
 qQ5zdV/fSkqfx0KXIYTSOFebq+UCL0DUEJeDZzjvqCU2zQrl9AHo+z9IanUD7E2+rTNn
 Z6lNv2H0GiGljebeBBnU85bM+BUF+iqtnMEigCTSuTR3VEgfHZSP0z4amOHc8FY9zFcJ
 YGtIuKqLT6dzO+EoCteI02vt3h+0hi64RnpoLIDWJ/lPcL+eoKLa7lFUGwk1Hq/GLgtS
 q/Rg==
X-Gm-Message-State: AFqh2koYo1EUGKOJbNb0nakuzuABki9dLghYhRq4ELQT4iPKXfDv6Qwy
 ce2r0ZPuo2jMUZYXClMRHo4xBqqQQ6DiXLTT3MHFIQ==
X-Google-Smtp-Source: AMrXdXvtMy28S2G0o04ASJwDMYjWHlFRJm5DjPVEqun3Ob6Di3ym6300LwdaXiB1rohlpjXm7JZ2nvIaZsPlypOG6Y0=
X-Received: by 2002:a81:7dd7:0:b0:4bb:c96d:f685 with SMTP id
 y206-20020a817dd7000000b004bbc96df685mr391847ywc.208.1673960688471; Tue, 17
 Jan 2023 05:04:48 -0800 (PST)
MIME-Version: 1.0
References: <20221202151202.24851-1-pyr@spootnik.org>
 <Y8acMi/eZAYfILg3@redhat.com>
In-Reply-To: <Y8acMi/eZAYfILg3@redhat.com>
From: Pierre-Yves Ritschard <pyr@spootnik.org>
Date: Tue, 17 Jan 2023 14:04:53 +0100
Message-ID: <CAJwCgu8aP9fF6u2dv9dMZypftAupyMx71BxvoDeqj7nxxFZj5w@mail.gmail.com>
Subject: Re: [PATCH] ui/vnc.c: Allow websocket connections over AF_UNIX sockets
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000003467ff05f275589f"
Received-SPF: none client-ip=2607:f8b0:4864:20::1136;
 envelope-from=pyr@spootnik.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000003467ff05f275589f
Content-Type: text/plain; charset="UTF-8"

Allowing websockets is fine, but just removing this check is not
> sufficient
>
> The 'websocket=XXXX' parameter for -vnc takes two formats
>
>    websocket=on|off
>
> or
>
>    websocket=portnum
>
> In the case of on|off, the code takes the original VNC display
> num and listens on   5700 + display for websockets, 590 + display
> for non-websockets.
>
> In the case of a explicit port, the code listens on that port.
>
> Also we fail to actually handle 'off' correctly, just treating
> it as a named port
>
> $ qemu-system-x86_64  -vnc :1,websocket=off
> qemu-system-x86_64: -vnc :1,websocket=off: address resolution failed for
> :off: Servname not supported for ai_socktype
>
>
> Anyway given an argument
>
>    -vnc  unix:/some/path,websocket=on
>
> this cause causes QEMU to listen on a relative path 'on'. We need
> to define what the semantics for websockets=on are going to be
> for UNIX sockets. Should it append '.ws' to the main path ? Should
> we just not allow websockets=on and document it must be an explicit
> path at all times ?
>
> We also need to document this in qemu-options.hx.
>
>
>
Thank you, these semantics weren't obvious to me, I will adapt accordingly
and post a new patch

--0000000000003467ff05f275589f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Allowing websockets is fine, but just removing this check is not<br>
sufficient<br>
<br>
The &#39;websocket=3DXXXX&#39; parameter for -vnc takes two formats<br>
<br>
=C2=A0 =C2=A0websocket=3Don|off<br>
<br>
or<br>
<br>
=C2=A0 =C2=A0websocket=3Dportnum<br>
<br>
In the case of on|off, the code takes the original VNC display<br>
num and listens on=C2=A0 =C2=A05700 + display for websockets, 590 + display=
<br>
for non-websockets.<br>
<br>
In the case of a explicit port, the code listens on that port.<br>
<br>
Also we fail to actually handle &#39;off&#39; correctly, just treating<br>
it as a named port<br>
<br>
$ qemu-system-x86_64=C2=A0 -vnc :1,websocket=3Doff<br>
qemu-system-x86_64: -vnc :1,websocket=3Doff: address resolution failed for =
:off: Servname not supported for ai_socktype<br>
<br>
<br>
Anyway given an argument<br>
<br>
=C2=A0 =C2=A0-vnc=C2=A0 unix:/some/path,websocket=3Don<br>
<br>
this cause causes QEMU to listen on a relative path &#39;on&#39;. We need<b=
r>
to define what the semantics for websockets=3Don are going to be<br>
for UNIX sockets. Should it append &#39;.ws&#39; to the main path ? Should<=
br>
we just not allow websockets=3Don and document it must be an explicit<br>
path at all times ?<br>
<br>
We also need to document this in qemu-options.hx.<br>
<br><br></blockquote><div><br></div><div>Thank you, these semantics weren&#=
39;t obvious to me, I will adapt accordingly and post a new patch <br></div=
></div></div>

--0000000000003467ff05f275589f--

