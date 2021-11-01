Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A54442058
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:54:17 +0100 (CET)
Received: from localhost ([::1]:49238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcRk-00035A-W6
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mhbYB-0005Q4-Ms
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:56:51 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mhbY9-0000h3-B1
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:56:51 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A1Hc7MT013595; 
 Mon, 1 Nov 2021 17:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=1ZkwHkMm4/siVEgTYsNkTeeRSMNNl2sfEIqJ1/3gOW8=;
 b=DGcocWmWa7U10jCY7BzsCLePSi0jvZyMCM96kIrNlSChStZSFc4Aco8bNNz2d0ZkcW02
 AhYQiX4awP2ZjrKBwH+icTGaUaqQ1tDyG1BqlgcNYMWC6pxe+jKGRHf3oHkdezAwAQdU
 r6VSgVUUCbQTO6lBtTuJEBpEJ8DM9Lf/i27lGEZuGwuEU4si2b6U9Qda3n2by5A0za9P
 8zvKprQ8AizemzMtzBrB+vY4dqNokER9ZqN9iFOQaDg47jDT9pm9b39xFaQtcNWzcDvZ
 8VZJMApBRJOehMWTmKN13C3yQxzU1pK335nHAp7uSjXr4xxDJ/8C548naiG/R4mKJpEw EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c2cydj28b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Nov 2021 17:56:46 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A1HcKNM013689;
 Mon, 1 Nov 2021 17:56:45 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c2cydj27x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Nov 2021 17:56:45 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A1Hqo8u020390;
 Mon, 1 Nov 2021 17:56:44 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 3c22trbyp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Nov 2021 17:56:44 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A1HugWL53477700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Nov 2021 17:56:42 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77B752805C;
 Mon,  1 Nov 2021 17:56:42 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F18B02806E;
 Mon,  1 Nov 2021 17:56:39 +0000 (GMT)
Received: from [9.65.202.213] (unknown [9.65.202.213])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  1 Nov 2021 17:56:39 +0000 (GMT)
Message-ID: <ea41121f-80df-f336-c63e-33ede8bac2d5@linux.ibm.com>
Date: Mon, 1 Nov 2021 19:56:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 1/3] sev/i386: Allow launching with -kernel if no OVMF
 hashes table found
Content-Language: en-US
To: Tom Lendacky <thomas.lendacky@amd.com>, qemu-devel@nongnu.org
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
 <20211101102136.1706421-2-dovmurik@linux.ibm.com>
 <24823e7a-b4e6-150c-df41-a373850301a7@amd.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <24823e7a-b4e6-150c-df41-a373850301a7@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HTZ5vlz_WMLQoQfBdaTxXUVxv3Bau4ir
X-Proofpoint-ORIG-GUID: ZOxS4e1ynCDyE0rzqX_z_R4JiactnSH9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-01_06,2021-11-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111010095
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ashish Kalra <ashish.kalra@amd.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 01/11/2021 16:25, Tom Lendacky wrote:
> On 11/1/21 5:21 AM, Dov Murik wrote:
>> Commit cff03145ed3c ("sev/i386: Introduce sev_add_kernel_loader_hashes
>> for measured linux boot", 2021-09-30) introduced measured direct boot
>> with -kernel, using an OVMF-designated hashes table which QEMU fills.
>>
>> However, if OVMF doesn't designate such an area, QEMU would completely
>> abort the VM launch.  This breaks launching with -kernel using older
>> OVMF images which don't publish the SEV_HASH_TABLE_RV_GUID.
>>
>> Instead, just warn the user that -kernel was supplied by OVMF doesn't
>> specify the GUID for the hashes table.  The following warning will be
>> displayed during VM launch:
>>
>>      qemu-system-x86_64: warning: SEV: kernel specified but OVMF has
>> no hash table guid
>>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>> Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
> 
> Just a few minor comments/questions below, otherwise:
> 
> Acked-by: Tom Lendacky <thomas.lendacky@amd.com>
> 
>> ---
>>   target/i386/sev.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/i386/sev.c b/target/i386/sev.c
>> index eede07f11d..682b8ccf6c 100644
>> --- a/target/i386/sev.c
>> +++ b/target/i386/sev.c
>> @@ -1204,7 +1204,7 @@ bool
>> sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
>>       int aligned_len;
>>         if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data,
>> NULL)) {
>> -        error_setg(errp, "SEV: kernel specified but OVMF has no hash
>> table guid");
>> +        warn_report("SEV: kernel specified but OVMF has no hash table
>> guid");
> 
> Not sure if warn or info would be better, either way works for me,
> though, since this allows the guest to boot now.

OK.

> 
> Unrelated to this change, but do we explicitly want to say OVMF? Can't
> another BIOS/UEFI implementation have this support?
> 

I don't mind saying "guest firmware" or "VM firmware" or "guest flash"
instead.  Note that the function name has "ovmf" in it...


> and should guid be GUID?

I agree; if we change "OVMF" I'll fix that as well.

-Dov


> 
> Thanks,
> Tom
> 
>>           return false;
>>       }
>>       area = (SevHashTableDescriptor *)data;
>>

