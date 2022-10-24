Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1669609CEE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 10:39:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omsb1-00052J-K9; Mon, 24 Oct 2022 04:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1omsax-000526-Fk
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 04:14:03 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1omsau-00050G-PG
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 04:14:02 -0400
Received: by mail-lf1-x129.google.com with SMTP id r14so15515693lfm.2
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 01:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LEzahPkCtDsbJWbJKTGCqZV3vMvIs+iqx7+nmtFEH2Q=;
 b=DoALo6XwuZoI0p9vLgXyfGdSe90xsMJIljl8FQXzfHvlST/MuHrxrocApZF3xLZwQX
 GvYMJuJzYPPRRP8W5Px5KZxz110/mTChuC5lVt56d/KA3jRkWHcAIDjO93G2Zkw05XR7
 iQSfV9ZINWJUcPX+vphmfQqR/pjJLpM69PucOiN6ldyoZ964yElXga2mWOPQyfcPHkFJ
 5Qob0RHIn28PEeg0SPJehT75Od6dmJ5syVuI/ZLbtNJYNCW4Cc8WpdG5O2aTR4shPZ9R
 8K6wOikEiSl58l1Rnm5ZvRPnOW+3/neiIrOxlrC1ut0ssz+LGKX5SYgyMELU7gqhkL9g
 x0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LEzahPkCtDsbJWbJKTGCqZV3vMvIs+iqx7+nmtFEH2Q=;
 b=ioL4rJQfObBNo4KBT9jizlgQM0S1WA1XuRgIkVP2O9xfKE3mO9Vm7vBjx1JeYilCxy
 D2Of1yr+gfwvx9h+rk7vZxg9dj2jX0853wvWV4mJD6TdjRI0vgmJCls5/M9pWWce/JCy
 myz5Wd0Uw7dTaUynIwDVZm3KlvX0Od94roo6AFdlZH01F8H6gKQ0AIScDSiudukqEMs3
 FqNW6aVoS2Qz3eDrwUjNmMgFgupdHUedXRbgDNOOakssJvW0/klFKqHsdg/5m84XueRz
 8CLokKkanvDrZWFfr+6uyuSHUZuzf4jW36RsSPqS2lsed23zzICqEl7IkPi0M89WeK27
 P5KQ==
X-Gm-Message-State: ACrzQf2Hip5fmfgwV+OqsQ0az8BPXF4zTblT5m8wnP/HwkPGEzwYAve5
 5O+v8ycC3W9E0r3eDFvCSQYENpHzO+cKYiE8no0=
X-Google-Smtp-Source: AMsMyM7yESDs3hFfzztmD9+Z5u4esTSE0ooUCwiDj6fElHmcXXaIJVt+rrPx3lc5iDwtYTGrWA0/avIQHI39aHF22is=
X-Received: by 2002:a05:6512:6d0:b0:4a4:45c3:8d8a with SMTP id
 u16-20020a05651206d000b004a445c38d8amr12189566lff.329.1666599238197; Mon, 24
 Oct 2022 01:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221022160052.1132-1-vr_qemu@t-online.de>
In-Reply-To: <20221022160052.1132-1-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 24 Oct 2022 12:13:46 +0400
Message-ID: <CAJ+F1CLjiCs4zSxSpr_OPWDM9_xCC0YfJTL_82umDB-rX6aW3Q@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/ac97-test: add up-/downsampling tests
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000093685f05ebc35ff3"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x129.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000093685f05ebc35ff3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Oct 24, 2022 at 9:28 AM Volker R=C3=BCmelin <vr_qemu@t-online.de> w=
rote:

> Test if the audio subsystem can handle extreme up- and down-
> sampling ratios like 44100/1 and 1/44100. For some time these
> used to trigger QEMU aborts. The test was taken from
> https://gitlab.com/qemu-project/qemu/-/issues/71 where it was
> used to demonstrate a very different issue.
>
> Suggested-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
>

Thanks for working on this

It seems to show something different though:
"
A bug was just triggered in audio_calloc
Save all your work and restart without audio
I am sorry
"

AUD_open_out() is called with audsettings: {freq =3D 1, nchannels =3D 2, fm=
t =3D
AUDIO_FORMAT_S16, endianness =3D 0}

And that's it. Any idea?


---
>  tests/qtest/ac97-test.c | 40 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
>
> diff --git a/tests/qtest/ac97-test.c b/tests/qtest/ac97-test.c
> index 74103efdfa..ce25f1d588 100644
> --- a/tests/qtest/ac97-test.c
> +++ b/tests/qtest/ac97-test.c
> @@ -42,16 +42,54 @@ static void *ac97_create(void *pci_bus,
> QGuestAllocator *alloc, void *addr)
>      return &ac97->obj;
>  }
>
> +/*
> + * This is rather a test of the audio subsystem and not an AC97 test.
> Test if
> + * the audio subsystem can handle a 44100/1 upsample ratio. With an audi=
o
> + * mixing buffer size of 1024 audio frames, the audio subsystem should
> either
> + * generate 1024 output frames from 0.0232 input frames or silently give
> up.
> + */
> +static void ac97_playback_upsample(void *obj, void *data, QGuestAllocato=
r
> *alloc)
> +{
> +    QAC97 *ac97 =3D obj;
> +    QPCIDevice *dev =3D &ac97->dev;
> +    QPCIBar bar0;
> +
> +    qpci_device_enable(dev);
> +    bar0 =3D qpci_iomap(dev, 0, NULL);
> +    qpci_io_writew(dev, bar0, 0x2c, 0x1);
> +}
> +
> +/*
> + * This test is similar to the playback upsample test. This time the aud=
io
> + * subsystem should either generate 0.0232 audio frames from 1024 input
> frames
> + * or silently give up.
> + */
> +static void ac97_record_downsample(void *obj, void *data, QGuestAllocato=
r
> *alloc)
> +{
> +    QAC97 *ac97 =3D obj;
> +    QPCIDevice *dev =3D &ac97->dev;
> +    QPCIBar bar0;
> +
> +    qpci_device_enable(dev);
> +    bar0 =3D qpci_iomap(dev, 0, NULL);
> +    qpci_io_writew(dev, bar0, 0x32, 0x1);
> +}
> +
>  static void ac97_register_nodes(void)
>  {
>      QOSGraphEdgeOptions opts =3D {
> -        .extra_device_opts =3D "addr=3D04.0",
> +        .extra_device_opts =3D "addr=3D04.0,audiodev=3Dsnd0",
> +        .after_cmd_line =3D "-audiodev none,id=3Dsnd0"
> +                          ",out.frequency=3D44100,in.frequency=3D44100",
>      };
>      add_qpci_address(&opts, &(QPCIAddress) { .devfn =3D QPCI_DEVFN(4, 0)=
 });
>
>      qos_node_create_driver("AC97", ac97_create);
>      qos_node_produces("AC97", "pci-device");
>      qos_node_consumes("AC97", "pci-bus", &opts);
> +
> +    qos_add_test("playback_upsample", "AC97", ac97_playback_upsample,
> NULL);
> +    qos_add_test("record_downsample", "AC97", ac97_record_downsample,
> NULL);
>  }
>
>  libqos_init(ac97_register_nodes);
> --
> 2.35.3
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000093685f05ebc35ff3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 24, 2022 at 9:28 AM Vol=
ker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de">vr_qemu@t-onlin=
e.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Test if the audio subsystem can handle extreme up- and down-<br>
sampling ratios like 44100/1 and 1/44100. For some time these<br>
used to trigger QEMU aborts. The test was taken from<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/71" rel=3D"norefer=
rer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/issues/71</a>=
 where it was<br>
used to demonstrate a very different issue.<br>
<br>
Suggested-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau=
@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Signed-off-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.d=
e" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br></blockquote><div><br><=
/div><div>Thanks for working on this<br></div><div><br></div><div>It seems =
to show something different though:</div><div>&quot;<br></div><div>A bug wa=
s just triggered in audio_calloc<br>Save all your work and restart without =
audio<br>I am sorry</div><div>&quot;</div><div><br></div><div>AUD_open_out(=
) is called with audsettings: {freq =3D 1, nchannels =3D 2, fmt =3D AUDIO_F=
ORMAT_S16, endianness =3D 0}<br></div><div><br></div><div>And that&#39;s it=
. Any idea?</div><div><br></div><div><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
---<br>
=C2=A0tests/qtest/ac97-test.c | 40 +++++++++++++++++++++++++++++++++++++++-=
<br>
=C2=A01 file changed, 39 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/tests/qtest/ac97-test.c b/tests/qtest/ac97-test.c<br>
index 74103efdfa..ce25f1d588 100644<br>
--- a/tests/qtest/ac97-test.c<br>
+++ b/tests/qtest/ac97-test.c<br>
@@ -42,16 +42,54 @@ static void *ac97_create(void *pci_bus, QGuestAllocator=
 *alloc, void *addr)<br>
=C2=A0 =C2=A0 =C2=A0return &amp;ac97-&gt;obj;<br>
=C2=A0}<br>
<br>
+/*<br>
+ * This is rather a test of the audio subsystem and not an AC97 test. Test=
 if<br>
+ * the audio subsystem can handle a 44100/1 upsample ratio. With an audio<=
br>
+ * mixing buffer size of 1024 audio frames, the audio subsystem should eit=
her<br>
+ * generate 1024 output frames from 0.0232 input frames or silently give u=
p.<br>
+ */<br>
+static void ac97_playback_upsample(void *obj, void *data, QGuestAllocator =
*alloc)<br>
+{<br>
+=C2=A0 =C2=A0 QAC97 *ac97 =3D obj;<br>
+=C2=A0 =C2=A0 QPCIDevice *dev =3D &amp;ac97-&gt;dev;<br>
+=C2=A0 =C2=A0 QPCIBar bar0;<br>
+<br>
+=C2=A0 =C2=A0 qpci_device_enable(dev);<br>
+=C2=A0 =C2=A0 bar0 =3D qpci_iomap(dev, 0, NULL);<br>
+=C2=A0 =C2=A0 qpci_io_writew(dev, bar0, 0x2c, 0x1);<br>
+}<br>
+<br>
+/*<br>
+ * This test is similar to the playback upsample test. This time the audio=
<br>
+ * subsystem should either generate 0.0232 audio frames from 1024 input fr=
ames<br>
+ * or silently give up.<br>
+ */<br>
+static void ac97_record_downsample(void *obj, void *data, QGuestAllocator =
*alloc)<br>
+{<br>
+=C2=A0 =C2=A0 QAC97 *ac97 =3D obj;<br>
+=C2=A0 =C2=A0 QPCIDevice *dev =3D &amp;ac97-&gt;dev;<br>
+=C2=A0 =C2=A0 QPCIBar bar0;<br>
+<br>
+=C2=A0 =C2=A0 qpci_device_enable(dev);<br>
+=C2=A0 =C2=A0 bar0 =3D qpci_iomap(dev, 0, NULL);<br>
+=C2=A0 =C2=A0 qpci_io_writew(dev, bar0, 0x32, 0x1);<br>
+}<br>
+<br>
=C2=A0static void ac97_register_nodes(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QOSGraphEdgeOptions opts =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .extra_device_opts =3D &quot;addr=3D04.0&quot;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .extra_device_opts =3D &quot;addr=3D04.0,audio=
dev=3Dsnd0&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .after_cmd_line =3D &quot;-audiodev none,id=3D=
snd0&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;,out.frequency=3D44100,in.frequency=3D44100&quot;,<=
br>
=C2=A0 =C2=A0 =C2=A0};<br>
=C2=A0 =C2=A0 =C2=A0add_qpci_address(&amp;opts, &amp;(QPCIAddress) { .devfn=
 =3D QPCI_DEVFN(4, 0) });<br>
<br>
=C2=A0 =C2=A0 =C2=A0qos_node_create_driver(&quot;AC97&quot;, ac97_create);<=
br>
=C2=A0 =C2=A0 =C2=A0qos_node_produces(&quot;AC97&quot;, &quot;pci-device&qu=
ot;);<br>
=C2=A0 =C2=A0 =C2=A0qos_node_consumes(&quot;AC97&quot;, &quot;pci-bus&quot;=
, &amp;opts);<br>
+<br>
+=C2=A0 =C2=A0 qos_add_test(&quot;playback_upsample&quot;, &quot;AC97&quot;=
, ac97_playback_upsample, NULL);<br>
+=C2=A0 =C2=A0 qos_add_test(&quot;record_downsample&quot;, &quot;AC97&quot;=
, ac97_record_downsample, NULL);<br>
=C2=A0}<br>
<br>
=C2=A0libqos_init(ac97_register_nodes);<br>
-- <br>
2.35.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000093685f05ebc35ff3--

