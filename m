Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 938CF12E029
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jan 2020 19:46:30 +0100 (CET)
Received: from localhost ([::1]:60850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imj0n-0001tg-2b
	for lists+qemu-devel@lfdr.de; Wed, 01 Jan 2020 13:46:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37046)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1imj01-0001Qw-8h
 for qemu-devel@nongnu.org; Wed, 01 Jan 2020 13:45:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1imizz-0000tU-Jj
 for qemu-devel@nongnu.org; Wed, 01 Jan 2020 13:45:40 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:14694)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1imizw-0000nd-Bk
 for qemu-devel@nongnu.org; Wed, 01 Jan 2020 13:45:39 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B262E745953;
 Wed,  1 Jan 2020 19:45:33 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1BFB0745712; Wed,  1 Jan 2020 19:45:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 18759745702;
 Wed,  1 Jan 2020 19:45:33 +0100 (CET)
Date: Wed, 1 Jan 2020 19:45:33 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 66/86] ppc:ppc440_bamboo/sam460ex: drop RAM size fixup
In-Reply-To: <2d440542-7a32-4e1d-6635-201d4535f91a@redhat.com>
Message-ID: <alpine.BSF.2.21.99999.352.2001011941520.17971@zero.eik.bme.hu>
References: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
 <1577797450-88458-67-git-send-email-imammedo@redhat.com>
 <alpine.BSF.2.21.99999.352.2001011235410.5612@zero.eik.bme.hu>
 <2d440542-7a32-4e1d-6635-201d4535f91a@redhat.com>
User-Agent: Alpine 2.21.99999 (BSF 352 2019-06-22)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1308057370-1577904333=:17971"
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1308057370-1577904333=:17971
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

On Wed, 1 Jan 2020, Philippe Mathieu-Daud=E9 wrote:
> On 1/1/20 12:54 PM, BALATON Zoltan wrote:
>> On Tue, 31 Dec 2019, Igor Mammedov wrote:
>>> If user provided non-sense RAM size, board will complain and
>>> continue running with max RAM size supported.
>>> Also RAM is going to be allocated by generic code, so it won't be
>>> possible for board to fix things up for user.
>>>=20
>>> Make it error message and exit to force user fix CLI,
>>> instead of accepting non-sense CLI values.
>>>=20
>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>> ---
>>> include/hw/ppc/ppc4xx.h |=A0 9 ++++-----
>>> hw/ppc/ppc440_bamboo.c=A0 | 11 ++++-------
>>> hw/ppc/ppc4xx_devs.c=A0=A0=A0 | 26 ++++++++++++++++----------
>>> hw/ppc/sam460ex.c=A0=A0=A0=A0=A0=A0 |=A0 5 ++---
>>> 4 files changed, 26 insertions(+), 25 deletions(-)
>>>=20
>>> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
>>> index 7d82259..1a28127 100644
>>> --- a/include/hw/ppc/ppc4xx.h
>>> +++ b/include/hw/ppc/ppc4xx.h
>>> @@ -42,11 +42,10 @@ enum {
>>> qemu_irq *ppcuic_init (CPUPPCState *env, qemu_irq *irqs,
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ui=
nt32_t dcr_base, int has_ssr, int has_vr);
>>>=20
>>> -ram_addr_t ppc4xx_sdram_adjust(ram_addr_t ram_size, int nr_banks,
>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 MemoryRegion ram_memories[],
>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 hwaddr ram_bases[],
>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 hwaddr ram_sizes[],
>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 const ram_addr_t sdram_bank_sizes[]);
>>> +void ppc4xx_sdram_adjust(ram_addr_t ram_size, int nr_banks,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 MemoryRegion ram_memories[],
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 hwaddr ram_bases[], hwaddr ram_sizes[],
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 const ram_addr_t sdram_bank_sizes[]);
>>=20
>> With this change this function does not adjust ram size any more so it=
 may=20
>> need to be renamed, e.g. ppc4xx_sdram_banks or something else.
>>=20
>> A better patch title may be
>>=20
>> ppc/{ppc440_bamboo,sam460x}: drop RAM size fixup
>
> Or split in 2 patches.

This is mainly patching a common function used by both so I think it's OK=
=20
to do in one patch.

Regards,
BALATON Zoltan
--3866299591-1308057370-1577904333=:17971--

