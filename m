Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D7054AD4C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 11:25:10 +0200 (CEST)
Received: from localhost ([::1]:59356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o12nN-000284-Fa
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 05:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o12c3-0002jF-Ie; Tue, 14 Jun 2022 05:13:27 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o12c1-00043s-Rb; Tue, 14 Jun 2022 05:13:27 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25E96oxv025105;
 Tue, 14 Jun 2022 09:13:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=AsHPdMCCmO+mLGHr7B/1wosU3xarpSCRUSnpXiXywtI=;
 b=KbLkfZx4f7hkPpSQrUEMx83851K637eN8ANJ9DGdFAqeR4uq4QbgTw1OsTVWHPpPSXOM
 P9DY4yyMVLDi0D5kZPGINbvfoyVifarXUGne/YKpgeiciNP062WGTrD1H1xPL+i5kZe+
 zj5Oc1hpiG5LeoQZuVO400EDxTFg7nWWmMCTWa9kZgYe1Ag9k6/bfN9cSKnD6T9+1tpb
 +6GWsda4rEyi5luqwi7T57Zw+oXvbGolo4dr0yappnG4BxWOiiZhXQxr9XJ0tbkQdO00
 axHvVbp6IQzctuk/1VBBnKSWTDNCMEk0jOOOP/mGIzs+7tExMXrtJjLsZC/Fg/KIQRen Nw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gpp6ha1gv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 09:13:15 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25E96snH000954;
 Tue, 14 Jun 2022 09:13:13 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3gmjp942j0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 09:13:13 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25E9DBvA17301764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 09:13:11 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47D60A4054;
 Tue, 14 Jun 2022 09:13:11 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D1B0A405C;
 Tue, 14 Jun 2022 09:13:11 +0000 (GMT)
Received: from [9.145.3.226] (unknown [9.145.3.226])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 14 Jun 2022 09:13:10 +0000 (GMT)
Message-ID: <09ed63ab-1d82-6924-3c8c-a025c4749314@linux.ibm.com>
Date: Tue, 14 Jun 2022 11:13:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 05/11] ppc/pnv: make pnv_ics_get() use the chip8->phbs[]
 array
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, mark.cave-ayland@ilande.co.uk
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
 <20220613154456.359674-6-danielhb@linux.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220613154456.359674-6-danielhb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2Bi652slP0aDq_2LD7LuhiBir8fZz06w
X-Proofpoint-ORIG-GUID: 2Bi652slP0aDq_2LD7LuhiBir8fZz06w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_02,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 mlxlogscore=714 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206140035
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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



On 13/06/2022 17:44, Daniel Henrique Barboza wrote:
> The function is working today by getting all the child objects of the
> chip, interacting with each of them to check whether the child is a PHB,
> and then doing what needs to be done.
> 
> We have all the chip PHBs in the phbs[] array so interacting with all
> child objects is unneeded.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
> ---
>   hw/ppc/pnv.c | 30 ++++++++++++++----------------
>   1 file changed, 14 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 40e0cbd84d..05a8d5034f 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1944,41 +1944,39 @@ typedef struct ForeachPhb3Args {
>       ICSState *ics;
>   } ForeachPhb3Args;
>   
> -static int pnv_ics_get_child(Object *child, void *opaque)
> +static void pnv_ics_get_phb_ics(PnvPHB3 *phb3, ForeachPhb3Args *args)
>   {
> -    ForeachPhb3Args *args = opaque;
> -    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
> +    if (ics_valid_irq(&phb3->lsis, args->irq)) {
> +        args->ics = &phb3->lsis;
> +    }
>   
> -    if (phb3) {
> -        if (ics_valid_irq(&phb3->lsis, args->irq)) {
> -            args->ics = &phb3->lsis;
> -        }
> -        if (ics_valid_irq(ICS(&phb3->msis), args->irq)) {
> -            args->ics = ICS(&phb3->msis);
> -        }
> +    if (ics_valid_irq(ICS(&phb3->msis), args->irq)) {
> +        args->ics = ICS(&phb3->msis);
>       }
> -    return args->ics ? 1 : 0;
>   }


It seems that we could gain in readability by dropping the 
ForeachPhb3Args structure completely.
The 'irq' member can just be an input argument to the function instead 
of the full structure.
The 'ics' member is no longer needed, it can be the returned value of 
the function (instead of void)

   Fred


>   
>   static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
>   {
>       PnvMachineState *pnv = PNV_MACHINE(xi);
>       ForeachPhb3Args args = { irq, NULL };
> -    int i;
> +    int i, j;
>   
>       for (i = 0; i < pnv->num_chips; i++) {
> -        PnvChip *chip = pnv->chips[i];
>           Pnv8Chip *chip8 = PNV8_CHIP(pnv->chips[i]);
>   
>           if (ics_valid_irq(&chip8->psi.ics, irq)) {
>               return &chip8->psi.ics;
>           }
>   
> -        object_child_foreach(OBJECT(chip), pnv_ics_get_child, &args);
> -        if (args.ics) {
> -            return args.ics;
> +        for (j = 0; j < chip8->num_phbs; j++) {
> +            pnv_ics_get_phb_ics(&chip8->phbs[j], &args);
> +
> +            if (args.ics) {
> +                return args.ics;
> +            }
>           }
>       }
> +
>       return NULL;
>   }
>   

