Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E6041161C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 15:54:15 +0200 (CEST)
Received: from localhost ([::1]:46540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSJkL-0007Wd-Uj
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 09:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSJj0-0006B2-Dx
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:52:50 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSJiw-00086N-LJ
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:52:50 -0400
Received: by mail-wr1-x434.google.com with SMTP id q26so29917199wrc.7
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 06:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZnXPIm25okUAcwe7KV2dTLuUG2hlJAzwBp/vSzV9XyM=;
 b=iPPQay94geKKr13/Wtya1YFNGfbliX2M/o+YpKlMhBV1T3zIZ+phfkFOHmNQuoZ6hx
 0YiW9d6Iz89/UozpI1OfmDAfey+nk8Fme3ghxAtzpp2QH8D4f7D32GCp//084Z7TAihZ
 7LGvK5LlFsaZb6ebK6xgNTJYVO6fhC1gf4P/RnOdVWlfLOZnlFkrwWCBMjwsX0a3g4bt
 eHnfWKMc6OC4CTyznCQTS04A0oDTF5DgFPYdJ2U9lHCd1A1ApZD+FI8RrOvFUfgsFvdX
 t9mhu/3b+t0/ebItqx8nwIU5yaz6dK6x7ZMUEndjAohD6fOqVGeHs3cwUdAB+fcmfBvK
 QY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZnXPIm25okUAcwe7KV2dTLuUG2hlJAzwBp/vSzV9XyM=;
 b=O5pyd/rbxAw/cUwiPOKm4S1G5aV9Nad9zqPzlsn1PEmfEJAzTmWXcvHa9b7trQUlM8
 mxRIdn09nBr2d+ESICUCFPhzJ6jxKtAaDUVAa68ppi/q1X77TjmPVDzpY5oTDkn9UC7P
 HSeo3jVVLHxbRjM7/+4mA106E7E7MGtg/5am2nyPRitFlXkF2DFX38yC3auVKoPtHzNX
 uBaZCQWFcz/kcJ+Hn+TJK1vXmtZQRavVcSF+DELBopR+0QfMsQJpATURG4ngErIYeXu/
 gyDX8oLAm/8B3DQNkqGzjmDMJQmZ1pcGGb+vjRwtrJvArx6doJHPaqEiQjLiZiMILcUR
 MxVw==
X-Gm-Message-State: AOAM532U4X2zy6isBLQcNspzyDN/u6ll/JKPHkpJvwzAVsqiwqJveGoA
 vkLFmnZZawHHKROO0ShTCWn02GpO9SY6XuijPC9p0g==
X-Google-Smtp-Source: ABdhPJyXz/oSxj/nG08VaS9/lt8O+r8jfpbL/G+sebLHs91/afX/kuTPRw9nyb6w5JieqrwYDiUTpVqCEfaP5T1V2BQ=
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr29590353wmo.21.1632145964049; 
 Mon, 20 Sep 2021 06:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210815162738.75461-1-kevin.townsend@linaro.org>
 <20210815162738.75461-2-kevin.townsend@linaro.org>
 <CAFEAcA8L7N0m1XRzRnyLt8QUOdrX436-2Xa9a04oYGOd6E0agw@mail.gmail.com>
 <CAFPHj6PJZdLXRiYXfz-zwgCaUwvTB8sbUsXcNL=aweqXR2hxQA@mail.gmail.com>
In-Reply-To: <CAFPHj6PJZdLXRiYXfz-zwgCaUwvTB8sbUsXcNL=aweqXR2hxQA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Sep 2021 14:51:51 +0100
Message-ID: <CAFEAcA_T4i9HL45h_AXfir+5U6ab8YFd7Sb2_6mGMtQuKh5UXg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/sensor: Add lsm303dlhc magnetometer device
To: Kevin Townsend <kevin.townsend@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 20 Sept 2021 at 14:38, Kevin Townsend <kevin.townsend@linaro.org> w=
rote:
>
> Hi Peter,
>
> Thanks for the review, and sorry for the slow reply, just getting back fr=
om holidays myself.
>
> On Thu, 26 Aug 2021 at 17:39, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>>
>>
>> So if I'm reading the datasheet correctly, the LM303DLHC is
>> really two completely distinct i2c devices in a single
>> package with different slave addresses; this QEMU device
>> implements only the magnetometer i2c device, and if we wanted
>> to add the accelerometer device we'd implement that as a
>> second separate QEMU i2c device ?
>
>
> This is correct. There are two distinct dies in the chip with separate I2=
C addresses, etc.,
> and this should probably be modelled separately. I chose the magnetometer=
 since it's
> a far simpler device to model than the accelrometer, but still solves the=
 need for a
> more complex I2C sensor that can be used in testing with the I2C bus.
>
>> > +    if (value > 2047 || value < -2048) {
>> > +        error_setg(errp, "value %d lsb is out of range", value);
>>
>> Why "lsb" ?
>>
>
> In my head, using LSB seemed more precise since I know exactly what value=
 will
> be set to the registers, and exactly what I will get back when reading ve=
rsus passing
> in a float that's needs to be conveted as a 'best-fit' scenario in 0.125=
=C2=B0C steps?

My question was really, "what does 'lsb' mean here"?  I would usually
assume "least significant bit", but that makes no sense in this context.


>> > +
>> > +/**
>> > + * @brief Callback handler when DeviceState 'reset' is set to true.
>> > + */
>> > +static void lsm303dlhc_mag_reset(DeviceState *dev)
>> > +{
>> > +    I2CSlave *i2c =3D I2C_SLAVE(dev);
>> > +    LSM303DLHC_Mag_State *s =3D LSM303DLHC_MAG(i2c);
>> > +
>> > +       /* Set the device into is default reset state. */
>> > +       lsm303dlhc_mag_default_cfg(&s->parent_obj);
>>
>> Misindentation.
>>
>> Also, don't use the parent_obj field;
>> always use the QOM cast macro when you need the pointer
>> to something as a different type. In this case you already
>> have the I2CSlave*, in 'i2c'. But better would be to make
>> lsm303dlhc_mag_default_cfg() take a LSM303DLHC_Mag_State*
>> directly rather than taking an I2CSlave* and casting it
>> internally.
>
>
> Do you have an example, just to be sure I follow? I've changed the code
> as follows:
>
> static void lsm303dlhc_mag_reset(DeviceState *dev)
> {
>     I2CSlave *i2c =3D I2C_SLAVE(dev);
>     LSM303DLHCMagState *s =3D LSM303DLHC_MAG(i2c);
>
>     /* Set the device into its default reset state. */
>     lsm303dlhc_mag_default_cfg(s);
> }
>
> static void lsm303dlhc_mag_default_cfg(LSM303DLHCMagState *s)
>
> Is this sufficient?

Yes, that's right.

>> > +static void lsm303dlhc_mag_initfn(Object *obj)
>> > +{
>> > +    object_property_add(obj, LSM303DLHC_MSG_PROP_MAGX, "int",
>> > +                lsm303dlhc_mag_get_xyz,
>> > +                lsm303dlhc_mag_set_xyz, NULL, NULL);
>> > +
>> > +    object_property_add(obj, LSM303DLHC_MSG_PROP_MAGY, "int",
>> > +                lsm303dlhc_mag_get_xyz,
>> > +                lsm303dlhc_mag_set_xyz, NULL, NULL);
>> > +
>> > +    object_property_add(obj, LSM303DLHC_MSG_PROP_MAGZ, "int",
>> > +                lsm303dlhc_mag_get_xyz,
>> > +                lsm303dlhc_mag_set_xyz, NULL, NULL);
>>
>> What units are these in? It looks like your implementation just
>> uses the property values as the raw -2048..+2048 value that the
>> X/Y/Z registers read as. Would it be better for the properties to
>> set the value in Gauss, and then the model to honour the
>> gain settings in CRB_REG_M.GN{0,1,2} ?  That way guest code that
>> adjusts the gain will get the results it is expecting.
>
>
> I guess I found raw units that the sensor uses more intuitive personally,
> with no room for unexpected translations and not having to deal with floa=
ts,
> but if you feel gauss or degrees C is better, I can change these.

Well, given that the device specifically changes the value it
shows the guest based on guest-programmable gain settings,
it does seem to me to be more natural to specify the values
in some way that represents the "real world data" that the
sensor is measuring. Ideally we would then if/when we add more
magnetometer implementations have them all use the same units,
for consistency. This is the first magnetometer we have, so this
is where we get to pick the convention.

> In that case, should I accept floating point inputs, however, or stick to=
 integers?
> When dealing with magnetometers the values can be very small, so it's not=
 the
> same as a temp sensor where we can provide 2300 for 23.00C.

What sort of range and precision requirements are we talking about
here? If we can avoid having to use float that would be nice...

>>
>> > +
>> > +    object_property_add(obj, LSM303DLHC_MSG_PROP_TEMP, "int",
>> > +                lsm303dlhc_mag_get_temperature,
>> > +                lsm303dlhc_mag_set_temperature, NULL, NULL);
>>
>> What units is this in?
>
>
> LSB where 1 LSB =3D 0.125 C, documented elsewhere, but as per the above
> I can change this to degrees if you can clarify if this should be in floa=
t or something
> integere based with a specific scale factor.

Our existing temperature sensors use integer properties whose
value is "temperature in degrees C, units of 0.001 C".
Consistency with that would be best. (We should write these
conventions down somewhere. Not sure where...)

thanks
-- PMM

