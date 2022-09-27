Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335935EC4E6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:49:41 +0200 (CEST)
Received: from localhost ([::1]:44848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAxw-00076j-87
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9Al-0002hC-30
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:55 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:34703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9Aj-0006ag-7U
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:46 -0400
Received: by mail-lf1-x130.google.com with SMTP id j16so15362620lfg.1
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=4Q5z4x/syjTqHk3lNH8iwsVxf9UBBhanNEDd0Ur8cNo=;
 b=fu501IV9dQhdXB8urwQoTDdti7QqXqGLpgNZrdZTPt3YFyfTM8uDe/B4UieoKkQghs
 4TzR5C/+HwGFHIWEeNK9TkDkNEX7RcgevEAkriZrUO1ijtxB0PBgBdSPPp17EvP7xgX2
 EsUWOA6/EbtlyzwP3eNXY6GPaF0kwbyR0Mm/nyerjz4K7aSfZ4bnwa7E+FTqxMj4A0I0
 TyJdhB7iHIDup5OEHFXld7gvc/IcjxsuE2LAkRJ2Rr4nNsJWLD5m288ys7uP/8gVMH7a
 /JBsdgejG/6CwCzhV5uZm+ge2h8OkXoZcaelEdcGDPZbVV+4HWUvarNqoSyuGEJ+iB81
 bo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=4Q5z4x/syjTqHk3lNH8iwsVxf9UBBhanNEDd0Ur8cNo=;
 b=6FrxTfqKL93pDW5RNYNBTaj8GVeTskJbofnLanTiwD+8MadU6S2RqxVUQAj1IYPjJx
 +YAY1XNRkkwz2982ajXDp/swmLDDk8PxhG6Tx/uwcfe9oc2gK+E3rS/MotiBPOOCD9lb
 Vu8owAghznYWripqMJP3W/1m7hJjU9xE0OP+bnm5lhrhQSCUYbiumGm1f4EaUQkJVvSb
 nl38wg6DN55zFA13qvzofCxB1fsUM7YEEpfTgJaEar0IRyTFFjlZlCFRFBzVsNgqx9tm
 9Az4wgn0Xh85zASZpq1QYQf8QVOmt9UK2AI+0xMAI1fsEZWFfQhMpYG7ATGMu3xwXLVZ
 iSOw==
X-Gm-Message-State: ACrzQf1er05vDfR7Moys8xyxKrX9wVHzdHMf1O78To0+lzchZZi2TDdU
 yoJn4iR6qaPL3/HCQCFxcSk21zind477eHGpl2k=
X-Google-Smtp-Source: AMsMyM6ONdjmvuDS8g4Kd6iT8BceiE+AJ32HgM0DKYjNCP+Fyi/Q+myoea7qrA7t2nxJ7B1OEubllmHeQEye5VFiO+U=
X-Received: by 2002:a05:6512:280d:b0:498:fd40:51d4 with SMTP id
 cf13-20020a056512280d00b00498fd4051d4mr11981502lfb.167.1664279683667; Tue, 27
 Sep 2022 04:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
 <20220923183640.8314-2-vr_qemu@t-online.de>
In-Reply-To: <20220923183640.8314-2-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Sep 2022 15:54:30 +0400
Message-ID: <CAJ+F1CKw+dQi_Vi-pXyDx86+v5rDNf-eUUXtxm-xEJvnEyb_wQ@mail.gmail.com>
Subject: Re: [PATCH 02/12] audio: fix GUS audio playback with
 out.mixing-engine=off
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000005a1d6805e9a74f35"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x130.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005a1d6805e9a74f35
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2022 at 10:39 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> =
wrote:

> Fix GUS audio playback with out.mixing-engine=3Doff.
>
> The GUS audio device needs to know the amount of samples to
> produce in advance.
>
> To reproduce start qemu with
> -parallel none -device gus,audiodev=3Daudio0
> -audiodev pa,id=3Daudio0,out.mixing-engine=3Doff
>
> and start the cartoon.exe demo in a FreeDOS guest. The demo file
> is available on the download page of the GUSemu32 author.
>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
>

lgtm
Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  audio/audio.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 04f685fe24..343786243d 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -1139,7 +1139,8 @@ static void audio_run_out (AudioState *s)
>              }
>
>              if (sw->active) {
> -                sw->callback.fn(sw->callback.opaque, INT_MAX);
> +                sw->callback.fn(sw->callback.opaque,
> +                                hw_free * sw->info.bytes_per_frame);
>              }
>
>              continue;
> --
> 2.35.3
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000005a1d6805e9a74f35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 23, 2022 at 10:39 PM Volk=
er R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de" target=3D"_blank=
">vr_qemu@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Fix GUS audio playback with out.mixing-engine=3Doff.<b=
r>
<br>
The GUS audio device needs to know the amount of samples to<br>
produce in advance.<br>
<br>
To reproduce start qemu with<br>
-parallel none -device gus,audiodev=3Daudio0<br>
-audiodev pa,id=3Daudio0,out.mixing-engine=3Doff<br>
<br>
and start the cartoon.exe demo in a FreeDOS guest. The demo file<br>
is available on the download page of the GUSemu32 author.<br>
<br>
Signed-off-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.d=
e" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br></blockquote><div><br><=
/div><div>lgtm<br></div><div>Acked-by: Marc-Andr=C3=A9 Lureau &lt;<a href=
=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@=
redhat.com</a>&gt;<br><br>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
---<br>
=C2=A0audio/audio.c | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/audio/audio.c b/audio/audio.c<br>
index 04f685fe24..343786243d 100644<br>
--- a/audio/audio.c<br>
+++ b/audio/audio.c<br>
@@ -1139,7 +1139,8 @@ static void audio_run_out (AudioState *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sw-&gt;active) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sw-&gt;callback.fn=
(sw-&gt;callback.opaque, INT_MAX);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sw-&gt;callback.fn=
(sw-&gt;callback.opaque,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hw_free * sw-&gt;info.bytes_per_fram=
e);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
-- <br>
2.35.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--0000000000005a1d6805e9a74f35--

