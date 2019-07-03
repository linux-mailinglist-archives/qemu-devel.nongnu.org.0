Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1F95E8C6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 18:26:41 +0200 (CEST)
Received: from localhost ([::1]:37366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hii5g-0000qu-I0
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 12:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60624)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stephen.checkoway@oberlin.edu>) id 1hii0L-0006S8-NI
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 12:21:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stephen.checkoway@oberlin.edu>) id 1hii0C-0007w4-MX
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 12:21:03 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:37122)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stephen.checkoway@oberlin.edu>)
 id 1hii06-0007rD-Ik
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 12:20:55 -0400
Received: by mail-qk1-x743.google.com with SMTP id d15so3239079qkl.4
 for <qemu-devel@nongnu.org>; Wed, 03 Jul 2019 09:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oberlin.edu; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=K8kN7qkJZ35Dg5HUEUSRfqQF7KNKkhMnh17hvbxj/QY=;
 b=Xr2MkQPSAdZTJey9M9p385krFLjsV1zuy7IW6faV00yP2cbQzcbh3s77pQuFiwjUub
 yc8No8Z86oa3uT0R6jUgvc2p2jICWCD2Sw0N5LRgDiRrq2oGhoKaaQHGdCSgWN6//zse
 xwO3H2+kZ24y83T1bDJUQEDHGccMcZWeKh2YWxGLyTp9xf2HZOt6KnmAwxwp4ZnMeYN2
 RJ/H3+vGnorsCivwJnCUUJqQT/wvfzOZWD1UZGS+QowIf9cuWsySzVO4qjoxmASAsqKF
 cWPjeQU9fZZKglBwkiwA5jn6iSEtZaz33uGBLxp4N3WQiHZUjUcJBQQ1SYwjnyQksrvr
 sExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=K8kN7qkJZ35Dg5HUEUSRfqQF7KNKkhMnh17hvbxj/QY=;
 b=AzjVD2i2ByIKdK4ueO9oQGWYfVSHKDYk+M9qTU9GJuI2UbVQXQB5wWGVxAYVQBF/rH
 YDg+hmakVAdS1xQoxN0JCXZ1w4cMtuhuitROYzM4WK0FPcsD30SPkFjqnOwQQUu7RW6t
 jpqp8BIscsn81jPi/MQ8Bzmouw7/6yi09oiFYu06RYyYiB4R50SM1OMd1WmsFF+CHdCH
 Xvf+xws6E2r7Ftpn1fknmNp4tpO06R5OdOQvJeSLlZXP9y7DHNOdYx5BO8Tf2QFx5Edt
 QqXjvas5xdl0r7JjrrwtUnCKru41rX2YdzEgRi/5SQI9MlSLmdVTYwi7APE6VROFJyHv
 bLOg==
X-Gm-Message-State: APjAAAV3YbA1pF4T1iPze943rubPZNIT+14yJL/LISTDyA9yctQI6BXB
 SaG+WO2GOj23w2TMRMzUOtcu2g==
X-Google-Smtp-Source: APXvYqzTiti4YLXS4bNIVgeKmPsdkNf54mlJKjhMToJJSboMjmg6DRtBcu+ARHPo7Wnvfm6wGMCBow==
X-Received: by 2002:a05:620a:1034:: with SMTP id
 a20mr13058596qkk.165.1562170850630; 
 Wed, 03 Jul 2019 09:20:50 -0700 (PDT)
Received: from [192.168.1.7] (ip-210-181.oberlin.net. [208.66.210.181])
 by smtp.gmail.com with ESMTPSA id m5sm1085449qke.25.2019.07.03.09.20.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 09:20:50 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
From: Stephen Checkoway <stephen.checkoway@oberlin.edu>
In-Reply-To: <05be219a-4af9-f939-3abe-6137f5a7deba@redhat.com>
Date: Wed, 3 Jul 2019 12:20:47 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <3D8F6CD2-6C74-469C-83C1-3DF0A458B757@oberlin.edu>
References: <20190702005912.15905-1-philmd@redhat.com>
 <20190702005912.15905-28-philmd@redhat.com>
 <C6F80CB3-2D5D-4EE0-A085-DDA8AA334279@oberlin.edu>
 <05be219a-4af9-f939-3abe-6137f5a7deba@redhat.com>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
X-Mailer: Apple Mail (2.3445.9.1)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::743
Subject: Re: [Qemu-devel] [PULL 27/27] hw/block/pflash_cfi02: Reduce I/O
 accesses to 16-bit
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jul 3, 2019, at 12:02, Philippe Mathieu-Daud=C3=A9 =
<philmd@redhat.com> wrote:
>=20
> On 7/3/19 5:52 PM, Stephen Checkoway wrote:
>>=20
>>=20
>>> On Jul 1, 2019, at 20:59, Philippe Mathieu-Daud=C3=A9 =
<philmd@redhat.com> wrote:
>>>=20
>>> Parallel NOR flashes are limited to 16-bit bus accesses.
>>=20
>> I don't think this is correct. The CFI spec defines an x32 interface =
for parallel NOR. CFI addresses 0x28 and 0x29 specify the interface and =
value 3 is x32 and value 5 is x16/x32.
>>=20
>> Here's an example of an x32 device =
<https://www.mouser.com/datasheet/2/100/002-00948_29CD032J_S29CD016J_S29CL=
032J_S29CL016J_3-1316792.pdf>.
>=20
> OK, I was not aware of these.
>=20
> QEMU never CFI-announced itself as x32 capable:
>=20
>    /* Flash device interface (8 & 16 bits) */
>    pfl->cfi_table[0x28] =3D 0x02;
>    pfl->cfi_table[0x29] =3D 0x00;
>=20
> So while the commit description is incorrect, the code is safe with =
the
> current device model.
>=20
> I am not comfortable keeping untested 32-bit mode.
> Were you using it?

I'm not using it. I did have some code to set these CFI values based on =
the parameters used to control the interleaving =
<https://github.com/stevecheckoway/qemu/commit/f9a79a6e18b2c7c5a05e344ff55=
4a7d980a56042#diff-d33881bd0ef099e2f46ebd4797c653bcR599>.

In general, a better testing harness would be nice though.

Steve

>=20
> Regards,
>=20
> Phil.
>=20
>> Cheers,
>>=20
>> Steve
>>=20
>>> Remove the 32-bit dead code.
>>>=20
>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>> Message-Id: <20190627202719.17739-29-philmd@redhat.com>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>> ---
>>> hw/block/pflash_cfi02.c | 5 +----
>>> 1 file changed, 1 insertion(+), 4 deletions(-)
>>>=20
>>> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
>>> index 83084b9d72..5392290c72 100644
>>> --- a/hw/block/pflash_cfi02.c
>>> +++ b/hw/block/pflash_cfi02.c
>>> @@ -317,8 +317,6 @@ static uint64_t pflash_read(void *opaque, hwaddr =
offset, unsigned int width)
>>>    boff =3D offset & 0xFF;
>>>    if (pfl->width =3D=3D 2) {
>>>        boff =3D boff >> 1;
>>> -    } else if (pfl->width =3D=3D 4) {
>>> -        boff =3D boff >> 2;
>>>    }
>>>    switch (pfl->cmd) {
>>>    default:
>>> @@ -449,8 +447,6 @@ static void pflash_write(void *opaque, hwaddr =
offset, uint64_t value,
>>>    boff =3D offset;
>>>    if (pfl->width =3D=3D 2) {
>>>        boff =3D boff >> 1;
>>> -    } else if (pfl->width =3D=3D 4) {
>>> -        boff =3D boff >> 2;
>>>    }
>>>    /* Only the least-significant 11 bits are used in most cases. */
>>>    boff &=3D 0x7FF;
>>> @@ -710,6 +706,7 @@ static void pflash_write(void *opaque, hwaddr =
offset, uint64_t value,
>>> static const MemoryRegionOps pflash_cfi02_ops =3D {
>>>    .read =3D pflash_read,
>>>    .write =3D pflash_write,
>>> +    .impl.max_access_size =3D 2,
>>>    .valid.min_access_size =3D 1,
>>>    .valid.max_access_size =3D 4,
>>>    .endianness =3D DEVICE_NATIVE_ENDIAN,
>>> --=20
>>> 2.20.1

--=20
Stephen Checkoway






