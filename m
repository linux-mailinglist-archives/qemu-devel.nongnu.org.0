Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3589054AD7D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 11:40:17 +0200 (CEST)
Received: from localhost ([::1]:58430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1320-0005i0-7B
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 05:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o12z6-0002vT-GQ; Tue, 14 Jun 2022 05:37:16 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o12z4-00083g-Ry; Tue, 14 Jun 2022 05:37:16 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25E9MsoH009216;
 Tue, 14 Jun 2022 09:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=u3JjQ9gddWNgenkSmNXqnLvPsauBhdV5FHaV3bvg/Jg=;
 b=olW3gi8ouG+XRbeyYyd0BfFcdy5kMawR4Ujr6/bW6s1ZSfOKNyWIBZWlREGTqXv9pZw9
 mRFLlOmDg3a1e9yA1wcz4D4+TVcoBrM0YpfLWz59/FctyeXPgYyUF8lPXnZq5YBh4eax
 6xIaMJXg3e1j1m2VTFqJ8xOWvF3nGiyeEkiaV8pajMijzc5tqMe5JNPBkY10dPHwYEQt
 JzJv8DRchgUu7mpWplD5NrWfozkJMDKHUsGETJTk+BCFt0QGa8r0KiSE53UvrAGkWQyX
 qmSHzBQT8gDKHY+vjSFS2kMaNbgldMgj35JFE0PW1FtwEn0YFavfqzMS1ovX6mDGCfzR WA== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gpqnb0akf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 09:36:58 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25E9LdX9005332;
 Tue, 14 Jun 2022 09:36:55 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 3gmjahu783-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 09:36:55 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25E9arZH17432952
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 09:36:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50689A4054;
 Tue, 14 Jun 2022 09:36:53 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0314AA405F;
 Tue, 14 Jun 2022 09:36:53 +0000 (GMT)
Received: from [9.145.3.226] (unknown [9.145.3.226])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 14 Jun 2022 09:36:52 +0000 (GMT)
Message-ID: <b0f328aa-ba2e-69a4-b971-0cdd2768f4b2@linux.ibm.com>
Date: Tue, 14 Jun 2022 11:36:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 07/11] ppc/pnv: make pnv_chip_power8_pic_print_info() use
 chip8->phbs[]
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, mark.cave-ayland@ilande.co.uk
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
 <20220613154456.359674-8-danielhb@linux.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220613154456.359674-8-danielhb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bYMGczB_UxB4qichCwyShP-FQ8mvNqDX
X-Proofpoint-GUID: bYMGczB_UxB4qichCwyShP-FQ8mvNqDX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_02,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 mlxlogscore=614 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206140037
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
> It's inneficient to scroll all child objects when we have all PHBs
> available in chip8->phbs[].
> 
> pnv_chip_power8_pic_print_info_child() ended up folded into
> pic_print_info() for simplicity.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/ppc/pnv.c | 22 ++++++++--------------
>   1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index d70deffa1d..5e3323e950 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -652,25 +652,19 @@ static ISABus *pnv_isa_create(PnvChip *chip, Error **errp)
>       return PNV_CHIP_GET_CLASS(chip)->isa_create(chip, errp);
>   }
>   
> -static int pnv_chip_power8_pic_print_info_child(Object *child, void *opaque)
> -{
> -    Monitor *mon = opaque;
> -    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
> -
> -    if (phb3) {
> -        pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
> -        ics_pic_print_info(&phb3->lsis, mon);
> -    }
> -    return 0;
> -}
> -
>   static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
>   {
>       Pnv8Chip *chip8 = PNV8_CHIP(chip);
> +    int i;
>   
>       ics_pic_print_info(&chip8->psi.ics, mon);
> -    object_child_foreach(OBJECT(chip),
> -                         pnv_chip_power8_pic_print_info_child, mon);
> +
> +    for (i = 0; i < chip8->num_phbs; i++) {
> +        PnvPHB3 *phb3 = &chip8->phbs[i];
> +
> +        pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
> +        ics_pic_print_info(&phb3->lsis, mon);
> +    }
>   }
>   
>   static int pnv_chip_power9_pic_print_info_child(Object *child, void *opaque)

