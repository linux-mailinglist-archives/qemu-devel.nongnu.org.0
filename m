Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D094978D9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 07:14:44 +0100 (CET)
Received: from localhost ([::1]:46580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBsck-00037i-TL
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 01:14:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nBsYx-0001Zu-Cu
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 01:10:50 -0500
Received: from [2a00:1450:4864:20::52b] (port=38766
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nBsYt-00043E-Bh
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 01:10:45 -0500
Received: by mail-ed1-x52b.google.com with SMTP id j23so49486679edp.5
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 22:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XqwPeC3+L6e/l57BkM99D6ID4gis7Lscsu7xgYamWK0=;
 b=Pz4MfluNIyHsAHluMkhjYP7wcUu4/9tCJ4J6AFChbiZOl4F/1YWcIbFgWfTTTQ1B5G
 CwH7/AKWxGM9odTdgV6f0BlLK5yThnM1xmibrGQbhQ+H37rqqZ1UoyukQ0pA+Y5cKi0h
 w7uMgdPV7Ep3XMZZmDsebO2wtxvPniqV7B3ae8WYsf+kkdQDxk8L5fBI3lPD4x2mVZ7U
 tuSMXAGBfstfi9F2L2+8trnFiInTPAVVO0O4JPiCDqqPCfsLZgNcgnXMoFg1TFVUiPEP
 1Ugrxq9TFgoYdYydBKhC5BcT0iSUNtGUBevdDol18CN2i5PyiBH0L+RuxGeb/K3RCvX+
 KpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XqwPeC3+L6e/l57BkM99D6ID4gis7Lscsu7xgYamWK0=;
 b=fRutDeeupCqNw6ChzmxQLHyrREOzVoKRYo7k/QRB3KyZgqrWwbXe8aNc/8NWcO9Jvr
 cVR8Pkt5gPZjqBQppkQPbkSL+pWe9LiBpBWtRD+G7dE9gcJp16+yEnAB1ikfzyhasanv
 N+npb0HixPR/WU2mo4oab7jOvC+JHgvFTmyTGuHrfHFvTWV6yOSeVSIV0wwqwQuoBkwM
 +VcVWV0Ij7J+GtR4C/tpIoA7dcexBkeVqLdjMfkh9ggy4GnPV2nknZ27f0HKhvJwZ+ws
 Q4/LjQp1uZDOFoe3WmrFWuSnz2KBf01lTmoLmfZLmlYoc8SaSDABH4EAOeWTW8l6e7ns
 cohQ==
X-Gm-Message-State: AOAM533byzGuHAbyzlGuEdDkEEZjtYK2oxG42syQT9VACxf/6W0GIq27
 y/LEXw0nbgl6uaqTlYmKU06/ZIHUyWirBGrg6dNiqZgHxkyYwQ==
X-Google-Smtp-Source: ABdhPJzITJI6PdvsJxrvDtsGej6r1768lTz37fqPzoZ7xgsrjnghEZa+bsqxUK5DEP3AocJmsQu+Vh8Kv3ZWFyeID/s=
X-Received: by 2002:a05:6402:518a:: with SMTP id
 q10mr14423392edd.167.1643004635265; 
 Sun, 23 Jan 2022 22:10:35 -0800 (PST)
MIME-Version: 1.0
References: <20220118023509.14496-1-frank.chang@sifive.com>
In-Reply-To: <20220118023509.14496-1-frank.chang@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 24 Jan 2022 14:10:24 +0800
Message-ID: <CAE_xrPjxO4NFG=tLsSRHwUMCTrDaLqyt4f2Mw0U599VnA2m+0A@mail.gmail.com>
Subject: Re: [PATCH] hw/sd: Correct the CURRENT_STATE bits in SPI-mode response
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000a6577005d64dd342"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=frank.chang@sifive.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a6577005d64dd342
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 18, 2022 at 10:35 AM <frank.chang@sifive.com> wrote:

> From: Frank Chang <frank.chang@sifive.com>
>
> In SPI-mode, type B ("cleared on valid command") clear condition is not
> supported, and as the "In idle state" bit in SPI-mode has type A
> ("according to current state") clear condition, the CURRENT_STATE bits
> in an SPI-mode response should be the SD card's state after the command
> is executed, instead of the state when it received the preceding
> command.
>
> Also, we don't need to clear the type B ("clear on valid command")
> status bits after the response is updated in SPI-mode.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  hw/sd/sd.c | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index cd67a7bac8..9736b8912d 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1757,12 +1757,20 @@ int sd_do_command(SDState *sd, SDRequest *req,
>      if (rtype == sd_illegal) {
>          sd->card_status |= ILLEGAL_COMMAND;
>      } else {
> -        /* Valid command, we can update the 'state before command' bits.
> -         * (Do this now so they appear in r1 responses.)
> -         */
>          sd->current_cmd = req->cmd;
>          sd->card_status &= ~CURRENT_STATE;
> -        sd->card_status |= (last_state << 9);
> +
> +        if (!sd->spi) {
> +            /* Valid command, we can update the 'state before command'
> bits.
> +             * (Do this now so they appear in r1 responses.)
> +             */
> +            sd->card_status |= (last_state << 9);
> +        } else {
> +            /* Type B ("clear on valid command") is not supported
> +             * in SPI-mode.
> +             */
> +            sd->card_status |= (sd->state << 9);
> +        }
>      }
>
>  send_response:
> @@ -1808,10 +1816,12 @@ send_response:
>      trace_sdcard_response(sd_response_name(rtype), rsplen);
>
>      if (rtype != sd_illegal) {
> -        /* Clear the "clear on valid command" status bits now we've
> -         * sent any response
> -         */
> -        sd->card_status &= ~CARD_STATUS_B;
> +        if (!sd->spi) {
> +            /* Clear the "clear on valid command" status bits now we've
> +             * sent any response
> +             */
> +            sd->card_status &= ~CARD_STATUS_B;
> +        }
>      }
>
>  #ifdef DEBUG_SD
> --
> 2.31.1
>
>
This patch is replaced with more proper SPI clear conditions fix patch:
https://patchew.org/QEMU/20220124060449.22498-1-frank.chang@sifive.com/
Please ignore this one, sorry for the confusion.

Regards,
Frank Chang

--000000000000a6577005d64dd342
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jan 18, 2022 at 10:35 AM &lt;<a h=
ref=3D"mailto:frank.chang@sifive.com">frank.chang@sifive.com</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com"=
 target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
<br>
In SPI-mode, type B (&quot;cleared on valid command&quot;) clear condition =
is not<br>
supported, and as the &quot;In idle state&quot; bit in SPI-mode has type A<=
br>
(&quot;according to current state&quot;) clear condition, the CURRENT_STATE=
 bits<br>
in an SPI-mode response should be the SD card&#39;s state after the command=
<br>
is executed, instead of the state when it received the preceding<br>
command.<br>
<br>
Also, we don&#39;t need to clear the type B (&quot;clear on valid command&q=
uot;)<br>
status bits after the response is updated in SPI-mode.<br>
<br>
Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" ta=
rget=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
---<br>
=C2=A0hw/sd/sd.c | 26 ++++++++++++++++++--------<br>
=C2=A01 file changed, 18 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/hw/sd/sd.c b/hw/sd/sd.c<br>
index cd67a7bac8..9736b8912d 100644<br>
--- a/hw/sd/sd.c<br>
+++ b/hw/sd/sd.c<br>
@@ -1757,12 +1757,20 @@ int sd_do_command(SDState *sd, SDRequest *req,<br>
=C2=A0 =C2=A0 =C2=A0if (rtype =3D=3D sd_illegal) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sd-&gt;card_status |=3D ILLEGAL_COMMAND;<=
br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Valid command, we can update the &#39;state=
 before command&#39; bits.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (Do this now so they appear in r1 resp=
onses.)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sd-&gt;current_cmd =3D req-&gt;cmd;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sd-&gt;card_status &amp;=3D ~CURRENT_STAT=
E;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sd-&gt;card_status |=3D (last_state &lt;&lt; 9=
);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!sd-&gt;spi) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Valid command, we can update =
the &#39;state before command&#39; bits.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (Do this now so they app=
ear in r1 responses.)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sd-&gt;card_status |=3D (last_st=
ate &lt;&lt; 9);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Type B (&quot;clear on valid =
command&quot;) is not supported<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* in SPI-mode.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sd-&gt;card_status |=3D (sd-&gt;=
state &lt;&lt; 9);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0send_response:<br>
@@ -1808,10 +1816,12 @@ send_response:<br>
=C2=A0 =C2=A0 =C2=A0trace_sdcard_response(sd_response_name(rtype), rsplen);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (rtype !=3D sd_illegal) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Clear the &quot;clear on valid command&quot=
; status bits now we&#39;ve<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* sent any response<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sd-&gt;card_status &amp;=3D ~CARD_STATUS_B;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!sd-&gt;spi) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Clear the &quot;clear on vali=
d command&quot; status bits now we&#39;ve<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* sent any response<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sd-&gt;card_status &amp;=3D ~CAR=
D_STATUS_B;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0#ifdef DEBUG_SD<br>
-- <br>
2.31.1<br>
<br></blockquote><div><br></div><div>This patch is replaced with more prope=
r SPI clear conditions fix patch:</div><div><a href=3D"https://patchew.org/=
QEMU/20220124060449.22498-1-frank.chang@sifive.com/">https://patchew.org/QE=
MU/20220124060449.22498-1-frank.chang@sifive.com/</a><br></div><div>Please =
ignore this one, sorry for the confusion.</div><div><br></div><div>Regards,=
</div><div>Frank Chang</div></div></div>

--000000000000a6577005d64dd342--

