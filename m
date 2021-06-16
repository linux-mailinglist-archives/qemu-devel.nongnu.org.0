Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0FF3AA1F8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 19:01:37 +0200 (CEST)
Received: from localhost ([::1]:47826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYv2-0002Kn-3D
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 13:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltYrk-00081f-Eh; Wed, 16 Jun 2021 12:58:12 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:38464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltYrh-00007K-6F; Wed, 16 Jun 2021 12:58:12 -0400
Received: by mail-qt1-x833.google.com with SMTP id o19so2408508qtp.5;
 Wed, 16 Jun 2021 09:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JC9bPL9OMUQl9hwYCI1yRuRLYxbJsIiEQjZTvn70iYU=;
 b=rMiujzwwYOUmyalCU0THiV/JH9oK43HF4LPU8m8heHFBfO/7DAIOuqivN/6kgwLidd
 Jl3XF9C6C4pLF7dmDGJW7iBu1U2B+yoNiIdCd4T3E38Vu7+0idrbkeHGnVgVCSZEBgad
 YhVb/V23Qhso2hq77l0wRDCXgrJBizNx8rkmUWoz+NFcsTcS6pglMyWvK+ve7Yy0W2rz
 +7LorMnduRzflAaeHSmDXJiUW/0k3dXc6GE6YAdf2t5N5BJWI0RsiiS834mE0gIAarHx
 5/xQLVHf9VyT07gCVxTFCI3NfFzKkPfvrntCjRHHI3UsPLiX+DqV+bcV41lMXEol0ehp
 Uy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JC9bPL9OMUQl9hwYCI1yRuRLYxbJsIiEQjZTvn70iYU=;
 b=e0vS2iRFsxwhJoAuFnc2TCCvSvoSFS6PGpUiuFqj0Genc2Q8gWf1fttYZ8ltwbZMKl
 Ue30CEwYEi0DgHiSPnCtNK4pLYF5JmKoA8Gra45Chnx9DUvLFSEjMnApKfbrFzMDJaLI
 3nYTM+yhLVNyMGj44wVCD1h+mUuI8ZSmU0uyHiKZyGz3dNENkSMdp5+62kPdXHifji/+
 3Ikyz9kF8SpQOGpLo5g4A8DCf/jy3BlsbPfgDiUEZvyIEgGQUZeLFbvuNL5WltRAmaCb
 u6F/PqJvQ0WovOpGWaxmQ05VDw6MAt8R5DJkm+sKVaZn85yylAqD8xF55iHkZgBm5ivS
 UYTA==
X-Gm-Message-State: AOAM532g0taMGXLcVTKU2mBJ5TdaXQgCblRhArBWj9do3Bo26WXJMH5g
 7xLeNJ7IQRQRBQLiVsZtxGE=
X-Google-Smtp-Source: ABdhPJwnghwpMs2fQK2zWCsjKgIp1/upr75VlMxp+CrtbYWEvyB+2FU1Zd+wENsS8eBgOMqHLBZaJg==
X-Received: by 2002:a05:622a:1a97:: with SMTP id
 s23mr789805qtc.75.1623862687755; 
 Wed, 16 Jun 2021 09:58:07 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:59e4:b479:6e4f:abba:619e?
 ([2804:431:c7c6:59e4:b479:6e4f:abba:619e])
 by smtp.gmail.com with ESMTPSA id p12sm1550039qtw.61.2021.06.16.09.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 09:58:07 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] spapr: use DEVICE_UNPLUG_ERROR to report unplug
 errors
To: Markus Armbruster <armbru@redhat.com>
References: <20210604200353.1206897-1-danielhb413@gmail.com>
 <20210604200353.1206897-3-danielhb413@gmail.com>
 <87y2bgppan.fsf@dusky.pond.sub.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <b24b965b-6e85-63b1-3bf1-2dc9418ec90a@gmail.com>
Date: Wed, 16 Jun 2021 13:58:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87y2bgppan.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: david@gibson.dropbear.id.au, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/11/21 9:18 AM, Markus Armbruster wrote:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> 
>> Linux Kernel 5.12 is now unisolating CPU DRCs in the device_removal
>> error path, signalling that the hotunplug process wasn't successful.
>> This allow us to send a DEVICE_UNPLUG_ERROR in drc_unisolate_logical()
>> to signal this error to the management layer.
>>
>> We also have another error path in spapr_memory_unplug_rollback() for
>> configured LMB DRCs. Kernels older than 5.13 will not unisolate the LMBs
>> in the hotunplug error path, but it will reconfigure them.  Let's send
>> the DEVICE_UNPLUG_ERROR event in that code path as well to cover the
>> case of older kernels.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/ppc/spapr.c     |  2 +-
>>   hw/ppc/spapr_drc.c | 15 +++++++++------
>>   2 files changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index c23bcc4490..29aa2f467d 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -3639,7 +3639,7 @@ void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState *dev)
>>        */
>>       qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
>>                                    "for device %s", dev->id);
>> -    qapi_event_send_mem_unplug_error(dev->id, qapi_error);
>> +    qapi_event_send_device_unplug_error(dev->id, qapi_error);
> 
> Incompatible change: we now emit DEVICE_UNPLUG_ERROR instead of
> MEM_UNPLUG_ERROR.  Intentional?
> 
> If yes, we need a release note.
> 
> To avoid the incompatible, we can emit both, and deprecate
> MEM_UNPLUG_ERROR.
> 
> What about the MEM_UNPLUG_ERROR in acpi_memory_hotplug_write()?

I'll emit DEVICE_UNPLUG_ERROR together with all MEM_UNPLUG_ERROR instances.
Then we can deprecate MEM_UNPLUG_ERROR.

By the way, how do I mark MEM_UNPLUG_ERROR as deprecated? I see examples
of command line options being documented as deprecated in
docs/system/deprecated.rst and some deprecated QOM/QDEV properties are
marked as deprecated directly in their .json files, but I didn't find
any case where a whole event is deprecated. Would something like this be
adequate?


$ git diff
diff --git a/qapi/machine.json b/qapi/machine.json
index 58a9c86b36..ce3d873c64 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1261,6 +1261,10 @@
  #
  # @msg: Informative message
  #
+#
+# @deprecated: Starting in 6.1 this event has been replaced by
+#              DEVICE_UNPLUG_ERROR.
+#
  # Since: 2.4
  #
  # Example:



Thanks,


Daniel


> 
>>   }
>>   
>>   /* Callback to be called during DRC release. */
>> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
>> index a2f2634601..0e1a8733bc 100644
>> --- a/hw/ppc/spapr_drc.c
>> +++ b/hw/ppc/spapr_drc.c
>> @@ -17,6 +17,8 @@
>>   #include "hw/ppc/spapr_drc.h"
>>   #include "qom/object.h"
>>   #include "migration/vmstate.h"
>> +#include "qapi/error.h"
>> +#include "qapi/qapi-events-machine.h"
>>   #include "qapi/visitor.h"
>>   #include "qemu/error-report.h"
>>   #include "hw/ppc/spapr.h" /* for RTAS return codes */
>> @@ -160,6 +162,10 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
>>            * means that the kernel is refusing the removal.
>>            */
>>           if (drc->unplug_requested && drc->dev) {
>> +            const char qapi_error_fmt[] = "Device hotunplug rejected by the "
>> +                                          "guest for device %s";
>> +            g_autofree char *qapi_error = NULL;
>> +
>>               if (spapr_drc_type(drc) == SPAPR_DR_CONNECTOR_TYPE_LMB) {
>>                   spapr = SPAPR_MACHINE(qdev_get_machine());
>>   
>> @@ -167,13 +173,10 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
>>               }
>>   
>>               drc->unplug_requested = false;
>> -            error_report("Device hotunplug rejected by the guest "
>> -                         "for device %s", drc->dev->id);
>> +            error_report(qapi_error_fmt, drc->dev->id);
>>   
>> -            /*
>> -             * TODO: send a QAPI DEVICE_UNPLUG_ERROR event when
>> -             * it is implemented.
>> -             */
>> +            qapi_error = g_strdup_printf(qapi_error_fmt, drc->dev->id);
>> +            qapi_event_send_device_unplug_error(drc->dev->id, qapi_error);
>>           }
>>   
>>           return RTAS_OUT_SUCCESS; /* Nothing to do */
> 
> Reporting both to stderr and QMP is odd.  Can you describe a use case
> where the report to stderr is useful?
> 

