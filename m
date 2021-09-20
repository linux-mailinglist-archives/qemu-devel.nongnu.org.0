Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD9A411778
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:49:56 +0200 (CEST)
Received: from localhost ([::1]:57904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKcF-0007B0-PH
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.townsend@linaro.org>)
 id 1mSKBw-0004q7-QF
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:22:45 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin.townsend@linaro.org>)
 id 1mSKBs-0002jk-UY
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:22:43 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t8so30226658wrq.4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hiCndy3Io2MOKdbSF+onM9fH4FCuLWs14HffyfBmEb4=;
 b=wTsO6jRYZaAWg9xl2pGQTXTwLTJWHDcUGAGAcVvyZVfg4M/Kkf4TJbJv9Q6NBZj+JS
 lcoNqnfDcZ8CBumps0xY0rDcQWoCD2wGpbvKtWKI+WicXpc1EaTCAVMauYF7It9iHOvy
 DLVpB+PTYhOlJib+Tqoy6O8oe3riA0d5HRqyjp/zASORc3in7l5JK+W5Lgm1LN5f93eI
 tBBpumLfd2ZMavKBYRYzeFJyNJajivCpnVjo6OJMC/ZnB9B+/KYv4KIaMc7+1p5+Rs7k
 +UWfeSSWz2rb4OymYrZpd1tf6n7hAhI1FfxEEY4Fpxh1L60P8xa36+FJyP3RVPLOiZ6r
 1WPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hiCndy3Io2MOKdbSF+onM9fH4FCuLWs14HffyfBmEb4=;
 b=Ecvxb5gIc7+wNrsycEG7SqQriOMkoxCAwbb4dUAuClRJ+drilbwRzSW3GaZGRg1voY
 2fjUGBhMO8bbg11nhhA3Ve/SAml5lB1VGXQqxPthInzzfTM5FxlkdywNqEypBPxJH9Jt
 6qUKa2rUXAks04ZWHxEaCwqOowIlJ082sl6Uctdy0XPbdhhpoF47bz64U6JFFg+dM9Fw
 r0S0s9oNC2zajFrCvf4AYogxR6GP/JpTGW2Bvii4/M1ic/Oy4DXfXeBFYnT0AzjTclfm
 XjVUu5nqRuD8YO0LtPSyhQ2RdhKvNwuntshlyjyVB5aA6OZL4F8qxh8f27wETuVMqWw7
 3mXQ==
X-Gm-Message-State: AOAM531zcFUb5Mxj57b0BpLx9k452VGp5FJgVjdrjhFohgLZx00VVV/1
 kMvGiaZf6OHuiVtpG/ZGq/KsUTxLY7Kk4/5gYe0JBw==
X-Google-Smtp-Source: ABdhPJyCO8lr1eQzahO7ENB57HBwNPi6bd0CTFfjJtPB6bPtOcOqtT3/Rg5WBUFWO2rJ8CcQjxrVTRqylVEbkN53/oI=
X-Received: by 2002:a1c:a94a:: with SMTP id s71mr29238312wme.32.1632147759391; 
 Mon, 20 Sep 2021 07:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210815162738.75461-1-kevin.townsend@linaro.org>
 <20210815162738.75461-2-kevin.townsend@linaro.org>
 <CAFEAcA8L7N0m1XRzRnyLt8QUOdrX436-2Xa9a04oYGOd6E0agw@mail.gmail.com>
 <CAFPHj6PJZdLXRiYXfz-zwgCaUwvTB8sbUsXcNL=aweqXR2hxQA@mail.gmail.com>
 <CAFEAcA_T4i9HL45h_AXfir+5U6ab8YFd7Sb2_6mGMtQuKh5UXg@mail.gmail.com>
In-Reply-To: <CAFEAcA_T4i9HL45h_AXfir+5U6ab8YFd7Sb2_6mGMtQuKh5UXg@mail.gmail.com>
From: Kevin Townsend <kevin.townsend@linaro.org>
Date: Mon, 20 Sep 2021 16:22:28 +0200
Message-ID: <CAFPHj6OWBhBg_SfXQ0MbjJ-Lfg3-=6=sLeY9zTaVU=LAMdSmBA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/sensor: Add lsm303dlhc magnetometer device
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006b754705cc6e03c6"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=kevin.townsend@linaro.org; helo=mail-wr1-x42e.google.com
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

--0000000000006b754705cc6e03c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 20 Sept 2021 at 15:52, Peter Maydell <peter.maydell@linaro.org>
wrote:

> >> Why "lsb" ?
> >>
> >
> > In my head, using LSB seemed more precise since I know exactly what
> value will
> > be set to the registers, and exactly what I will get back when reading
> versus passing
> > in a float that's needs to be conveted as a 'best-fit' scenario in
> 0.125=C2=B0C steps?
>
> My question was really, "what does 'lsb' mean here"?  I would usually
> assume "least significant bit", but that makes no sense in this context.
>
> Ha, sorry. Least significant bit, yes. It gets used in sensor and IC
datasheets all
the time and basically means '1 bit', so if the DS says 0.125=C2=B0C per LS=
B it
means
that value for 1 bit, or to multiply the integer by the 1 LSB value.

Conversion factors from raw units to standard SI units are almost always
indicated this way, though, such as 'LSB/Gauss', etc.

Well, given that the device specifically changes the value it
> shows the guest based on guest-programmable gain settings,
> it does seem to me to be more natural to specify the values
> in some way that represents the "real world data" that the
> sensor is measuring. Ideally we would then if/when we add more
> magnetometer implementations have them all use the same units,
> for consistency. This is the first magnetometer we have, so this
> is where we get to pick the convention.
>

Sounds reasonable.

We have two options here:

- Gauss (standard SI unit)
- micro Tesla (0.01 Gauss)

They've both widely used; but I think uT might be slightly more common.


> > In that case, should I accept floating point inputs, however, or stick
> to integers?
> > When dealing with magnetometers the values can be very small, so it's
> not the
> > same as a temp sensor where we can provide 2300 for 23.00C.
>
> What sort of range and precision requirements are we talking about
> here? If we can avoid having to use float that would be nice...
>
> Well, taking the LSM303DLHC as an example, we have 1100 LSB per Gauss
at a range of +/- 1.3 Gauss, so 1 bit is: 0.0009090909091 Gauss.

If we use micro Tesla (uT) we get 11 LSB per uT so the smallest value is
0.09090909091 uT ... which we could represent with something like
1000 =3D 1.000 uT

That gives us +/- 1.3 G =3D +/- 130 uT =3D +/- 130,000, for example.

This would require a 32-bit integer, though, to take into account the full
range of +/-8.1 G (+/- 810 uT) =3D +/- 810,000.

There are devices with a much wider range, like the MLX90393, which can
measure up to +/- 50 mT (50,000 uT), so +/-50,000,000.

That's the largest range I'm aware of personally, with +/- 1-8G (or 100-800
uT)
the most common.

>>
> >> > +
> >> > +    object_property_add(obj, LSM303DLHC_MSG_PROP_TEMP, "int",
> >> > +                lsm303dlhc_mag_get_temperature,
> >> > +                lsm303dlhc_mag_set_temperature, NULL, NULL);
> >>
> >> What units is this in?
> >
> >
> > LSB where 1 LSB =3D 0.125 C, documented elsewhere, but as per the above
> > I can change this to degrees if you can clarify if this should be in
> float or something
> > integere based with a specific scale factor.
>
> Our existing temperature sensors use integer properties whose
> value is "temperature in degrees C, units of 0.001 C".
> Consistency with that would be best. (We should write these
> conventions down somewhere. Not sure where...)
>

That's similar to what I propose above, based on chosing micro Tesla as the
base unit, and not Gauss, so units of 0.001 uT.

Kevin

--0000000000006b754705cc6e03c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 20 Sept 2021 at 15:52, Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">&gt;&gt; Why &quot;lsb&quot; ?<br>
&gt;&gt;<br>
&gt;<br>
&gt; In my head, using LSB seemed more precise since I know exactly what va=
lue will<br>
&gt; be set to the registers, and exactly what I will get back when reading=
 versus passing<br>
&gt; in a float that&#39;s needs to be conveted as a &#39;best-fit&#39; sce=
nario in 0.125=C2=B0C steps?<br>
<br>
My question was really, &quot;what does &#39;lsb&#39; mean here&quot;?=C2=
=A0 I would usually<br>
assume &quot;least significant bit&quot;, but that makes no sense in this c=
ontext.<br>
<br></blockquote><div>Ha, sorry. Least significant bit, yes. It gets used i=
n sensor and IC datasheets all</div><div>the time and basically means &#39;=
1 bit&#39;, so if the DS says 0.125=C2=B0C per LSB it means</div><div>that =
value for 1 bit, or to multiply the integer by the 1 LSB value.</div><div><=
br></div><div>Conversion factors from raw units to standard SI units are al=
most always</div><div>indicated this way, though, such as &#39;LSB/Gauss&#3=
9;, etc.<br></div><br><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Well, given that the device specifically changes the value it<br>
shows the guest based on guest-programmable gain settings,<br>
it does seem to me to be more natural to specify the values<br>
in some way that represents the &quot;real world data&quot; that the<br>
sensor is measuring. Ideally we would then if/when we add more<br>
magnetometer implementations have them all use the same units,<br>
for consistency. This is the first magnetometer we have, so this<br>
is where we get to pick the convention.<br></blockquote><div><br></div><div=
>Sounds reasonable.</div><div><br></div><div>We have two options here:</div=
><div><br></div><div>- Gauss (standard SI unit)<br></div><div>- micro Tesla=
 (0.01 Gauss)<br></div><div><br></div><div>They&#39;ve both widely used; bu=
t I think uT might be slightly more common.<br></div><div> <br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; In that case, should I accept floating point inputs, however, or stick=
 to integers?<br>
&gt; When dealing with magnetometers the values can be very small, so it&#3=
9;s not the<br>
&gt; same as a temp sensor where we can provide 2300 for 23.00C.<br>
<br>
What sort of range and precision requirements are we talking about<br>
here? If we can avoid having to use float that would be nice...<br>
<br></blockquote><div>Well, taking the LSM303DLHC as an example, we have 11=
00 LSB per Gauss</div><div>at a range of +/- 1.3 Gauss, so 1 bit is: 0.0009=
090909091 Gauss.<br></div><div><br></div><div>If we use micro Tesla (uT) we=
 get 11 LSB per uT so the smallest value is</div><div>0.09090909091 uT ... =
which we could represent with something like</div><div>1000 =3D 1.000 uT</d=
iv><div><br></div><div>That gives us +/- 1.3 G =3D +/- 130 uT =3D +/- 130,0=
00, for example.<br></div><div><br></div><div>This would require a 32-bit i=
nteger, though, to take into account the full</div><div>range of +/-8.1 G (=
+/- 810 uT) =3D +/- 810,000.<br></div><div>=C2=A0<br></div><div>There are d=
evices with a much wider range, like the MLX90393, which can</div><div>meas=
ure up to +/- 50 mT (50,000 uT), so +/-50,000,000.</div><div><br></div><div=
>That&#39;s the largest range I&#39;m aware of personally, with +/- 1-8G (o=
r 100-800 uT)</div><div>the most common.</div><div><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
&gt;&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 object_property_add(obj, LSM303DLHC_MSG_PROP_T=
EMP, &quot;int&quot;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lsm3=
03dlhc_mag_get_temperature,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lsm3=
03dlhc_mag_set_temperature, NULL, NULL);<br>
&gt;&gt;<br>
&gt;&gt; What units is this in?<br>
&gt;<br>
&gt;<br>
&gt; LSB where 1 LSB =3D 0.125 C, documented elsewhere, but as per the abov=
e<br>
&gt; I can change this to degrees if you can clarify if this should be in f=
loat or something<br>
&gt; integere based with a specific scale factor.<br>
<br>
Our existing temperature sensors use integer properties whose<br>
value is &quot;temperature in degrees C, units of 0.001 C&quot;.<br>
Consistency with that would be best. (We should write these<br>
conventions down somewhere. Not sure where...)<br></blockquote><div><br></d=
iv><div>That&#39;s similar to what I propose above, based on chosing micro =
Tesla as the</div><div>base unit, and not Gauss, so units of 0.001 uT.<br><=
/div><div><br></div><div>Kevin<br>
</div></div></div>

--0000000000006b754705cc6e03c6--

