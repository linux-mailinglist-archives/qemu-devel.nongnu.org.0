Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A1454B4EB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 17:42:59 +0200 (CEST)
Received: from localhost ([::1]:58304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o18gs-0001iy-OK
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 11:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o18du-0000n7-H1; Tue, 14 Jun 2022 11:39:46 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o18dr-0000Xu-W3; Tue, 14 Jun 2022 11:39:46 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25EFVReX001109;
 Tue, 14 Jun 2022 15:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0GJ4Vp4ST4kaM8hpWdYbh0N2hbygybiSVPgSXDaNqKY=;
 b=BSROz02D327GyCHbJBce2PfSZ+mM7G6Npk2W1Z6bA1EcP9ISrKyErEYLE3L6Om5ltzN8
 YEFt2Vzx2aOmzIwGrVjRmH8l9bWm+396Lrm0R56eU1/xVbRyj3mLXRKJ0FWNbC8iO7up
 FLCoaU9s8H0hpj/xYrXiSGdgIrlyZF6UY8wTiK3lhmKOYSpvyI1+bOvwpK/poeh0YFH9
 9PLo85r90Em5pmGunepcBNO2fD0nB2627TNkYJq6DM/R+8FJ3fudQcPTGiPrFu9i5dXO
 K7fQ4BVjFSfTE62GG++sigj8QTl2NKlA2OCQ5i9rImVxwp+RATAG4WZjOMVTq46DNHoS aQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gpqnbag9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 15:39:28 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25EF5mpD019140;
 Tue, 14 Jun 2022 15:39:27 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 3gmjp9n9ms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 15:39:27 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25EFdQow10420910
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 15:39:26 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F22AC6055;
 Tue, 14 Jun 2022 15:39:26 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09E39C6083;
 Tue, 14 Jun 2022 15:39:25 +0000 (GMT)
Received: from [9.160.187.150] (unknown [9.160.187.150])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 14 Jun 2022 15:39:24 +0000 (GMT)
Message-ID: <3638290a-8bcb-699a-5304-e397853957b4@linux.ibm.com>
Date: Tue, 14 Jun 2022 12:39:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 08/11] ppc/pnv: turn chip8->phbs[] into a PnvPHB3* array
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, mark.cave-ayland@ilande.co.uk
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
 <20220613154456.359674-9-danielhb@linux.ibm.com>
 <d220e41c-a171-7263-a32c-3fc0d6c22ebd@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb@linux.ibm.com>
In-Reply-To: <d220e41c-a171-7263-a32c-3fc0d6c22ebd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mc52zRvaFFTzibZHyp18_6J9wqOjDmfJ
X-Proofpoint-GUID: mc52zRvaFFTzibZHyp18_6J9wqOjDmfJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_05,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206140061
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



On 6/14/22 06:53, Frederic Barrat wrote:
> 
> 
> On 13/06/2022 17:44, Daniel Henrique Barboza wrote:
>> When enabling user created PHBs (a change reverted by commit 9c10d86fee)
>> we were handling PHBs created by default versus by the user in different
>> manners. The only difference between these PHBs is that one will have a
>> valid phb3->chip that is assigned during pnv_chip_power8_realize(),
>> while the user created needs to search which chip it belongs to.
>>
>> Aside from that there shouldn't be any difference. Making the default
>> PHBs behave in line with the user created ones will make it easier to
>> re-introduce them later on. It will also make the code easier to follow
>> since we are dealing with them in equal manner.
>>
>> The first step is to turn chip8->phbs[] into a PnvPHB3 pointer array.
>> This will allow us to assign user created PHBs into it later on. The way
>> we initilize the default case is now more in line with that would happen
>> with the user created case: the object is created, parented by the chip
>> because pnv_xscom_dt() relies on it, and then assigned to the array.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
>> ---
> 
> 
> This patch is more prep work for the user-created device instead of general cleanup like the previous ones, but I don't see anything wrong with it. So:
> 
> Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>


I've been thinking about it and I guess I could do better with this
and the proxy pnv-phb series that is already in v2. What I'm thinking
is:

- crop patches 8-11 from this series. Patches 1-7 would be the prep cleanup
series;

- split the pnv-phb series in two:

   - first series will just introduce the pnv-phb devices and consolidate the
root ports. We're going to deal just with default devices. No consideration
about future user-created devices will be made;

   - a second series would then re-introduce user creatable phbs and root ports.
Patches 8-11 of this series would be handled in this second patch set since it's
closely related to user devices.


Does that sound fair?


Thanks,


Daniel




> 
>    Fred
> 
> 
> 
>>   hw/ppc/pnv.c         | 19 ++++++++++++++-----
>>   include/hw/ppc/pnv.h |  6 +++++-
>>   2 files changed, 19 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index 5e3323e950..6ce9e94e05 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -660,7 +660,7 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
>>       ics_pic_print_info(&chip8->psi.ics, mon);
>>       for (i = 0; i < chip8->num_phbs; i++) {
>> -        PnvPHB3 *phb3 = &chip8->phbs[i];
>> +        PnvPHB3 *phb3 = chip8->phbs[i];
>>           pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
>>           ics_pic_print_info(&phb3->lsis, mon);
>> @@ -1149,7 +1149,16 @@ static void pnv_chip_power8_instance_init(Object *obj)
>>       chip8->num_phbs = pcc->num_phbs;
>>       for (i = 0; i < chip8->num_phbs; i++) {
>> -        object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB3);
>> +        PnvPHB3 *phb3 = PNV_PHB3(object_new(TYPE_PNV_PHB3));
>> +
>> +        /*
>> +         * We need the chip to parent the PHB to allow the DT
>> +         * to build correctly (via pnv_xscom_dt()).
>> +         *
>> +         * TODO: the PHB should be parented by a PEC device.
>> +         */
>> +        object_property_add_child(obj, "phb[*]", OBJECT(phb3));
>> +        chip8->phbs[i] = phb3;
>>       }
>>   }
>> @@ -1278,7 +1287,7 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
>>       /* PHB3 controllers */
>>       for (i = 0; i < chip8->num_phbs; i++) {
>> -        PnvPHB3 *phb = &chip8->phbs[i];
>> +        PnvPHB3 *phb = chip8->phbs[i];
>>           object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
>>           object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
>> @@ -1963,7 +1972,7 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
>>           }
>>           for (j = 0; j < chip8->num_phbs; j++) {
>> -            pnv_ics_get_phb_ics(&chip8->phbs[j], &args);
>> +            pnv_ics_get_phb_ics(chip8->phbs[j], &args);
>>               if (args.ics) {
>>                   return args.ics;
>> @@ -1996,7 +2005,7 @@ static void pnv_ics_resend(XICSFabric *xi)
>>           Pnv8Chip *chip8 = PNV8_CHIP(pnv->chips[i]);
>>           for (j = 0; j < chip8->num_phbs; j++) {
>> -            PnvPHB3 *phb3 = &chip8->phbs[j];
>> +            PnvPHB3 *phb3 = chip8->phbs[j];
>>               ics_resend(&phb3->lsis);
>>               ics_resend(ICS(&phb3->msis));
>> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
>> index 033890a23f..11f1089289 100644
>> --- a/include/hw/ppc/pnv.h
>> +++ b/include/hw/ppc/pnv.h
>> @@ -80,7 +80,11 @@ struct Pnv8Chip {
>>       PnvHomer     homer;
>>   #define PNV8_CHIP_PHB3_MAX 4
>> -    PnvPHB3      phbs[PNV8_CHIP_PHB3_MAX];
>> +    /*
>> +     * The array is used to allow quick access to the phbs by
>> +     * pnv_ics_get_child() and pnv_ics_resend_child().
>> +     */
>> +    PnvPHB3      *phbs[PNV8_CHIP_PHB3_MAX];
>>       uint32_t     num_phbs;
>>       XICSFabric    *xics;

