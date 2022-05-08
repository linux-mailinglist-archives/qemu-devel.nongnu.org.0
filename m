Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9045C51EC60
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 11:14:07 +0200 (CEST)
Received: from localhost ([::1]:43618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnczO-000866-4q
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 05:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nncvS-00066R-9Y
 for qemu-devel@nongnu.org; Sun, 08 May 2022 05:10:10 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:54800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nncvK-0005Li-M9
 for qemu-devel@nongnu.org; Sun, 08 May 2022 05:10:02 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nncuC-0009mG-Hc; Sun, 08 May 2022 10:08:48 +0100
Message-ID: <85236da7-1951-ab79-624f-35b0d54cd887@ilande.co.uk>
Date: Sun, 8 May 2022 10:09:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-43-mark.cave-ayland@ilande.co.uk>
 <e3dd0ee0-d805-d5a2-464c-3b4478925303@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <e3dd0ee0-d805-d5a2-464c-3b4478925303@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 42/50] lasi: move from hw/hppa to hw/misc
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 08/05/2022 04:07, Richard Henderson wrote:

> On 5/4/22 04:25, Mark Cave-Ayland wrote:
>> Move the LASI device implementation from hw/hppa to hw/misc so that it is
>> located with all the other miscellaneous devices.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Acked-by: Helge Deller <deller@gmx.de>
>> ---
>>   MAINTAINERS                         | 2 ++
>>   hw/hppa/Kconfig                     | 1 +
>>   hw/hppa/machine.c                   | 2 +-
>>   hw/hppa/meson.build                 | 2 +-
>>   hw/hppa/trace-events                | 5 -----
>>   hw/misc/Kconfig                     | 3 +++
>>   hw/{hppa => misc}/lasi.c            | 3 +--
>>   hw/misc/meson.build                 | 3 +++
>>   hw/misc/trace-events                | 5 +++++
>>   {hw/hppa => include/hw/misc}/lasi.h | 0
>>   10 files changed, 17 insertions(+), 9 deletions(-)
>>   rename hw/{hppa => misc}/lasi.c (99%)
>>   rename {hw/hppa => include/hw/misc}/lasi.h (100%)
> 
> I don't understand hw/misc, or why this is a better categorization than hw/hppa.

This one is a bit of a grey area at the moment. There have been some discussions 
around having a hard separation between boards and devices, so that devices live in 
one part of the directory hierarchy and boards live in another. I think possibly 
Markus was advocating but this, but of course that would involve quite some work.

The reason for leaning in this direction is that by having the device separate from 
the board then it requires uses of QOM APIs in a way that don't break this 
abstraction, which I think makes things more future-proof.

There are already quite a few machine-specific devices throughout the tree: good 
examples of this would be hw/pci-host and hw/misc where there are a number of devices 
that it doesn't make sense to wire up to anything except one particular machine, so 
we're certainly not doing anything new here.


ATB,

Mark.

