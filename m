Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFDB54AD74
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 11:37:47 +0200 (CEST)
Received: from localhost ([::1]:52404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o12zY-0001X7-IG
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 05:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o12ZK-00010y-Nt; Tue, 14 Jun 2022 05:10:40 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13416
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o12ZI-0003Up-J8; Tue, 14 Jun 2022 05:10:38 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25E8GMsG010644;
 Tue, 14 Jun 2022 09:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=h2KDHyHK4YnDeDgA+ny79XizC1ZR9/pDYj/nvLIiKA8=;
 b=Dlg1cpGa4nbgNQy5xb1vdwR4Lgm/FvqaHlcJSIQGYckXpMVDExIfAc7gUtkTIhUIxjKO
 iJrqAMoJEciW/TcFPh5EuS9lmiPisE6U+Rn5xnoWp1WPZTyhA6tOHuDQuk+q81VIVvw9
 T9wd/ms4vlGjHXGtJ+/fn795WYMSIEioFdCQA14V8ls08XmuRTwDg/AHar4jGiJx6DEl
 b2g2Nexg5XPcqJqLHg0g/ylCAAvU1R0z+bhvu5JZAzaEyo0RGrDIx2gYnFTo+3AVDLtN
 1iMcosySqds5ekJ1ePz+XwkMLIAYXmvCi/bTn/qP7BTB51zb0KlRQvu08HP8DU4rNE39 WQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gppp498ay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 09:10:24 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25E95L0F016132;
 Tue, 14 Jun 2022 09:10:22 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3gmjp8u5t9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 09:10:22 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25E9AKFw21692732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 09:10:20 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F63CA405F;
 Tue, 14 Jun 2022 09:10:20 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDEFDA405C;
 Tue, 14 Jun 2022 09:10:19 +0000 (GMT)
Received: from [9.145.3.226] (unknown [9.145.3.226])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 14 Jun 2022 09:10:19 +0000 (GMT)
Message-ID: <a8194fd7-9563-fec1-9d70-0e25ba648b73@linux.ibm.com>
Date: Tue, 14 Jun 2022 11:10:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 03/11] ppc/pnv: use dev->parent_bus->parent to get the PHB
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, mark.cave-ayland@ilande.co.uk
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
 <20220613154456.359674-4-danielhb@linux.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220613154456.359674-4-danielhb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4UT9J9QgzEArOhqXJvOVzo_Xy41LpLT3
X-Proofpoint-GUID: 4UT9J9QgzEArOhqXJvOVzo_Xy41LpLT3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_02,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206140035
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
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
> It is not advisable to execute an object_dynamic_cast() to poke into
> bus->qbus.parent and follow it up with a C cast into the PnvPHB type we
> think we got.
> 
> A better way is to access the PnvPHB object via a QOM macro accessing
> the existing parent links of the DeviceState. For a given
> pnv-phb3/4-root-port 'dev', dev->parent_bus will give us the PHB bus,
> and dev->parent_bus->parent is the PHB. Use the adequate QOM macro to
> assert the type, and keep the NULL check in case we didn't get the
> object we were expecting.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
> ---
>   hw/pci-host/pnv_phb3.c | 10 +++++++---
>   hw/pci-host/pnv_phb4.c | 10 +++++++---
>   2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index 4ba660f8b9..7901d8172c 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1139,12 +1139,16 @@ static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
>   {
>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>       PCIDevice *pci = PCI_DEVICE(dev);
> -    PCIBus *bus = pci_get_bus(pci);
>       PnvPHB3 *phb = NULL;
>       Error *local_err = NULL;
>   
> -    phb = (PnvPHB3 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
> -                                          TYPE_PNV_PHB3);
> +    /*
> +     * dev->parent_bus gives access to the pnv-phb-root bus.
> +     * The PnvPHB3 is the owner (parent) of the bus.
> +     */
> +    if (dev && dev->parent_bus) {
> +        phb = PNV_PHB3(dev->parent_bus->parent);
> +    }
>   
>       if (!phb) {
>           error_setg(errp,
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index ffd9d8a947..bae9398d86 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1782,12 +1782,16 @@ static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
>   {
>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>       PCIDevice *pci = PCI_DEVICE(dev);
> -    PCIBus *bus = pci_get_bus(pci);
>       PnvPHB4 *phb = NULL;
>       Error *local_err = NULL;
>   
> -    phb = (PnvPHB4 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
> -                                          TYPE_PNV_PHB4);
> +    /*
> +     * dev->parent_bus gives access to the pnv-phb-root bus.
> +     * The PnvPHB4 is the owner (parent) of the bus.
> +     */
> +    if (dev && dev->parent_bus) {


Does it make sense to test 'dev' first when it's the device being realized?

   Fred




> +        phb = PNV_PHB4(dev->parent_bus->parent);
> +    }
>   
>       if (!phb) {
>           error_setg(errp, "%s must be connected to pnv-phb4 buses", dev->id);

