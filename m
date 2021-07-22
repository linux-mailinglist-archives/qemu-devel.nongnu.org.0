Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4FD3D1D28
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 06:54:03 +0200 (CEST)
Received: from localhost ([::1]:37682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Qig-0006g7-MF
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 00:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1m6Qhm-0005zN-Nm
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 00:53:06 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:34396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1m6Qhl-0001oO-21
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 00:53:06 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 p5-20020a17090a8685b029015d1a9a6f1aso2573320pjn.1
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 21:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iALvRI9A14y0KLM+qiG1UxRkiEt/vXEExaXeTWBCq9Y=;
 b=Hqq7TgHt7lx7jcdLJPHKRkFYW6EcrLQp/CVIY9y2l2q021+bf+mAtkzB7TdnPioFJo
 lJ3HqW8MW9HVmoDmyFwlvb3q+OHi1JCQRyjkCSfpt7cuT5mqPLeQuuBk2eeuo1Nf9EhS
 2aVyD5VJGTpcKfle2arBTSNMP+ZY01wClzGfRH8bYKtzxaPUZzm2PNZ9jwcTNQIYgjiN
 PAGpfPFa3o44FyUYyBn3KlU5n0psiSkLHtiqY58apsdsD0Gs3R9ZmJzkPgixNtNKterr
 9/fpGj5HLkV5vSGn2Mrji5+BVhVvD/0dZ/hA//wfb6MxvyEwBEFHGnFQMWOx14Fd3Jk2
 socQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iALvRI9A14y0KLM+qiG1UxRkiEt/vXEExaXeTWBCq9Y=;
 b=OlnzEfG8aCk/WcT/6mL7lIM61W0rgs7JQTS9t6+72kMDp5jlxAOW/4whDB2o+jzijp
 lnpOpmFHKhyIFRJ7J9FcQufwVgCnpozMx5Rt4AZSK611ROj4BKPvM7OvJplV4kIvI8lt
 U9FT4m8KWiUUjbIPlhTQwcqbN3co66VkNxBmQ2a+bG6CVMILx4t9BOtBZB/f8F+oQ+WJ
 GYRIrcAY0fByCjcG1injOs+agXIzCdJ7/rnVle1N2zkZx4ro9Maydl25wv7L5XAlIDOn
 VqV8FPVunyPLcGMXZXmuOC+tS2GqN97K4Jb4iD22hR4mX5ZAcJ/Hx/3NOEOxDzxA2zBI
 /rkg==
X-Gm-Message-State: AOAM531aEBFLT2JMDHjvrAKTCoG8iNPPcI0G80C/0lyzCEPv7ItrHr1+
 Llg1LSsGV9fDCugQZ/GDvrTAo0zeMkLmDeZnS/I=
X-Google-Smtp-Source: ABdhPJxJoVgtHXbr9fybxn098LkJHFtcLvHOMCcWDameOYXtSp4EWOW90CpK3+5DS+uaA7OJnZ/2qO2ohT0lSStgUKo=
X-Received: by 2002:a17:902:e80f:b029:12b:5cb8:dbf5 with SMTP id
 u15-20020a170902e80fb029012b5cb8dbf5mr27839087plg.30.1626929582883; Wed, 21
 Jul 2021 21:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
 <20210429120445.694420-11-chouhan.shreyansh2702@gmail.com>
 <CANo3dkpB6Qn46mDGdGE4KTNqHpJkajNcnq_4BugNC5jd8r042Q@mail.gmail.com>
In-Reply-To: <CANo3dkpB6Qn46mDGdGE4KTNqHpJkajNcnq_4BugNC5jd8r042Q@mail.gmail.com>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Thu, 22 Jul 2021 10:22:51 +0530
Message-ID: <CAAQ-SiNjrjEmt0SUjDx2wYX-M7i3q+D6y=2PvasBgqbs0UGVkQ@mail.gmail.com>
Subject: Re: [RFC PATCH 10/27] virtio-snd: Add code for the realize function
To: Deepa gowda <deepa.gouda@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000dcd05505c7af0f13"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000dcd05505c7af0f13
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 22 Jul 2021 at 07:48, Deepa gowda <deepa.gouda@gmail.com> wrote:

> Hi, Shreyansh,
>
> When is virtio-snd expected to be completed and available in Qemu GitHub?
>
>
Sorry for the recent absence of activity on this patch series. I have the
sound card
working with alsa. The output works just fine. The input needs a little bit
of polishing to do.
To answer your question, it is still going to take some time because I
recently got selected
for an internship/mentorship program and I cannot give as much time to the
patch as I
would like to. It could still take me over a month to complete this.

Hope you understand.

(I've cc'd the mailing list and Gerd so that they too can know about this.)

Thanks,
Shreyansh Chouhan

> Regards Deepa
>
> On Thu, 29 Apr 2021, 17:58 Shreyansh Chouhan, <
> chouhan.shreyansh2702@gmail.com> wrote:
>
>> Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
>> ---
>>  hw/audio/virtio-snd.c | 35 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>
>> diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
>> index edaeffd6b7..caad157705 100644
>> --- a/hw/audio/virtio-snd.c
>> +++ b/hw/audio/virtio-snd.c
>> @@ -97,8 +97,43 @@ static uint64_t virtio_snd_get_features(VirtIODevice
>> *vdev, uint64_t features,
>>      return vdev->host_features;
>>  }
>>
>> +/*
>> + * Initializes the VirtIOSound card device. Validates the configuration
>> + * passed by the command line. Initializes the virtqueues. Allocates
>> resources
>> + * for and initializes streams, jacks and chmaps.
>> + *
>> + * @dev: VirtIOSound card device
>> + * @errp: Set if there is an error
>> + */
>>  static void virtio_snd_device_realize(DeviceState *dev, Error **errp)
>>  {
>> +    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>> +    VirtIOSound *s = VIRTIO_SOUND(dev);
>> +
>> +    virtio_init(vdev, "virtio-snd", VIRTIO_ID_SOUND,
>> sizeof(virtio_snd_config));
>> +
>> +    /* set number of jacks and streams */
>> +    if (s->snd_conf.jacks > 8) {
>> +        error_setg(errp, "Invalid number of jacks: %d",
>> s->snd_conf.jacks);
>> +        return;
>> +    }
>> +    if (s->snd_conf.streams < 1 || s->snd_conf.streams > 10) {
>> +        error_setg(errp, "Invalid number of streams: %d",
>> s->snd_conf.streams);
>> +        return;
>> +    }
>> +
>> +    if (s->snd_conf.chmaps > VIRTIO_SND_CHMAP_MAX_SIZE) {
>> +        error_setg(errp, "Invalid number of channel maps: %d",
>> +                   s->snd_conf.chmaps);
>> +        return;
>> +    }
>> +
>> +    /* set up QEMUSoundCard and audiodev */
>> +    AUD_register_card ("virtio_snd_card", &s->card);
>> +
>> +    s->streams = g_new0(virtio_snd_pcm_stream *, s->snd_conf.streams);
>> +    s->pcm_params = g_new0(virtio_snd_pcm_params *, s->snd_conf.streams);
>> +    s->jacks = g_new0(virtio_snd_jack *, s->snd_conf.jacks);
>>  }
>>
>>  static void virtio_snd_device_unrealize(DeviceState *dev)
>> --
>> 2.25.1
>>
>>
>>

--000000000000dcd05505c7af0f13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 22 Jul 2021 at 07:48, Deepa gowda &lt=
;<a href=3D"mailto:deepa.gouda@gmail.com">deepa.gouda@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
auto">Hi, Shreyansh,<div dir=3D"auto"><br><div dir=3D"auto">When is virtio-=
snd expected to be completed and available in Qemu GitHub?</div><div dir=3D=
"auto"><br></div></div></div></blockquote><div><br></div><div>Sorry for the=
 recent absence of activity on this patch series. I have the sound card <br=
></div><div>working with alsa. The output works just fine. The input needs =
a little bit of polishing to do.</div><div>To answer your question, it is s=
till going to take some time because I recently got selected</div><div> for=
 an internship/mentorship program and I cannot give as much time to the pat=
ch as I</div><div>would like to. It could still take me over a month to com=
plete this.<br></div><div><br></div><div>Hope you understand.</div><div><br=
></div><div>(I&#39;ve cc&#39;d the mailing list and Gerd so that they too c=
an know about this.)</div><div><br></div><div>Thanks,</div><div>Shreyansh C=
houhan<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"auto"><div dir=3D"auto"><div dir=3D"auto"></div><div dir=3D"auto">Regar=
ds Deepa</div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Thu, 29 Apr 2021, 17:58 Shreyansh Chouhan, &lt;<a hr=
ef=3D"mailto:chouhan.shreyansh2702@gmail.com" target=3D"_blank">chouhan.shr=
eyansh2702@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Signed-off-by: Shreyansh Chouhan &lt;<a href=3D"mailto:=
chouhan.shreyansh2702@gmail.com" rel=3D"noreferrer" target=3D"_blank">chouh=
an.shreyansh2702@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/audio/virtio-snd.c | 35 +++++++++++++++++++++++++++++++++++<br>
=C2=A01 file changed, 35 insertions(+)<br>
<br>
diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c<br>
index edaeffd6b7..caad157705 100644<br>
--- a/hw/audio/virtio-snd.c<br>
+++ b/hw/audio/virtio-snd.c<br>
@@ -97,8 +97,43 @@ static uint64_t virtio_snd_get_features(VirtIODevice *vd=
ev, uint64_t features,<br>
=C2=A0 =C2=A0 =C2=A0return vdev-&gt;host_features;<br>
=C2=A0}<br>
<br>
+/*<br>
+ * Initializes the VirtIOSound card device. Validates the configuration<br=
>
+ * passed by the command line. Initializes the virtqueues. Allocates resou=
rces<br>
+ * for and initializes streams, jacks and chmaps.<br>
+ *<br>
+ * @dev: VirtIOSound card device<br>
+ * @errp: Set if there is an error<br>
+ */<br>
=C2=A0static void virtio_snd_device_realize(DeviceState *dev, Error **errp)=
<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);<br>
+=C2=A0 =C2=A0 VirtIOSound *s =3D VIRTIO_SOUND(dev);<br>
+<br>
+=C2=A0 =C2=A0 virtio_init(vdev, &quot;virtio-snd&quot;, VIRTIO_ID_SOUND, s=
izeof(virtio_snd_config));<br>
+<br>
+=C2=A0 =C2=A0 /* set number of jacks and streams */<br>
+=C2=A0 =C2=A0 if (s-&gt;snd_conf.jacks &gt; 8) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Invalid number of jacks=
: %d&quot;, s-&gt;snd_conf.jacks);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (s-&gt;snd_conf.streams &lt; 1 || s-&gt;snd_conf.streams =
&gt; 10) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Invalid number of strea=
ms: %d&quot;, s-&gt;snd_conf.streams);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (s-&gt;snd_conf.chmaps &gt; VIRTIO_SND_CHMAP_MAX_SIZE) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Invalid number of chann=
el maps: %d&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt=
;snd_conf.chmaps);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* set up QEMUSoundCard and audiodev */<br>
+=C2=A0 =C2=A0 AUD_register_card (&quot;virtio_snd_card&quot;, &amp;s-&gt;c=
ard);<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;streams =3D g_new0(virtio_snd_pcm_stream *, s-&gt;snd_=
conf.streams);<br>
+=C2=A0 =C2=A0 s-&gt;pcm_params =3D g_new0(virtio_snd_pcm_params *, s-&gt;s=
nd_conf.streams);<br>
+=C2=A0 =C2=A0 s-&gt;jacks =3D g_new0(virtio_snd_jack *, s-&gt;snd_conf.jac=
ks);<br>
=C2=A0}<br>
<br>
=C2=A0static void virtio_snd_device_unrealize(DeviceState *dev)<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div>
</blockquote></div></div>

--000000000000dcd05505c7af0f13--

