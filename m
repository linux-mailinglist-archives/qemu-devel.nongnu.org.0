Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3069312E5CD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jan 2020 12:42:39 +0100 (CET)
Received: from localhost ([::1]:40068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imysA-0004To-3N
	for lists+qemu-devel@lfdr.de; Thu, 02 Jan 2020 06:42:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45862)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1imyrK-00040o-CD
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 06:41:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1imyrJ-0007kw-8Q
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 06:41:46 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:49089)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1imyrI-0007jq-Vc
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 06:41:45 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MEFrX-1iuR6G24Xd-00AE7d; Thu, 02 Jan 2020 12:41:41 +0100
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20200102103644.233370-1-Jason@zx2c4.com>
 <60efe91c-af82-f6d7-36c5-c603971c2f33@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH] q800: implement mac rom reset function for BIOS-less mode
Message-ID: <d3eb847b-a6b9-4ac7-3c06-576686cca608@vivier.eu>
Date: Thu, 2 Jan 2020 12:41:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <60efe91c-af82-f6d7-36c5-c603971c2f33@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QGfhhmPL3y9/oMiGE0Ni7bBZRxTK9l2jcC0x/l0ac/xD3TDYUV+
 2eyb0zBXJ9Xc2yjQDGoTOCXTAM7cgFKOHQqaxWfz1j2TRHMeHTlpDR4LyuRZeVIv12j+mBd
 l9wU2b54OSBcpl6NCJ+aFgKpb1U1tWaNR4jjoEldeiUKRpkERW+YBxAekDSk50a73ic0Dsz
 sQUlIPQG52lhQWtJu4Lqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:flhJUu0xdkY=:8v0Cex8XlQAagVTzqR7pX/
 viJadTZIMZQz+46LMulwM0Rs4LxkoX6+ksjD8ezux5hhIBTwXR3q4JvRXLrECIicWuTvGIMuC
 LIu3vEmKT+A8ON6NwjdtYhwr2yNl4Pls3U777k7svjrw6KDO1tHUouWO37O+JEyC/4dPWkTlE
 8i6mowdKmBSlSf9+jn4xwyNP0O9cmWKl28cN1hOdaVOeW9smdWfmr62ZNz3QYOK+ch8B2fvuA
 XMJ89VxTx/8cuyQ9cEuwX0tzkIQEIh9bMO81NgjZSoJ0JgTmijNHcaXgC5I0yGfX9kVSe25uD
 zQb9Ps/Bb7Xn9h9bWt+YSj0qFa/HtZ1nsoXLP9tEUdbFy9RyLKaIlSTtb5zGDxlR+QX4UGUKE
 FqjrwxZoJJWPCHFFLzWDzZLEKWodpkc6RNCU2zvXXw4j9n1xc3BJ85ytInX43+I+84o/6oCCM
 0Ww3yTofQ4Ye0dZejMvotqCIrKlcTV+nuqaM0htPKvrDE3/kpJVQsPN7Ikyt5BBBS7spp2vxp
 KRRwuWL+nAWSXLqoFu/vQ1vCtaOYPMvQyUQLqYxIxL31qLVAkLTCrMPmpo4Ka9cXtbI4looFp
 88qKJiOGb1Qce7W7OWeHqHXeVAckJi96p/Xr3KiJyOQPAnNQQ5i4Et2SJWaRxSnqOIhU/8Tn4
 I2u1cS7AWlpOjZwbSOPfMZrl3O9YLYA+nTKzk4Zuoj+/wYQZXUQV3qtwlAnyKcm1SCSDcY3ms
 pwMjukNLc0hrOdGoBA1Ky75j3LlgjmOJXQY1mp5hESNPc7ucJ4WnESSAD18cTAC6HkCo5a68M
 9kmtTAnGPBkctviGgjcDXPAALxPGfCNAnfq3DhthJebxpsoi3A1TsRiJxJrT1oi276gCy5HK7
 GwEoNyP9er45oCUy9cnw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 217.72.192.75
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 02/01/2020 à 12:10, Laurent Vivier a écrit :
> Le 02/01/2020 à 11:36, Jason A. Donenfeld a écrit :
>> On Linux, calling `reboot(RB_AUTOBOOT);` will result in
>> arch/m68k/mac/misc.c's mac_reset function being called. That in turn
>> looks at the rombase (or uses 0x40800000 is there's no rombase), adds
>> 0xa, and jumps to that address. At the moment, there's nothing there, so
>> the kernel just crashes when trying to reboot. So, this commit adds a
>> very simple implementation at that location, which just writes to via2
>> to power down.
>>
>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>> ---
> 
> There are two cleaners solution to do that:
> 1- catch the jump to the ROM address in QEMU and shutdown the machine, see
> 
> https://github.com/vivier/qemu-m68k/commit/51cd57d1128059819038b9800455fbf794430c15
> 
> 2- or as you do, write a fake ROM but use the VIA2 port B bit 3 to
> shutdown the machine see hw/misc/mac_via.c mos6522_q800_via2_portB_write().

OK, 2 is what you do, so I think we can take this.

The assembly code is correct but not easy to read, could you use defined
values (VIA_BASE) and add some comments?

I think we don't need the BI_MAC_ROMBASE: in fact MACROM_ADDR is wrong,
you can change its definition to 0x40800000.

Thanks,
Laurent

