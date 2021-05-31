Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A41539552E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 07:58:56 +0200 (CEST)
Received: from localhost ([::1]:33166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnawx-0002B6-4M
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 01:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1lnasf-0004Yj-AU
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:54:29 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1lnasd-0006BS-0w
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:54:29 -0400
Received: by mail-ed1-x52e.google.com with SMTP id t3so12076619edc.7
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 22:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hBk3YSY1TvI/Il4G4iVB3jqcuW0iaXGrBpwrx96qQF0=;
 b=XUyLowpdmlnIRkM6W6/59NFrLOIWyXJDLColjfRTZXbS5Wh+YLVa4GXIAxFlaYOWLB
 fEDKUHf8UkU94NcETi/kJ738bhPgchwqnekf/M09T5LNWy3aInsfgYpkzRhFeLdfF5oa
 QaIXNTREK5mpu7On8QpnX8w67yKqNtzRJIWDWFLSdQnxz/qpqiAou/TZS7UHt2Zz3bYm
 0sWX+692fZvOKddrXMXIEG9KQEn4j70MEvOZ/g6EmTq1HW/Dy3VhrG2l7xYHx0U4On5d
 xBWecYV4MyGTdmfyZLRtLjKKxuvvZqB+RVjaP8uF6BcruX7d0qPWnhUWaxF/UTrfNyaM
 sgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hBk3YSY1TvI/Il4G4iVB3jqcuW0iaXGrBpwrx96qQF0=;
 b=X4MKSYUBedl77Kg4ojULDSnMoSkiLzedXoawFfvxqERBH1X9HjG1rssggSIRZWeAw3
 SNj69LCtxJYoEQq+5k/RiR3ggzvq6mGKi/B73gyu0QNaio+8E/bAeT2kI2LftENOgwX4
 pbayrQMkLUPhbEOKXoXbeDLbgEBqggruufgRD8Q/Y90lcS48S2XzYKJvdIbv1K1XFtla
 7XmSyrnXkpQ8bJH2l1GmKGVwZpRctccnjfjZ7q0dDIUx7r+0viPERRoWYcd+2HadiYM1
 FnOYP1stfXlDn6Odry+RxzyWBG3zox1Ahyvf7Lg+8iGCxKtLXVcrqg/C8h0cTJTCkNHW
 PFYQ==
X-Gm-Message-State: AOAM532FJBLGE6oQkqTLIbl96ERYsnlLtB6lfyeGUp9FHqWOZ5IfT15s
 T+kKd181H1rF8PlBhAt7fV42gzzF5+EW7ZtNCbw2dg==
X-Google-Smtp-Source: ABdhPJzinheXQk4RuF6L7ax9pAi8Ax3UNfjGV3UouAm/QrShAYwdWQJVxZXSLie2pUtPK0MwlXmLhHQ8diUA/mkUmvc=
X-Received: by 2002:aa7:c594:: with SMTP id g20mr8506844edq.193.1622440465306; 
 Sun, 30 May 2021 22:54:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210531055125.148282-1-anirban.sinha@nokia.com>
In-Reply-To: <20210531055125.148282-1-anirban.sinha@nokia.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 31 May 2021 11:24:14 +0530
Message-ID: <CAARzgww-EDsMcuAfGA5-NnHdaKFzEchG_nHfSKO9ULNtf2FoSQ@mail.gmail.com>
Subject: Re: [PATCH v1] hw/input/ps2: Use ps2_raise_irq() instead of open
 coding it
To: anirban.sinha@nokia.com
Content-Type: multipart/alternative; boundary="0000000000009aad0505c399dbce"
Received-SPF: none client-ip=2a00:1450:4864:20::52e;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009aad0505c399dbce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My apologies =E2=80=A6 please ignore =E2=80=A6

On Mon, May 31, 2021 at 11:21 Ani Sinha <ani@anisinha.ca> wrote:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Inspired-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Message-Id: <20210513171244.3940519-1-f4bug@amsat.org>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/input/ps2.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/input/ps2.c b/hw/input/ps2.c
> index 5cf95b4dd3..8dd482c1f6 100644
> --- a/hw/input/ps2.c
> +++ b/hw/input/ps2.c
> @@ -217,7 +217,7 @@ void ps2_queue(PS2State *s, int b)
>      }
>
>      ps2_queue_noirq(s, b);
> -    s->update_irq(s->update_arg, 1);
> +    ps2_raise_irq(s);
>  }
>
>  void ps2_queue_2(PS2State *s, int b1, int b2)
> @@ -228,7 +228,7 @@ void ps2_queue_2(PS2State *s, int b1, int b2)
>
>      ps2_queue_noirq(s, b1);
>      ps2_queue_noirq(s, b2);
> -    s->update_irq(s->update_arg, 1);
> +    ps2_raise_irq(s);
>  }
>
>  void ps2_queue_3(PS2State *s, int b1, int b2, int b3)
> @@ -240,7 +240,7 @@ void ps2_queue_3(PS2State *s, int b1, int b2, int b3)
>      ps2_queue_noirq(s, b1);
>      ps2_queue_noirq(s, b2);
>      ps2_queue_noirq(s, b3);
> -    s->update_irq(s->update_arg, 1);
> +    ps2_raise_irq(s);
>  }
>
>  void ps2_queue_4(PS2State *s, int b1, int b2, int b3, int b4)
> @@ -253,7 +253,7 @@ void ps2_queue_4(PS2State *s, int b1, int b2, int b3,
> int b4)
>      ps2_queue_noirq(s, b2);
>      ps2_queue_noirq(s, b3);
>      ps2_queue_noirq(s, b4);
> -    s->update_irq(s->update_arg, 1);
> +    ps2_raise_irq(s);
>  }
>
>  /* keycode is the untranslated scancode in the current scancode set. */
> --
> 2.25.1
>
>

--0000000000009aad0505c399dbce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">My apologies =E2=80=A6 please ignore =E2=80=A6</div><div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon=
, May 31, 2021 at 11:21 Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca">an=
i@anisinha.ca</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: =
Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org" target=
=3D"_blank">f4bug@amsat.org</a>&gt;<br>
<br>
Inspired-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de"=
 target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Reviewed-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de"=
 target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br>
Reviewed-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D"_=
blank">bmeng.cn@gmail.com</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20210513171244.3940519-1-f4bug@amsat.org"=
 target=3D"_blank">20210513171244.3940519-1-f4bug@amsat.org</a>&gt;<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/input/ps2.c | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/hw/input/ps2.c b/hw/input/ps2.c<br>
index 5cf95b4dd3..8dd482c1f6 100644<br>
--- a/hw/input/ps2.c<br>
+++ b/hw/input/ps2.c<br>
@@ -217,7 +217,7 @@ void ps2_queue(PS2State *s, int b)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0ps2_queue_noirq(s, b);<br>
-=C2=A0 =C2=A0 s-&gt;update_irq(s-&gt;update_arg, 1);<br>
+=C2=A0 =C2=A0 ps2_raise_irq(s);<br>
=C2=A0}<br>
<br>
=C2=A0void ps2_queue_2(PS2State *s, int b1, int b2)<br>
@@ -228,7 +228,7 @@ void ps2_queue_2(PS2State *s, int b1, int b2)<br>
<br>
=C2=A0 =C2=A0 =C2=A0ps2_queue_noirq(s, b1);<br>
=C2=A0 =C2=A0 =C2=A0ps2_queue_noirq(s, b2);<br>
-=C2=A0 =C2=A0 s-&gt;update_irq(s-&gt;update_arg, 1);<br>
+=C2=A0 =C2=A0 ps2_raise_irq(s);<br>
=C2=A0}<br>
<br>
=C2=A0void ps2_queue_3(PS2State *s, int b1, int b2, int b3)<br>
@@ -240,7 +240,7 @@ void ps2_queue_3(PS2State *s, int b1, int b2, int b3)<b=
r>
=C2=A0 =C2=A0 =C2=A0ps2_queue_noirq(s, b1);<br>
=C2=A0 =C2=A0 =C2=A0ps2_queue_noirq(s, b2);<br>
=C2=A0 =C2=A0 =C2=A0ps2_queue_noirq(s, b3);<br>
-=C2=A0 =C2=A0 s-&gt;update_irq(s-&gt;update_arg, 1);<br>
+=C2=A0 =C2=A0 ps2_raise_irq(s);<br>
=C2=A0}<br>
<br>
=C2=A0void ps2_queue_4(PS2State *s, int b1, int b2, int b3, int b4)<br>
@@ -253,7 +253,7 @@ void ps2_queue_4(PS2State *s, int b1, int b2, int b3, i=
nt b4)<br>
=C2=A0 =C2=A0 =C2=A0ps2_queue_noirq(s, b2);<br>
=C2=A0 =C2=A0 =C2=A0ps2_queue_noirq(s, b3);<br>
=C2=A0 =C2=A0 =C2=A0ps2_queue_noirq(s, b4);<br>
-=C2=A0 =C2=A0 s-&gt;update_irq(s-&gt;update_arg, 1);<br>
+=C2=A0 =C2=A0 ps2_raise_irq(s);<br>
=C2=A0}<br>
<br>
=C2=A0/* keycode is the untranslated scancode in the current scancode set. =
*/<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000009aad0505c399dbce--

