Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326E1ABD55
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 18:09:31 +0200 (CEST)
Received: from localhost ([::1]:58086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6Gnh-0000oX-M0
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 12:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52251)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1i6GjN-0005FC-Fm
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 12:05:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1i6GjK-0000aj-UW
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 12:05:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35670)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1i6GjK-0000Zp-N0
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 12:04:58 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 59CCA30821AE;
 Fri,  6 Sep 2019 16:04:57 +0000 (UTC)
Received: from [10.3.116.234] (ovpn-116-234.phx2.redhat.com [10.3.116.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9B073DA6;
 Fri,  6 Sep 2019 16:04:52 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Tony Nguyen <tony.nguyen@bt.com>, qemu-devel@nongnu.org
References: <20190902012647.1761-1-tony.nguyen@bt.com>
 <41e61c1c-15b0-d028-fc23-52e2c59319d2@redhat.com>
 <93172f42-7506-65d0-5754-248c3fc31aa1@redhat.com>
 <867bdb4b-3eef-0660-6db2-a2e6a0ab5a0e@redhat.com>
 <c1159dea-d68c-1143-a000-1320a1e39fb7@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=eblake@redhat.com; keydata=
 xsBNBEvHyWwBCACw7DwsQIh0kAbUXyqhfiKAKOTVu6OiMGffw2w90Ggrp4bdVKmCaEXlrVLU
 xphBM8mb+wsFkU+pq9YR621WXo9REYVIl0FxKeQo9dyQBZ/XvmUMka4NOmHtFg74nvkpJFCD
 TUNzmqfcjdKhfFV0d7P/ixKQeZr2WP1xMcjmAQY5YvQ2lUoHP43m8TtpB1LkjyYBCodd+LkV
 GmCx2Bop1LSblbvbrOm2bKpZdBPjncRNob73eTpIXEutvEaHH72LzpzksfcKM+M18cyRH+nP
 sAd98xIbVjm3Jm4k4d5oQyE2HwOur+trk2EcxTgdp17QapuWPwMfhaNq3runaX7x34zhABEB
 AAHNHkVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPsLAegQTAQgAJAIbAwULCQgHAwUV
 CgkICwUWAgMBAAIeAQIXgAUCS8fL9QIZAQAKCRCnoWtKJSdDahBHCACbl/5FGkUqJ89GAjeX
 RjpAeJtdKhujir0iS4CMSIng7fCiGZ0fNJCpL5RpViSo03Q7l37ss+No+dJI8KtAp6ID+PMz
 wTJe5Egtv/KGUKSDvOLYJ9WIIbftEObekP+GBpWP2+KbpADsc7EsNd70sYxExD3liwVJYqLc
 Rw7so1PEIFp+Ni9A1DrBR5NaJBnno2PHzHPTS9nmZVYm/4I32qkLXOcdX0XElO8VPDoVobG6
 gELf4v/vIImdmxLh/w5WctUpBhWWIfQDvSOW2VZDOihm7pzhQodr3QP/GDLfpK6wI7exeu3P
 pfPtqwa06s1pae3ad13mZGzkBdNKs1HEm8x6zsBNBEvHyWwBCADGkMFzFjmmyqAEn5D+Mt4P
 zPdO8NatsDw8Qit3Rmzu+kUygxyYbz52ZO40WUu7EgQ5kDTOeRPnTOd7awWDQcl1gGBXgrkR
 pAlQ0l0ReO57Q0eglFydLMi5bkwYhfY+TwDPMh3aOP5qBXkm4qIYSsxb8A+i00P72AqFb9Q7
 3weG/flxSPApLYQE5qWGSXjOkXJv42NGS6o6gd4RmD6Ap5e8ACo1lSMPfTpGzXlt4aRkBfvb
 NCfNsQikLZzFYDLbQgKBA33BDeV6vNJ9Cj0SgEGOkYyed4I6AbU0kIy1hHAm1r6+sAnEdIKj
 cHi3xWH/UPrZW5flM8Kqo14OTDkI9EtlABEBAAHCwF8EGAEIAAkFAkvHyWwCGwwACgkQp6Fr
 SiUnQ2q03wgAmRFGDeXzc58NX0NrDijUu0zx3Lns/qZ9VrkSWbNZBFjpWKaeL1fdVeE4TDGm
 I5mRRIsStjQzc2R9b+2VBUhlAqY1nAiBDv0Qnt+9cLiuEICeUwlyl42YdwpmY0ELcy5+u6wz
 mK/jxrYOpzXKDwLq5k4X+hmGuSNWWAN3gHiJqmJZPkhFPUIozZUCeEc76pS/IUN72NfprZmF
 Dp6/QDjDFtfS39bHSWXKVZUbqaMPqlj/z6Ugk027/3GUjHHr8WkeL1ezWepYDY7WSoXwfoAL
 2UXYsMAr/uUncSKlfjvArhsej0S4zbqim2ZY6S8aRWw94J3bSvJR+Nwbs34GPTD4Pg==
Organization: Red Hat, Inc.
Message-ID: <c05017b0-086c-9811-0538-65eeff0d92f9@redhat.com>
Date: Fri, 6 Sep 2019 11:04:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c1159dea-d68c-1143-a000-1320a1e39fb7@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 06 Sep 2019 16:04:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] memory: Set notdirty_mem_ops validator
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/6/19 8:44 AM, Eric Blake wrote:
> On 9/6/19 8:24 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>=20
>>>>>  static const MemoryRegionOps notdirty_mem_ops =3D {
>>>>>      .write =3D notdirty_mem_write,
>>>>> -    .valid.accepts =3D notdirty_mem_accepts,
>>>>>      .endianness =3D DEVICE_NATIVE_ENDIAN,
>>>>>      .valid =3D {
>>>>>          .min_access_size =3D 1,
>>>>>          .max_access_size =3D 8,
>>>>>          .unaligned =3D false,
>>>>> +        .accepts =3D notdirty_mem_accepts,
>>>>
>>>> I'm surprised the compiler doesn't emit any warning...
>>>
>>> Same here.

Actually, I just played with -Woverride-init in gcc 9.2.1 (and clang's
comparable -Winitializer-overrides, which we intentionally disable
during configure), and they come pretty close - both compilers DO flag
when an implicit zero-initialization due to partial =3D{} overrides an
earlier initialization.  But sadly, they also warn when one specific
init of a smaller subobject overrides another earlier specific init of a
larger subobject such as an array range operator.  So
qobject/json-lexer.c and others fail to compile under the existing
warning option, which is why we disable it during configure (clang has
it as part of -Wall; gcc only has it as part of -Wextra which we do not
use).

In researching further, I see:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D24010#c4
which explains why -Woverride-init is NOT part of gcc's -Wall, precisely
because of our range pre-initialization usage.

So I filed:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D91688
seeing if the gcc devs would consider splitting into
-Woverride-init=3D[12], where 1 only flags a larger subobject overriding
an earlier smaller one (would have caught our bug) and 2 flags an
equal-size or smaller subobject overriding an earlier large one (which
we would not use, because we rely on that for range pre-initialization).

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

