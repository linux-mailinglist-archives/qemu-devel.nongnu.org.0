Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95C02E205A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 19:18:23 +0100 (CET)
Received: from localhost ([::1]:51604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks8iM-0007Zo-26
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 13:18:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ks8fy-00070D-EG
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 13:15:58 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43530
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ks8fv-0004cf-C1
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 13:15:54 -0500
Received: from host86-184-125-210.range86-184.btcentralplus.com
 ([86.184.125.210] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ks8fk-0003Nj-36; Wed, 23 Dec 2020 18:15:46 +0000
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <5ef852ee-8a53-df9d-82f4-33a68c05f53a@ilande.co.uk>
 <5849da05-a063-cd56-7709-c4760c8aa71f@roeck-us.net>
 <ee005fd0-1eb0-2bfd-6be3-10f616cc7aad@ilande.co.uk>
 <1b7afdc5-a7d7-5dd2-9398-786d6413ed82@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <9059dbb1-a29e-c18e-beaa-38d82fdcce6a@ilande.co.uk>
Date: Wed, 23 Dec 2020 18:15:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1b7afdc5-a7d7-5dd2-9398-786d6413ed82@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.184.125.210
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: Problems with irq mapping in qemu v5.2
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.521,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Guenter Roeck <linux@roeck-us.net>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/12/2020 13:17, BALATON Zoltan via wrote:

> On Wed, 23 Dec 2020, Mark Cave-Ayland wrote:
>> On 22/12/2020 21:23, Guenter Roeck wrote:
>>
>> (Added jiaxun.yang@flygoat.com as CC)
> 
> Are you sure? It does not show up on cc list for me so unless the list ate it you 
> might have forgotten to copy the address there. Done now just in case, sorry if this 
> resulted in double post.
> 
> Regards,
> BALATON Zoltan

I've added the address to the CC (and I can confirm from the exim logs that it gets 
accepted), however the list copy removes it. Perhaps Jiaxun isn't subscribed to 
qemu-devel?


ATB,

Mark.

