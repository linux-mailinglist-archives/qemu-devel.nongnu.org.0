Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A45561FAF
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 17:49:42 +0200 (CEST)
Received: from localhost ([::1]:57438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6wQF-0006Jl-Fc
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 11:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1o6wNY-0003t4-O1
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 11:46:52 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935]:36848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1o6wNU-00042s-BV
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 11:46:52 -0400
Received: by mail-ua1-x935.google.com with SMTP id t21so1988295uaq.3
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 08:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DueRxrzN8XKA4kRP8RAf+kVwKuNi1FBSS9X5v4zxKjI=;
 b=qDeHpuPp6SVQ7ny8Tiex4nwed4/tZVTWyjJVGx83blWhnRSYU46o86PpI9UQCYzcQd
 V9Ba/CTt5xlQ09Fm5f8/UyBTQkul5vAVB+6nrAc43e3DHvfw//pbn0wveCd4TYMvMvob
 T5NnRfPW7x72KBPwZDpb1sLLmLb1UxAMi8l27x9WIjZ5y+ow13KaV5x2JnYpATQ9D7Gh
 6OeR9qcDuwassjjDmms5j9WQwzOQjIM0yY7mnW0X2V92maEGlUTJ46jjSWqArFWVkrph
 6pCW7HEXrGc2qIeVPvh2LL0loC6XaC+dbWzugNVryYv92dAJnx3pM1eNKvujYQOcVZJb
 lTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DueRxrzN8XKA4kRP8RAf+kVwKuNi1FBSS9X5v4zxKjI=;
 b=Gp5naHZAUe1/OI1xqF2Dd8K3hdQNYn4B2toiYzjC75e6B5FJ6kaeiHhFxw+LNL6QbW
 KvxmvADZ1hANMwiqwcZ3yBGttkUWKU5OdIYW/ZPUzOuLjD3ChhaXwJhLmnVba0lfp26f
 cmE0xRCPPBbbVAo2GNC/wCFg2/QZ8GQXUNS0Dtha9ucj8nivvzlzmLqPvLuFycgVP8gS
 Jitheg+kgTlpqFD7YnO15rh1JJa05l98iyhLzUR/6XjHtynpAwGFzZoUKSK8wF0UDlI/
 v4uQql6aV0HgKqwbeFhiSykg+6rMUHUR1qvRtX8CGIZ6wlDMJqS/Yzuj40BODDjh5wp5
 UjHg==
X-Gm-Message-State: AJIora+8XsGg/3DlZw9L2cK+DaGRTP6XVFPDmnVHsaMhZXcIlhLwPM3I
 Cmd49lcg6ThdAJB78YLgfcH5YCK3hkv0RxeO/r28Yw==
X-Google-Smtp-Source: AGRyM1vuIcAo2CnorCUOu5+9TydXIbDBxe8VJcjUv7BvzLTgkequa79Xl2MSqv7rZS0fFsOr7pkRHRU7ZjOkRgZavg4=
X-Received: by 2002:ab0:388e:0:b0:37f:3dd:76da with SMTP id
 z14-20020ab0388e000000b0037f03dd76damr5483914uav.26.1656604006805; Thu, 30
 Jun 2022 08:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220629033634.3850922-1-pdel@fb.com>
 <20220629033634.3850922-10-pdel@fb.com>
 <CAMvPwGqmU+bsDb1fHraiTzdg14An5QiKUazSweyzVvbwHeCM=g@mail.gmail.com>
 <59308513-C87E-4DF9-8191-5F2664E90B85@fb.com>
In-Reply-To: <59308513-C87E-4DF9-8191-5F2664E90B85@fb.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 30 Jun 2022 08:46:35 -0700
Message-ID: <CAO=notxbi2wroXK281X0Q4QUF2ONas2xHq=ZYDPsnKRaP4u2wg@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] hw/i2c/pmbus: Add read-only IC_DEVICE_ID support
To: Peter Delevoryas <pdel@fb.com>
Cc: Titus Rwantare <titusr@google.com>,
 Peter Delevoryas <peterdelevoryas@gmail.com>, 
 "clg@kaod.org" <clg@kaod.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, 
 "andrew@aj.id.au" <andrew@aj.id.au>, "joel@jms.id.au" <joel@jms.id.au>, 
 "cminyard@mvista.com" <cminyard@mvista.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Dan Zhang <zhdaniel@fb.com>
Content-Type: multipart/alternative; boundary="0000000000005c639105e2ac2ddf"
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=venture@google.com; helo=mail-ua1-x935.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--0000000000005c639105e2ac2ddf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 11:34 AM Peter Delevoryas <pdel@fb.com> wrote:

>
>
> > On Jun 29, 2022, at 11:04 AM, Titus Rwantare <titusr@google.com> wrote:
> >
> > On Tue, 28 Jun 2022 at 20:36, Peter Delevoryas
> > <peterdelevoryas@gmail.com> wrote:
> >>
> >> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> >> ---
> >
> >> --- a/hw/i2c/pmbus_device.c
> >> +++ b/hw/i2c/pmbus_device.c
> >> @@ -984,6 +984,11 @@ static uint8_t pmbus_receive_byte(SMBusDevice *sm=
d)
> >>         }
> >>         break;
> >>
> >> +    case PMBUS_IC_DEVICE_ID:
> >> +        pmbus_send(pmdev, pmdev->pages[index].ic_device_id,
> >> +                   sizeof(pmdev->pages[index].ic_device_id));
> >> +        break;
> >> +
> >
> > I don't think it's a good idea to add this here because this sends 16
> > bytes for all PMBus devices. I have at least one device that formats
> > IC_DEVICE_ID differently that I've not got permission to upstream.
> > The spec leaves the size and format up to the manufacturer, so this is
> > best done in isl_pmbus_vr.c in isl_pmbus_vr_read_byte().
> > Look at the adm1272_read_byte() which is more interesting than
> > isl_pmbus_vr one as an example.
>
> Argh, yes, you=E2=80=99re absolutely right. I didn=E2=80=99t read the spe=
c in very
> much detail, I see now that the length is device-specific. For the
> ISL69259 I see that it=E2=80=99s 4 bytes, which makes sense now. This
> is not the exact datasheet for the ISL69259, but I think the IC_DEVICE_ID
> part is the same.
>
>
> https://www.renesas.com/us/en/document/dst/isl68229-isl68239-datasheet
>
> Putting the logic in isl_pmbus_vr_read_byte() is a good idea, I hadn=E2=
=80=99t
> seen the implementation in adm1272_read_byte(), that looks great,
> I=E2=80=99ll just add a switch on the command code and move the error mes=
sage
> to the default case.
>
> >
> >
> >>     case PMBUS_CLEAR_FAULTS:              /* Send Byte */
> >>     case PMBUS_PAGE_PLUS_WRITE:           /* Block Write-only */
> >>     case PMBUS_STORE_DEFAULT_ALL:         /* Send Byte */
> >> diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
> >> index e11e028884..b12c46ab6d 100644
> >> --- a/hw/sensor/isl_pmbus_vr.c
> >> +++ b/hw/sensor/isl_pmbus_vr.c
> >> @@ -218,6 +218,28 @@ static void isl_pmbus_vr_class_init(ObjectClass
> *klass, void *data,
> >>     k->device_num_pages =3D pages;
> >> }
> >>
> >> +static void isl69259_init(Object *obj)
> >> +{
> >> +    static const uint8_t ic_device_id[] =3D {0x04, 0x00, 0x81, 0xD2,
> 0x49};
> >> +    PMBusDevice *pmdev =3D PMBUS_DEVICE(obj);
> >> +    int i;
> >> +
> >> +    raa22xx_init(obj);
> >> +    for (i =3D 0; i < pmdev->num_pages; i++) {
> >> +        memcpy(pmdev->pages[i].ic_device_id, ic_device_id,
> >> +               sizeof(ic_device_id));
> >> +    }
> >> +}
> >> +
> >
> > We tend to set default register values in exit_reset() calls. You can
> > do something like in raa228000_exit_reset()
>
> Oh got it. If I can move the logic to isl_pmbus_vr_read_byte perhaps
> I can avoid this whole function though.
>
> >
> >
> >> diff --git a/include/hw/i2c/pmbus_device.h
> b/include/hw/i2c/pmbus_device.h
> >> index 0f4d6b3fad..aed7809841 100644
> >> --- a/include/hw/i2c/pmbus_device.h
> >> +++ b/include/hw/i2c/pmbus_device.h
> >> @@ -407,6 +407,7 @@ typedef struct PMBusPage {
> >>     uint16_t mfr_max_temp_1;           /* R/W word */
> >>     uint16_t mfr_max_temp_2;           /* R/W word */
> >>     uint16_t mfr_max_temp_3;           /* R/W word */
> >> +    uint8_t ic_device_id[16];          /* Read-Only block-read */
> >
> > You wouldn't be able to do this here either, since the size could be
> > anything for other devices.
>
> Right, yeah I see what you mean.
>
> >
> > Thanks for the new device. It helps me see where to expand on PMBus.
>
> Thanks for adding the whole pmbus infrastructure! It=E2=80=99s really use=
ful.
> And thanks for the review.
>
> Off-topic, but I=E2=80=99ve been meaning to reach out to you guys (Google
> engineers working on QEMU for OpenBMC) about your Nuvoton NPCM845R
> series, my team is interested in using it. I was just curious about
> the status of it and if there=E2=80=99s any features missing and what pla=
ns
> you have for the future, maybe we can collaborate.
>

Peter, feel free to reach out to me, or Titus, and we can sync up.  I used
to work with Patrick who's now at Fb on OpenBMC stuff.  We sent a bunch of
the Nuvoton patches up for review recently, and we're actively adding more
devices, etc.

We also have quite a few patches downstream we're looking to upstream,
including PECI, and sensors, etc, etc that we've seen on BMC servers.

Patrick


>
> Thanks!
> Peter
>
> >
> >
> > Titus
>
>

--0000000000005c639105e2ac2ddf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 29, 2022 at 11:34 AM Pete=
r Delevoryas &lt;<a href=3D"mailto:pdel@fb.com">pdel@fb.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt; On Jun 29, 2022, at 11:04 AM, Titus Rwantare &lt;<a href=3D"mailto:tit=
usr@google.com" target=3D"_blank">titusr@google.com</a>&gt; wrote:<br>
&gt; <br>
&gt; On Tue, 28 Jun 2022 at 20:36, Peter Delevoryas<br>
&gt; &lt;<a href=3D"mailto:peterdelevoryas@gmail.com" target=3D"_blank">pet=
erdelevoryas@gmail.com</a>&gt; wrote:<br>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: Peter Delevoryas &lt;<a href=3D"mailto:pdel@fb.com"=
 target=3D"_blank">pdel@fb.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt; <br>
&gt;&gt; --- a/hw/i2c/pmbus_device.c<br>
&gt;&gt; +++ b/hw/i2c/pmbus_device.c<br>
&gt;&gt; @@ -984,6 +984,11 @@ static uint8_t pmbus_receive_byte(SMBusDevice=
 *smd)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; <br>
&gt;&gt; +=C2=A0 =C2=A0 case PMBUS_IC_DEVICE_ID:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmbus_send(pmdev, pmdev-&gt;pages[ind=
ex].ic_device_id,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0sizeof(pmdev-&gt;pages[index].ic_device_id));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; +<br>
&gt; <br>
&gt; I don&#39;t think it&#39;s a good idea to add this here because this s=
ends 16<br>
&gt; bytes for all PMBus devices. I have at least one device that formats<b=
r>
&gt; IC_DEVICE_ID differently that I&#39;ve not got permission to upstream.=
<br>
&gt; The spec leaves the size and format up to the manufacturer, so this is=
<br>
&gt; best done in isl_pmbus_vr.c in isl_pmbus_vr_read_byte().<br>
&gt; Look at the adm1272_read_byte() which is more interesting than<br>
&gt; isl_pmbus_vr one as an example.<br>
<br>
Argh, yes, you=E2=80=99re absolutely right. I didn=E2=80=99t read the spec =
in very<br>
much detail, I see now that the length is device-specific. For the<br>
ISL69259 I see that it=E2=80=99s 4 bytes, which makes sense now. This<br>
is not the exact datasheet for the ISL69259, but I think the IC_DEVICE_ID<b=
r>
part is the same.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://www.renesas.com/us/en/docume=
nt/dst/isl68229-isl68239-datasheet" rel=3D"noreferrer" target=3D"_blank">ht=
tps://www.renesas.com/us/en/document/dst/isl68229-isl68239-datasheet</a><br=
>
<br>
Putting the logic in isl_pmbus_vr_read_byte() is a good idea, I hadn=E2=80=
=99t<br>
seen the implementation in adm1272_read_byte(), that looks great,<br>
I=E2=80=99ll just add a switch on the command code and move the error messa=
ge<br>
to the default case.<br>
<br>
&gt; <br>
&gt; <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0case PMBUS_CLEAR_FAULTS:=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Send Byte */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0case PMBUS_PAGE_PLUS_WRITE:=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0/* Block Write-only */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0case PMBUS_STORE_DEFAULT_ALL:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* Send Byte */<br>
&gt;&gt; diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c<b=
r>
&gt;&gt; index e11e028884..b12c46ab6d 100644<br>
&gt;&gt; --- a/hw/sensor/isl_pmbus_vr.c<br>
&gt;&gt; +++ b/hw/sensor/isl_pmbus_vr.c<br>
&gt;&gt; @@ -218,6 +218,28 @@ static void isl_pmbus_vr_class_init(ObjectCla=
ss *klass, void *data,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0k-&gt;device_num_pages =3D pages;<br>
&gt;&gt; }<br>
&gt;&gt; <br>
&gt;&gt; +static void isl69259_init(Object *obj)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 static const uint8_t ic_device_id[] =3D {0x04, 0x00=
, 0x81, 0xD2, 0x49};<br>
&gt;&gt; +=C2=A0 =C2=A0 PMBusDevice *pmdev =3D PMBUS_DEVICE(obj);<br>
&gt;&gt; +=C2=A0 =C2=A0 int i;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 raa22xx_init(obj);<br>
&gt;&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; pmdev-&gt;num_pages; i++) {<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(pmdev-&gt;pages[i].ic_device_i=
d, ic_device_id,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(ic_=
device_id));<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt; <br>
&gt; We tend to set default register values in exit_reset() calls. You can<=
br>
&gt; do something like in raa228000_exit_reset()<br>
<br>
Oh got it. If I can move the logic to isl_pmbus_vr_read_byte perhaps<br>
I can avoid this whole function though.<br>
<br>
&gt; <br>
&gt; <br>
&gt;&gt; diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_=
device.h<br>
&gt;&gt; index 0f4d6b3fad..aed7809841 100644<br>
&gt;&gt; --- a/include/hw/i2c/pmbus_device.h<br>
&gt;&gt; +++ b/include/hw/i2c/pmbus_device.h<br>
&gt;&gt; @@ -407,6 +407,7 @@ typedef struct PMBusPage {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0uint16_t mfr_max_temp_1;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* R/W word */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0uint16_t mfr_max_temp_2;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* R/W word */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0uint16_t mfr_max_temp_3;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* R/W word */<br>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t ic_device_id[16];=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* Read-Only block-read */<br>
&gt; <br>
&gt; You wouldn&#39;t be able to do this here either, since the size could =
be<br>
&gt; anything for other devices.<br>
<br>
Right, yeah I see what you mean.<br>
<br>
&gt; <br>
&gt; Thanks for the new device. It helps me see where to expand on PMBus.<b=
r>
<br>
Thanks for adding the whole pmbus infrastructure! It=E2=80=99s really usefu=
l.<br>
And thanks for the review.<br>
<br>
Off-topic, but I=E2=80=99ve been meaning to reach out to you guys (Google<b=
r>
engineers working on QEMU for OpenBMC) about your Nuvoton NPCM845R<br>
series, my team is interested in using it. I was just curious about<br>
the status of it and if there=E2=80=99s any features missing and what plans=
<br>
you have for the future, maybe we can collaborate.<br></blockquote><div><br=
></div><div>Peter, feel free to reach out to me, or Titus, and we can sync =
up.=C2=A0 I used to work with Patrick who&#39;s now at Fb on OpenBMC stuff.=
=C2=A0 We sent a bunch of the Nuvoton patches up for review recently, and w=
e&#39;re actively adding more devices, etc.</div><div><br></div><div>We als=
o have quite a few patches downstream we&#39;re looking to upstream, includ=
ing PECI, and sensors, etc, etc that we&#39;ve seen on BMC servers.</div><d=
iv><br></div><div>Patrick</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
Thanks!<br>
Peter<br>
<br>
&gt; <br>
&gt; <br>
&gt; Titus<br>
<br>
</blockquote></div></div>

--0000000000005c639105e2ac2ddf--

