Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37252AD20B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 10:06:16 +0100 (CET)
Received: from localhost ([::1]:48556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcPbT-00024M-Ji
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 04:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kcPZE-00019t-HA; Tue, 10 Nov 2020 04:03:56 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43038
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kcPZC-0001Mx-74; Tue, 10 Nov 2020 04:03:56 -0500
Received: from host86-184-131-53.range86-184.btcentralplus.com
 ([86.184.131.53] helo=[192.168.1.110])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kcPZJ-0004z6-6o; Tue, 10 Nov 2020 09:04:05 +0000
To: Thomas Huth <thuth@redhat.com>, armbru@redhat.com,
 david@gibson.dropbear.id.au, atar4qemu@gmail.com, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20200926140216.7368-1-mark.cave-ayland@ilande.co.uk>
 <20200926140216.7368-6-mark.cave-ayland@ilande.co.uk>
 <16f13e17-37cb-a238-4e2a-9a945649cafd@redhat.com>
 <24aca485-fe87-8aab-7554-ba8dc1a3bbb3@ilande.co.uk>
 <19068e17-21f0-75a5-f7df-1b11404008c6@redhat.com>
 <eda03864-cbd5-4205-8b69-06fa20321b49@ilande.co.uk>
 <53c02ed9-c21a-a628-753c-09f3f4e632f4@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <74b3fd72-01ce-c071-4f12-7037fd93a25e@ilande.co.uk>
Date: Tue, 10 Nov 2020 09:03:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <53c02ed9-c21a-a628-753c-09f3f4e632f4@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.184.131.53
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 5/6] macio: don't reference serial_hd() directly within
 the device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On 09/11/2020 10:02, Thomas Huth wrote:

>>>> Just out of interest how did you find this? My new workflow involves a local
>>>> "make check" with all ppc targets and a pass through Travis-CI and it didn't
>>>> show up there for me (or indeed Peter's pre-merge tests).
>>>
>>> I've found it with the scripts/device-crash-test script. (You currently need
>>> to apply Eduardo's patch "Check if path is actually an executable file" on
>>> top first to run it)
>>
>> Have you got a link for this? I've tried doing some basic searches in my
>> email client and couldn't easily spot it...
> 
> https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg07549.html

Thanks for this - I gave it a quick run with my patch and I see that there are still 
quite a few failures for qemu-system-ppc, so certainly there are other devices that 
will need attention in future.

I've just realised that I didn't explicitly mark the patch as for-5.2 so I'll resend 
it along with your R-B tag.


ATB,

Mark.

