Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A8F22B132
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jul 2020 16:23:12 +0200 (CEST)
Received: from localhost ([::1]:35326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyc7r-0003Hw-4k
	for lists+qemu-devel@lfdr.de; Thu, 23 Jul 2020 10:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jyc6n-0002b5-Vb
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 10:22:05 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:28810
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jyc6m-0006F7-CS
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 10:22:05 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06NE24aM023355
 for <qemu-devel@nongnu.org>; Thu, 23 Jul 2020 10:22:03 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32facsbamc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 23 Jul 2020 10:22:03 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06NE2Bph024348
 for <qemu-devel@nongnu.org>; Thu, 23 Jul 2020 10:22:02 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32facsbam3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 10:22:02 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06NEF4cF030760;
 Thu, 23 Jul 2020 14:22:02 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 32brq9mwd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 14:22:02 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06NEM1xB56689144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 14:22:01 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC013B2064;
 Thu, 23 Jul 2020 14:22:01 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2C6FB205F;
 Thu, 23 Jul 2020 14:22:01 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 23 Jul 2020 14:22:01 +0000 (GMT)
Subject: Re: [PATCH for-5.1 2/2] tpm: Improve help on TPM types when none are
 available
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200723115845.1865886-1-armbru@redhat.com>
 <20200723115845.1865886-3-armbru@redhat.com>
 <42246b2f-e267-b254-10cf-0dc491d5f99e@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <e0270711-f453-fa99-dc2e-74032b24118c@linux.ibm.com>
Date: Thu, 23 Jul 2020 10:22:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <42246b2f-e267-b254-10cf-0dc491d5f99e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_06:2020-07-23,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007230102
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/23 10:22:03
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/23/20 8:49 AM, Philippe Mathieu-Daudé wrote:
> On 7/23/20 1:58 PM, Markus Armbruster wrote:
>> Help is a bit awkward when no TPM types are built into QEMU:
>>
>>      $ upstream-qemu -tpmdev nonexistent,id=tpm0
>>      upstream-qemu: -tpmdev nonexistent,id=tpm0: Parameter 'type' expects a TPM backend type
>>      Supported TPM types (choose only one):
>>
>> Improve to
>>
>>      upstream-qemu: -tpmdev nonexistent,id=tpm0: Parameter 'type' expects a TPM backend type
>>      No TPM backend types are available
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


>
>> ---
>>   tpm.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/tpm.c b/tpm.c
>> index f6045bb6da..cab206355a 100644
>> --- a/tpm.c
>> +++ b/tpm.c
>> @@ -47,18 +47,23 @@ tpm_be_find_by_type(enum TpmType type)
>>    */
>>   static void tpm_display_backend_drivers(void)
>>   {
>> +    bool got_one = false;
>>       int i;
>>   
>> -    fprintf(stderr, "Supported TPM types (choose only one):\n");
>> -
>>       for (i = 0; i < TPM_TYPE__MAX; i++) {
>>           const TPMBackendClass *bc = tpm_be_find_by_type(i);
>>           if (!bc) {
>>               continue;
>>           }
>> -        fprintf(stderr, "%12s   %s\n", TpmType_str(i), bc->desc);
>> +        if (!got_one) {
>> +            error_printf("Supported TPM types (choose only one):\n");
>> +            got_one = true;
>> +        }
>> +        error_printf("%12s   %s\n", TpmType_str(i), bc->desc);
>> +    }
>> +    if (!got_one) {
>> +        error_printf("No TPM backend types are available\n");
>>       }
>> -    fprintf(stderr, "\n");
>>   }
>>   
>>   /*
>>


