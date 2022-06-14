Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B14754B446
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 17:13:11 +0200 (CEST)
Received: from localhost ([::1]:47568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o18E9-0000y1-Le
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 11:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o18D3-0008VV-6y; Tue, 14 Jun 2022 11:12:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:3006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o18D0-0004x9-Ld; Tue, 14 Jun 2022 11:12:00 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25EFBmwN021312;
 Tue, 14 Jun 2022 15:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=QIJUfdjZRy5chTEnpL523Sepddfaj6MJ8SPZ5Xi2Kmw=;
 b=fPHzC2mGoDmNj5hTHqO6QtYXgtnWJTa5xxsA1rxlsoWf2cpxZc0Q4z3yDg9TxbNaITe/
 SZgWHCZ7JD9oubd8UcTj7HRQt5TM/c9imQKNZaJOfUZzqSwQiP3zDC0ZX4dNthPkg52Q
 LSGnFQhzjLN880UNY9YHnLcLNftWxYmLV7qy2dKmTDXAVUBwp+3bH7K6vXcVuxx7k+Au
 a8NOMyMbnb9QI0GdWUf/e9MY57hNQ2WCzGOCXbFNUl3fiV84SFWHgTVjJ48M/BBlMYdk
 Lf9QJZLMxmX6XLOpH9r/3Xf5eb/xLzstOy7cvkUYWk4MrDVIIPCW4YPBjwN+d/bf+cPc 9A== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gpqnb9s8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 15:11:48 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25EF5d86004404;
 Tue, 14 Jun 2022 15:11:32 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 3gmjpa2ae6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 15:11:32 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25EFBVLQ20709698
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 15:11:31 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80B48C605A;
 Tue, 14 Jun 2022 15:11:31 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFCD2C6057;
 Tue, 14 Jun 2022 15:11:29 +0000 (GMT)
Received: from [9.160.187.150] (unknown [9.160.187.150])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 14 Jun 2022 15:11:29 +0000 (GMT)
Message-ID: <4d2ff9d6-3e65-087b-cbc6-7b4a8f4fc094@linux.ibm.com>
Date: Tue, 14 Jun 2022 12:11:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 06/11] ppc/pnv: make pnv_ics_resend() use chip8->phbs[]
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, mark.cave-ayland@ilande.co.uk
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
 <20220613154456.359674-7-danielhb@linux.ibm.com>
 <deb180db-a6be-906d-dc86-f8c0830be22e@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb@linux.ibm.com>
In-Reply-To: <deb180db-a6be-906d-dc86-f8c0830be22e@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JOwqfOlmXX4gqU_7RCZl3YqYspQbSNMJ
X-Proofpoint-GUID: JOwqfOlmXX4gqU_7RCZl3YqYspQbSNMJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_05,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 mlxlogscore=740 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206140059
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=danielhb@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/14/22 06:24, Frederic Barrat wrote:
> 
> 
> On 13/06/2022 17:44, Daniel Henrique Barboza wrote:
>> pnv_ics_resend() is scrolling through all the child objects of the chip
>> to search for the PHBs. It's faster and simpler to just use the phbs[]
>> array.
>>
>> pnv_ics_resend_child() was folded into pnv_ics_resend() since it's too
>> simple to justify its own function.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
>> ---
>>   hw/ppc/pnv.c | 22 +++++++---------------
>>   1 file changed, 7 insertions(+), 15 deletions(-)
>>
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index 05a8d5034f..d70deffa1d 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -1993,28 +1993,20 @@ PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
>>       return NULL;
>>   }
>> -static int pnv_ics_resend_child(Object *child, void *opaque)
>> -{
>> -    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
>> -
>> -    if (phb3) {
>> -        ics_resend(&phb3->lsis);
>> -        ics_resend(ICS(&phb3->msis));
>> -    }
>> -    return 0;
>> -}
>> -
>>   static void pnv_ics_resend(XICSFabric *xi)
>>   {
>>       PnvMachineState *pnv = PNV_MACHINE(xi);
>> -    int i;
>> +    int i, j;
>>       for (i = 0; i < pnv->num_chips; i++) {
>> -        PnvChip *chip = pnv->chips[i];
>>           Pnv8Chip *chip8 = PNV8_CHIP(pnv->chips[i]);
>> -        ics_resend(&chip8->psi.ics);
> 
> 
> That line shouldn't be dropped, right?

oooffff. It shouldn't. I'll fix it in the v2.


It didn't break anything I could see though. OS boots with network
with ping ....



Daniel

> 
>    Fred
> 
> 
>> -        object_child_foreach(OBJECT(chip), pnv_ics_resend_child, NULL);
>> +        for (j = 0; j < chip8->num_phbs; j++) {
>> +            PnvPHB3 *phb3 = &chip8->phbs[j];
>> +
>> +            ics_resend(&phb3->lsis);
>> +            ics_resend(ICS(&phb3->msis));
>> +        }
>>       }
>>   }
> 

