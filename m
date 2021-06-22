Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7233B05B4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 15:19:02 +0200 (CEST)
Received: from localhost ([::1]:54180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvgIv-0002X3-9c
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 09:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1lvgGh-0000pg-7i
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 09:16:43 -0400
Received: from redisdead.crans.org ([2a0c:700:2::ff:fe01:2402]:41170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1lvgGe-0001pm-Eb
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 09:16:42 -0400
Received: from [IPv6:2a02:8428:4db:b001:fc01:7e3f:bfe5:ef8d]
 (2a02-8428-04db-b001-fc01-7e3f-bfe5-ef8d.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:fc01:7e3f:bfe5:ef8d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id 8D24658A;
 Tue, 22 Jun 2021 15:16:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1624367797; bh=6HjOJ3ZXKGOV45vesa9qdkCQM9c7jBoarqeDP9lLsnk=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=LMgmMcXH84SMajj+cgjGNUJ9nMAfaSm4pYL5pstnzKysrwjz9g4E4I3Lf1pMEx1Zf
 LESFCUoSRBQ5d2wl/JHuu5EyLZmdLAyh6f/rRqq8UpNN5Se4XA1YG95paxXCgvqJGw
 g22/Y54c2LdQvFeyqvc0UJXtBKcuDqRN8HjV0aLRU2lLHROjJuHZH3E8jYharuconH
 /fHahQG06z1y/Dbyx6AJV5md7z2ugkJCUr6+Bc1y5QafhHGHaEKqSpbxhJAu5kCSM+
 9DhMOjRwG1eKEXdu4lXRvbkwRqY8b+F4yf66IhpAWH0gx/8Big6CZsDipqm9s4bMvC
 jag7v27Wb2DjYor1RgQHp/OQc7k3WfNEqZuTmIgtIqVXiGQC6YZbMiXRtaCvLuf+7H
 1NmQ1APYEgTQmfrbEd/m3CE9Ge6hgjMePsblu+vZMmjwOZ1OqxnVFm4G2loa8IOf++
 bFLKcQ1ymSrDQUVOORNxH0UWU+Ke+fpEt8K8nGrOzeWChVnNR10L54VdqjQKm3ZTJG
 MGFANUZSsJk/VaagVMH03A9KOsYdx6WlzNR+5HwCVpxkbFv2su58C2UD/dVfvzdaTg
 /fJFtIEJ1YtSna7qCu4EQHeZ90qMs24obDtzIu7ijI5ISh+Kx6EvIxSPPK/ortQa3V
 egpDqTGR6Ysm9Y6jkt4fx2vI=
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210618091101.2802534-1-erdnaxe@crans.org>
 <20210618091101.2802534-3-erdnaxe@crans.org> <87y2b2s2gw.fsf@linaro.org>
 <49027cc2-f89e-cbd6-cfc0-e59ce7dd4b17@crans.org> <87y2b2rxju.fsf@linaro.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Subject: Re: [PATCH v2 2/2] docs/devel: tvg-plugins: add execlog plugin
 description
Message-ID: <9c43ebbe-d0cd-5244-ba86-477e40f0c835@crans.org>
Date: Tue, 22 Jun 2021 15:16:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <87y2b2rxju.fsf@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zZ4I41LeqYRxNTlLGZ4nnVhFJlnzdFjDG"
Received-SPF: pass client-ip=2a0c:700:2::ff:fe01:2402;
 envelope-from=erdnaxe@crans.org; helo=redisdead.crans.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 "open list : All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zZ4I41LeqYRxNTlLGZ4nnVhFJlnzdFjDG
Content-Type: multipart/mixed; boundary="3sWsYuQG0xGHTCmVQdr62dA3nlvhmYvj8";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: "open list : All patches CC here" <qemu-devel@nongnu.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Message-ID: <9c43ebbe-d0cd-5244-ba86-477e40f0c835@crans.org>
Subject: Re: [PATCH v2 2/2] docs/devel: tvg-plugins: add execlog plugin
 description
References: <20210618091101.2802534-1-erdnaxe@crans.org>
 <20210618091101.2802534-3-erdnaxe@crans.org> <87y2b2s2gw.fsf@linaro.org>
 <49027cc2-f89e-cbd6-cfc0-e59ce7dd4b17@crans.org> <87y2b2rxju.fsf@linaro.org>
In-Reply-To: <87y2b2rxju.fsf@linaro.org>

--3sWsYuQG0xGHTCmVQdr62dA3nlvhmYvj8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/22/21 12:37 PM, Alex Benn=C3=A9e wrote:
>=20
> Alexandre IOOSS <erdnaxe@crans.org> writes:
>=20
>> [[PGP Signed Part:Undecided]]
>> On 6/22/21 10:48 AM, Alex Benn=C3=A9e wrote:
>>> Alexandre Iooss<erdnaxe@crans.org>  writes:
>>>> [...]
>>>> +
>>>> +The execlog tool traces executed instructions with memory access. I=
t can be used
>>>> +for debugging and security analysis purposes.
>>> We should probably mention that this will generate a lot of output.
>>> Running the admittedly memory heavy softmmu memory test:
>>>     ./aarch64-softmmu/qemu-system-aarch64 -D test.out -d plugin \
>>>       -plugin contrib/plugins/libexeclog.so  \
>>>       -cpu max -serial mon:stdio -M virt \
>>>       -display none -semihosting-config chardev=3Dserial0 \
>>>       -kernel ./tests/tcg/aarch64-softmmu/memory
>>> generates a 8.6Gb text file. I suspect once this is merged you might
>>> want to look at options to target the instrumentation at areas of
>>> specific interest or abbreviate information.
>>
>> Yes! In my downstream version I am triggering the beginning and the
>> end of trace acquisition by matching two virtual addresses of GPIO
>> device access. This works in my case because I'm also using the same
>> GPIO for triggering an oscilloscope, but maybe we would like to
>> upstream something more generic.
>>
>> I'm still thinking about this (maybe for a later patch) but I believe
>> it would be nice to have the following:
>>   - If no argument is given to the plugin, log everything.
>>   - Allow the user to specify either a memory address, an instruction
>>     virtual address or an opcode that would start the acquisition.
>>   - Same to stop the acquisition.
>=20
> Sounds reasonable to me.
>=20
>> This would look like this to start/stop acquisition using GPIO PA8 on
>> STM32VLDISCOVERY:
>>
>>    ./arm-softmmu/qemu-system-arm -M stm32vldiscovery \
>>      -kernel ./firmware.elf -d plugin \
>>      -plugin libexeclog.so,arg=3Dmem:1073809424,arg=3Dmem:1073809424
>=20
> I quite like the formats you can use for -dfilter, for example:
>=20
>    0x1000+0x100,0x2100-0x100,0x3000..0x3100
>=20
> it might even be worth exposing qemu_set_dfilter_ranges as a helper
> function to plugins to avoid copy and paste.

We could expose "-dfilter", but maybe it is better to reserve it to=20
filter the output of the plugin rather than triggering the tracing?

I could implement a format similar to dfilter to configure triggering.=20
This would enable someone to start logging on any access to a memory rang=
e.

>=20
> So what would your above command trigger? A write to 1073809424 would
> start the trace and the next write to the same address would stop it?
>=20

Yes exactly. In this case the first access set the GPIO high, and the=20
second access set it low.

I don't believe the plugin can access the value stored in memory (i.e.=20
differentiating between setting a GPIO output high or low). I don't find =

this problematic in my case, but maybe it could be for someone else.

 From the discussion I see the following possible patches:
1. Add an argument to trigger the beginning with one address (memory or=20
instruction).
2. Add an argument to trigger the end with one address (memory or=20
instruction).
3. Add the support for ranges (in "dfilter" style).
4. (maybe) Add the support to trigger on an opcode.
5. Add support for "-dfilter" to filter the logging output.

Thanks,
-- Alexandre


--3sWsYuQG0xGHTCmVQdr62dA3nlvhmYvj8--

--zZ4I41LeqYRxNTlLGZ4nnVhFJlnzdFjDG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmDR4rUFAwAAAAAACgkQbHknjz/NzAKM
xw//WHeNQt/wdICzBgl01y1Gs3pQF2oxOfVIqmciZ4zQH89X5MDH+JxcWHhAJhZaXhy0WWrG/sdE
BkvmMqfiMVMekyvsmNDl2YP4B+BPnhV/rlII0pIOhxwvgsrs7yRgXDUGuCDEeQcu8irr3ZcpFCRM
B2plPPaAmByorCxNLa3/M6jnFizVWRIv9NitCBXfdlu5F8152VPgrAr8HMA0n5WBUHqO2BQg/4vL
WyQyDH0SMlB0zyvg0KfvbrjhsvnrrABMuS87rWnyb6luNSiKvfShECTvV3tlrMikp4cAfEm0xc98
p7R/KFoU11iE9P32k6z62xG15Mmjh3/32xvYKMo3XIz/JgWxWP5OEP57Sh1wshNl5JxXoH458bXG
alpqruA/h/NIXc5MFf2zGlugwfKCCUxB9YFqnmiHz9yBeRtVe4ouxTHWK8CfU9t6LmhhhhpsjT1m
UZ85T2JzyBb1YxdvwX8XZ1vDIe5eeyJYcZiJUHQGYzBwJ+F6AHM/PnIee0ts0hwdXATGCDZc92oq
kYUOoVvsmaTpvKC/p3N2GdOXnZV7+81Plr6+74ggrpvmeXR+GYfC7PqeRMGDkzstdQ7ijkItNWbE
OfBUNRv4TmnR1M/ONI+rDTsib7O9Ql853Ye4mV2hJZdXi/IoW1zbyv+M7rAyZ83sO93CQVVoTYia
0To=
=SmaX
-----END PGP SIGNATURE-----

--zZ4I41LeqYRxNTlLGZ4nnVhFJlnzdFjDG--

