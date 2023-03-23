Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023866C6C62
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 16:37:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfMyv-00030a-Lo; Thu, 23 Mar 2023 11:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pfMyl-0002zD-M1
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 11:35:51 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pfMyj-0002bj-QZ
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 11:35:51 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32NEsTLS024947; Thu, 23 Mar 2023 15:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=UMg5JQLsdm8f/9yQveSaYGAiAFzTiXpzo6PxI3z3Voc=;
 b=luNoMAlSCLG/G3ekisPhc3+WITYZuUkiLJn2vmWynKxiq+uDNCNw1HRuGfJrxRn/QMUH
 QfCl1qJAhyKuEN9fpr09uOi0sa6pUqcvr8hzFgb/gwNbxqgYlLUf9C/zzxNO2ZYfg35j
 YMtn5FNXwwJh43diJ5R+hpZAwLKJGbOeOr5JraJ4b9hSNAX/+MuCT3kKFyhGA7C1Hxx5
 adnsYclhLehce5iwrLi8oDCBMAxOt8KZF0JS8iPGCg01ntdCBRm1F1SQLrkbT86tf6GV
 RST43hCqgXtjJOtYWR5/XTIWmPHSyimkr6uUIDL4zqd0QpYW6kt3mWqmnDod9m37YFr1 ng== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgmu7g7as-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 15:35:32 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32NEFQ9J014726;
 Thu, 23 Mar 2023 15:35:32 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3pd4x7p524-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 15:35:32 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32NFZUEf47710736
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Mar 2023 15:35:30 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C028F58059;
 Thu, 23 Mar 2023 15:35:30 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8602E58057;
 Thu, 23 Mar 2023 15:35:30 +0000 (GMT)
Received: from [9.163.39.211] (unknown [9.163.39.211])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 23 Mar 2023 15:35:30 +0000 (GMT)
Message-ID: <fc7303e8-e847-9717-c83a-d9b0f812bddf@linux.vnet.ibm.com>
Date: Thu, 23 Mar 2023 10:35:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] TPM TIS: Add support for TPM devices over I2C bus
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, stefanb@linux.ibm.com
References: <20230323030119.2113570-1-ninad@linux.ibm.com>
 <20230323030119.2113570-3-ninad@linux.ibm.com>
 <18fd2a6a-a7e6-f9d4-e993-05dc2142f4d4@kaod.org>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <18fd2a6a-a7e6-f9d4-e993-05dc2142f4d4@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QOVGflaazH9fKbkc5VOKFi--kuWIGqFK
X-Proofpoint-GUID: QOVGflaazH9fKbkc5VOKFi--kuWIGqFK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303230113
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=ninad@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 3/23/23 2:44 AM, Cédric Le Goater wrote:
> On 3/23/23 04:01, Ninad Palsule wrote:
>> Qemu already supports devices attached to ISA and sysbus. This drop adds
>> support for the I2C bus attached TPM devices.
>>
>> This commit includes changes for the common code.
>> - Added support for the new checksum registers which are required for
>>    the I2C support. The checksum calculation is handled in the qemu
>>    common code.
>> - Added wrapper function for read and write data so that I2C code can
>>    call it without MMIO interface.
>>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>> ---
>> V2:
>>
>> Incorporated Stephen's comments.
>>
>> - Removed checksum enable and checksum get registers.
>> - Added checksum calculation function which can be called from
>>    i2c layer.
>> ---
>>   hw/tpm/tpm_tis.h        |  3 +++
>>   hw/tpm/tpm_tis_common.c | 32 ++++++++++++++++++++++++++++++++
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/hw/tpm/tpm_tis.h b/hw/tpm/tpm_tis.h
>> index f6b5872ba6..6f29a508dd 100644
>> --- a/hw/tpm/tpm_tis.h
>> +++ b/hw/tpm/tpm_tis.h
>> @@ -86,5 +86,8 @@ int tpm_tis_pre_save(TPMState *s);
>>   void tpm_tis_reset(TPMState *s);
>>   enum TPMVersion tpm_tis_get_tpm_version(TPMState *s);
>>   void tpm_tis_request_completed(TPMState *s, int ret);
>> +uint32_t tpm_tis_read_data(TPMState *s, hwaddr addr, unsigned size);
>> +void tpm_tis_write_data(TPMState *s, hwaddr addr, uint64_t val, 
>> uint32_t size);
>> +uint16_t tpm_tis_get_checksum(TPMState *s);
>>     #endif /* TPM_TPM_TIS_H */
>> diff --git a/hw/tpm/tpm_tis_common.c b/hw/tpm/tpm_tis_common.c
>> index 503be2a541..b1acde74cb 100644
>> --- a/hw/tpm/tpm_tis_common.c
>> +++ b/hw/tpm/tpm_tis_common.c
>> @@ -26,6 +26,8 @@
>>   #include "hw/irq.h"
>>   #include "hw/isa/isa.h"
>>   #include "qapi/error.h"
>> +#include "qemu/bswap.h"
>> +#include "qemu/crc-ccitt.h"
>>   #include "qemu/module.h"
>>     #include "hw/acpi/tpm.h"
>> @@ -447,6 +449,27 @@ static uint64_t tpm_tis_mmio_read(void *opaque, 
>> hwaddr addr,
>>       return val;
>>   }
>>   +/*
>> + * A wrapper read function so that it can be directly called without
>> + * mmio.
>> + */
>> +uint32_t tpm_tis_read_data(TPMState *s, hwaddr addr, unsigned size)
>> +{
>> +    return tpm_tis_mmio_read(s, addr, size);
>> +}
>> +
>> +/*
>> + * Calculate current data buffer checksum
>> + */
>> +uint16_t tpm_tis_get_checksum(TPMState *s)
>> +{
>> +    uint16_t val = 0xffff;
>> +
>> +    val = cpu_to_be16(crc_ccitt(0, s->buffer, s->rw_offset));
>
> this routine could simply return cpu_to_be16(....
>
Done.

Thank you for the review.

Ninad

> Thanks,
>
> C.
>
>
>> +
>> +    return val;
>> +}
>> +
>>   /*
>>    * Write a value to a register of the TIS interface
>>    * See specs pages 33-63 for description of the registers
>> @@ -767,6 +790,15 @@ static void tpm_tis_mmio_write(void *opaque, 
>> hwaddr addr,
>>       }
>>   }
>>   +/*
>> + * A wrapper write function so that it can be directly called without
>> + * mmio.
>> + */
>> +void tpm_tis_write_data(TPMState *s, hwaddr addr, uint64_t val, 
>> uint32_t size)
>> +{
>> +    tpm_tis_mmio_write(s, addr, val, size);
>> +}
>> +
>>   const MemoryRegionOps tpm_tis_memory_ops = {
>>       .read = tpm_tis_mmio_read,
>>       .write = tpm_tis_mmio_write,
>

