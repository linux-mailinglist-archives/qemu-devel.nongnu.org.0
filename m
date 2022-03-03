Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ABA4CC304
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:41:46 +0100 (CET)
Received: from localhost ([::1]:52514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPoWP-0003ZO-2w
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:41:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nPoAu-0002Nm-3v
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:19:32 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:39838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nPoAr-0004SK-Rr
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:19:31 -0500
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id CE66421A89;
 Thu,  3 Mar 2022 16:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1646324367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wfilffRHfpMybCSuloR4lMWxi04rPwgAyS0D+w+K4P4=;
 b=DwLDWSImOt/IzKx9K9VsvJtsnLwg2ELMrwwcaM2xqMQnheSC+DZT4AM1JQ4uUn8wjdkg9t
 Q0y19zMYWGeRCgBpFelS7tQmQOiS5EAAtmGyjRCIhv/tUmkm/0PvP2zNsHCETFpGiLdXZQ
 9227H2RseJ087Mu3pkPILh0CEWTctYk=
Message-ID: <427eea9e-710e-cadb-e87f-85c723674662@greensocs.com>
Date: Thu, 3 Mar 2022 17:19:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 08/14] none-machine: add 'ram-addr' property
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org,
 mark.burton@greensocs.com, edgari@xilinx.com
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-9-damien.hedde@greensocs.com>
 <5f0b5304-359b-1cc6-6ea0-57ba6b0947f0@gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <5f0b5304-359b-1cc6-6ea0-57ba6b0947f0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/3/22 15:41, Philippe Mathieu-Daudé wrote:
> On 23/2/22 10:07, Damien Hedde wrote:
>> Add the property to configure a the base address of the ram.
>> The default value remains zero.
>>
>> This commit is needed to use the 'none' machine as a base, and
>> subsequently to dynamically populate it using qapi commands. Having
>> a non null 'ram' is really hard to workaround because of the actual
>> constraints on the generic loader: it prevents loading binaries
>> bigger than ram_size (with a null ram, we cannot load anything).
>> For now we need to be able to use the existing ram creation
>> feature of the none machine with a configurable base address.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> ---
>>   hw/core/null-machine.c | 34 ++++++++++++++++++++++++++++++++--
>>   1 file changed, 32 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
>> index 7eb258af07..5fd1cc0218 100644
>> --- a/hw/core/null-machine.c
>> +++ b/hw/core/null-machine.c
>> @@ -16,9 +16,11 @@
>>   #include "hw/boards.h"
>>   #include "exec/address-spaces.h"
>>   #include "hw/core/cpu.h"
>> +#include "qapi/visitor.h"
>>   struct NoneMachineState {
>>       MachineState parent;
>> +    uint64_t ram_addr;
>>   };
>>   #define TYPE_NONE_MACHINE MACHINE_TYPE_NAME("none")
>> @@ -26,6 +28,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(NoneMachineState, 
>> NONE_MACHINE)
>>   static void machine_none_init(MachineState *mch)
>>   {
>> +    NoneMachineState *nms = NONE_MACHINE(mch);
>>       CPUState *cpu = NULL;
>>       /* Initialize CPU (if user asked for it) */
>> @@ -37,9 +40,13 @@ static void machine_none_init(MachineState *mch)
>>           }
>>       }
>> -    /* RAM at address zero */
>> +    /* RAM at configured address (default: 0) */
>>       if (mch->ram) {
>> -        memory_region_add_subregion(get_system_memory(), 0, mch->ram);
>> +        memory_region_add_subregion(get_system_memory(), nms->ram_addr,
>> +                                    mch->ram);
>> +    } else if (nms->ram_addr) {
>> +        error_report("'ram-addr' has been specified but the size is 
>> zero");
> 
> I'm not sure about this error message, IIUC we can get here if no ram
> backend is provided, not if we have one zero-sized. Otherwise LGTM.

You're most probably right. Keeping the ram_size to 0 is just one way of 
getting here. I can replace the message by a more generic formulation
"'ram-addr' has been specified but the machine has no ram"


