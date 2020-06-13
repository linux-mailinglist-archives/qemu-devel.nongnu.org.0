Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82121F84F4
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Jun 2020 21:37:29 +0200 (CEST)
Received: from localhost ([::1]:55418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkBy4-0002w2-GJ
	for lists+qemu-devel@lfdr.de; Sat, 13 Jun 2020 15:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jkBxD-0002Ky-Te; Sat, 13 Jun 2020 15:36:35 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:43023)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jkBxA-0006Gx-Px; Sat, 13 Jun 2020 15:36:35 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B63E17482C8;
 Sat, 13 Jun 2020 21:36:23 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8E56E7475FA; Sat, 13 Jun 2020 21:36:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8C96F74633F;
 Sat, 13 Jun 2020 21:36:23 +0200 (CEST)
Date: Sat, 13 Jun 2020 21:36:23 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v2 0/5] Mac Old World ROM experiment
In-Reply-To: <alpine.BSF.2.22.395.2006131957090.82630@zero.eik.bme.hu>
Message-ID: <alpine.BSF.2.22.395.2006132134500.7137@zero.eik.bme.hu>
References: <cover.1592055375.git.balaton@eik.bme.hu>
 <alpine.BSF.2.22.395.2006131957090.82630@zero.eik.bme.hu>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/13 14:03:35
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: David Gibson <david@gibson.dropbear.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 13 Jun 2020, BALATON Zoltan wrote:
> On Sat, 13 Jun 2020, BALATON Zoltan wrote:
>> Version 2 with some more tweaks this now starts but drops in a Serial
>> Test Manager (see below) presumably because some POST step is failing,
>> I let others who know more about this machine figure out what's
>> missing from here.
>> 
>> Regards,
>> BALATON Zoltan
>> 
>>
>>      1 :pci_update_mappings_add d=0x55a1bb6254a0 00:01.0 
>> 0,0xf3000000+0x80000
>>      1 pci_cfg_read grackle 00:0 @0x0 -> 0x21057
>>      1 pci_cfg_read grackle 00:0 @0xa8 -> 0x0
>>      1 pci_cfg_write grackle 00:0 @0xa8 <- 0x40e0c
>>      1 pci_cfg_read grackle 00:0 @0xac -> 0x0
>>      1 pci_cfg_write grackle 00:0 @0xac <- 0x12000000
>>      1 pci_cfg_read grackle 00:0 @0xac -> 0x12000000
>>      1 pci_cfg_write grackle 00:0 @0xac <- 0x2000000
>>      1 pci_cfg_read grackle 00:0 @0x70 -> 0x0
>>      1 pci_cfg_write grackle 00:0 @0x70 <- 0x11000000
>>      1 machine_id_read(0, 2)
>>      1 pci_cfg_read grackle 00:0 @0x8 -> 0x6000140
>>      1 pci_cfg_read grackle 00:0 @0xf0 -> 0x0
>>      1 pci_cfg_write grackle 00:0 @0xf0 <- 0x12900000
>>      1 machine_id_read(0, 2)
>>      1 portA_write unimplemented
>>      1 CUDA: unknown command 0x22
>>      1 CUDA: unknown command 0x26
>>      3 CUDA: unknown command 0x25
>>      1 pci_cfg_write grackle 00:0 @0x80 <- 0xffffffff
>>      1 pci_cfg_write grackle 00:0 @0x88 <- 0xffffffff
>>      1 pci_cfg_write grackle 00:0 @0x90 <- 0xffffffff
>>      1 pci_cfg_write grackle 00:0 @0x98 <- 0xffffffff
>>      1 pci_cfg_write grackle 00:0 @0x84 <- 0xffffffff
>>      1 pci_cfg_write grackle 00:0 @0x8c <- 0xffffffff
>>      1 pci_cfg_write grackle 00:0 @0x94 <- 0xffffffff
>>      1 pci_cfg_write grackle 00:0 @0x9c <- 0xffffffff
>>      1 pci_cfg_write grackle 00:0 @0xa0 <- 0x0
>>      1 pci_cfg_read grackle 00:0 @0xf0 -> 0x12900000
>>      1 pci_cfg_write grackle 00:0 @0xf0 <- 0x12900000
>>      1 machine_id_read(0, 2)
>>      1 pci_cfg_read grackle 00:0 @0x8 -> 0x6000140
>>      1 pci_cfg_read grackle 00:0 @0xf0 -> 0x12900000
>>      1 pci_cfg_write grackle 00:0 @0xf0 <- 0x12940000
>>      1 pci_cfg_write grackle 00:0 @0xf0 <- 0x12940000
>>      1 pci_cfg_write grackle 00:0 @0xf4 <- 0x40010fe4
>>      1 pci_cfg_write grackle 00:0 @0xf8 <- 0x7302293
>>      1 pci_cfg_write grackle 00:0 @0xfc <- 0x25302220
>>      1 pci_cfg_read grackle 00:0 @0xa0 -> 0x0
>>      1 pci_cfg_write grackle 00:0 @0xa0 <- 0x67000000
>>      1 pci_cfg_read grackle 00:0 @0xf0 -> 0x12940000
>>      1 pci_cfg_write grackle 00:0 @0xf0 <- 0x129c0000
>> 550755 Unassigned mem read 00000000f3014020
>
> So this seems to be the missing sound device (maybe trying to play the 
> startup chime). Adding some dummy implementation there gets me a little bit 
> further:
>
>      2 macio: screamer read 20  4
>      1 macio: screamer write 10  4 = 600000
>      1 macio: screamer read 10  4
>      2 macio: screamer read 20  4
>      1 macio: screamer write 10  4 = 8220000
>      1 macio: screamer read 10  4
>      1 macio: screamer write 10  4 = 0
>      1 macio: screamer read 10  4
>      7 CUDA: unknown command 0x22
>      2 macio: screamer read 20  4
>      1 macio: screamer write 10  4 = 180000
>      1 macio: screamer read 10  4
>      1 CUDA: unknown command 0x22
>      1 macio: screamer read 0  4
>      1 macio: screamer write 0  4 = 11050000
>      1 dbdma_unassigned_flush: use of unassigned channel 16
>      1 dbdma_unassigned_rw: use of unassigned channel 16
>      1 Unassigned mem write 0000000000240020 = 0x10006238
>      1 Unassigned mem write 0000000000240024 = 0xffe32c00
>      1 Unassigned mem write 0000000000240028 = 0x0
>      1 Unassigned mem write 000000000024002c = 0x84006238
>
> then stops here, I guess it may be waiting for an interrupt so probably we

Or maybe it's the missing i2c bus in cuda (CUDA commands 0x22 and 0x25 
above) which I can imagine may try to get SPD data from RAM to configure 
memory.

Regards,
BALATON Zoltan


