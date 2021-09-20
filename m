Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8068D4115ED
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 15:39:39 +0200 (CEST)
Received: from localhost ([::1]:54778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSJWE-00027d-2a
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 09:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.townsend@linaro.org>)
 id 1mSJUr-00011v-9s
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:38:13 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin.townsend@linaro.org>)
 id 1mSJUl-0006MQ-8Y
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:38:11 -0400
Received: by mail-wr1-x42b.google.com with SMTP id u15so29815411wru.6
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 06:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aI9zsdOarExIjyyynKobMWJK1cYK/UNibSl2MovK1PI=;
 b=pUIiwLfUcmzGR5WYQK4ZfwOO8V/ZJFwLFvHnSK7VD7F5pcR/V8/lQRSY6u6fUwL/bl
 Pbs7o+C821SgVC6XAhq/DApJN141vcKwxAd6DIE36wmKYxtcXuYGHL3czMjqntrkBNqf
 BEK0fDW2MOD9+b3ZjFWK8MRj869TlF8232el2gv7YJjDG+IT85K2SJMyGzMBr1WfZuq8
 wl0/1U+SwUiCuNQWtziT+HGQwYj+hcp72OgzYjvcO3C9OUvtVvP2kPH7bC/aREyXWsY1
 0NUaDEj2tBkyiUdOtjxH3BIxL8sb2ylcf0++JWgFGskVtU4AW/p312IBQ9BzApGVr8PZ
 98fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aI9zsdOarExIjyyynKobMWJK1cYK/UNibSl2MovK1PI=;
 b=eToqq2Qg0fEQCOElp1XXJhM+wyIx5vWPOALhVV8pzs4hdfhCyXmFREEPALrnkew/NX
 oBvF29vKiN3+5xse9Hf/FGevTXbTvZOnBIdfKInvyqj89y6eGawTxteFlDiGSQyXImyk
 +APQQ/4ic1NdTgBVJ6wXOgP9IxzERmj7L85+eQ5t1/AIBlGG6vsISeEmO7t2nOuqKOYs
 C4h6cuJw2BaL3LlE4W5/LUYyhYc3vICE1o9BAfO1Xj+8d2u8ZIYDoTnYbPUSG5DnDTlv
 gIooKqWGXY6bql6xN8fqyC7xd04i2FsE8/epxrZfazc6B3y+TreajFjq1Uw0XOXB2NOu
 sOQg==
X-Gm-Message-State: AOAM533KEBoCs30Ylq7jR7q431o2W+0MB/kApH+l2C88PUVs6oUK0Ouf
 ThVyaqZgTC7WyFTBkRRT4IaxHMu+hlIO2xYoAr4PLA==
X-Google-Smtp-Source: ABdhPJwYZXFuUJhqQDv0dYP8liRgHfrmYw0GKQg8VqttmP8dvMO78BJtfhUD/340lZ7HvGehedq+pakFL+SdCT+2WEA=
X-Received: by 2002:a1c:a94a:: with SMTP id s71mr29009079wme.32.1632145085020; 
 Mon, 20 Sep 2021 06:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210815162738.75461-1-kevin.townsend@linaro.org>
 <20210815162738.75461-2-kevin.townsend@linaro.org>
 <CAFEAcA8L7N0m1XRzRnyLt8QUOdrX436-2Xa9a04oYGOd6E0agw@mail.gmail.com>
In-Reply-To: <CAFEAcA8L7N0m1XRzRnyLt8QUOdrX436-2Xa9a04oYGOd6E0agw@mail.gmail.com>
From: Kevin Townsend <kevin.townsend@linaro.org>
Date: Mon, 20 Sep 2021 15:37:53 +0200
Message-ID: <CAFPHj6PJZdLXRiYXfz-zwgCaUwvTB8sbUsXcNL=aweqXR2hxQA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/sensor: Add lsm303dlhc magnetometer device
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000003d14a05cc6d647d"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=kevin.townsend@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000003d14a05cc6d647d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Thanks for the review, and sorry for the slow reply, just getting back from
holidays myself.

On Thu, 26 Aug 2021 at 17:39, Peter Maydell <peter.maydell@linaro.org>
wrote:

>
> So if I'm reading the datasheet correctly, the LM303DLHC is
> really two completely distinct i2c devices in a single
> package with different slave addresses; this QEMU device
> implements only the magnetometer i2c device, and if we wanted
> to add the accelerometer device we'd implement that as a
> second separate QEMU i2c device ?
>

This is correct. There are two distinct dies in the chip with separate I2C
addresses, etc.,
and this should probably be modelled separately. I chose the magnetometer
since it's
a far simpler device to model than the accelrometer, but still solves the
need for a
more complex I2C sensor that can be used in testing with the I2C bus.

> +    if (value > 2047 || value < -2048) {
> > +        error_setg(errp, "value %d lsb is out of range", value);
>
> Why "lsb" ?
>
>
In my head, using LSB seemed more precise since I know exactly what value
will
be set to the registers, and exactly what I will get back when reading
versus passing
in a float that's needs to be conveted as a 'best-fit' scenario in 0.125=C2=
=B0C
steps?

> +     * The auto-increment logic is only taken into account in this drive=
r
> > +     * for the LSM303DLHC_MAG_REG_OUT_X_H and
> LSM303DLHC_MAG_REG_TEMP_OUT_H
> > +     * registers, which are the two common uses cases for it. Accessin=
g
> either
> > +     * of these registers will also populate the rest of the related
> dataset.
>
> How hard would it be to implement the behaviour correctly for all cases?
> I find it's usually better to model something correctly from the start:
> usually the person writing the code knows the h/w behaviour better than
> anybody else coming along later trying to figure out why some other
> guest code doesn't work on the model...
>

I can update this to also take auto-increment into account when you don't
start at
the first record (X-axis), yes, even if that is an uncommon scenario.

> +    s->mr =3D 0x1;            /* Operating Mode =3D Single conversion. *=
/
> > +    s->x =3D 0;
> > +    s->z =3D 0;
> > +    s->y =3D 0;
> > +    s->sr =3D 0x1;            /* DRDY =3D 1. */
>
> Do you understand how the DRDY and LOCK bits work ? The datasheet
> is unclear. Also, what's the difference between "single-conversion"
> and "continuous-conversion" modes ?
>

DRDY indicates that a set of XYZ samples is available in the data registers=
,
presumably post reset or when switching modes, and how LOCK works is that
once I read the first byte of the X register, the current sample will be
locked
until it has been fully read to prevent the values from being changed
mid-read
with a high sample rate. LOCK simply indicates this status of the registers
being
read-only until we get to the end of ou 6 byte sample.

Some details are unclear, however, such as what happens if I don't read
all six bytes, and go back to request the first X byte again? I'll need to
hook a
real sensor up to see what happens in those cases.

Single-conversion mode is documented in earlier variations of this chip
family, but
it is used for device calibration. From the LSM303DLH (not 'C' at the end):

"By placing the mode register into single-conversion mode (0x01), two data
acquisition  cycles are made on each magnetic vector. The first acquisition
is a set pulse followed shortly by measurement data of the external field.
The second acquisition has the offset strap excited in the positive bias
mode
to create about  a 0.6 gauss self-test field plus the external field. The
first
acquisition values are subtracted  from the second acquisition, and the net
measurement is placed into the data output  registers."

Given the lack of details in the LSM303DLHC datasheet, however, only
continuous mode should likely be modeled, and the way QEMU works
to model sensors makes this a moot point anyway since the output
registers are only updated when an end-user changes the values manually.
If specific values are expected by the data consumer, such as calibration
data
from single-conversion mode, those values can be set by the user regardless
of the current operating mode.


> > +    s->ira =3D 0x48;
> > +    s->irb =3D 0x34;
> > +    s->irc =3D 0x33;
> > +    s->temperature =3D 0;     /* Default to 0 degrees C (0/8 lsb =3D 0=
 C).
> */
> > +}
> > +
> > +/**
> > + * @brief Callback handler when DeviceState 'reset' is set to true.
> > + */
> > +static void lsm303dlhc_mag_reset(DeviceState *dev)
> > +{
> > +    I2CSlave *i2c =3D I2C_SLAVE(dev);
> > +    LSM303DLHC_Mag_State *s =3D LSM303DLHC_MAG(i2c);
> > +
> > +       /* Set the device into is default reset state. */
> > +       lsm303dlhc_mag_default_cfg(&s->parent_obj);
>
> Misindentation.
>
> Also, don't use the parent_obj field;
> always use the QOM cast macro when you need the pointer
> to something as a different type. In this case you already
> have the I2CSlave*, in 'i2c'. But better would be to make
> lsm303dlhc_mag_default_cfg() take a LSM303DLHC_Mag_State*
> directly rather than taking an I2CSlave* and casting it
> internally.
>

Do you have an example, just to be sure I follow? I've changed the code
as follows:

static void lsm303dlhc_mag_reset(DeviceState *dev)
{
    I2CSlave *i2c =3D I2C_SLAVE(dev);
    LSM303DLHCMagState *s =3D LSM303DLHC_MAG(i2c);

    /* Set the device into its default reset state. */
    lsm303dlhc_mag_default_cfg(s);
}

static void lsm303dlhc_mag_default_cfg(LSM303DLHCMagState *s)

Is this sufficient?

> +static void lsm303dlhc_mag_initfn(Object *obj)
> > +{
> > +    object_property_add(obj, LSM303DLHC_MSG_PROP_MAGX, "int",
> > +                lsm303dlhc_mag_get_xyz,
> > +                lsm303dlhc_mag_set_xyz, NULL, NULL);
> > +
> > +    object_property_add(obj, LSM303DLHC_MSG_PROP_MAGY, "int",
> > +                lsm303dlhc_mag_get_xyz,
> > +                lsm303dlhc_mag_set_xyz, NULL, NULL);
> > +
> > +    object_property_add(obj, LSM303DLHC_MSG_PROP_MAGZ, "int",
> > +                lsm303dlhc_mag_get_xyz,
> > +                lsm303dlhc_mag_set_xyz, NULL, NULL);
>
> What units are these in? It looks like your implementation just
> uses the property values as the raw -2048..+2048 value that the
> X/Y/Z registers read as. Would it be better for the properties to
> set the value in Gauss, and then the model to honour the
> gain settings in CRB_REG_M.GN{0,1,2} ?  That way guest code that
> adjusts the gain will get the results it is expecting.
>

I guess I found raw units that the sensor uses more intuitive personally,
with no room for unexpected translations and not having to deal with floats=
,
but if you feel gauss or degrees C is better, I can change these.

In that case, should I accept floating point inputs, however, or stick to
integers?
When dealing with magnetometers the values can be very small, so it's not
the
same as a temp sensor where we can provide 2300 for 23.00C.


> > +
> > +    object_property_add(obj, LSM303DLHC_MSG_PROP_TEMP, "int",
> > +                lsm303dlhc_mag_get_temperature,
> > +                lsm303dlhc_mag_set_temperature, NULL, NULL);
>
> What units is this in?
>

LSB where 1 LSB =3D 0.125 C, documented elsewhere, but as per the above
I can change this to degrees if you can clarify if this should be in float
or something
integere based with a specific scale factor.

Thanks for the feedback, and sorry again for the slow reply.

-- Kevin

--00000000000003d14a05cc6d647d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Peter,</div><div><br></div><div>T=
hanks for the review, and sorry for the slow reply, just getting back from =
holidays myself.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Thu, 26 Aug 2021 at 17:39, Peter Maydell &lt;<=
a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
So if I&#39;m reading the datasheet correctly, the LM303DLHC is<br>
really two completely distinct i2c devices in a single<br>
package with different slave addresses; this QEMU device<br>
implements only the magnetometer i2c device, and if we wanted<br>
to add the accelerometer device we&#39;d implement that as a<br>
second separate QEMU i2c device ?<br></blockquote><div><br></div><div>This =
is correct. There are two distinct dies in the chip with separate I2C addre=
sses, etc.,</div><div>and this should probably be modelled separately. I ch=
ose the magnetometer since it&#39;s</div><div>a far simpler device to model=
 than the accelrometer, but still solves the need for a</div><div>more comp=
lex I2C sensor that can be used in testing with the I2C bus.<br></div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; +=C2=A0 =
=C2=A0 if (value &gt; 2047 || value &lt; -2048) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;value %d lsb is ou=
t of range&quot;, value);<br>
<br>
Why &quot;lsb&quot; ?<br>
<br></blockquote><div><br></div><div>In my head, using LSB seemed more prec=
ise since I know exactly what value will</div><div>be set to the registers,=
 and exactly what I will get back when reading versus passing</div><div>in =
a float that&#39;s needs to be conveted as a &#39;best-fit&#39; scenario in=
 0.125=C2=B0C steps?</div><div><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0* The auto-increment logic is only taken into acc=
ount in this driver<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* for the LSM303DLHC_MAG_REG_OUT_X_H and LSM303DL=
HC_MAG_REG_TEMP_OUT_H<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* registers, which are the two common uses cases =
for it. Accessing either<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* of these registers will also populate the rest =
of the related dataset.<br>
<br>
How hard would it be to implement the behaviour correctly for all cases?<br=
>
I find it&#39;s usually better to model something correctly from the start:=
<br>
usually the person writing the code knows the h/w behaviour better than<br>
anybody else coming along later trying to figure out why some other<br>
guest code doesn&#39;t work on the model...<br></blockquote><div><br></div>=
<div>I can update this to also take auto-increment into account when you do=
n&#39;t start at</div><div>the first record (X-axis), yes, even if that is =
an uncommon scenario.<br></div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">&gt; +=C2=A0 =C2=A0 s-&gt;mr =3D 0x1;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* Operating Mode =3D Single conversion. */<br>
&gt; +=C2=A0 =C2=A0 s-&gt;x =3D 0;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;z =3D 0;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;y =3D 0;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;sr =3D 0x1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* DRDY =3D 1. */<br>
<br>
Do you understand how the DRDY and LOCK bits work ? The datasheet<br>
is unclear. Also, what&#39;s the difference between &quot;single-conversion=
&quot;<br>
and &quot;continuous-conversion&quot; modes ?<br></blockquote><div><br></di=
v><div>DRDY indicates that a set of XYZ samples is available in the data re=
gisters,</div><div>presumably post reset or when switching modes, and how L=
OCK works is that</div><div>once I read the first byte of the X register, t=
he current sample will be locked</div><div>until it has been fully read to =
prevent the values from being changed mid-read</div><div>with a high sample=
 rate. LOCK simply indicates this status of the registers being</div><div>r=
ead-only until we get to the end of ou 6 byte sample.<br></div><div><br></d=
iv><div>Some details are unclear, however, such as what happens if I don&#3=
9;t read</div><div>all six bytes, and go back to request the first X byte a=
gain? I&#39;ll need to hook a</div><div>real sensor up to see what happens =
in those cases.</div><div><br></div><div>Single-conversion mode is document=
ed in earlier variations of this chip family, but</div><div>it is used for =
device calibration. From the LSM303DLH (not &#39;C&#39; at the end):</div><=
div><br></div><div>&quot;By placing the mode register into single-conversio=
n mode (0x01), two data</div><div>acquisition=C2=A0 cycles are made on each=
 magnetic vector. The first acquisition</div><div>is a set pulse followed s=
hortly by measurement data of the external field.</div><div>The second acqu=
isition has the offset strap excited in the positive bias mode</div><div>to=
 create about=C2=A0 a 0.6 gauss self-test field plus the external field. Th=
e first</div><div>acquisition values are subtracted=C2=A0 from the second a=
cquisition, and the net</div><div>measurement is placed into the data outpu=
t=C2=A0 registers.&quot;</div><div><br> </div><div>Given the lack of detail=
s in the LSM303DLHC datasheet, however, only</div><div>continuous mode shou=
ld likely be modeled, and the way QEMU works</div><div>to model sensors mak=
es this a moot point anyway since the output</div><div>registers are only u=
pdated when an end-user changes the values manually.</div><div>If specific =
values are expected by the data consumer, such as calibration data</div><di=
v>from single-conversion mode, those values can be set by the user regardle=
ss</div><div>of the current operating mode.<br></div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 s-&gt;ira =3D 0x48;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;irb =3D 0x34;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;irc =3D 0x33;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;temperature =3D 0;=C2=A0 =C2=A0 =C2=A0/* Default =
to 0 degrees C (0/8 lsb =3D 0 C). */<br>
&gt; +}<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * @brief Callback handler when DeviceState &#39;reset&#39; is set to=
 true.<br>
&gt; + */<br>
&gt; +static void lsm303dlhc_mag_reset(DeviceState *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 I2CSlave *i2c =3D I2C_SLAVE(dev);<br>
&gt; +=C2=A0 =C2=A0 LSM303DLHC_Mag_State *s =3D LSM303DLHC_MAG(i2c);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set the device into is default reset st=
ate. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0lsm303dlhc_mag_default_cfg(&amp;s-&gt;pare=
nt_obj);<br>
<br>
Misindentation.<br>
<br>
Also, don&#39;t use the parent_obj field;<br>
always use the QOM cast macro when you need the pointer<br>
to something as a different type. In this case you already<br>
have the I2CSlave*, in &#39;i2c&#39;. But better would be to make<br>
lsm303dlhc_mag_default_cfg() take a LSM303DLHC_Mag_State*<br>
directly rather than taking an I2CSlave* and casting it<br>
internally.<br></blockquote><div><br></div><div>Do you have an example, jus=
t to be sure I follow? I&#39;ve changed the code</div><div>as follows:</div=
><div><br></div><div>static void lsm303dlhc_mag_reset(DeviceState *dev)<br>=
{<br>=C2=A0 =C2=A0 I2CSlave *i2c =3D I2C_SLAVE(dev);<br>=C2=A0 =C2=A0 LSM30=
3DLHCMagState *s =3D LSM303DLHC_MAG(i2c);<br><br>=C2=A0 =C2=A0 /* Set the d=
evice into its default reset state. */<br>=C2=A0 =C2=A0 lsm303dlhc_mag_defa=
ult_cfg(s);<br>}</div><div><br></div><div>static void lsm303dlhc_mag_defaul=
t_cfg(LSM303DLHCMagState *s)</div><div><br></div><div>Is this sufficient?</=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +static void lsm303dlhc_mag_initfn(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 object_property_add(obj, LSM303DLHC_MSG_PROP_MAGX, &quo=
t;int&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lsm303dlhc_ma=
g_get_xyz,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lsm303dlhc_ma=
g_set_xyz, NULL, NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 object_property_add(obj, LSM303DLHC_MSG_PROP_MAGY, &quo=
t;int&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lsm303dlhc_ma=
g_get_xyz,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lsm303dlhc_ma=
g_set_xyz, NULL, NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 object_property_add(obj, LSM303DLHC_MSG_PROP_MAGZ, &quo=
t;int&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lsm303dlhc_ma=
g_get_xyz,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lsm303dlhc_ma=
g_set_xyz, NULL, NULL);<br>
<br>
What units are these in? It looks like your implementation just<br>
uses the property values as the raw -2048..+2048 value that the<br>
X/Y/Z registers read as. Would it be better for the properties to<br>
set the value in Gauss, and then the model to honour the<br>
gain settings in <a href=3D"http://CRB_REG_M.GN" rel=3D"noreferrer" target=
=3D"_blank">CRB_REG_M.GN</a>{0,1,2} ?=C2=A0 That way guest code that<br>
adjusts the gain will get the results it is expecting.<br></blockquote><div=
><br></div><div>I guess I found raw units that the sensor uses more intuiti=
ve personally,</div><div>with no room for unexpected translations and not h=
aving to deal with floats,</div><div>but if you feel gauss or degrees C is =
better, I can change these.</div><div><br></div><div>In that case, should I=
 accept floating point inputs, however, or stick to integers?</div><div>Whe=
n dealing with magnetometers the values can be very small, so it&#39;s not =
the</div><div>same as a temp sensor where we can provide 2300 for 23.00C.<b=
r></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 object_property_add(obj, LSM303DLHC_MSG_PROP_TEMP, &quo=
t;int&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lsm303dlhc_ma=
g_get_temperature,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lsm303dlhc_ma=
g_set_temperature, NULL, NULL);<br>
<br>
What units is this in?<br></blockquote><div><br></div><div>LSB where 1 LSB =
=3D 0.125 C, documented elsewhere, but as per the above</div><div>I can cha=
nge this to degrees if you can clarify if this should be in float or someth=
ing</div><div>integere based with a specific scale factor.</div></div><div =
class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Thanks for the f=
eedback, and sorry again for the slow reply.</div><div class=3D"gmail_quote=
"><br></div><div class=3D"gmail_quote">-- Kevin<br></div></div>

--00000000000003d14a05cc6d647d--

