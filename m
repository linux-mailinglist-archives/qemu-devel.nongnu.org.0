Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA1C48C3B7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 13:07:50 +0100 (CET)
Received: from localhost ([::1]:58166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7cPt-0000k2-NP
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 07:07:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7bwL-00012N-No
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:37:17 -0500
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:40777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7bwJ-0004u2-Sd
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:37:17 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.244])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 7EF05218E4;
 Wed, 12 Jan 2022 11:37:12 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 12 Jan
 2022 12:37:08 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0050c689496-beec-4802-b35b-ff0f456da9fe,
 C5437DA5DF8DB845CC48CAA380855665EAA33ED7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6450218f-8ae7-d12d-e340-73260ae426c9@kaod.org>
Date: Wed, 12 Jan 2022 12:37:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 0/5] user creatable pnv-phb4 devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220111131027.599784-1-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220111131027.599784-1-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 970f693b-3052-4510-bb83-921304d1bb4d
X-Ovh-Tracer-Id: 13648158673135963104
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtddugddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeetveeludeuffffleevleehkeeutdevheekudetffffhfekuddthefgtdejhfdtffenucffohhmrghinhepghhnuhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/22 14:10, Daniel Henrique Barboza wrote:
> Hi,
> 
> This version implements Cedric's review suggestions from v4. No
> drastic design changes were made.
> 
> Changes from v4:
> - patches 1,3,5: unchanged
> - patch 2:
>    * renamed function to pnv_phb4_xscom_realize()
>    * pnv4_phb4_xscom_realize() is now called at the end of phb4_realize()
> - patch 4:
>    * changed pnv_phb4_get_stack signature to use chip and phb
>    * added a new helper called pnv_pec_stk_default_phb_realize() to
> realize the default phb when running with defaults
> - v4 link: https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg02148.html
> 
> Daniel Henrique Barboza (5):
>    ppc/pnv: set phb4 properties in stk_realize()
>    ppc/pnv: move PHB4 XSCOM init to phb4_realize()
>    ppc/pnv: turn 'phb' into a pointer in struct PnvPhb4PecStack
>    ppc/pnv: Introduce user creatable pnv-phb4 devices
>    ppc/pnv: turn pnv_phb4_update_regions() into static
> 
>   hw/pci-host/pnv_phb4.c         | 430 ++++++++++++++++++++++++++++++---
>   hw/pci-host/pnv_phb4_pec.c     | 329 ++-----------------------
>   hw/ppc/pnv.c                   |   2 +
>   include/hw/pci-host/pnv_phb4.h |   8 +-
>   4 files changed, 431 insertions(+), 338 deletions(-)
> 


Applied to ppc7.0.

Thanks,

C.

