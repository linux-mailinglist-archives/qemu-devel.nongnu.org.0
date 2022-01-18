Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2189D4925C5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:37:09 +0100 (CET)
Received: from localhost ([::1]:49768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9njY-0002W4-72
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:37:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9nEW-0006DC-LD; Tue, 18 Jan 2022 07:05:05 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:58313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9nEN-0005sw-Lz; Tue, 18 Jan 2022 07:04:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.186])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 6283E20905;
 Tue, 18 Jan 2022 12:03:28 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 13:03:27 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005b4108373-2c97-4b32-8216-63d69f362a8b,
 78124C4340FA50D00486B2609A05927D7A7C6ABE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <03b9f33f-660b-c947-0deb-33fa376882a4@kaod.org>
Date: Tue, 18 Jan 2022 13:03:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 0/8] remove PnvPhb4PecStack from Powernv9
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220114180719.52117-1-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220114180719.52117-1-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 99180469-c014-4e55-8ad0-49096a2e9556
X-Ovh-Tracer-Id: 12434438574425934816
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudefgdefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeetveeludeuffffleevleehkeeutdevheekudetffffhfekuddthefgtdejhfdtffenucffohhmrghinhepghhnuhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 1/14/22 19:07, Daniel Henrique Barboza wrote:
> Hi,
> 
> This second version contains improvements suggested by Cedric in the
> v1 review.
> 
> Patches 1-10 from v1 are already accepted and aren't included in this
> v2.
> 
> 
> Changes from v1:
> - v1 patches 1-10: already accepted, not included in the v2
> - 'stack-stack_no' use is eliminated. We're now deriving stack_no from
> phb->phb_id
> - no longer use phb->phb_number
> - no longer use pec->phbs[]
> - v1 link: https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg03000.html
> 
> Daniel Henrique Barboza (8):
>    ppc/pnv: introduce PnvPHB4 'pec' property
>    ppc/pnv: reduce stack->stack_no usage
>    ppc/pnv: remove stack pointer from PnvPHB4
>    ppc/pnv: move default_phb_realize() to pec_realize()
>    ppc/pnv: remove PnvPhb4PecStack::stack_no
>    ppc/pnv: make PECs create and realize PHB4s
>    ppc/pnv: remove PnvPhb4PecStack object
>    ppc/pnv: rename pnv_pec_stk_update_map()
> 
>   hw/pci-host/pnv_phb4.c         |  88 ++++++++++++++----------
>   hw/pci-host/pnv_phb4_pec.c     | 118 ++++++++-------------------------
>   include/hw/pci-host/pnv_phb4.h |  33 ++-------
>   3 files changed, 86 insertions(+), 153 deletions(-)
> 

Applied to ppc-7.0

Thanks,

C.


