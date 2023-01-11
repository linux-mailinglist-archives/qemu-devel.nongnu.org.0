Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424FC665677
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 09:50:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFWng-0002qz-EZ; Wed, 11 Jan 2023 03:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pFWnR-0002hn-0H
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:49:24 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pFWnO-0007GN-RJ
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:49:20 -0500
Received: by mail-oi1-x22f.google.com with SMTP id r130so12230141oih.2
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 00:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PalkQssPvQmtYpHPXFW9Xu+/0ECuC/QA7s4Exu4mrnE=;
 b=o5BA1HKiiwKpcGSujFczh6XcNdbfdckfNBhN6tlGsbtLXEaP4acrWkyCVY2a8Tuc3/
 TI7n2AZ1gsCNFkCwNKWXYpkloqjmxgjlFaAKmB9fQseTmlQMz/dT56J9qUupu45awfOp
 ifl+69GS1SuJGq1LTgD/5sA2piGqxmOOyPz0sNz/+IAmh0xVyexAkoFm+M7sYXLaxpFz
 t9Gnmgr6wM8aR1g/y/s8v7t7Qqr8UOrp5E84Z2moHYBHXcq9kITTs3TIqqg0Y0ne2eyQ
 LJBJ2fYhsUC9tywhb7PIfYakP+DC7Jm91sNL1lj5BcW/b6VswJlRLVvlSl5VE8h1wapt
 3MpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PalkQssPvQmtYpHPXFW9Xu+/0ECuC/QA7s4Exu4mrnE=;
 b=Zu1jRvnxf8bn2qHoWoe7V5Ia3YC3VYDDU/Spds2QMmMr2xnGSCMjImLBJU/uPw7zUd
 XPBMDj7cOJx0VgOc7ac88il7QSRZoAnl6vd/EhQAD2idzsLyfSVEetWKZV5jK5DF7rpv
 0UjWpVS7Vxbkoai3xpB4dbNAq5ugTnk+TxIJIlTnc0gGmEX3rKAJFGHAfZd+X+q5pkrG
 H4G4pyASv/XuB6z4h7Z0k/DVYqPci79UVj/twU5VRK6O4Y5Nb2xB2C6zWNZS5QN2JY0C
 ybHD7oGhlPhAX7RKA8S7oLEdblxYQ6OAZt10RyKaZhhUdHMbnWeeDdDxDWr3/JkeaSYP
 uLAQ==
X-Gm-Message-State: AFqh2krBWLevN/9ihrDfOGbgMeMaNL3ePvTbj3sBE1f7NVgNLYzs4Tvk
 BqJo1GPTIKMORQY2FC1rGQIyeXjdelnGJPMb6mQ=
X-Google-Smtp-Source: AMrXdXt+OvmtuGUDxYKadn6OgIOmkvVgX/HOwTn0vWvbxbm0abaZcBi0FNdSdUGYa1boHRlrlTlc0Fi9oD/kqPk6py4=
X-Received: by 2002:a05:6808:6093:b0:364:6b78:71e1 with SMTP id
 de19-20020a056808609300b003646b7871e1mr169649oib.134.1673426956389; Wed, 11
 Jan 2023 00:49:16 -0800 (PST)
MIME-Version: 1.0
References: <20230111070518.994646-1-cyruscyliu@gmail.com>
 <c3291eb6-bd1c-e5d5-eac7-7edab48dfd17@linaro.org>
In-Reply-To: <c3291eb6-bd1c-e5d5-eac7-7edab48dfd17@linaro.org>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Wed, 11 Jan 2023 16:49:05 +0800
Message-ID: <CAAKa2j=q=JBMXHnG5h1bQ1MDhVTJMNJUiV3rTysg6WwCTtxfVQ@mail.gmail.com>
Subject: Re: [PATCH] hw/net/lan9118: log [read|write]b when mode_16bit is
 enabled rather than abort
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004b110e05f1f9136d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=cyruscyliu@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000004b110e05f1f9136d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2023 at 4:44 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org>
wrote:

> Hi Qiang,
>
> On 11/1/23 08:05, Qiang Liu wrote:
> > This patch replaces hw_error to guest error log for [read|write]b
> > accesses when mode_16bit is enabled. This avoids aborting qemu.
> >
> > Fixes: 1248f8d4cbc3 ("hw/lan9118: Add basic 16-bit mode support.")
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1433
> > Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> > Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> > ---
> >   hw/net/lan9118.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
> > index f1cba55967..7f35715f27 100644
> > --- a/hw/net/lan9118.c
> > +++ b/hw/net/lan9118.c
> > @@ -1209,7 +1209,8 @@ static void lan9118_16bit_mode_write(void *opaque=
,
> hwaddr offset,
> >           return;
> >       }
> >
> > -    hw_error("lan9118_write: Bad size 0x%x\n", size);
> > +    qemu_log_mask(LOG_GUEST_ERROR,
> > +                  "lan9118_16bit_mode_write: Bad size 0x%x\n", size);
> >   }
>
> There are two other uses via BADF(), then we can remove the BADF() macro
> and the "hw/hw.h" inclusion.

 I see. Sounds nice! Let me resend the patch.

Best,
Qiang

--0000000000004b110e05f1f9136d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Jan 11, 2023 at 4:44 PM Philippe =
Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@linaro.o=
rg</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Hi Qiang,<br>
<br>
On 11/1/23 08:05, Qiang Liu wrote:<br>
&gt; This patch replaces hw_error to guest error log for [read|write]b<br>
&gt; accesses when mode_16bit is enabled. This avoids aborting qemu.<br>
&gt; <br>
&gt; Fixes: 1248f8d4cbc3 (&quot;hw/lan9118: Add basic 16-bit mode support.&=
quot;)<br>
&gt; Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/143=
3" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qem=
u/-/issues/1433</a><br>
&gt; Reported-by: Qiang Liu &lt;<a href=3D"mailto:cyruscyliu@gmail.com" tar=
get=3D"_blank">cyruscyliu@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Qiang Liu &lt;<a href=3D"mailto:cyruscyliu@gmail.com" t=
arget=3D"_blank">cyruscyliu@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/net/lan9118.c | 6 ++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c<br>
&gt; index f1cba55967..7f35715f27 100644<br>
&gt; --- a/hw/net/lan9118.c<br>
&gt; +++ b/hw/net/lan9118.c<br>
&gt; @@ -1209,7 +1209,8 @@ static void lan9118_16bit_mode_write(void *opaqu=
e, hwaddr offset,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 hw_error(&quot;lan9118_write: Bad size 0x%x\n&quot;, si=
ze);<br>
&gt; +=C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
lan9118_16bit_mode_write: Bad size 0x%x\n&quot;, size);<br>
&gt;=C2=A0 =C2=A0}<br>
<br>
There are two other uses via BADF(), then we can remove the BADF() macro<br=
>
and the &quot;hw/hw.h&quot; inclusion.</blockquote><div>=C2=A0I see. Sounds=
 nice! Let me resend the patch.</div><div><br></div><div>Best,</div><div>Qi=
ang</div></div></div>

--0000000000004b110e05f1f9136d--

