Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5213A79F8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 11:18:10 +0200 (CEST)
Received: from localhost ([::1]:44972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt5D0-00087T-23
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 05:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1lt5B5-00079U-3E; Tue, 15 Jun 2021 05:16:11 -0400
Received: from redisdead.crans.org ([2a0c:700:2::ff:fe01:2402]:53914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1lt5B2-0006Nu-8m; Tue, 15 Jun 2021 05:16:10 -0400
Received: from [IPv6:2a02:8428:4db:b001:f255:832d:4007:dcd0]
 (2a02-8428-04db-b001-f255-832d-4007-dcd0.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:f255:832d:4007:dcd0])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id 939F7231;
 Tue, 15 Jun 2021 11:15:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1623748556; bh=j9QYVLr7txLB2mDegB+kNTapow7I38GSh6euRHS3C6U=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=RB1dKs5FZ+62tSIDkR6/TUvX+CcxQjFxA8Y9AwfQi4NUx/oRj81Rk8OYEi7ZqTWw4
 3xkXGVggMGVy0OJg3MFzaY9Hggx2U8EsgtapE3XrNzjeBzxh20LSACdZXEXMjFInEM
 xsWTP89mwgGLrHR/XEYkjbUFLHcS071kq2hF+Qdv3TSIFl5bnpV06etMByaUtx0Tpm
 5g3fLTO4rHZ06yf5EEwWYndePvMdEkSEph/Hch6JejY8eSjwBZzLC6tLhqDeVr3myY
 X/3SUufX+vQGSEoHGB9oXM//KJsUwwG9w5J+ab6OutmUdBFlFPCTD3iqa/UBdeXRD7
 mGIAxrVs3oTdeGBD4pJGxpXrS/edQQxrH4ezOB8HaAq4atc8IYRnj6QRfhggHuexks
 ijqpLNg2Mj2ZHlPTK6+mxl5sOBxWu1MGz8eEnUjDOGT/ctcCjkUHUuXYLWNV4jwUzk
 DZYs9yyjqmZ+stOwnOdUxeS527BQOl+TDKbvs4GDr0QIpzSLugjEd5UsiQ+2patTZ4
 Up+styNg00lVP+VeDKr3gnG4gOMsJmyYx5whkFrXBtxuaUK1MCL2YCAMU6qoQND39x
 zIeKmLHmy1mfUyggJV4Qrddxrz8KIXvabZEGGJc04zQA7as5eHozuhcF6TqG8AyYr+
 9KbMguRHSNqZPMMJV/KKcb6g=
To: Alistair Francis <alistair23@gmail.com>
References: <20210608161028.4159582-1-erdnaxe@crans.org>
 <20210608161028.4159582-2-erdnaxe@crans.org>
 <CAKmqyKMs4Sr9oXR8k3jeXo=Umy3F6k-CfQW4Fz3zB++uFKkmDg@mail.gmail.com>
 <6bcf8d1b-7caf-ded5-937a-4c1bf96e2d85@crans.org>
 <CAKmqyKMETmc0sJbG8FdUokg9Ke_hg5ohZ2YnLzyQO1xwzpXMRA@mail.gmail.com>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Subject: Re: [PATCH 1/2] stm32f100: Add the stm32f100 SoC
Message-ID: <7e8a01c5-0130-1003-8396-af8d4b45d2c0@crans.org>
Date: Tue, 15 Jun 2021 11:15:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMETmc0sJbG8FdUokg9Ke_hg5ohZ2YnLzyQO1xwzpXMRA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oJnZZkzAXJYZWoOx4qXgHI6fBYp1BC7T1"
Received-SPF: pass client-ip=2a0c:700:2::ff:fe01:2402;
 envelope-from=erdnaxe@crans.org; helo=redisdead.crans.org
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:STM32F100" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oJnZZkzAXJYZWoOx4qXgHI6fBYp1BC7T1
Content-Type: multipart/mixed; boundary="k5iP4HYfbo4fUTz4Vj1rHhfowOx01n6yb";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:STM32F100" <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org
Message-ID: <7e8a01c5-0130-1003-8396-af8d4b45d2c0@crans.org>
Subject: Re: [PATCH 1/2] stm32f100: Add the stm32f100 SoC
References: <20210608161028.4159582-1-erdnaxe@crans.org>
 <20210608161028.4159582-2-erdnaxe@crans.org>
 <CAKmqyKMs4Sr9oXR8k3jeXo=Umy3F6k-CfQW4Fz3zB++uFKkmDg@mail.gmail.com>
 <6bcf8d1b-7caf-ded5-937a-4c1bf96e2d85@crans.org>
 <CAKmqyKMETmc0sJbG8FdUokg9Ke_hg5ohZ2YnLzyQO1xwzpXMRA@mail.gmail.com>
In-Reply-To: <CAKmqyKMETmc0sJbG8FdUokg9Ke_hg5ohZ2YnLzyQO1xwzpXMRA@mail.gmail.com>

--k5iP4HYfbo4fUTz4Vj1rHhfowOx01n6yb
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 6/15/21 10:04 AM, Alistair Francis wrote:
> On Tue, Jun 15, 2021 at 5:50 PM Alexandre IOOSS <erdnaxe@crans.org> wro=
te:
>>
>> On 6/15/21 9:41 AM, Alistair Francis wrote:
>>> Aren't you missing some timers, like timer[5] 0x4000_0C00?
>>>
>>> Alistair
>>
>> I double-checked using the reference manual and the datasheet and ther=
e
>> is not timer[5]:
>> - page 36 of
>> https://www.st.com/resource/en/reference_manual/cd00246267-stm32f100xx=
-advanced-arm-based-32-bit-mcus-stmicroelectronics.pdf
>=20
> Strange, https://www.st.com/resource/en/datasheet/stm32f100rc.pdf
> describes Timer 5 and page 282 of the document you linked talks about
> timer 5 as well.
>=20
> Alistair
>=20
>> - page 30 of https://www.st.com/resource/en/datasheet/stm32f100cb.pdf
>>
>> I believe ST is skipping numbers to guarantee that timer[n] will have =
a
>> consistent address on different STM32 SoC.
>>
>> Thanks,
>> -- Alexandre
>>

 From what I understand from other STM32F100xx reference manuals:
I am implementing all peripherals in the STM32F100xx reference manual=20
which match with what is actually in the STM32F100RB SoC (used in the=20
STM32VLDISCOVERY).

STM32F100RC SoC implements more peripherals (more USART, more=20
timers...). Adding these peripherals in stm32f100.c means that the=20
STM32VLDISCOVERY machine would have peripherals that does not exist on=20
the real target. Do we want to avoid that?

Should we keep stm32f100.c with the common subset of peripherals and=20
extend it when a machine is using a variant with more peripherals?

I believe this issue is also linked with what Philippe proposed: we=20
could abstract STM32 SoC in the same way ATMEGA is abstracted. This=20
would make a lot of sense since the STM32 family has a lot of=20
similarities and we don't want to bloat QEMU with N times the same code.

Thanks,
-- Alexandre


--k5iP4HYfbo4fUTz4Vj1rHhfowOx01n6yb--

--oJnZZkzAXJYZWoOx4qXgHI6fBYp1BC7T1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmDIb8wFAwAAAAAACgkQbHknjz/NzALg
NA/8CakOEXH6SMgFdtHxek262B5aSxd/P2QP21k+DFKPxByNqNnb4ClvYCH1muyzwyQIDX/WSmvA
jPtiyE9tdQ/4/cDHkTXRmnvfXiYje1gtKWPBUHZPzNKP+1FlAIc6KPRAxcYJMhGJwFhCc4scm4h6
KfbluoZgtG6azeL249eAy0gWqYeRIIIoZXrBbgRfQ4EWjLrYSOEZWqQJC9dF7jEQ75g6BP/MD1fw
mmaUDUWVXpY94GfkLx9fstwhsEC+8JfxCgH9vofkLz+Hp7ODv+Jetw4gKUpKIQhCT6aE/0GVC/qJ
SUt2igTipPajfKjGPo8agNolfsbPTfYRI/QdS7wmIUnoQZgQEKP6E1qi5WNBncac3xfJ9xh9LrVU
YNO4hVEsj2wNajIlh+UvFbrI3/Sr49gnwpUY4A+EZMgbeCVdP2AZeRHNL5erDjMKBCdO6db37d54
5NHRygJVQ+Zg8xWhSFQgcIZ5+UqCw2HDqCGD7EMKFE/dx9NCJip054Rih/J3CmonJsQtbLEQ5Y+O
/5m9e1swbXs9I+ty+00gcYCU2GTdPT/z4gRxhoq+ydgcWQHbtwfJ1B+xtk5GM1QdG6NZL6EZkp3t
2xG4OJfEK4sxO4Td65qyXrDUbSqlA4vMA354xpRTkJiuH93889oGrhmxuvVNXOhnViU0gFYwXSK6
VDs=
=k7c+
-----END PGP SIGNATURE-----

--oJnZZkzAXJYZWoOx4qXgHI6fBYp1BC7T1--

