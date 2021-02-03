Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF15130E51C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 22:46:40 +0100 (CET)
Received: from localhost ([::1]:55636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Pyy-0001RB-1M
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 16:46:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l7PtA-0007MW-Vg
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:40:41 -0500
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:43606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l7Pt9-0001io-8t
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:40:40 -0500
Received: by mail-vs1-xe32.google.com with SMTP id u127so663964vsc.10
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 13:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=88XYJ0/R7ij1bsqjuqrmE+Ogce6YB3fYgnH6OiKpsxA=;
 b=QDhRMQG/lisLPGqWklypai4RLwU/QfT8q6Fimak51vsE3n6jitciyKBR3DBDX919hk
 qQ3aj1QFD9duSC591RggdAsagEknuohBWbb8lX3tla8stWKXCoJ4/x300ez3s6OhIvHg
 8uU/958LzPCKJpkBrWYz4fiAQUdvhlzNcmdYKvjT6ahwBtpllzhPIhGTcX7jbrr0DW5w
 s3XjPcPOmuX99+1YD/0awV229sKa9h+ZBEVX+/qztTB2zaPTks5UVDwHDkDD+dlFy7DN
 MET1lFhBWoA+mAi9sBdjwjrgyvH1o9YRZm8R0IwyOHmE07s22OASifjA24FfNf/U8lJZ
 uH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=88XYJ0/R7ij1bsqjuqrmE+Ogce6YB3fYgnH6OiKpsxA=;
 b=UB1AArH9V5rUJiB7yf8+NdAxfyO3qn0X/pNSBK/mqJe4zP5D5epasvgVQuKCuyLKXi
 ogLhcMcDAa4xXL3LZLCGQ52zp3kdUDpDvsZtN+621K4UTUQaxJGS71IPO3BkX8W1bfYa
 je6j/alFxp/OJVCs2ei2ENCM46MT63HrOSvbNYodePhyLepWNzEG1+nTmusSxq6x7je2
 Y6nQvqGsq6+Ijs/ssUkGbpoQmK74LtUrsBDTpsfp8rtibqKaDO1k4y1Mm1E76/rgsa2Q
 SDbGI35XsEeyjVtNQFTMbF263Ya9Q3Ij396py2PnvWiFreabfMtEPxLEBrhqZ2wumg67
 LUNw==
X-Gm-Message-State: AOAM531HJQH85OIDaQVK6UdjxqpZ6oaOfEbrCMXR2doqCe1HHk5gz5Cj
 jP6kCuQc3pHn7IszVoelIi31ClAo3L7Oy1k+6Z7iBz6jLqA=
X-Google-Smtp-Source: ABdhPJybYE0GwTl3FaUlVa2/hRVWPlo0DNy2Iq+JsATMHDGdUZhBUmJcOWIKSPa0gRmY2x09Lqzy4Gov900hqIYc39Q=
X-Received: by 2002:a67:310e:: with SMTP id x14mr3525959vsx.46.1612388437107; 
 Wed, 03 Feb 2021 13:40:37 -0800 (PST)
MIME-Version: 1.0
References: <20210203213729.1940893-1-dje@google.com>
 <20210203213729.1940893-2-dje@google.com>
In-Reply-To: <20210203213729.1940893-2-dje@google.com>
From: Doug Evans <dje@google.com>
Date: Wed, 3 Feb 2021 13:39:59 -0800
Message-ID: <CADPb22Re0gwZs5r4YsAK_Gnqk+G9JxpA9GnPsGQKfV==hhAY1w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] net/slirp.c: Refactor address parsing
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: multipart/alternative; boundary="00000000000009143105ba7570a0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=dje@google.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000009143105ba7570a0
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 3, 2021 at 1:37 PM Doug Evans <dje@google.com> wrote:

> ... in preparation for adding ipv6 host forwarding support.
> ---
>  net/slirp.c | 200 +++++++++++++++++++++++++++++++++-------------------
>  slirp       |   2 +-
>  2 files changed, 130 insertions(+), 72 deletions(-)
>
> diff --git a/net/slirp.c b/net/slirp.c
> index be914c0be0..a21a313302 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -631,15 +631,83 @@ static SlirpState *slirp_lookup(Monitor *mon, const
> char *id)



Yeah, the Signed-off-by line is missing here. Will add in next version, but
will wait for further comments.

--00000000000009143105ba7570a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Wed, Feb 3, 2021 at 1:37 PM Doug Evans &lt;<a href=3D"mail=
to:dje@google.com">dje@google.com</a>&gt; wrote:<br></div></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">... in p=
reparation for adding ipv6 host forwarding support.<br>
---<br>
=C2=A0net/slirp.c | 200 +++++++++++++++++++++++++++++++++------------------=
-<br>
=C2=A0slirp=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A02 files changed, 130 insertions(+), 72 deletions(-)<br>
<br>
diff --git a/net/slirp.c b/net/slirp.c<br>
index be914c0be0..a21a313302 100644<br>
--- a/net/slirp.c<br>
+++ b/net/slirp.c<br>
@@ -631,15 +631,83 @@ static SlirpState *slirp_lookup(Monitor *mon, const c=
har *id)</blockquote><div><br></div><div><br></div><div><div class=3D"gmail=
_default" style=3D"font-size:small">Yeah, the Signed-off-by line is missing=
 here. Will add in next version, but will wait for further comments.</div><=
br></div></div></div>

--00000000000009143105ba7570a0--

