Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCBB54AE23
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 12:19:06 +0200 (CEST)
Received: from localhost ([::1]:46076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o13dY-0004Oo-RH
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 06:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o13Zg-0002Cl-8c; Tue, 14 Jun 2022 06:15:05 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:61902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o13ZY-0006fm-R2; Tue, 14 Jun 2022 06:15:03 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25E8r0Oa015441;
 Tue, 14 Jun 2022 10:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=5Uta4SHRt5DTvxgCDb3al1rTSdBRb8Nyd3UjbE5tMio=;
 b=KozQ/8luoZ352fHhnSFqluwCH7icNcYLCNogmBWbMeZ6EKbeCfiiiHbsUeETHpXA0SGH
 Qu+H1ac+AXFoFpAmNJdHrA7+6IOWzcA/8XIJHA9KPded+Vwha9d91UpI69hcVAL2j9lu
 vinBT7hy/VOvs9VzCEN39GVWQabHodWVgctATm3/evAOzaPau+mDhUmdnbwIS6DNTcBJ
 bnbB38IbAh3GGBTISHUX2JIfgN/jGKET12LtgTv/oLAgWDZiHimXQkiFf3/3qywnrjYd
 LDLWFP/SK6sXerWpFuxW8ibftTD7cETia0uq+kkkY1sUKMaEfAzw3bHEUe7EdqmljNzp dA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gpq76t5sg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 10:14:42 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25EA5TcT001973;
 Tue, 14 Jun 2022 10:14:40 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3gmjp8u7wj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 10:14:40 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25EAEb3D21823832
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 10:14:37 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8C5DA405B;
 Tue, 14 Jun 2022 10:14:37 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E7CDA4054;
 Tue, 14 Jun 2022 10:14:37 +0000 (GMT)
Received: from [9.145.3.226] (unknown [9.145.3.226])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 14 Jun 2022 10:14:37 +0000 (GMT)
Message-ID: <b663e01e-f20d-e58d-857f-9e3a09e95217@linux.ibm.com>
Date: Tue, 14 Jun 2022 12:14:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 10/11] ppc/pnv: move PHB3 initialization to realize time
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, mark.cave-ayland@ilande.co.uk
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
 <20220613154456.359674-11-danielhb@linux.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220613154456.359674-11-danielhb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: k8k2T8kxUUGHj6VrxTWfFgRSA_AJ4K48
X-Proofpoint-GUID: k8k2T8kxUUGHj6VrxTWfFgRSA_AJ4K48
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_02,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206140040
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
> There's nothing special that is being done in
> pnv_chip_power8_instance_init() that can't be done during
> pnv_chip_power8_realize(). Move the PHB creating and phbs[] assignment
> to power8_realize().
> 
> We also need to assign a proper phb->chip parent and bus. This is done
> by the PHB itself, in pnv_phb3_realize(), in a similar fashion that user
> created PHB3s are going to do.
> 
> After all this we're left with logic that, aside from phb chip
> assignment that are still being done in power8_realize(), behaves the
> same for default and user created PHB3s.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
> ---
>   hw/pci-host/pnv_phb3.c | 14 ++++++++++++++
>   hw/ppc/pnv.c           | 24 +++++-------------------
>   2 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index bda23fd20b..c1c73fb88d 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -998,6 +998,20 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> +    /*
> +     * We need the chip to parent the PHB to allow the DT
> +     * to build correctly (via pnv_xscom_dt()).
> +     *
> +     * TODO: the PHB should be parented by a PHB3 PEC device.
> +     */
> +    pnv_parent_qom_fixup(OBJECT(phb->chip), OBJECT(phb), phb->phb_id);
> +


Wouldn't we get the same result in a cleaner way by adding the phb as a 
child of the chip in pnv_chip_power8_realize() ? Right next to when the 
PnvPHB3 object pointer is added to the chip8->phbs array

   Fred


> +    /*
> +     * pnv-phb3 buses are child of the main-system-bus, same as
> +     * the chip.
> +     */
> +    pnv_parent_bus_fixup(DEVICE(phb->chip), dev);
> +
>       /* LSI sources */
>       object_property_set_link(OBJECT(&phb->lsis), "xics", OBJECT(pnv),
>                                &error_abort);
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index d77c90d64a..e4080a98e1 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1130,8 +1130,6 @@ static void pnv_chip_power10_intc_print_info(PnvChip *chip, PowerPCCPU *cpu,
>   static void pnv_chip_power8_instance_init(Object *obj)
>   {
>       Pnv8Chip *chip8 = PNV8_CHIP(obj);
> -    PnvChipClass *pcc = PNV_CHIP_GET_CLASS(obj);
> -    int i;
>   
>       object_property_add_link(obj, "xics", TYPE_XICS_FABRIC,
>                                (Object **)&chip8->xics,
> @@ -1145,22 +1143,6 @@ static void pnv_chip_power8_instance_init(Object *obj)
>       object_initialize_child(obj, "occ", &chip8->occ, TYPE_PNV8_OCC);
>   
>       object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER);
> -
> -    chip8->num_phbs = pcc->num_phbs;
> -
> -    for (i = 0; i < chip8->num_phbs; i++) {
> -        PnvPHB3 *phb3 = PNV_PHB3(object_new(TYPE_PNV_PHB3));
> -
> -        /*
> -         * We need the chip to parent the PHB to allow the DT
> -         * to build correctly (via pnv_xscom_dt()).
> -         *
> -         * TODO: the PHB should be parented by a PEC device.
> -         */
> -        object_property_add_child(obj, "phb[*]", OBJECT(phb3));
> -        chip8->phbs[i] = phb3;
> -    }
> -
>   }
>   
>   static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
> @@ -1286,8 +1268,12 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
>                                   &chip8->homer.regs);
>   
>       /* PHB3 controllers */
> +    chip8->num_phbs = pcc->num_phbs;
> +
>       for (i = 0; i < chip8->num_phbs; i++) {
> -        PnvPHB3 *phb = chip8->phbs[i];
> +        PnvPHB3 *phb = PNV_PHB3(object_new(TYPE_PNV_PHB3));
> +
> +        chip8->phbs[i] = phb;
>   
>           object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
>           object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,

