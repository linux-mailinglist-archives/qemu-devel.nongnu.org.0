Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418DB4E5B46
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 23:34:52 +0100 (CET)
Received: from localhost ([::1]:60726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX9Z5-0000v5-Ch
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 18:34:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1nX9Vx-0006wH-Gx
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 18:31:37 -0400
Received: from mta01.hs-regensburg.de ([194.95.104.11]:39794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1nX9Vt-0006Wh-H1
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 18:31:36 -0400
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de
 [IPv6:2001:638:a01:8013::93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "E16S03", Issuer "E16S03" (not verified))
 by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4KP34168M7zy8q;
 Wed, 23 Mar 2022 23:31:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oth-regensburg.de;
 s=mta01-20211122; t=1648074689;
 bh=qJ1k9Zw5p1j/IBVD0xcUKiPRx5j6BnR6yLuhQMz+N+k=;
 h=Date:Subject:To:CC:References:From:In-Reply-To:From;
 b=BlDr6qykAyYsyf/gSTDxtl2ZHD12aK7XMLPyheuS5iifVx0Zelw8qSCakWMlTHUKY
 PLYrj3O+6LuHZUaQPljLJUe1+llxY7jEKjWZ9ZcyEekhGo8xIdhwVTrzCr0/G0niFE
 RBN6Jflz2MYVbeZqIF+gMLALhymj3t9kxzLLdmhlzKeNO1uWHsDwZ++guaCuVIsc7l
 Mp8YBjnK/rBh5MjFSvBfYZ92bYjz25M61u+kJwRLn7wJCzCFVC94WLR47En0L0MjE6
 m3T6Jn9gscUedx1ZfvWGki4rKvb/zDzVoOwkIUmAWQ9N/SQjD0EYyyso05p2Qp44xz
 7khj4bKCJG91A==
Received: from [IPV6:2001:678:ddc:11:17a4:3bb5:620b:1dcb]
 (2001:638:a01:8013::138) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 23 Mar
 2022 23:31:29 +0100
Message-ID: <f479be4c-6308-aee3-29eb-b5f26397e296@oth-regensburg.de>
Date: Wed, 23 Mar 2022 23:31:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [EXT] Re: [PATCH] hw/riscv: virt: Warn the user if -bios is
 provided when using KVM
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
References: <20220323171346.792572-1-ralf.ramsauer@oth-regensburg.de>
 <CAKmqyKP8Nf5X7-X8Y+-xdczn2nauzhh1GEwj77_S6GFTMGmPTQ@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <CAKmqyKP8Nf5X7-X8Y+-xdczn2nauzhh1GEwj77_S6GFTMGmPTQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
Received-SPF: pass client-ip=194.95.104.11;
 envelope-from=ralf.ramsauer@oth-regensburg.de; helo=mta01.hs-regensburg.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, Anup Patel <anup@brainfault.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Stefan Huber <stefan.huber@oth-regensburg.de>,
 Jiangyifei <jiangyifei@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 23/03/2022 22:05, Alistair Francis wrote:
> On Thu, Mar 24, 2022 at 3:13 AM Ralf Ramsauer
> <ralf.ramsauer@oth-regensburg.de> wrote:
>>
>> The -bios option is silently ignored if used in combination with -enable-kvm.
>> The reason is that the machine starts in S-Mode, and the bios typically runs in
>> M-Mode.
>>
>> Warn the user that the bios won't be loaded.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> 
> Thanks for the patch.
> 
>> ---
>>   hw/riscv/virt.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index 4496a15346..a4d13114ee 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -1312,6 +1312,9 @@ static void virt_machine_init(MachineState *machine)
>>        * when KVM is enabled.
>>        */
>>       if (kvm_enabled()) {
>> +        if (machine->firmware && strcmp(machine->firmware, "none"))
> 
> You need curly braces around the if statement. You can run checkpatch
> on the patch to catch issues like this with:
> 
> git show | ./scripts/checkpatch.pl -

total: 0 errors, 0 warnings, 9 lines checked

Your patch has no obvious style problems and is ready for submission.

> 
>> +            warn_report("BIOS is not supported in combination with KVM. "
>> +                        "Ignoring BIOS.");
> 
> Maybe say
> 
> "Machine mode firmware is not supported in combination with KVM. Ignoring -bios"

Anyway, will provide a V2 with an improved warning message.

Thanks
   Ralf

> 
> Alistair
> 
>>           g_free(machine->firmware);
>>           machine->firmware = g_strdup("none");
>>       }
>> --
>> 2.32.0
>>

