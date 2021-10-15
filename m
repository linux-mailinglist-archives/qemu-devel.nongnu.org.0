Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8255742FC42
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 21:38:46 +0200 (CEST)
Received: from localhost ([::1]:50074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbT2T-0005lW-KH
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 15:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mbSui-0000J2-UJ
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:30:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51456
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mbSud-0000ny-Gf
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:30:41 -0400
Received: from [2a00:23c4:8b9d:f500:9396:df17:737c:b32c]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mbSuI-000BN4-0x; Fri, 15 Oct 2021 20:30:22 +0100
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
 <20211013212132.31519-2-mark.cave-ayland@ilande.co.uk>
 <ffd52b20-c812-b58f-370b-ca3a81bb4eb2@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <8f99f470-bdde-97e5-32bf-a8e519f607ad@ilande.co.uk>
Date: Fri, 15 Oct 2021 20:30:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ffd52b20-c812-b58f-370b-ca3a81bb4eb2@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:f500:9396:df17:737c:b32c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 1/8] mac_via: update comment for VIA1B_vMystery bit
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/10/2021 07:14, Laurent Vivier wrote:

> Le 13/10/2021 à 23:21, Mark Cave-Ayland a écrit :
>> According to both Linux and NetBSD, port B bit 6 is used on the Quadra 800 to
>> configure the GLUE logic in A/UX mode. Whilst the name VIA1B_vMystery isn't
>> particularly descriptive, the patch leaves this to ensure that the constants
>> in mac_via.c remain in sync with Linux's mac_via.h.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/misc/mac_via.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
>> index 993bac017d..7a53a8b4c0 100644
>> --- a/hw/misc/mac_via.c
>> +++ b/hw/misc/mac_via.c
>> @@ -130,6 +130,10 @@
>>                                   * On SE/30, vertical sync interrupt enable.
>>                                   * 0=enabled. This vSync interrupt shows up
>>                                   * as a slot $E interrupt.
>> +                                * On Quadra 800 this bit toggles A/UX mode which
>> +                                * configures the glue logic to deliver some IRQs
>> +                                * at different levels compared to a classic
>> +                                * Mac.
>>                                   */
>>   #define VIA1B_vADBS2   0x20    /* ADB state input bit 1 (unused on IIfx) */
>>   #define VIA1B_vADBS1   0x10    /* ADB state input bit 0 (unused on IIfx) */
>>
> 
> I'm not sure we need to keep in sync a word that neither used by linux or qemu (for now).
> 
> Perhaps you can put a word from where it is (NetBSD)?
> 
> It seems it's supported by all Quadra, not only Quadra 800 (see NetBSD comment in mac68k/machdep.c
> 
> Anyway:
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.Eu>

Yeah, it's a hard one: you can see the bit referenced in the via_alt_mapping logic in 
Linux but mac_via.h still shows it as VIA1B_vMystery (and indeed, it seems to have 
different uses on different machines). The thought behind adding the comment was to 
better explain the purpose of VIA1B_vMystery within the series.


ATB,

Mark.

