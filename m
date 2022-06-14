Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3404154AD75
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 11:37:47 +0200 (CEST)
Received: from localhost ([::1]:52480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o12zZ-0001aY-UW
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 05:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o12nA-0004YR-B7; Tue, 14 Jun 2022 05:25:02 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o12n6-0005na-Gl; Tue, 14 Jun 2022 05:24:55 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25E8omM3029042;
 Tue, 14 Jun 2022 09:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ElbqT6Ug+OmKzgyy1glzIIDdx7w78u0GONAI8lNbVu4=;
 b=a2Gc/TlX4SPwbkyGVnHQrUs1ufa4WJAqN9wt8FnKtCjjkT1EcfhEVos3PNM0Z4o1hLAE
 402jUdSw3Wg9T5MR/uNXfJvmvxeYcv1uMor1PX+/C7XnI/yjL1A5tK9X1W9HDlGNJTEh
 LdeBsMsnnpK4ZQFwbeoWG5rQy41GOg/bWbTzqyL4uN0lSAsApZoFOlEiyHBbq2XG5k45
 WYI5ZRzy/ff7pHsNidxl/DN6RlTmRdopEqDClAd5pIC820rqzHv3agGWZVVQF/p4DU6b
 BZE14a5rXX70VoQLmmuSsLHhL462K1I0qNj1x6vg+wwMBhL4D3t3LFkOaJpyW0k2UjQ1 XQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gpq68rvyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 09:24:43 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25E9LXkm005323;
 Tue, 14 Jun 2022 09:24:41 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 3gmjahu6u8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 09:24:41 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25E9OcPS19726744
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 09:24:38 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C74B5A4054;
 Tue, 14 Jun 2022 09:24:38 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AA48A405C;
 Tue, 14 Jun 2022 09:24:38 +0000 (GMT)
Received: from [9.145.3.226] (unknown [9.145.3.226])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 14 Jun 2022 09:24:38 +0000 (GMT)
Message-ID: <deb180db-a6be-906d-dc86-f8c0830be22e@linux.ibm.com>
Date: Tue, 14 Jun 2022 11:24:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 06/11] ppc/pnv: make pnv_ics_resend() use chip8->phbs[]
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, mark.cave-ayland@ilande.co.uk
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
 <20220613154456.359674-7-danielhb@linux.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220613154456.359674-7-danielhb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IJ_4cYcoHrpecAoKsRJ-VQDxRmV2yAz7
X-Proofpoint-ORIG-GUID: IJ_4cYcoHrpecAoKsRJ-VQDxRmV2yAz7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_02,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 mlxlogscore=602
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> pnv_ics_resend() is scrolling through all the child objects of the chip
> to search for the PHBs. It's faster and simpler to just use the phbs[]
> array.
> 
> pnv_ics_resend_child() was folded into pnv_ics_resend() since it's too
> simple to justify its own function.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
> ---
>   hw/ppc/pnv.c | 22 +++++++---------------
>   1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 05a8d5034f..d70deffa1d 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1993,28 +1993,20 @@ PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
>       return NULL;
>   }
>   
> -static int pnv_ics_resend_child(Object *child, void *opaque)
> -{
> -    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
> -
> -    if (phb3) {
> -        ics_resend(&phb3->lsis);
> -        ics_resend(ICS(&phb3->msis));
> -    }
> -    return 0;
> -}
> -
>   static void pnv_ics_resend(XICSFabric *xi)
>   {
>       PnvMachineState *pnv = PNV_MACHINE(xi);
> -    int i;
> +    int i, j;
>   
>       for (i = 0; i < pnv->num_chips; i++) {
> -        PnvChip *chip = pnv->chips[i];
>           Pnv8Chip *chip8 = PNV8_CHIP(pnv->chips[i]);
>   
> -        ics_resend(&chip8->psi.ics);


That line shouldn't be dropped, right?

   Fred


> -        object_child_foreach(OBJECT(chip), pnv_ics_resend_child, NULL);
> +        for (j = 0; j < chip8->num_phbs; j++) {
> +            PnvPHB3 *phb3 = &chip8->phbs[j];
> +
> +            ics_resend(&phb3->lsis);
> +            ics_resend(ICS(&phb3->msis));
> +        }
>       }
>   }
>   

