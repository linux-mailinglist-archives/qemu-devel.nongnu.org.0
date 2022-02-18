Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD744BB37A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 08:46:02 +0100 (CET)
Received: from localhost ([::1]:43802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKxxo-0008NV-Rm
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 02:46:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKxuo-0007XH-Dn
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 02:42:54 -0500
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:36923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKxuk-0003Ub-I1
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 02:42:52 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.179])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id C5B6C231C5;
 Fri, 18 Feb 2022 07:42:40 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 18 Feb
 2022 08:42:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00377edb01b-f57f-477d-abe0-88fda35a277a,
 07432D932CF505C4D002BA4105FABD7408393EAD) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e9640818-5bcd-44ef-bb00-e939a4e89419@kaod.org>
Date: Fri, 18 Feb 2022 08:42:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 00/27] target/ppc: SPR registration cleanups
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220216162426.1885923-1-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220216162426.1885923-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 51dc014f-170c-442d-992b-8d929198e90a
X-Ovh-Tracer-Id: 5615988737268681635
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeelgdduudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfduveeggeduvefglefhkeekheffgefhkeejvdeguefftdekuefggefhfeejkedunecuffhomhgrihhnpehnohhnghhnuhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/22 17:23, Fabiano Rosas wrote:
> The goal of this series is to do some untangling of SPR registration
> code in cpu_init.c and prepare for moving the CPU initialization into
> separate files for each CPU family.
> 
> After this series we'll have only cpu-specific SPR code in cpu_init.c,
> i.e. code that can be split and moved as a unit into other
> files. Common/generic SPR code will be in helper_regs.c, exposed via
> spr_common.h.
> 
> Changes from v1:
> 
> - Some commit message improvements suggested by David;
> 
> - Removed the soft_tlb rename patch. Kept the old name;
> 
> - Left the specific check_pow functions behind, they can be dealt with
>    in the next series;
> 
> - Added a new patch to rename spr_tcg to spr_common.
> 
> Patches 23 and 26 still need review.
> 
> This series is based on legoater/ppc7.0.
> 
> v1:
> https://lists.nongnu.org/archive/html/qemu-ppc/2022-02/msg00313.html
> 
> Fabiano Rosas (27):
>    target/ppc: cpu_init: Remove not implemented comments
>    target/ppc: cpu_init: Remove G2LE init code
>    target/ppc: cpu_init: Group registration of generic SPRs
>    target/ppc: cpu_init: Move Timebase registration into the common
>      function
>    target/ppc: cpu_init: Avoid nested SPR register functions
>    target/ppc: cpu_init: Move 405 SPRs into register_405_sprs
>    target/ppc: cpu_init: Move G2 SPRs into register_G2_sprs
>    target/ppc: cpu_init: Decouple G2 SPR registration from 755
>    target/ppc: cpu_init: Decouple 74xx SPR registration from 7xx
>    target/ppc: cpu_init: Deduplicate 440 SPR registration
>    target/ppc: cpu_init: Deduplicate 603 SPR registration
>    target/ppc: cpu_init: Deduplicate 604 SPR registration
>    target/ppc: cpu_init: Deduplicate 745/755 SPR registration
>    target/ppc: cpu_init: Deduplicate 7xx SPR registration
>    target/ppc: cpu_init: Move 755 L2 cache SPRs into a function
>    target/ppc: cpu_init: Move e300 SPR registration into a function
>    target/ppc: cpu_init: Move 604e SPR registration into a function
>    target/ppc: cpu_init: Reuse init_proc_603 for the e300
>    target/ppc: cpu_init: Reuse init_proc_604 for the 604e
>    target/ppc: cpu_init: Reuse init_proc_745 for the 755
>    target/ppc: cpu_init: Rename register_ne_601_sprs
>    target/ppc: cpu_init: Remove register_usprg3_sprs
>    target/ppc: Rename spr_tcg.h to spr_common.h
>    target/ppc: cpu_init: Expose some SPR registration helpers
>    target/ppc: cpu_init: Move SPR registration macros to a header
>    target/ppc: cpu_init: Move check_pow and QOM macros to a header
>    target/ppc: Move common SPR functions out of cpu_init
> 
>   target/ppc/cpu.h                       |   39 +
>   target/ppc/cpu_init.c                  | 1879 ++++++++----------------
>   target/ppc/helper_regs.c               |  402 +++++
>   target/ppc/{spr_tcg.h => spr_common.h} |   69 +-
>   target/ppc/translate.c                 |    2 +-
>   5 files changed, 1098 insertions(+), 1293 deletions(-)
>   rename target/ppc/{spr_tcg.h => spr_common.h} (72%)
> 


Applied for ppc-7.0

Thanks,

C.

