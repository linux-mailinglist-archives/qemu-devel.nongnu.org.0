Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB6E54AD82
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 11:41:35 +0200 (CEST)
Received: from localhost ([::1]:60698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o133G-0007FI-3s
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 05:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o12Zo-0001Lk-MZ; Tue, 14 Jun 2022 05:11:09 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:10070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o12Zm-0003bx-2Z; Tue, 14 Jun 2022 05:11:08 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25E8qldn014128;
 Tue, 14 Jun 2022 09:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=yQgw9SGJgOLE0lq5xZ7b1fCQeTDAUtueSNEZWr7hzPE=;
 b=QTgn2+2ufbZgGC/yqpMdONGr+Kf3LjDQ8TRCmNKuXowLZP8tv724pd1Th4KkcQ+Ww0vI
 ync/P6DMsh64UxLOJJDuZb1W/xH440xiRQk/or2SxOqTnUzhWMLK0jyZitMboY0Q6YG+
 p1rCn4Lt0Zlt8YTdudDOZRdEhp3K2O5CUELHxGegTp67polHsihUh/9rf2HLm2MaRMUI
 mBfxw+7FCzNQ87Ut97Znf2KffeBERkHatkTdVxMaFMWH7xU5jVq7oG5kH8STaljrPyor
 aeuENRrxzUKD4dfNQoYyaiTz3wmgr5rRyPaN9gWl75G2w3oUHLflmwPkHrxFbKi/gy9f Ww== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gpq76rgre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 09:10:58 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25E96Gjg004915;
 Tue, 14 Jun 2022 09:10:55 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 3gmjp9357f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 09:10:55 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25E9Ar6F17105348
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 09:10:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 520B6A405B;
 Tue, 14 Jun 2022 09:10:53 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 171FCA4054;
 Tue, 14 Jun 2022 09:10:53 +0000 (GMT)
Received: from [9.145.3.226] (unknown [9.145.3.226])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 14 Jun 2022 09:10:52 +0000 (GMT)
Message-ID: <df8e3235-ae98-c2f5-ceea-36384b1e2281@linux.ibm.com>
Date: Tue, 14 Jun 2022 11:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 04/11] ppc/pnv: use dev instead of pci->qdev in
 root_port_realize()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, mark.cave-ayland@ilande.co.uk
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
 <20220613154456.359674-5-danielhb@linux.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220613154456.359674-5-danielhb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FarxQYZXg6jU6yZ3R83Or0EMwv4f7pib
X-Proofpoint-GUID: FarxQYZXg6jU6yZ3R83Or0EMwv4f7pib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_02,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206140035
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
> We already have access to the 'dev' object.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/pci-host/pnv_phb3.c | 4 ++--
>   hw/pci-host/pnv_phb4.c | 5 ++---
>   2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index 7901d8172c..bda23fd20b 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1157,8 +1157,8 @@ static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
>       }
>   
>       /* Set unique chassis/slot values for the root port */
> -    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
> -    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
> +    qdev_prop_set_uint8(dev, "chassis", phb->chip_id);
> +    qdev_prop_set_uint16(dev, "slot", phb->phb_id);
>   
>       rpc->parent_realize(dev, &local_err);
>       if (local_err) {
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index bae9398d86..bfec8b9f6d 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1781,7 +1781,6 @@ static void pnv_phb4_root_port_reset(DeviceState *dev)
>   static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
>   {
>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
> -    PCIDevice *pci = PCI_DEVICE(dev);
>       PnvPHB4 *phb = NULL;
>       Error *local_err = NULL;
>   
> @@ -1799,8 +1798,8 @@ static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
>       }
>   
>       /* Set unique chassis/slot values for the root port */
> -    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
> -    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
> +    qdev_prop_set_uint8(dev, "chassis", phb->chip_id);
> +    qdev_prop_set_uint16(dev, "slot", phb->phb_id);
>   
>       rpc->parent_realize(dev, &local_err);
>       if (local_err) {

