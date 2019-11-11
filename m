Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8D8F6F4C
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 08:59:31 +0100 (CET)
Received: from localhost ([::1]:49778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iU4bh-0001Ib-KP
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 02:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56060)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jan.kiszka@siemens.com>) id 1iU4Zt-0000lk-Lg
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 02:57:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.kiszka@siemens.com>) id 1iU4Zo-0004se-RX
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 02:57:34 -0500
Received: from goliath.siemens.de ([192.35.17.28]:34222)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jan.kiszka@siemens.com>)
 id 1iU4Zo-0004qu-Hy
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 02:57:32 -0500
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id xAB7vNBu031512
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Nov 2019 08:57:24 +0100
Received: from [139.22.39.245] ([139.22.39.245])
 by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xAB7vNT6024606;
 Mon, 11 Nov 2019 08:57:23 +0100
Subject: Re: [PATCH] MAINTAINERS: slirp: Remove myself as maintainer
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 qemu-devel <qemu-devel@nongnu.org>
References: <759f8f44-9a01-a9f1-c7cf-65d40151a93a@web.de>
 <CAJ+F1C+tRzRXzTWE1E7Uyvz1q_XU-6i_+utD461i-WbJ+wdR2w@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0f57bc71-5a71-6cbf-0ee6-6a83af049959@siemens.com>
Date: Mon, 11 Nov 2019 08:57:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+tRzRXzTWE1E7Uyvz1q_XU-6i_+utD461i-WbJ+wdR2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by goliath.siemens.de id
 xAB7vNBu031512
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 192.35.17.28
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.07.19 12:00, Marc-Andr=C3=A9 Lureau wrote:
> Hi
>=20
> On Sat, Jul 27, 2019 at 10:16 AM Jan Kiszka <jan.kiszka@web.de> wrote:
>>
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> I haven't been doing anything here for a long time, nor does my git re=
po
>> still play a role.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>=20
> too bad, we could still use some help ;)
>=20
> thanks anyway!
>=20
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
>> ---
>>   MAINTAINERS | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index d6de200453..238feb965f 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2089,13 +2089,11 @@ F: include/hw/registerfields.h
>>
>>   SLIRP
>>   M: Samuel Thibault <samuel.thibault@ens-lyon.org>
>> -M: Jan Kiszka <jan.kiszka@siemens.com>
>>   S: Maintained
>>   F: slirp/
>>   F: net/slirp.c
>>   F: include/net/slirp.h
>>   T: git https://people.debian.org/~sthibault/qemu.git slirp
>> -T: git git://git.kiszka.org/qemu.git queues/slirp
>>
>>   Stubs
>>   M: Paolo Bonzini <pbonzini@redhat.com>
>> --
>> 2.16.4
>>
>=20
>=20

May I point out that this one was never merged?

Sorry, I really can't help in this area anymore.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

