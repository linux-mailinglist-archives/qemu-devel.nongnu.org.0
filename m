Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3635141984B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 17:55:35 +0200 (CEST)
Received: from localhost ([::1]:58472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUsyc-0005lh-6L
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 11:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1mUstG-00079t-Ep
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 11:50:02 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:44028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1mUstC-0001pV-OB
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 11:50:01 -0400
Received: by mail-lf1-x12a.google.com with SMTP id e15so79632578lfr.10
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 08:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HlLFePpZrvSqVF7ByHxYNwJxmPk1nwpKsS/tECoYIHE=;
 b=C4aoKAowty4vKwu2/54rxwXo77nlCvL3sEOdfp6iLzE1v0ILl+lvPVLo7Z7QJngw8Y
 gFDE2RJesfQGvza0LGbtlOW95aKParYWQKFVbk21z0Hj0GLTtzMeIXk2qnKp8JYbIm5d
 UUs4m37IO9gSgXLX7QaPUz9if+Aiz88n/Rrki0ajXd5yTbIPttRiB8M6OPyqmid84lBR
 YCP5hdWla8tjzHplBLcNoZxckhB2DoK8ipDwF9GlIDCLB4H+iSjBLEvpfSnwKKj1IVRi
 12xK+IOEYlWopPoqfYPrqcVB/0YKQh1E/PS21B948ShSjvOEKVA1/QYQ/eUvqft5Grxn
 voqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HlLFePpZrvSqVF7ByHxYNwJxmPk1nwpKsS/tECoYIHE=;
 b=MlBMTCzwcsOIU7is+sn/iMrcMzXuiqJi34j/rI/3UOUKXrgh4snhPAqAxYL1H3uzO2
 DAF6M16AQcGfcWfkl+wE33QtGz0YSLuCfp3/y9vprrBAbxEId+fr7x8edl2HImKGZs0V
 mqYYCOC7t+2r3u5hPJ7CZ/4J0H6Nb1v/UBKcwZ21oXkXFB2bTS2gw2fp1be4bWmF5ZcB
 LpDdIZEyvNF3UsfzR/d0+ZkuRkQrQNnCrK59bj1G2O8xbLY1jjPeB91we7n8OQgJGur+
 BEO/MkRW58TFPBVMIkHdHHmRN5DwTF7vzkJMPLZa9edln1aVgh2o/pel/KVY9LIirkk+
 H/SA==
X-Gm-Message-State: AOAM5312/S0u9tJO0NzZkaC1ZriJVOXJBYLF0HzbUD75VuryIWXw1V0s
 4z6ZO95PlSuY4wrpOUrf4+WHXFu9os+qRoZllpv5+g==
X-Google-Smtp-Source: ABdhPJzpQslY6Lkd6vnLTZ1KsjClBp7Jko4HvI81GgBH3tM3NWm/rspjOe1N5sDGZDqWnyzDX9aOA83Pbn2IIApT7do=
X-Received: by 2002:a2e:5418:: with SMTP id i24mr533353ljb.115.1632757792982; 
 Mon, 27 Sep 2021 08:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210926221518.1726267-1-f4bug@amsat.org>
 <b16f6405-72cf-144b-975e-98cda77604ab@kaod.org>
In-Reply-To: <b16f6405-72cf-144b-975e-98cda77604ab@kaod.org>
From: Hao Wu <wuhaotsh@google.com>
Date: Mon, 27 Sep 2021 08:49:31 -0700
Message-ID: <CAGcCb11_SZH+eXVHhCWWffon03E1M998wi4gtnRXd8feJahVhQ@mail.gmail.com>
Subject: Re: [PATCH] hw: Add a 'Sensor devices' qdev category
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Corey Minyard <cminyard@mvista.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, 
 qemu-arm <qemu-arm@nongnu.org>, Titus Rwantare <titusr@google.com>, 
 John Wang <wangzhiqiang.bj@bytedance.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000041ed8805ccfc0cf5"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

--00000000000041ed8805ccfc0cf5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2021 at 3:03 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 9/27/21 00:15, Philippe Mathieu-Daud=C3=A9 wrote:
> > Sensors models are listed in the 'Misc devices' category.
> > Move them to their own category.
> >
> > For the devices in the hw/sensor/ directory, the category
> > is obvious.
> >
> > hw/arm/z2.c models the AER915 model which is described
> > on [*] as:
> >
> >    The 14-pin chip marked AER915 just below the expansion
> >    port is a 80C51-type microcontroller, similar to Philips
> >    P89LPC915. It has an 8-bit A/D which is used to determine
> >    which of six buttons are pressed on the resistor-network
> >    wired remote.  It communicates with the main cpu via I2C.
> >
> > It was introduced in commit 3bf11207c06 ("Add support for
> > Zipit Z2 machine") with this comment:
> >
> >    248 static uint8_t aer915_recv(I2CSlave *slave)
> >    249 {
> >    ...
> >    253     switch (s->buf[0]) {
> >    254     /* Return hardcoded battery voltage,
> >    255      * 0xf0 means ~4.1V
> >    256      */
> >    257     case 0x02:
> >    258         retval =3D 0xf0;
> >    259         break;
> >
> > For QEMU the AER915 is a very simple sensor model.
> >
> > [*] https://www.bealecorner.org/best/measure/z2/index.html
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

>
>
> > ---
> >   include/hw/qdev-core.h | 1 +
> >   hw/arm/z2.c            | 1 +
> >   hw/sensor/adm1272.c    | 1 +
> >   hw/sensor/dps310.c     | 1 +
> >   hw/sensor/emc141x.c    | 1 +
> >   hw/sensor/max34451.c   | 2 ++
> >   hw/sensor/tmp105.c     | 1 +
> >   hw/sensor/tmp421.c     | 1 +
> >   softmmu/qdev-monitor.c | 1 +
> >   9 files changed, 10 insertions(+)
> >
> > diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> > index 34c8a7506a1..f6241212247 100644
> > --- a/include/hw/qdev-core.h
> > +++ b/include/hw/qdev-core.h
> > @@ -26,6 +26,7 @@ typedef enum DeviceCategory {
> >       DEVICE_CATEGORY_SOUND,
> >       DEVICE_CATEGORY_MISC,
> >       DEVICE_CATEGORY_CPU,
> > +    DEVICE_CATEGORY_SENSOR,
> >       DEVICE_CATEGORY_MAX
> >   } DeviceCategory;
> >
> > diff --git a/hw/arm/z2.c b/hw/arm/z2.c
> > index 9c1e876207b..62db9741106 100644
> > --- a/hw/arm/z2.c
> > +++ b/hw/arm/z2.c
> > @@ -288,6 +288,7 @@ static void aer915_class_init(ObjectClass *klass,
> void *data)
> >       k->recv =3D aer915_recv;
> >       k->send =3D aer915_send;
> >       dc->vmsd =3D &vmstate_aer915_state;
> > +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
> >   }
> >
> >   static const TypeInfo aer915_info =3D {
> > diff --git a/hw/sensor/adm1272.c b/hw/sensor/adm1272.c
> > index 7310c769be2..2942ac75f90 100644
> > --- a/hw/sensor/adm1272.c
> > +++ b/hw/sensor/adm1272.c
> > @@ -518,6 +518,7 @@ static void adm1272_class_init(ObjectClass *klass,
> void *data)
> >       DeviceClass *dc =3D DEVICE_CLASS(klass);
> >       PMBusDeviceClass *k =3D PMBUS_DEVICE_CLASS(klass);
> >
> > +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
> >       dc->desc =3D "Analog Devices ADM1272 Hot Swap controller";
> >       dc->vmsd =3D &vmstate_adm1272;
> >       k->write_data =3D adm1272_write_data;
> > diff --git a/hw/sensor/dps310.c b/hw/sensor/dps310.c
> > index d60a18ac41b..1e24a499b38 100644
> > --- a/hw/sensor/dps310.c
> > +++ b/hw/sensor/dps310.c
> > @@ -208,6 +208,7 @@ static void dps310_class_init(ObjectClass *klass,
> void *data)
> >       k->send =3D dps310_tx;
> >       dc->reset =3D dps310_reset;
> >       dc->vmsd =3D &vmstate_dps310;
> > +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
> >   }
> >
> >   static const TypeInfo dps310_info =3D {
> > diff --git a/hw/sensor/emc141x.c b/hw/sensor/emc141x.c
> > index 7ce8f4e9794..4202d8f185a 100644
> > --- a/hw/sensor/emc141x.c
> > +++ b/hw/sensor/emc141x.c
> > @@ -270,6 +270,7 @@ static void emc141x_class_init(ObjectClass *klass,
> void *data)
> >       DeviceClass *dc =3D DEVICE_CLASS(klass);
> >       I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
> >
> > +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
> >       dc->reset =3D emc141x_reset;
> >       k->event =3D emc141x_event;
> >       k->recv =3D emc141x_rx;
> > diff --git a/hw/sensor/max34451.c b/hw/sensor/max34451.c
> > index a91d8bd487c..8300bf4ff43 100644
> > --- a/hw/sensor/max34451.c
> > +++ b/hw/sensor/max34451.c
> > @@ -751,6 +751,8 @@ static void max34451_class_init(ObjectClass *klass,
> void *data)
> >       ResettableClass *rc =3D RESETTABLE_CLASS(klass);
> >       DeviceClass *dc =3D DEVICE_CLASS(klass);
> >       PMBusDeviceClass *k =3D PMBUS_DEVICE_CLASS(klass);
> > +
> > +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
> >       dc->desc =3D "Maxim MAX34451 16-Channel V/I monitor";
> >       dc->vmsd =3D &vmstate_max34451;
> >       k->write_data =3D max34451_write_data;
> > diff --git a/hw/sensor/tmp105.c b/hw/sensor/tmp105.c
> > index 20564494899..43d79b9eeec 100644
> > --- a/hw/sensor/tmp105.c
> > +++ b/hw/sensor/tmp105.c
> > @@ -305,6 +305,7 @@ static void tmp105_class_init(ObjectClass *klass,
> void *data)
> >       DeviceClass *dc =3D DEVICE_CLASS(klass);
> >       I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
> >
> > +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
> >       dc->realize =3D tmp105_realize;
> >       k->event =3D tmp105_event;
> >       k->recv =3D tmp105_rx;
> > diff --git a/hw/sensor/tmp421.c b/hw/sensor/tmp421.c
> > index a3db57dcb5a..c328978af9c 100644
> > --- a/hw/sensor/tmp421.c
> > +++ b/hw/sensor/tmp421.c
> > @@ -343,6 +343,7 @@ static void tmp421_class_init(ObjectClass *klass,
> void *data)
> >       I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
> >       TMP421Class *sc =3D TMP421_CLASS(klass);
> >
> > +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
> >       dc->realize =3D tmp421_realize;
> >       k->event =3D tmp421_event;
> >       k->recv =3D tmp421_rx;
> > diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> > index 0705f008466..db56f328228 100644
> > --- a/softmmu/qdev-monitor.c
> > +++ b/softmmu/qdev-monitor.c
> > @@ -162,6 +162,7 @@ static void qdev_print_devinfos(bool show_no_user)
> >           [DEVICE_CATEGORY_SOUND]   =3D "Sound",
> >           [DEVICE_CATEGORY_MISC]    =3D "Misc",
> >           [DEVICE_CATEGORY_CPU]     =3D "CPU",
> > +        [DEVICE_CATEGORY_SENSOR]  =3D "Sensor",
> >           [DEVICE_CATEGORY_MAX]     =3D "Uncategorized",
> >       };
> >       GSList *list, *elt;
> >
>
>

--00000000000041ed8805ccfc0cf5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 27, 2021 at 3:03 AM C=C3=
=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org">clg@kaod.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 9/27/2=
1 00:15, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; Sensors models are listed in the &#39;Misc devices&#39; category.<br>
&gt; Move them to their own category.<br>
&gt; <br>
&gt; For the devices in the hw/sensor/ directory, the category<br>
&gt; is obvious.<br>
&gt; <br>
&gt; hw/arm/z2.c models the AER915 model which is described<br>
&gt; on [*] as:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 The 14-pin chip marked AER915 just below the expansion<br=
>
&gt;=C2=A0 =C2=A0 port is a 80C51-type microcontroller, similar to Philips<=
br>
&gt;=C2=A0 =C2=A0 P89LPC915. It has an 8-bit A/D which is used to determine=
<br>
&gt;=C2=A0 =C2=A0 which of six buttons are pressed on the resistor-network<=
br>
&gt;=C2=A0 =C2=A0 wired remote.=C2=A0 It communicates with the main cpu via=
 I2C.<br>
&gt; <br>
&gt; It was introduced in commit 3bf11207c06 (&quot;Add support for<br>
&gt; Zipit Z2 machine&quot;) with this comment:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 248 static uint8_t aer915_recv(I2CSlave *slave)<br>
&gt;=C2=A0 =C2=A0 249 {<br>
&gt;=C2=A0 =C2=A0 ...<br>
&gt;=C2=A0 =C2=A0 253=C2=A0 =C2=A0 =C2=A0switch (s-&gt;buf[0]) {<br>
&gt;=C2=A0 =C2=A0 254=C2=A0 =C2=A0 =C2=A0/* Return hardcoded battery voltag=
e,<br>
&gt;=C2=A0 =C2=A0 255=C2=A0 =C2=A0 =C2=A0 * 0xf0 means ~4.1V<br>
&gt;=C2=A0 =C2=A0 256=C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 257=C2=A0 =C2=A0 =C2=A0case 0x02:<br>
&gt;=C2=A0 =C2=A0 258=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D 0xf0;<br>
&gt;=C2=A0 =C2=A0 259=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; <br>
&gt; For QEMU the AER915 is a very simple sensor model.<br>
&gt; <br>
&gt; [*] <a href=3D"https://www.bealecorner.org/best/measure/z2/index.html"=
 rel=3D"noreferrer" target=3D"_blank">https://www.bealecorner.org/best/meas=
ure/z2/index.html</a><br>
&gt; <br>
&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug=
@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
<br>
Reviewed-by: C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org" targ=
et=3D"_blank">clg@kaod.org</a>&gt;<br></blockquote><div>Reviewed-by: Hao Wu=
 &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@google.com</a>&gt;=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0include/hw/qdev-core.h | 1 +<br>
&gt;=C2=A0 =C2=A0hw/arm/z2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +=
<br>
&gt;=C2=A0 =C2=A0hw/sensor/adm1272.c=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0hw/sensor/dps310.c=C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A0hw/sensor/emc141x.c=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0hw/sensor/max34451.c=C2=A0 =C2=A0| 2 ++<br>
&gt;=C2=A0 =C2=A0hw/sensor/tmp105.c=C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A0hw/sensor/tmp421.c=C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A0softmmu/qdev-monitor.c | 1 +<br>
&gt;=C2=A0 =C2=A09 files changed, 10 insertions(+)<br>
&gt; <br>
&gt; diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h<br>
&gt; index 34c8a7506a1..f6241212247 100644<br>
&gt; --- a/include/hw/qdev-core.h<br>
&gt; +++ b/include/hw/qdev-core.h<br>
&gt; @@ -26,6 +26,7 @@ typedef enum DeviceCategory {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEVICE_CATEGORY_SOUND,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEVICE_CATEGORY_MISC,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEVICE_CATEGORY_CPU,<br>
&gt; +=C2=A0 =C2=A0 DEVICE_CATEGORY_SENSOR,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEVICE_CATEGORY_MAX<br>
&gt;=C2=A0 =C2=A0} DeviceCategory;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/hw/arm/z2.c b/hw/arm/z2.c<br>
&gt; index 9c1e876207b..62db9741106 100644<br>
&gt; --- a/hw/arm/z2.c<br>
&gt; +++ b/hw/arm/z2.c<br>
&gt; @@ -288,6 +288,7 @@ static void aer915_class_init(ObjectClass *klass, =
void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0k-&gt;recv =3D aer915_recv;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0k-&gt;send =3D aer915_send;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_aer915_state;<b=
r>
&gt; +=C2=A0 =C2=A0 set_bit(DEVICE_CATEGORY_SENSOR, dc-&gt;categories);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static const TypeInfo aer915_info =3D {<br>
&gt; diff --git a/hw/sensor/adm1272.c b/hw/sensor/adm1272.c<br>
&gt; index 7310c769be2..2942ac75f90 100644<br>
&gt; --- a/hw/sensor/adm1272.c<br>
&gt; +++ b/hw/sensor/adm1272.c<br>
&gt; @@ -518,6 +518,7 @@ static void adm1272_class_init(ObjectClass *klass,=
 void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PMBusDeviceClass *k =3D PMBUS_DEVICE_CLASS(k=
lass);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 set_bit(DEVICE_CATEGORY_SENSOR, dc-&gt;categories);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;desc =3D &quot;Analog Devices ADM1272=
 Hot Swap controller&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_adm1272;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0k-&gt;write_data =3D adm1272_write_data;<br>
&gt; diff --git a/hw/sensor/dps310.c b/hw/sensor/dps310.c<br>
&gt; index d60a18ac41b..1e24a499b38 100644<br>
&gt; --- a/hw/sensor/dps310.c<br>
&gt; +++ b/hw/sensor/dps310.c<br>
&gt; @@ -208,6 +208,7 @@ static void dps310_class_init(ObjectClass *klass, =
void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0k-&gt;send =3D dps310_tx;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;reset =3D dps310_reset;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_dps310;<br>
&gt; +=C2=A0 =C2=A0 set_bit(DEVICE_CATEGORY_SENSOR, dc-&gt;categories);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static const TypeInfo dps310_info =3D {<br>
&gt; diff --git a/hw/sensor/emc141x.c b/hw/sensor/emc141x.c<br>
&gt; index 7ce8f4e9794..4202d8f185a 100644<br>
&gt; --- a/hw/sensor/emc141x.c<br>
&gt; +++ b/hw/sensor/emc141x.c<br>
&gt; @@ -270,6 +270,7 @@ static void emc141x_class_init(ObjectClass *klass,=
 void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);=
<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 set_bit(DEVICE_CATEGORY_SENSOR, dc-&gt;categories);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;reset =3D emc141x_reset;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0k-&gt;event =3D emc141x_event;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0k-&gt;recv =3D emc141x_rx;<br>
&gt; diff --git a/hw/sensor/max34451.c b/hw/sensor/max34451.c<br>
&gt; index a91d8bd487c..8300bf4ff43 100644<br>
&gt; --- a/hw/sensor/max34451.c<br>
&gt; +++ b/hw/sensor/max34451.c<br>
&gt; @@ -751,6 +751,8 @@ static void max34451_class_init(ObjectClass *klass=
, void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ResettableClass *rc =3D RESETTABLE_CLASS(kla=
ss);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PMBusDeviceClass *k =3D PMBUS_DEVICE_CLASS(k=
lass);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 set_bit(DEVICE_CATEGORY_SENSOR, dc-&gt;categories);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;desc =3D &quot;Maxim MAX34451 16-Chan=
nel V/I monitor&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_max34451;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0k-&gt;write_data =3D max34451_write_data;<br=
>
&gt; diff --git a/hw/sensor/tmp105.c b/hw/sensor/tmp105.c<br>
&gt; index 20564494899..43d79b9eeec 100644<br>
&gt; --- a/hw/sensor/tmp105.c<br>
&gt; +++ b/hw/sensor/tmp105.c<br>
&gt; @@ -305,6 +305,7 @@ static void tmp105_class_init(ObjectClass *klass, =
void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);=
<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 set_bit(DEVICE_CATEGORY_SENSOR, dc-&gt;categories);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;realize =3D tmp105_realize;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0k-&gt;event =3D tmp105_event;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0k-&gt;recv =3D tmp105_rx;<br>
&gt; diff --git a/hw/sensor/tmp421.c b/hw/sensor/tmp421.c<br>
&gt; index a3db57dcb5a..c328978af9c 100644<br>
&gt; --- a/hw/sensor/tmp421.c<br>
&gt; +++ b/hw/sensor/tmp421.c<br>
&gt; @@ -343,6 +343,7 @@ static void tmp421_class_init(ObjectClass *klass, =
void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TMP421Class *sc =3D TMP421_CLASS(klass);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 set_bit(DEVICE_CATEGORY_SENSOR, dc-&gt;categories);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;realize =3D tmp421_realize;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0k-&gt;event =3D tmp421_event;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0k-&gt;recv =3D tmp421_rx;<br>
&gt; diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c<br>
&gt; index 0705f008466..db56f328228 100644<br>
&gt; --- a/softmmu/qdev-monitor.c<br>
&gt; +++ b/softmmu/qdev-monitor.c<br>
&gt; @@ -162,6 +162,7 @@ static void qdev_print_devinfos(bool show_no_user)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[DEVICE_CATEGORY_SOUND]=C2=A0 =
=C2=A0=3D &quot;Sound&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[DEVICE_CATEGORY_MISC]=C2=A0 =
=C2=A0 =3D &quot;Misc&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[DEVICE_CATEGORY_CPU]=C2=A0 =
=C2=A0 =C2=A0=3D &quot;CPU&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [DEVICE_CATEGORY_SENSOR]=C2=A0 =3D &quot;=
Sensor&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[DEVICE_CATEGORY_MAX]=C2=A0 =
=C2=A0 =C2=A0=3D &quot;Uncategorized&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GSList *list, *elt;<br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000041ed8805ccfc0cf5--

