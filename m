Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F03541185A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 17:36:54 +0200 (CEST)
Received: from localhost ([::1]:37554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSLLh-0002gm-Cr
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 11:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSL0L-000504-6d
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 11:14:49 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSL0I-0004Av-AE
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 11:14:48 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d21so30659002wra.12
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 08:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J+GxH469dUqYyB1X+5EiJN4LLGaf+y9vspudMPv9Vck=;
 b=vi1t41EqCxVt5kt8GGF2ScXdB9FqAegXUw0sFgudfD+LZGczeQgu1SRX6WlcHv8QmT
 RiehnVNSfxO1VpV94FkiEts726dxhP5XX+RG2tPYngNy2GkX1HJgK0OsVhkVEbXAfftR
 CkPyyRbdrPVY6yggMnYbcKdLR/AGi8pzRtYeZS4JO29RMyvfQ7eRJ8CPGKWYSgDWYVA4
 eUx2msyFW75f4099Qx6wuhzojCmTLkMrEnO46hY9/Nx9pzFlefd14hgzGtxYhjE6tqR5
 TTEYkLqjm2Htmqk3mz25W653jjSwaJUQsRHzYTjLyS5Fqy3CtKEed8LZpT5WpiMcEGF6
 fAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J+GxH469dUqYyB1X+5EiJN4LLGaf+y9vspudMPv9Vck=;
 b=Z6jeF7Uc8+jwbqN5m6Bmta+rUo7kzYxWmUIIh6HiniY2BSLbju4/mW+MJ+C1hj5uOS
 XPGEcXmKhq65VpapkmYqELGGcN+BOubvRQtWmA4gzX3taprYRerAK79DhfPXe/bSDFCr
 40Dp9Uv2z/qdJsi9bLsk7VyuG0ezFaICkNgMHfFU1yJ6IqoIMXKyKSzRGq9maG1wNpMA
 eDqoEQTCE4Anbihjds9g3jugY/engKYIxO8eiQApozkNxDEoUZwkHJ4hUSodof4unvPU
 Y9DpNqhca4RWWgWoTqE9M5iubXGeTJs70vGW5ZiCCIk1SclokE/f8+qCASgikC5P3xDz
 5WAQ==
X-Gm-Message-State: AOAM531jljpvAwHAtw4AHC7sQ/1/7JdT7UukcC+lZXLxhLO7N9x+Ztj9
 3eDZN70yE/Hf0BTLs8iV4dGyHOFt790AXy54jsFU4w==
X-Google-Smtp-Source: ABdhPJyV177Y+GkJ+FNymVYf9cq4Cx4JxwXG+6bs0ObgPuoeyGg+Ni9P9CFxi1qvi5/IFo1IHNqoLSK1y5qxDejZjTQ=
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr2699109wrw.376.1632150883422; 
 Mon, 20 Sep 2021 08:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210815162738.75461-1-kevin.townsend@linaro.org>
 <20210815162738.75461-2-kevin.townsend@linaro.org>
 <CAFEAcA8L7N0m1XRzRnyLt8QUOdrX436-2Xa9a04oYGOd6E0agw@mail.gmail.com>
 <CAFPHj6PJZdLXRiYXfz-zwgCaUwvTB8sbUsXcNL=aweqXR2hxQA@mail.gmail.com>
 <CAFEAcA_T4i9HL45h_AXfir+5U6ab8YFd7Sb2_6mGMtQuKh5UXg@mail.gmail.com>
 <CAFPHj6OWBhBg_SfXQ0MbjJ-Lfg3-=6=sLeY9zTaVU=LAMdSmBA@mail.gmail.com>
In-Reply-To: <CAFPHj6OWBhBg_SfXQ0MbjJ-Lfg3-=6=sLeY9zTaVU=LAMdSmBA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Sep 2021 16:13:50 +0100
Message-ID: <CAFEAcA-Fi4ZVdXMv-HZ5EPMGpj_fH2VmY+ZFeKKXvVYp4OkP0A@mail.gmail.com>
Subject: Re: [PATCH v2] hw/sensor: Add lsm303dlhc magnetometer device
To: Kevin Townsend <kevin.townsend@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

On Mon, 20 Sept 2021 at 15:22, Kevin Townsend <kevin.townsend@linaro.org> w=
rote:
> On Mon, 20 Sept 2021 at 15:52, Peter Maydell <peter.maydell@linaro.org> w=
rote:
>>
>> >> Why "lsb" ?
>> >>
>> >
>> > In my head, using LSB seemed more precise since I know exactly what va=
lue will
>> > be set to the registers, and exactly what I will get back when reading=
 versus passing
>> > in a float that's needs to be conveted as a 'best-fit' scenario in 0.1=
25=C2=B0C steps?
>>
>> My question was really, "what does 'lsb' mean here"?  I would usually
>> assume "least significant bit", but that makes no sense in this context.
>>
> Ha, sorry. Least significant bit, yes. It gets used in sensor and IC data=
sheets all
> the time and basically means '1 bit', so if the DS says 0.125=C2=B0C per =
LSB it means
> that value for 1 bit, or to multiply the integer by the 1 LSB value.
>
> Conversion factors from raw units to standard SI units are almost always
> indicated this way, though, such as 'LSB/Gauss', etc.

OK, that's not a convention I've encountered before.

>> Well, given that the device specifically changes the value it
>> shows the guest based on guest-programmable gain settings,
>> it does seem to me to be more natural to specify the values
>> in some way that represents the "real world data" that the
>> sensor is measuring. Ideally we would then if/when we add more
>> magnetometer implementations have them all use the same units,
>> for consistency. This is the first magnetometer we have, so this
>> is where we get to pick the convention.
>
>
> Sounds reasonable.
>
> We have two options here:
>
> - Gauss (standard SI unit)
> - micro Tesla (0.01 Gauss)
>
> They've both widely used; but I think uT might be slightly more common.
>
>>
>> > In that case, should I accept floating point inputs, however, or stick=
 to integers?
>> > When dealing with magnetometers the values can be very small, so it's =
not the
>> > same as a temp sensor where we can provide 2300 for 23.00C.
>>
>> What sort of range and precision requirements are we talking about
>> here? If we can avoid having to use float that would be nice...
>>
> Well, taking the LSM303DLHC as an example, we have 1100 LSB per Gauss
> at a range of +/- 1.3 Gauss, so 1 bit is: 0.0009090909091 Gauss.
>
> If we use micro Tesla (uT) we get 11 LSB per uT so the smallest value is
> 0.09090909091 uT ... which we could represent with something like
> 1000 =3D 1.000 uT
>
> That gives us +/- 1.3 G =3D +/- 130 uT =3D +/- 130,000, for example.
>
> This would require a 32-bit integer, though, to take into account the ful=
l
> range of +/-8.1 G (+/- 810 uT) =3D +/- 810,000.

That's OK -- our "int" properties are int64_t. So we could easily
fit something like 10000 =3D=3D 1.0000 uT, in case we might want
the extra precision in future. That would be 1,000,000 =3D=3D 1 G
(assuming I haven't messed up my arithmetic ;-))

> There are devices with a much wider range, like the MLX90393, which can
> measure up to +/- 50 mT (50,000 uT), so +/-50,000,000.
>
> That's the largest range I'm aware of personally, with +/- 1-8G (or 100-8=
00 uT)
> the most common.

thanks
-- PMM

