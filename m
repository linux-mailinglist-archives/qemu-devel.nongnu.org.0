Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE635EC50E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:55:32 +0200 (CEST)
Received: from localhost ([::1]:42330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odB3b-0005AC-Jx
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9Ah-0002h4-DP
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:55 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:42884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od9Af-0006aN-R3
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:54:43 -0400
Received: by mail-lf1-x12d.google.com with SMTP id a3so15297169lfk.9
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=7dmFWe1JeAx62Z54Sad0uggy0zYltcCuKcsb3yusfV4=;
 b=RMsZRMOU7xANj8MhaRzcr+6nCX7QCGLe82U9ZM+DGVsywoTpdN+sGq9BbZfNNLrPMA
 3Pi1Rg4Yv3DW/ek9n8fZeXDF+OZX94/C/H3iy60HM6Ns5pA6mF+q/VlfKiQViEEv4RpT
 N3n8Zq59eJcnerYWNjqjUcw7CT9F573exfzsHL1fbt/5S5mybSFDnrx7TTLV9UE8VFjg
 JZsvI+0HHZNlsyN2hMQjn1tkzMmlrkk0g+3MwRhKZ4ltMHOETd3Tr3HTIPsLDE6Kj7zz
 V0/a3SIrKkyIS9tqW+RwKloLh4a8ux1gtYXfxUVEDUgDjd0N72zn41gUD0ATuxA0Wk4v
 wh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=7dmFWe1JeAx62Z54Sad0uggy0zYltcCuKcsb3yusfV4=;
 b=4pZ0D3AwTjl/dZueV89soIVRQ2k9HGFTyYrSSPyuJY3lCNeBmo7wxDwVHkdp3mpzlA
 d1SnZniVBLfb0THQINQ6v7yiSI8sPgT1WKvXWd07g/yHy3/NdjRQ1qEsfBMU8eZh0SnB
 /JyegQZLPCGJTMTIwc7FGi5gcn/qLJ/yI/I9lWE3RPO8tkGi02mkd/sIf+i1xbwamgzT
 3q0kXTDai+QwfRvDRA2an4zNSils3swrVPYABKpbhPYRkEn+XbqKoIR7GhfFdV85m082
 bM4cbQvtRQyPIvi002O/1Na2aBAVhlOnT8qQWE7aySWTuPB4mHv8PKGznzMlCLBvjO9c
 T4TA==
X-Gm-Message-State: ACrzQf1VdwIFWeDS4Amycokipb8kIGZpYc5xuQp+bSwWZUlcABIZuxSU
 iAfMrjtWNrddDYu/RXYvFCsescV8sKL/XOqeu7q1FNOGaUs=
X-Google-Smtp-Source: AMsMyM5voeMBh2nHSAzRY2Ot0goctKz1XZGnLvXXeLH8xKD1lissG70TuX6IZ3gIAyjmniOh2T/pgfsGrqkIVmMMdFQ=
X-Received: by 2002:a05:6512:3ca0:b0:49f:f620:b826 with SMTP id
 h32-20020a0565123ca000b0049ff620b826mr12123776lfv.375.1664279679545; Tue, 27
 Sep 2022 04:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
 <20220923183640.8314-3-vr_qemu@t-online.de>
In-Reply-To: <20220923183640.8314-3-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Sep 2022 15:54:27 +0400
Message-ID: <CAJ+F1CJtHfCsb0ZV8hFUqOUjcS1mSRKwOrm6H1irWa-YcWesWQ@mail.gmail.com>
Subject: Re: [PATCH 03/12] audio: run downstream playback queue unconditionally
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001b351805e9a74fd8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12d.google.com
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

--0000000000001b351805e9a74fd8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2022 at 10:45 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> =
wrote:

> Run the downstream playback queue even if the emulated audio
> device didn't write new samples. There still may be buffered
> audio samples downstream.
>
> This is for the -audiodev out.mixing-engine=3Doff case. Commit
> a8a98cfd42 ("audio: run downstream playback queue uncondition-
> ally") fixed the out.mixing-engine=3Don case.
>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
>

lgtm
Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  audio/audio.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 343786243d..9e55834909 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -1143,6 +1143,10 @@ static void audio_run_out (AudioState *s)
>                                  hw_free * sw->info.bytes_per_frame);
>              }
>
> +            if (hw->pcm_ops->run_buffer_out) {
> +                hw->pcm_ops->run_buffer_out(hw);
> +            }
> +
>              continue;
>          }
>
> @@ -1501,10 +1505,6 @@ size_t audio_generic_write(HWVoiceOut *hw, void
> *buf, size_t size)
>          }
>      }
>
> -    if (hw->pcm_ops->run_buffer_out) {
> -        hw->pcm_ops->run_buffer_out(hw);
> -    }
> -
>      return total;
>  }
>
> --
> 2.35.3
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000001b351805e9a74fd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 23, 2022 at 10:45 PM Volk=
er R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de" target=3D"_blank=
">vr_qemu@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Run the downstream playback queue even if the emulated=
 audio<br>
device didn&#39;t write new samples. There still may be buffered<br>
audio samples downstream.<br>
<br>
This is for the -audiodev out.mixing-engine=3Doff case. Commit<br>
a8a98cfd42 (&quot;audio: run downstream playback queue uncondition-<br>
ally&quot;) fixed the out.mixing-engine=3Don case.<br>
<br>
Signed-off-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.d=
e" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br></blockquote><div><br><=
/div><div><div>lgtm<br></div><div>Acked-by: Marc-Andr=C3=A9 Lureau &lt;<a h=
ref=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lure=
au@redhat.com</a>&gt;</div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
---<br>
=C2=A0audio/audio.c | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/audio/audio.c b/audio/audio.c<br>
index 343786243d..9e55834909 100644<br>
--- a/audio/audio.c<br>
+++ b/audio/audio.c<br>
@@ -1143,6 +1143,10 @@ static void audio_run_out (AudioState *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw_free * sw-&gt;info.bytes_pe=
r_frame);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hw-&gt;pcm_ops-&gt;run_buffe=
r_out) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hw-&gt;pcm_ops-&gt=
;run_buffer_out(hw);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -1501,10 +1505,6 @@ size_t audio_generic_write(HWVoiceOut *hw, void *buf=
, size_t size)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (hw-&gt;pcm_ops-&gt;run_buffer_out) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 hw-&gt;pcm_ops-&gt;run_buffer_out(hw);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
=C2=A0 =C2=A0 =C2=A0return total;<br>
=C2=A0}<br>
<br>
-- <br>
2.35.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--0000000000001b351805e9a74fd8--

