Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A0E35D26B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 23:15:06 +0200 (CEST)
Received: from localhost ([::1]:53808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW3tg-0008A3-RR
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 17:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW3sS-0007jG-HP
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 17:13:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43952
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW3sQ-00049v-Cv
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 17:13:48 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW3sZ-0003vS-7g; Mon, 12 Apr 2021 22:14:00 +0100
To: Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
 <dabec806-51e3-5f3c-463b-0ac7f5ba854a@ilande.co.uk>
 <CAFEAcA8=G=O58FCaZBUqpqtFGaAYJT=PsDnEYjHu0qEGL22oBQ@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <571d68d8-bca3-c51d-f184-3dbee69d2eb7@ilande.co.uk>
Date: Mon, 12 Apr 2021 22:13:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8=G=O58FCaZBUqpqtFGaAYJT=PsDnEYjHu0qEGL22oBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: any remaining for-6.0 issues?
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/04/2021 20:40, Peter Maydell wrote:

>> On 12/04/2021 16:32, Peter Maydell wrote:
>>
>>> Last call to note anything we need to fix for 6.0 on
>>> https://wiki.qemu.org/Planning/6.0#Known_issues please.
>>> The schedule is to tag rc3 tomorrow, which I would ideally like
>>> to be the last rc before release. After rc3 I will only be taking
>>> fixes for bugs which are absolutely critical...
>>
>> Thanks for reviewing one of the patches from the ESP security patchset earlier.
>>
>> Should I send a PR for the ESP security patchset and the acceptance test fix?
>> Unfortunately the timing of the holidays has meant that these are missing a review
>> from a SCSI maintainer but IMO both of these are worthy for 6.0.
> 
> Yes, please do. If you could add your missing copyright line to
> the comment in the new file in patch 12 as well that would be great.

Okay, great - just reading over today's thread so should be able to send a PR shortly.


ATB,

Mark.

