Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8167E4985F7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 18:12:16 +0100 (CET)
Received: from localhost ([::1]:42872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC2t4-0003GZ-Vt
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 12:12:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nC2jC-0007ti-Oj
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:02:02 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:54533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nC2jA-0005Ol-Ev
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:02:02 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.241])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A28DFD9B9822;
 Mon, 24 Jan 2022 18:01:56 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 24 Jan
 2022 18:01:55 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00248539d14-f744-4ac5-8e4a-71dbbcbde304,
 8B4FF7E59EB7D736B5D3E090BD3F43F29F49559A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d8db7ba1-8ce9-2057-607e-ddb827480e9b@kaod.org>
Date: Mon, 24 Jan 2022 18:01:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 00/37] target/ppc: PowerISA Vector/VSX instruction batch
Content-Language: en-US
To: <matheus.ferst@eldorado.org.br>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
References: <20220107185653.1609775-1-matheus.ferst@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220107185653.1609775-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b050f357-355b-47d6-8ee9-dfe9774fa545
X-Ovh-Tracer-Id: 15817767792249834345
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvdeigdelkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/22 19:56, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> This patch series implements 5 missing instructions from PowerISA v3.0
> and 40 new instructions from PowerISA v3.1, moving 62 other instructions
> to decodetree along the way.

I haven't seen any regressions with this series and it should be included
in the next ppc PR.

Thanks,

C.

> 
> Lucas Coutinho (2):
>    target/ppc: Move vexts[bhw]2[wd] to decodetree
>    target/ppc: Implement vextsd2q
> 
> Lucas Mateus Castro (alqotel) (3):
>    target/ppc: moved vector even and odd multiplication to decodetree
>    target/ppc: Moved vector multiply high and low to decodetree
>    target/ppc: vmulh* instructions use gvec
> 
> Luis Pires (1):
>    target/ppc: Introduce TRANS*FLAGS macros
> 
> Matheus Ferst (20):
>    target/ppc: Move Vector Compare Equal/Not Equal/Greater Than to
>      decodetree
>    target/ppc: Move Vector Compare Not Equal or Zero to decodetree
>    target/ppc: Implement Vector Compare Equal Quadword
>    target/ppc: Implement Vector Compare Greater Than Quadword
>    target/ppc: Implement Vector Compare Quadword
>    target/ppc: implement vstri[bh][lr]
>    target/ppc: implement vclrlb
>    target/ppc: implement vclrrb
>    target/ppc: implement vcntmb[bhwd]
>    target/ppc: implement vgnb
>    target/ppc: Move vsel and vperm/vpermr to decodetree
>    target/ppc: Move xxsel to decodetree
>    target/ppc: move xxperm/xxpermr to decodetree
>    target/ppc: Move xxpermdi to decodetree
>    target/ppc: Implement xxpermx instruction
>    tcg/tcg-op-gvec.c: Introduce tcg_gen_gvec_4i
>    target/ppc: Implement xxeval
>    target/ppc: Implement xxgenpcv[bhwd]m instruction
>    target/ppc: move xs[n]madd[am][ds]p/xs[n]msub[am][ds]p to decodetree
>    target/ppc: implement xs[n]maddqp[o]/xs[n]msubqp[o]
> 
> Victor Colombo (6):
>    target/ppc: Implement xvtlsbb instruction
>    target/ppc: Refactor VSX_SCALAR_CMP_DP
>    target/ppc: Implement xscmp{eq,ge,gt}qp
>    target/ppc: Move xscmp{eq,ge,gt,ne}dp to decodetree
>    target/ppc: Refactor VSX_MAX_MINC helper
>    target/ppc: Implement xs{max,min}cqp
> 
> Víctor Colombo (5):
>    target/ppc: Implement vmsumcud instruction
>    target/ppc: Implement vmsumudm instruction
>    target/ppc: Implement do_helper_XX3 and move xxperm* to use it
>    target/ppc: Move xs{max,min}[cj]dp to use do_helper_XX3
>    target/ppc: Implement xvcvbf16spn and xvcvspbf16 instructions
> 
>   include/tcg/tcg-op-gvec.h           |  22 +
>   target/ppc/fpu_helper.c             | 172 ++++--
>   target/ppc/helper.h                 | 144 ++---
>   target/ppc/insn32.decode            | 189 +++++-
>   target/ppc/insn64.decode            |  40 +-
>   target/ppc/int_helper.c             | 354 ++++++-----
>   target/ppc/translate.c              |  19 +
>   target/ppc/translate/vmx-impl.c.inc | 894 +++++++++++++++++++++++++---
>   target/ppc/translate/vmx-ops.c.inc  |  41 +-
>   target/ppc/translate/vsx-impl.c.inc | 516 ++++++++++++----
>   target/ppc/translate/vsx-ops.c.inc  |  67 ---
>   tcg/ppc/tcg-target.c.inc            |   6 +
>   tcg/tcg-op-gvec.c                   | 146 +++++
>   13 files changed, 2037 insertions(+), 573 deletions(-)
> 


