Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E174A2D0BFC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 09:49:12 +0100 (CET)
Received: from localhost ([::1]:44612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmCCl-0006h1-Py
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 03:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ankur.a.arora@oracle.com>)
 id 1kmCB1-0005qi-AB
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 03:47:23 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:60742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ankur.a.arora@oracle.com>)
 id 1kmCAy-0004Cy-F0
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 03:47:22 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B78de6n152217;
 Mon, 7 Dec 2020 08:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=v0klcQzRARB8Iz3yVPz4uLDtUlYxbpX3y0/U/OCZI6A=;
 b=HOJszh2++ts7LHL99UyjdI69o6wwOXvlUyCaP4eaW/+VeUxn2w6uzf6s7uMv2BWCmM3z
 ngD/6f22qLHvBNBtJx4lpz+NhhMkDuxcS3HQX5bh5qr1LPahQH2gT2GYIuw+ApgpMJtp
 eCT0gEECE3xYMSpqRQXlkc3mEjQrvhVhDDTNB2aEeP83utVTqiqM2LCbOClSzx1IPFfc
 TJ7EU1uuiWUbfMamSUkt5ExsThF3egGsr4dK9fV9OOIVyer/Hq7Gh+NaSIclhpxvu1xH
 nOMj1/LggWARmlBJaJuvOn7CZ+RtVZmrCFJWgmgKPktcFMLMtVBR8w4WuPTMQf6+7T0Y 8g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 35825kv3jh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 07 Dec 2020 08:47:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B78jdlB022986;
 Mon, 7 Dec 2020 08:47:15 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 358m4vrarw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Dec 2020 08:47:15 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B78lEEH006971;
 Mon, 7 Dec 2020 08:47:15 GMT
Received: from [10.159.238.131] (/10.159.238.131)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 07 Dec 2020 00:47:14 -0800
Subject: Re: [PATCH 2/8] acpi: cpuhp: introduce 'firmware performs eject'
 status/control bits
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20201204170939.1815522-1-imammedo@redhat.com>
 <20201204170939.1815522-3-imammedo@redhat.com>
 <891d22af-617c-7962-4fe8-e60cd18f4df3@oracle.com>
Message-ID: <8e0d95ec-2a49-5c7e-7ed0-dde807a8c028@oracle.com>
Date: Mon, 7 Dec 2020 00:47:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <891d22af-617c-7962-4fe8-e60cd18f4df3@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9827
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012070056
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9827
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012070055
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=ankur.a.arora@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lersek@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020-12-06 10:31 p.m., Ankur Arora wrote:
> On 2020-12-04 9:09 a.m., Igor Mammedov wrote:
>> Adds bit #4 to status/control field of CPU hotplug MMIO interface.
>> New bit will be used OSPM to mark CPUs as pending for removal by firmware,
>> when it calls _EJ0 method on CPU device node. Later on, when firmware
>> sees this bit set, it will perform CPU eject which will clear bit #4
>> as well.
>>
>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>> ---
>> v1:
>>    - rearrange status/control bits description (Laszlo)
>>    - add clear bit #4 on eject
>>    - drop toggling logic from bit #4, it can be only set by guest
>>      and clear as part of cpu eject
>>    - exclude boot CPU from remove request
>>    - add trace events for new bit
>> ---
>>   include/hw/acpi/cpu.h           |  1 +
>>   docs/specs/acpi_cpu_hotplug.txt | 19 ++++++++++++++-----
>>   hw/acpi/cpu.c                   |  9 +++++++++
>>   hw/acpi/trace-events            |  2 ++
>>   4 files changed, 26 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
>> index 0eeedaa491..d71edde456 100644
>> --- a/include/hw/acpi/cpu.h
>> +++ b/include/hw/acpi/cpu.h
>> @@ -22,6 +22,7 @@ typedef struct AcpiCpuStatus {
>>       uint64_t arch_id;
>>       bool is_inserting;
>>       bool is_removing;
>> +    bool fw_remove;
>>       uint32_t ost_event;
>>       uint32_t ost_status;
>>   } AcpiCpuStatus;
>> diff --git a/docs/specs/acpi_cpu_hotplug.txt b/docs/specs/acpi_cpu_hotplug.txt
>> index 9bb22d1270..9bd59ae0da 100644
>> --- a/docs/specs/acpi_cpu_hotplug.txt
>> +++ b/docs/specs/acpi_cpu_hotplug.txt
>> @@ -56,8 +56,11 @@ read access:
>>                 no device check event to OSPM was issued.
>>                 It's valid only when bit 0 is set.
>>              2: Device remove event, used to distinguish device for which
>> -              no device eject request to OSPM was issued.
>> -           3-7: reserved and should be ignored by OSPM
>> +              no device eject request to OSPM was issued. Firmware must
>> +              ignore this bit.
>> +           3: reserved and should be ignored by OSPM
>> +           4: if set to 1, OSPM requests firmware to perform device eject.
>> +           5-7: reserved and should be ignored by OSPM
>>       [0x5-0x7] reserved
>>       [0x8] Command data: (DWORD access)
>>             contains 0 unless value last stored in 'Command field' is one of:
>> @@ -79,10 +82,16 @@ write access:
>>                  selected CPU device
>>               2: if set to 1 clears device remove event, set by OSPM
>>                  after it has emitted device eject request for the
>> -               selected CPU device
>> +               selected CPU device.
>>               3: if set to 1 initiates device eject, set by OSPM when it
>> -               triggers CPU device removal and calls _EJ0 method
>> -            4-7: reserved, OSPM must clear them before writing to register
>> +               triggers CPU device removal and calls _EJ0 method or by firmware
>> +               when bit #4 is set. In case bit #4 were set, it's cleared as
>> +               part of device eject.

So I spent some time testing my OVMF series alongside this.
Just sent out the code on the EDK2 list.

To do the eject, I'm setting bit#3 after queuing up the processor
for removal (via RemoveProcessor()).

This means, however, that the unplug in QEMU would happen before the
real firmware unplug (which'll happen in SmmCpuUpdate()).

Clearly, the right place for eject would be either in the appropriate
APHandler() or in the BSPHandler() after all the APs have been waited
for but from my reading of related code I don't see any infrastructure
for doing this (admittedly, I don't know the EDK2 source well enough
so it's likely I missed something.)

The other possibility might be to do it in the _EJ0 method itself
after we return from the SMI:

@@ -479,9 +515,8 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
                  aml_append(method, aml_store(one, fw_ej_evt));
                  aml_append(method, aml_store(aml_int(OVMF_CPUHP_SMI_CMD),
                             aml_name("%s", opts.smi_path)));
-            } else {
-                aml_append(method, aml_store(one, ej_evt));
-            }
+           }
+            aml_append(method, aml_store(one, ej_evt));
              aml_append(method, aml_release(ctrl_lock));

This seems to work but it is possible I'm missing something here.


Opinions?

Ankur

>> +            4: if set to 1, OSPM hands over device eject to firmware.
>> +               Firmware shall issue device eject request as described above
>> +               (bit #3) and OSPM should not touch device eject bit (#3) in case
>> +               it's asked firmware to perform CPU device eject.
>> +            5-7: reserved, OSPM must clear them before writing to register
>>       [0x5] Command field: (1 byte access)
>>             value:
>>               0: selects a CPU device with inserting/removing events and
>> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
>> index f099b50927..811218f673 100644
>> --- a/hw/acpi/cpu.c
>> +++ b/hw/acpi/cpu.c
>> @@ -71,6 +71,7 @@ static uint64_t cpu_hotplug_rd(void *opaque, hwaddr addr, unsigned size)
>>           val |= cdev->cpu ? 1 : 0;
>>           val |= cdev->is_inserting ? 2 : 0;
>>           val |= cdev->is_removing  ? 4 : 0;
>> +        val |= cdev->fw_remove  ? 16 : 0;
>>           trace_cpuhp_acpi_read_flags(cpu_st->selector, val);
>>           break;
>>       case ACPI_CPU_CMD_DATA_OFFSET_RW:
>> @@ -148,6 +149,14 @@ static void cpu_hotplug_wr(void *opaque, hwaddr addr, uint64_t data,
>>               hotplug_ctrl = qdev_get_hotplug_handler(dev);
>>               hotplug_handler_unplug(hotplug_ctrl, dev, NULL);
>>               object_unparent(OBJECT(dev));
>> +            cdev->fw_remove = false;
>> +        } else if (data & 16) {
>> +            if (!cdev->cpu || cdev->cpu == first_cpu) {
>> +                trace_cpuhp_acpi_fw_remove_invalid_cpu(cpu_st->selector);
>> +                break;
>> +            }
>> +            trace_cpuhp_acpi_fw_remove_cpu(cpu_st->selector);
>> +            cdev->fw_remove = true;
>>           }
>>           break;
> 
> By the time the firmware gets the MMI, cdev->is_removing == 0. So we probably
> need the cdev->fw_remove clause as well.
> 
> @@ -168,7 +193,7 @@ static void cpu_hotplug_wr(void *opaque, hwaddr addr, uint64_t data,
> 
>                   do {
>                       cdev = &cpu_st->devs[iter];
> -                    if (cdev->is_inserting || cdev->is_removing) {
> +                    if (cdev->is_inserting || cdev->is_removing || cdev->fw_remove) {
>                           cpu_st->selector = iter;
>                           trace_cpuhp_acpi_cpu_has_events(cpu_st->selector,
>                               cdev->is_inserting, cdev->is_removing);
> 
> 
> Ankur
> 
>>       case ACPI_CPU_CMD_OFFSET_WR:
>> diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
>> index afbc77de1c..f91ced477d 100644
>> --- a/hw/acpi/trace-events
>> +++ b/hw/acpi/trace-events
>> @@ -29,6 +29,8 @@ cpuhp_acpi_clear_inserting_evt(uint32_t idx) "idx[0x%"PRIx32"]"
>>   cpuhp_acpi_clear_remove_evt(uint32_t idx) "idx[0x%"PRIx32"]"
>>   cpuhp_acpi_ejecting_invalid_cpu(uint32_t idx) "0x%"PRIx32
>>   cpuhp_acpi_ejecting_cpu(uint32_t idx) "0x%"PRIx32
>> +cpuhp_acpi_fw_remove_invalid_cpu(uint32_t idx) "0x%"PRIx32
>> +cpuhp_acpi_fw_remove_cpu(uint32_t idx) "0x%"PRIx32
>>   cpuhp_acpi_write_ost_ev(uint32_t slot, uint32_t ev) "idx[0x%"PRIx32"] OST EVENT: 0x%"PRIx32
>>   cpuhp_acpi_write_ost_status(uint32_t slot, uint32_t st) "idx[0x%"PRIx32"] OST STATUS: 0x%"PRIx32
>>

