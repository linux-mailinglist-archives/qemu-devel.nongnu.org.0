Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BFA455E7F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 15:47:34 +0100 (CET)
Received: from localhost ([::1]:53584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnihI-0002qq-9B
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 09:47:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnifY-0000Mz-BL
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:45:44 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:46909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnifW-00064V-Ai
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:45:44 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.149])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 46426CC6475B;
 Thu, 18 Nov 2021 15:45:41 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 18 Nov
 2021 15:45:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0065ae8f8fe-c068-453e-b61f-65c1df760c27,
 4A6ABDF66DC85A3D00A6C17CB73E494911F6EB6E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.55.24.82
Message-ID: <97cf25cb-7380-0385-32a6-93e0bf0df19a@kaod.org>
Date: Thu, 18 Nov 2021 15:45:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/3] pci: Export the pci_intx() function
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20211116170133.724751-1-fbarrat@linux.ibm.com>
 <20211116170133.724751-3-fbarrat@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211116170133.724751-3-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: bbb4cda9-e443-4c7b-88bc-4601aada7668
X-Ovh-Tracer-Id: 7427843163206618019
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigdeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.084,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/16/21 18:01, Frederic Barrat wrote:
> Move the pci_intx() definition to the PCI header file, so that it can
> be called from other PCI files. It is used by the next patch.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/pci/pci.c         | 5 -----
>   include/hw/pci/pci.h | 5 +++++
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index e5993c1ef5..249d7e4cf6 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1497,11 +1497,6 @@ static void pci_irq_handler(void *opaque, int irq_num, int level)
>       pci_change_irq_level(pci_dev, irq_num, change);
>   }
>   
> -static inline int pci_intx(PCIDevice *pci_dev)
> -{
> -    return pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
> -}
> -
>   qemu_irq pci_allocate_irq(PCIDevice *pci_dev)
>   {
>       int intx = pci_intx(pci_dev);
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index e7cdf2d5ec..35f8eb67bd 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -735,6 +735,11 @@ void lsi53c8xx_handle_legacy_cmdline(DeviceState *lsi_dev);
>   qemu_irq pci_allocate_irq(PCIDevice *pci_dev);
>   void pci_set_irq(PCIDevice *pci_dev, int level);
>   
> +static inline int pci_intx(PCIDevice *pci_dev)
> +{
> +    return pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
> +}
> +
>   static inline void pci_irq_assert(PCIDevice *pci_dev)
>   {
>       pci_set_irq(pci_dev, 1);
> 


