Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EFC54AD69
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 11:31:50 +0200 (CEST)
Received: from localhost ([::1]:42434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o12tp-0002M1-CV
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 05:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o12XX-0007kj-N0; Tue, 14 Jun 2022 05:08:49 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o12XT-0003DV-4c; Tue, 14 Jun 2022 05:08:47 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25E8kxGV006409;
 Tue, 14 Jun 2022 09:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=H9Cr3emLtGnZC61CkTQ9tnKnDqprBNidKXrkQ5hERxg=;
 b=qLEXjBpfTOeCTZlXB2LmAkAJUy9o+rOBnhfGnrVskskAG4hJnphC5iv1Z1XyDuYYMDEl
 AYaZslKP++LOEQ/QyyhTFv7lI+DS8jV1isMx1dAR3etdbOpW4qFJ/OOHF7Y3zHyR5lsR
 mvM5R6s9WcdzhAiURWRIcV/m6ygyBI5mfaSoRSlFSJyglGYXghT5Xf94TAPTqJ+eI0bN
 mgflthmDphaOMYngpYM/bngfK7LSlb1Zhvgh9AeLJyIZMT0JIkanJHBrb/63bAjMP9A0
 P+TaLeqb4hvCKnYc8HsGie3Z1+eAo5FuMYWiyNDLeOLiArxQTfkKtV/43wbonWfz/h/l MQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gpne9atyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 09:08:32 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25E96N21010881;
 Tue, 14 Jun 2022 09:08:29 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3gmjajc3qh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 09:08:29 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25E98ROH18940224
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 09:08:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97F63A4054;
 Tue, 14 Jun 2022 09:08:27 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3965CA405B;
 Tue, 14 Jun 2022 09:08:27 +0000 (GMT)
Received: from [9.145.3.226] (unknown [9.145.3.226])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 14 Jun 2022 09:08:27 +0000 (GMT)
Message-ID: <8bb032db-d572-a6c6-2822-e6c27143d1dc@linux.ibm.com>
Date: Tue, 14 Jun 2022 11:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 01/11] ppc/pnv: move root port attach to pnv_phb4_realize()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, mark.cave-ayland@ilande.co.uk
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
 <20220613154456.359674-2-danielhb@linux.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220613154456.359674-2-danielhb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Rfj1UWU-ihsQqihtoQYlW0YhSIds7Z1E
X-Proofpoint-ORIG-GUID: Rfj1UWU-ihsQqihtoQYlW0YhSIds7Z1E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_02,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> Creating a root port is something related to the PHB, not the PEC. It
> also makes the logic more in line with what pnv-phb3 does.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
> ---

LGTM,
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/pci-host/pnv_phb4.c     | 4 ++++
>   hw/pci-host/pnv_phb4_pec.c | 3 ---
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 6594016121..23ad8de7ee 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1547,6 +1547,7 @@ static void pnv_phb4_instance_init(Object *obj)
>   static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>   {
>       PnvPHB4 *phb = PNV_PHB4(dev);
> +    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
>       PCIHostState *pci = PCI_HOST_BRIDGE(dev);
>       XiveSource *xsrc = &phb->xsrc;
>       int nr_irqs;
> @@ -1583,6 +1584,9 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>       pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
>       pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
>   
> +    /* Add a single Root port if running with defaults */
> +    pnv_phb_attach_root_port(pci, pecc->rp_model);
> +
>       /* Setup XIVE Source */
>       if (phb->big_phb) {
>           nr_irqs = PNV_PHB4_MAX_INTs;
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 8b7e823fa5..c9aaf1c28e 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -130,9 +130,6 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>       if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
>           return;
>       }
> -
> -    /* Add a single Root port if running with defaults */
> -    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), pecc->rp_model);
>   }
>   
>   static void pnv_pec_realize(DeviceState *dev, Error **errp)

