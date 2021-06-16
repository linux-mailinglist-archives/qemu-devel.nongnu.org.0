Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7BC3A9ECE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 17:17:59 +0200 (CEST)
Received: from localhost ([::1]:39544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltXIk-0004AK-K7
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 11:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1ltXGX-0002Hc-6T
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:15:41 -0400
Received: from redisdead.crans.org ([185.230.79.39]:39234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1ltXGU-0000rC-Ec
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:15:40 -0400
Received: from [IPv6:2a02:8428:4db:b001:ecdd:11de:638c:6d7c]
 (2a02-8428-04db-b001-ecdd-11de-638c-6d7c.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:ecdd:11de:638c:6d7c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id 86CDD191;
 Wed, 16 Jun 2021 17:15:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1623856525; bh=9YJeHrGXTz+oFUNjeTIQsTh2y0kjJ52J6jIcc0Yo61A=;
 h=From:To:Cc:References:Subject:Date:In-Reply-To:From;
 b=aeb9oAGO8Rr/xZWYjQ18MMWTE5VYaNzJBaakhaRseSoXlIKmoIBQThVusnTBkUEw5
 bPJlwOUMoHLZqkEzO4hXkjnIYbAjkO9f1ai4I8moCeDxpGsoHAOdc4B/5kVFWegpRU
 2mJu2Kr8ORb4LOcpOgKPRH6xHaeNLiLSayh5tu5vjM1BfODCug4YtpI37SBd6+9wPq
 nB3q7zwZOzlNvc/4Gay76AeQr34GBRpDDFyALxsiziH4YvKs/RtWs87S4oV8pg/Deh
 00GHIZTrNh5EgVEj1DGRC0aJ1bNT+wd16gqho0zirPa8ZF92KffzCR3P3U82G4ljTi
 23nDT61fBrqLSCuNQdZ7ZNHzCp/OAS5OSfuk078GqTJJKMQq4QlPgnWIk94u4HgH09
 +XvqUjIVL+/usPGW3bLxue3CO23ryQxoUDer9UiUh9LcQJNG6oV2rIQ1NQSEn0LCqk
 s+dyDTg31eSgTcCAtVioKWAbIn48XswAguG882MPPOshL/zBd08EbBBeGx9Ix4s9LR
 xlmaHHbMQok3i8VpmlgkJVxMU8YNGtkzxnjnjRKhC/hJI19rn/rvAwxow0pzoHCqQl
 8ev7dTvhYdgaJWJgpoQ1zMjxFiix+YtbvXKMJEY1JaZQzPFrEi4Yffr9fEEShh63w3
 BA9rvtmhS1XHPr8B82o5SBfk=
From: Alexandre IOOSS <erdnaxe@crans.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20210614090116.816833-1-erdnaxe@crans.org>
 <d2d0e9c1-872b-158d-fe74-42ef699c60a9@gmail.com> <871r93k04f.fsf@linaro.org>
 <adf3164e-84dc-b96b-c671-0805175d0394@crans.org>
Organization: Crans
Subject: Re: [PATCH] contrib/plugins: add execlog to log instruction execution
 and memory access
Message-ID: <fe85f44b-a7a6-1b59-daa6-c5b6b81a2112@crans.org>
Date: Wed, 16 Jun 2021 17:15:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <adf3164e-84dc-b96b-c671-0805175d0394@crans.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="RxMvWp3D98vyQej5Hu2PneEb1naSWgpRz"
Received-SPF: pass client-ip=185.230.79.39; envelope-from=erdnaxe@crans.org;
 helo=redisdead.crans.org
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RxMvWp3D98vyQej5Hu2PneEb1naSWgpRz
Content-Type: multipart/mixed; boundary="BazLm04zUZoycyJ0p539Fp5mVVlNAZwRf";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Message-ID: <fe85f44b-a7a6-1b59-daa6-c5b6b81a2112@crans.org>
Subject: Re: [PATCH] contrib/plugins: add execlog to log instruction execution
 and memory access
References: <20210614090116.816833-1-erdnaxe@crans.org>
 <d2d0e9c1-872b-158d-fe74-42ef699c60a9@gmail.com> <871r93k04f.fsf@linaro.org>
 <adf3164e-84dc-b96b-c671-0805175d0394@crans.org>
In-Reply-To: <adf3164e-84dc-b96b-c671-0805175d0394@crans.org>

--BazLm04zUZoycyJ0p539Fp5mVVlNAZwRf
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/15/21 6:47 PM, Alexandre IOOSS wrote:
> On 6/15/21 10:22 AM, Alex Benn=C3=A9e wrote:
>> Mahmoud Mandour <ma.mandourr@gmail.com> writes:
>>> On 14/06/2021 11:01, Alexandre Iooss wrote:
>>>> +}
>>>> +
>>>> +/**
>>>> + * Log instruction execution
>>>> + */
>>>> +static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 char *insn_disas =3D (char *)udata;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* Add data to execution log */
>>>> +=C2=A0=C2=A0=C2=A0 fprintf(output, "insn: %s\n", insn_disas);
>>
>> =C2=A0=C2=A0 insn, 0x%08lx, disas
>>
>> Currently however on a multi-threaded execution you will potentially
>> loose any synchronisation between the insn_exec and any memory operati=
on
>> associated with it. If you really just care about what's tickling
>> hardware you could just drop the insn_exec callback and pass the
>> instruction information via udata to the vcpu_mem callback. You could
>> then dump everything in one line:
>>
>> =C2=A0=C2=A0 0xPC, ld [x1], x2, 0xADDR, load|store
>>
>> you wouldn't dump other instructions leading up to that though.
>=20
> You are correct, this is indeed an issue and it's currently making my=20
> life really hard when I try to apply a side-channel model on the memory=
=20
> interactions.
> I prefer to log all instructions, so I need to use vcpu_mem_cb when it'=
s=20
> a memory instruction, or vcpu_insn_exec_cb if it's not.

If I always set vcpu_mem_cb and vcpu_insn_exec_cb, then an user can do a =

bit of postprocessing of the data to merge lines that correspond to=20
memory interactions. Example of output (Cortex-M0 in Thumb mode):

```
# vaddr, opcode, disassembly, [load/store, memory addr, device]
0xa14, 0xf87f42b4, "cmp r4, r6"
0xa16, 0xd206, "bhs #0xa26"
0xa18, 0xfff94803, "ldr r0, [pc, #0xc]"
0xa18, 0xfff94803, "ldr r0, [pc, #0xc]", load, 0x00010a28, RAM
0xa1a, 0xf989f000, "bl #0xd30"
0xd30, 0xfff9b510, "push {r4, lr}"
0xd30, 0xfff9b510, "push {r4, lr}", store, 0x20003ee0, RAM
0xd30, 0xfff9b510, "push {r4, lr}", store, 0x20003ee4, RAM
0xd32, 0xf9893014, "adds r0, #0x14"
0xd34, 0xf9c8f000, "bl #0x10c8"
0x10c8, 0xfff96c43, "ldr r3, [r0, #0x44]"
0x10c8, 0xfff96c43, "ldr r3, [r0, #0x44]", load, 0x200000e4, RAM
```

If we don't want to call `vcpu_insn_exec_cb` when `vcpu_mem_cb` is=20
triggered, then I would have either to:

1. Implement load/store instructions matchers, similar to what is done=20
in `howvec.c` plugin.
2. Implement instructions mnemonic matchers (using the output of=20
qemu_plugin_insn_disas).
3. Use Capstone and disassemble a second time each instructions.

What is your opinion on these solutions? Maybe for a first version we=20
can keep it simple?

Thanks,
-- Alexandre


--BazLm04zUZoycyJ0p539Fp5mVVlNAZwRf--

--RxMvWp3D98vyQej5Hu2PneEb1naSWgpRz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmDKFY0FAwAAAAAACgkQbHknjz/NzAJV
qg/+OSYAdzvJHcZYoe9Xbm1EPl+lAiIJHvY6GUSA0Vq1dP0ydU8i3SuELC/OaCa5Q3m4L3UqNDT8
aRjl2mC1v3uArVzVT6MLIUc2TQOHMQQU9jsn60uUHorQcvNbaUq+mhS/wK8zD/W+IFwxdQUXh+Z5
ckNeQ8y4V6DVZLaGIk5F/v25TkKY5vPH9OEpE3nY7aUL0QeP9tVAb46Xdhq0IPnhfc8sJtPK/zko
9slCzBqp+EOLMxUg/IQEc2fB2vdRFmIc4MOBsKY38VwOFEluI7hv6SxzbEVGWHym6MVFnaQJXRbD
0Hzfb7AkqoJUgN8KoYleeL+qvddMsW1JNBMQbGbkB6cSDubl7tmaedBjnPI6T2wArPIhdzvAe2qq
XvUTGT7QFMYgk9lQD/FhXkLydMeFDL4q5xZcUBxugA/UQ0v7PmV2A/al/RBO1lFEBZev5JBLwiux
2nCkFaKBSVdCE6f5docplicjK2OJpSTrgCCwSByPNu/mfEYYVuWOa/hXRzFNyh5v0RLSUKFCwRCm
udzzNdL6O8LJ4rkevIrq7v0yxlAoSj+u7GjfF5jMGRuhTNC4lv0Tfl3jJkghuatyPZ92S8fNzTA0
FMQ5qOxn9v+ThqmfAKOx53hiTi15sy1d6oAln+ogMz4nd7F1q6A3+RiEaGmedwRIm2tKqxh6H4dw
q4U=
=4tQ6
-----END PGP SIGNATURE-----

--RxMvWp3D98vyQej5Hu2PneEb1naSWgpRz--

