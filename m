Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86D94CC440
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 18:47:21 +0100 (CET)
Received: from localhost ([::1]:59064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPpXs-0002Vx-Qf
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 12:47:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPpWB-0000lU-Ss
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:45:37 -0500
Received: from [2001:41c9:1:41f::167] (port=56316
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPpW7-0003cQ-S3
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:45:34 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPpVO-0006ql-1J; Thu, 03 Mar 2022 17:44:50 +0000
Message-ID: <74a8f29f-6015-d166-f829-bfca59ed3df1@ilande.co.uk>
Date: Thu, 3 Mar 2022 17:45:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
 <20220302212752.6922-5-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA8s9j7ypQXiY8AE_NiqjO9aTfVx+6P60BgVTqJFTTv3MA@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAFEAcA8s9j7ypQXiY8AE_NiqjO9aTfVx+6P60BgVTqJFTTv3MA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 04/10] macfb: add VMStateDescription fields for display
 type and VBL timer
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, pbonzini@redhat.com, Laurent@vivier.eu,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/03/2022 15:26, Peter Maydell wrote:

> On Wed, 2 Mar 2022 at 21:31, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> These fields are required in the migration stream to restore macfb state
>> correctly.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/display/macfb.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
>> index dfdae90144..7371986480 100644
>> --- a/hw/display/macfb.c
>> +++ b/hw/display/macfb.c
>> @@ -625,9 +625,11 @@ static const VMStateDescription vmstate_macfb = {
>>       .minimum_version_id = 1,
>>       .post_load = macfb_post_load,
>>       .fields = (VMStateField[]) {
>> +        VMSTATE_UINT8(type, MacfbState),
>>           VMSTATE_UINT8_ARRAY(color_palette, MacfbState, 256 * 3),
>>           VMSTATE_UINT32(palette_current, MacfbState),
>>           VMSTATE_UINT32_ARRAY(regs, MacfbState, MACFB_NUM_REGS),
>> +        VMSTATE_TIMER_PTR(vbl_timer, MacfbState),
>>           VMSTATE_END_OF_LIST()
>>       }
>>   };
> 
> Same bump-versions-or-explain-why-not as previous patch, otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

... and the same explanation applies here too. Should I still mention this in the 
commit messages for both this and the previous patch?


ATB,

Mark.

