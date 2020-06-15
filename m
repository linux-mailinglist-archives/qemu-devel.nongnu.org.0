Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4C01F9D22
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 18:21:49 +0200 (CEST)
Received: from localhost ([::1]:51380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkrro-0001Ts-2p
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 12:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jkrpH-0008DV-7D
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 12:19:11 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jkrpF-0004HW-4I
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 12:19:10 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FG6p6R075365
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 12:19:07 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31pc7pgbyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 12:19:06 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05FG6t8Z076021
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 12:19:05 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31pc7pgbxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 12:19:05 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05FGEvYo031630;
 Mon, 15 Jun 2020 16:19:04 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 31mpe9f463-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 16:19:04 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05FGJ2rV11469168
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jun 2020 16:19:02 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BA766E056;
 Mon, 15 Jun 2020 16:19:03 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC77F6E054;
 Mon, 15 Jun 2020 16:19:02 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 15 Jun 2020 16:19:02 +0000 (GMT)
Subject: Re: [PATCH v2 2/5] tpm: Extend TPMIfClass with get_irqnum() function
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20200615142327.671546-1-stefanb@linux.vnet.ibm.com>
 <20200615142327.671546-3-stefanb@linux.vnet.ibm.com>
 <755b35ea-fae7-e683-bb7b-6496f14bd66c@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <33fab40a-585d-18f7-1017-550a35094d1a@linux.ibm.com>
Date: Mon, 15 Jun 2020 12:19:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <755b35ea-fae7-e683-bb7b-6496f14bd66c@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_03:2020-06-15,
 2020-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 clxscore=1015 cotscore=-2147483648 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006150111
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 08:37:04
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mkedzier@redhat.com,
 Stefan Berger <stefanb@sbct-2.pok.ibm.com>, eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/20 11:54 AM, Philippe Mathieu-Daudé wrote:
> On 6/15/20 4:23 PM, Stefan Berger wrote:
>> From: Stefan Berger <stefanb@sbct-2.pok.ibm.com>
>>
>> Implement get_irqnum() as part of the TPMIfClass to be get the assigned
>> IRQ number.
>>
>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>> ---
>>   hw/tpm/tpm_tis_isa.c    |  9 +++++++++
>>   hw/tpm/tpm_tis_sysbus.c |  9 +++++++++
>>   include/sysemu/tpm.h    | 10 ++++++++++
>>   3 files changed, 28 insertions(+)
>>
>> diff --git a/hw/tpm/tpm_tis_isa.c b/hw/tpm/tpm_tis_isa.c
>> index 30ba37079d..63b62f4c21 100644
>> --- a/hw/tpm/tpm_tis_isa.c
>> +++ b/hw/tpm/tpm_tis_isa.c
>> @@ -80,6 +80,14 @@ static enum TPMVersion tpm_tis_isa_get_tpm_version(TPMIf *ti)
>>       return tpm_tis_get_tpm_version(s);
>>   }
>>   
>> +static uint8_t tpm_tis_isa_get_irqnum(TPMIf *ti)
>> +{
>> +    TPMStateISA *isadev = TPM_TIS_ISA(ti);
>> +    TPMState *s = &isadev->state;
>> +
>> +    return s->irq_num;
>> +}
>> +
>>   static void tpm_tis_isa_reset(DeviceState *dev)
>>   {
>>       TPMStateISA *isadev = TPM_TIS_ISA(dev);
>> @@ -148,6 +156,7 @@ static void tpm_tis_isa_class_init(ObjectClass *klass, void *data)
>>       dc->reset = tpm_tis_isa_reset;
>>       tc->request_completed = tpm_tis_isa_request_completed;
>>       tc->get_version = tpm_tis_isa_get_tpm_version;
>> +    tc->get_irqnum = tpm_tis_isa_get_irqnum;
>>   }
>>   
>>   static const TypeInfo tpm_tis_isa_info = {
>> diff --git a/hw/tpm/tpm_tis_sysbus.c b/hw/tpm/tpm_tis_sysbus.c
>> index eced1fc843..6cf45e5057 100644
>> --- a/hw/tpm/tpm_tis_sysbus.c
>> +++ b/hw/tpm/tpm_tis_sysbus.c
>> @@ -80,6 +80,14 @@ static enum TPMVersion tpm_tis_sysbus_get_tpm_version(TPMIf *ti)
>>       return tpm_tis_get_tpm_version(s);
>>   }
>>   
>> +static uint8_t tpm_tis_sysbus_get_irqnum(TPMIf *ti)
>> +{
>> +    TPMStateSysBus *sbdev = TPM_TIS_SYSBUS(ti);
>> +    TPMState *s = &sbdev->state;
>> +
>> +    return s->irq_num;
>> +}
>> +
>>   static void tpm_tis_sysbus_reset(DeviceState *dev)
>>   {
>>       TPMStateSysBus *sbdev = TPM_TIS_SYSBUS(dev);
>> @@ -137,6 +145,7 @@ static void tpm_tis_sysbus_class_init(ObjectClass *klass, void *data)
>>       dc->reset = tpm_tis_sysbus_reset;
>>       tc->request_completed = tpm_tis_sysbus_request_completed;
>>       tc->get_version = tpm_tis_sysbus_get_tpm_version;
>> +    tc->get_irqnum = tpm_tis_sysbus_get_irqnum;
>>   }
>>   
>>   static const TypeInfo tpm_tis_sysbus_info = {
>> diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
>> index 03fb25941c..b94a8a2b16 100644
>> --- a/include/sysemu/tpm.h
>> +++ b/include/sysemu/tpm.h
>> @@ -41,6 +41,7 @@ typedef struct TPMIfClass {
>>       enum TpmModel model;
>>       void (*request_completed)(TPMIf *obj, int ret);
>>       enum TPMVersion (*get_version)(TPMIf *obj);
>> +    uint8_t (*get_irqnum)(TPMIf *obj);
>>   } TPMIfClass;
>>   
>>   #define TYPE_TPM_TIS_ISA            "tpm-tis"
>> @@ -74,4 +75,13 @@ static inline TPMVersion tpm_get_version(TPMIf *ti)
>>       return TPM_IF_GET_CLASS(ti)->get_version(ti);
>>   }
>>   
>> +static inline uint8_t tpm_get_irqnum(TPMIf *ti)
>> +{
>> +    if (!ti || !TPM_IF_GET_CLASS(ti)->get_irqnum) {
>> +        return 0;
> 0 is valid...
>
> Shouldn't we use an Error* argument?
>
> Else return -1 when invalid?

Indeed. Let me fix this. Thanks.


>
>> +    }
>> +
>> +    return TPM_IF_GET_CLASS(ti)->get_irqnum(ti);
>> +}
>> +
>>   #endif /* QEMU_TPM_H */
>>


