Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACAB4F0FB2
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 08:59:35 +0200 (CEST)
Received: from localhost ([::1]:45832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbGgY-00081a-Bn
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 02:59:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nbGb2-0005AI-Sw
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 02:53:54 -0400
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:43503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nbGb0-0001AH-D1
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 02:53:51 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.129])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0C78120712;
 Mon,  4 Apr 2022 06:53:46 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 4 Apr
 2022 08:53:46 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006a54b4ae0-10f6-4e9d-a7a4-92c8e29b74ec,
 193BEDB8EED17CFBFC1316EE01F9191BF107EB6B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <dbaeec2b-b34c-dab7-9c99-dc7ddf15aa14@kaod.org>
Date: Mon, 4 Apr 2022 08:53:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ppc/pnv: Fix number of registers in the PCIe controller
 on POWER9
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <danielhb413@gmail.com>,
 <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220401091925.770803-1-fbarrat@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220401091925.770803-1-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 17b09cf0-9c68-4c8f-adf1-1450818280e3
X-Ovh-Tracer-Id: 10806950258304388003
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudejuddguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsvghnhheskhgvrhhnvghlrdgtrhgrshhhihhnghdrohhrgh
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 4/1/22 11:19, Frederic Barrat wrote:
> The spec defines 3 registers, even though only index 0 and 2 are valid
> on POWER9. The same model is used on POWER10. Register 1 is defined
> there but we currently don't use it in skiboot. So we can keep
> reporting an error on write.
> 
> Reported by Coverity (CID 1487176).
> 
> Fixes: 4f9924c4d4cf ("ppc/pnv: Add models for POWER9 PHB4 PCIe Host bridge")
> Suggested-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>   include/hw/pci-host/pnv_phb4.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Queued for ppc-7.0

Thanks,

C.



> 
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index b02ecdceaa..19dcbd6f87 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -180,7 +180,7 @@ struct PnvPhb4PecState {
>       MemoryRegion nest_regs_mr;
>   
>       /* PCI registers, excluding per-stack */
> -#define PHB4_PEC_PCI_REGS_COUNT     0x2
> +#define PHB4_PEC_PCI_REGS_COUNT     0x3
>       uint64_t pci_regs[PHB4_PEC_PCI_REGS_COUNT];
>       MemoryRegion pci_regs_mr;
>   


