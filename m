Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DF654B2CB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 16:11:47 +0200 (CEST)
Received: from localhost ([::1]:32822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o17Gk-0000K5-R4
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 10:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o17FT-0007FX-OX; Tue, 14 Jun 2022 10:10:28 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o17FR-0003qC-KE; Tue, 14 Jun 2022 10:10:27 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25EDF1lr022561;
 Tue, 14 Jun 2022 14:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=oVJ3oJicknhAjxQMqUOUNxQLNvVtcn4yj4CdMHiRmEE=;
 b=ByFmvORJdNUNJSAmMXpOvTF8Ue/WVA/fVotWJBx9OETIHelNuEDlnuop9u0VrPEzt9PQ
 uUeIDfvAuAfDaHBMi5ex3ySv8pMflDEv3Jn0XDy9r2PfXntFwyC6qCxzQh/em+B8vXSv
 USc/gWRJpysxHIsWZcShD+uQuP7ee63fhhVBVtLspS5AK8q5rqFnwbJLVbLS5W6drxzY
 qWZLhDg6nrsxfYHemvxp2FloQUSVqPAP+0NEgOr1xnBHndA8Sn9kQ7McFpcbclxUShlg
 YtHIZUB/IdpYgY8N8JTT6wwP0baemD7xQIoid16EA1MQP62PJft3DFyV7+vUOavj4vop NA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gpr31ydpe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 14:10:10 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25EE6mCa010758;
 Tue, 14 Jun 2022 14:10:09 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 3gmjp9csvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 14:10:09 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25EEA8w735193336
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 14:10:08 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44026C6063;
 Tue, 14 Jun 2022 14:10:08 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9C29C6057;
 Tue, 14 Jun 2022 14:10:06 +0000 (GMT)
Received: from [9.160.187.150] (unknown [9.160.187.150])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 14 Jun 2022 14:10:06 +0000 (GMT)
Message-ID: <104be42f-25e3-20b5-60f1-3db943ec65f8@linux.ibm.com>
Date: Tue, 14 Jun 2022 11:10:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 01/11] ppc/pnv: move root port attach to pnv_phb4_realize()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, fbarrat@linux.ibm.com, mark.cave-ayland@ilande.co.uk
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
 <20220613154456.359674-2-danielhb@linux.ibm.com>
 <eb6b85a6-d70a-aa1c-cde1-ffc5f86b2218@kaod.org>
From: Daniel Henrique Barboza <danielhb@linux.ibm.com>
In-Reply-To: <eb6b85a6-d70a-aa1c-cde1-ffc5f86b2218@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tx_giiHNoxgIGKCi-aLOoQT9UDSaSgQz
X-Proofpoint-ORIG-GUID: tx_giiHNoxgIGKCi-aLOoQT9UDSaSgQz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_05,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206140055
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



On 6/14/22 09:02, Cédric Le Goater wrote:
> On 6/13/22 17:44, Daniel Henrique Barboza wrote:
>> Creating a root port is something related to the PHB, not the PEC. It
>> also makes the logic more in line with what pnv-phb3 does.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> So the root port is back where it was.
> 
> Could we avoid the pci_new() and use object_initialize_child() instead ?


We could but then we would need to deal with yet another difference with
default versus user created devices, given that for user devices we can't
initialize_child(). And since we're also unifying the root ports later on
I'd rather wait to see how it turns out when everything is finished.


Tanks,

Daniel

> 
> Thanks,
> 
> C.
> 
> 
>> ---
>>   hw/pci-host/pnv_phb4.c     | 4 ++++
>>   hw/pci-host/pnv_phb4_pec.c | 3 ---
>>   2 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>> index 6594016121..23ad8de7ee 100644
>> --- a/hw/pci-host/pnv_phb4.c
>> +++ b/hw/pci-host/pnv_phb4.c
>> @@ -1547,6 +1547,7 @@ static void pnv_phb4_instance_init(Object *obj)
>>   static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>>   {
>>       PnvPHB4 *phb = PNV_PHB4(dev);
>> +    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
>>       PCIHostState *pci = PCI_HOST_BRIDGE(dev);
>>       XiveSource *xsrc = &phb->xsrc;
>>       int nr_irqs;
>> @@ -1583,6 +1584,9 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>>       pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
>>       pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
>> +    /* Add a single Root port if running with defaults */
>> +    pnv_phb_attach_root_port(pci, pecc->rp_model);
>> +
>>       /* Setup XIVE Source */
>>       if (phb->big_phb) {
>>           nr_irqs = PNV_PHB4_MAX_INTs;
>> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
>> index 8b7e823fa5..c9aaf1c28e 100644
>> --- a/hw/pci-host/pnv_phb4_pec.c
>> +++ b/hw/pci-host/pnv_phb4_pec.c
>> @@ -130,9 +130,6 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>>       if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
>>           return;
>>       }
>> -
>> -    /* Add a single Root port if running with defaults */
>> -    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), pecc->rp_model);
>>   }
>>   static void pnv_pec_realize(DeviceState *dev, Error **errp)
> 

