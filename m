Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B70048E86B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 11:41:58 +0100 (CET)
Received: from localhost ([::1]:35632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8K1s-0007bl-0T
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 05:41:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n8Jyv-0006il-GI; Fri, 14 Jan 2022 05:38:53 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:59011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n8Jyt-0007at-Eh; Fri, 14 Jan 2022 05:38:53 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.12])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id CCEBCD7B8A1B;
 Fri, 14 Jan 2022 11:38:48 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 14 Jan
 2022 11:38:42 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005ab9e4527-074f-4a21-8725-9fda0fa4ad5b,
 CC0F12677928C812C874D314DD24F058DC39716A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2d76265d-94c8-9170-20b8-c722346a3680@kaod.org>
Date: Fri, 14 Jan 2022 11:38:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 00/17] remove PnvPhb4PecStack from Powernv9
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220113192952.911188-1-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220113192952.911188-1-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2d0145ac-ff6c-4a5f-a01b-0d70d15e9d7e
X-Ovh-Tracer-Id: 5958825259068656608
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/22 20:29, Daniel Henrique Barboza wrote:
> Hi,
> 
> After all the done enabling pnv-phb4 user devices, it became clear that
> the stack object is just a container of the PHB and its resources than
> something that needs to be maintained by its own. Removing the
> PnvPhb4PecStack object promotes a simpler code where we're dealing only
> with PECs and PHB4s.
> 
> One thing that isn't handled in this series is the nested regs names.
> There are 30+ nested per-stack registers with names such as
> 'PEC_NEST_STK*' or 'PEC_PCI_STK*' that are left as is. Renaming them to
> remove the 'STK' reference can be done in a follow up when we're
> satisfied with what it is presented here.

I think that's fine. The name identifies the sub-unit logic to which
the register belongs to.

Thanks,

C.
  
> 
> No functional change is intended with this series. The series is based
> on top of current master (at f8d75e10d3),
> 
> Daniel Henrique Barboza (17):
>    ppc/pnv: use PHB4 obj in pnv_pec_stk_pci_xscom_ops
>    ppc/pnv: move PCI registers to PnvPHB4
>    ppc/pnv: move phbbar to PnvPHB4
>    ppc/pnv: move intbar to PnvPHB4
>    ppc/pnv: change pnv_phb4_update_regions() to use PnvPHB4
>    ppc/pnv: move mmbar0/mmbar1 and friends to PnvPHB4
>    ppc/pnv: move nest_regs[] to PnvPHB4
>    ppc/pnv: change pnv_pec_stk_update_map() to use PnvPHB4
>    ppc/pnv: move nest_regs_mr to PnvPHB4
>    ppc/pnv: move phb_regs_mr to PnvPHB4
>    ppc/pnv: introduce PnvPHB4 'phb_number' property
>    ppc/pnv: introduce PnvPHB4 'pec' property
>    ppc/pnv: remove stack pointer from PnvPHB4
>    ppc/pnv: move default_phb_realize() to pec_realize()
>    ppc/pnv: convert pec->stacks[] into pec->phbs[]
>    ppc/pnv: remove PnvPhb4PecStack object
>    ppc/pnv: rename pnv_pec_stk_update_map()
> 
>   hw/pci-host/pnv_phb4.c         | 271 ++++++++++++++++-----------------
>   hw/pci-host/pnv_phb4_pec.c     | 122 ++++-----------
>   include/hw/pci-host/pnv_phb4.h |  84 +++++-----
>   3 files changed, 200 insertions(+), 277 deletions(-)
> 


