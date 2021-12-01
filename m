Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9F146549A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 19:00:20 +0100 (CET)
Received: from localhost ([::1]:33490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msTtz-0005o0-9O
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 13:00:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1msTsH-0004FC-BO; Wed, 01 Dec 2021 12:58:34 -0500
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:41627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1msTsC-0003ga-Ft; Wed, 01 Dec 2021 12:58:31 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.238])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id C120C204B1;
 Wed,  1 Dec 2021 17:58:16 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 1 Dec
 2021 18:58:16 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003d208cf67-eb27-4546-8447-91758a68303f,
 A214034E9EDAB49BEA2160BF49F8C38F118F2259) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2aaf6e9a-7115-136d-18b6-fbf959f56531@kaod.org>
Date: Wed, 1 Dec 2021 18:58:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 0/3] Fix mtfsf, mtfsfi and mtfsb1 bug
Content-Language: en-US
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>
References: <20211201163808.440385-1-lucas.araujo@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211201163808.440385-1-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 52ab2142-98b9-4b4a-9a9b-e821a19ec19c
X-Ovh-Tracer-Id: 13238331108650617647
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieefgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedtjeeffedvvedtffevjeeitdejgeeiueejhfffkeffgeeghedvleffuedvjeeftdenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehmrghthhgvuhhsrdhfvghrshhtsegvlhguohhrrgguohdrohhrghdrsghr
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.211,
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com,
 mark.cave-ayland@ilande.co.uk, pc@us.ibm.com, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/21 17:38, Lucas Mateus Castro (alqotel) wrote:
> The instructions mtfsf, mtfsfi and mtfsb1, when called, fail to set the FI
> bit (bit 46 in the FPSCR) and can set to 1 the reserved bit 52 of the
> FPSCR, as reported in https://gitlab.com/qemu-project/qemu/-/issues/266
> (although the bug report is only for mtfsf, the bug applies to mtfsfi and
> mtfsb1 as well).
> 
> These instructions also fail to throw an exception when the exception
> and enabling bits are set, this can be tested by adding
> 'prctl(PR_SET_FPEXC, PR_FP_EXC_PRECISE);' before the __builtin_mtfsf
> call in the test case of the bug report.
> 
> These patches aim to fix these issues.
> 
> Changes from v3:
> - rebased on the master branch of https://gitlab.com/qemu-project/qemu


Richard had reviewed patch 1 and 2. It is better to keep the
Reviewed-by when resending. Please do if there is a v5. I will
add them for v4.

Thanks,

C.

> 
> Changes from v2:
> - changed patch order to add the mtfsf test after the FI bit and
>    deferred exception fix(patch 1) as these are the errors tested here
> - moved code to check FP_VE only once in helper_fpscr_check_status
> - tests/tcg/ppc64le/mtfsf.c tests if the signal code is correct
> - FPSCR bits 0-28 can't be set anymore as they're reserved bits
> - changed (11ull << 11) in FPSCR_MTFS_MASK to PPC_BIT(52) to make it clearer
> 
> Changes from v1:
> - added a test for mtfsf (patch 3)
> - moved "Resolves" to second patch
> - removed gen_reset_fpstatus() from mtfsf,mtfsfi and mtfsb1 instructions
> 
> 
> Lucas Mateus Castro (alqotel) (3):
>    target/ppc: Fixed call to deferred exception
>    test/tcg/ppc64le: test mtfsf
>    target/ppc: ppc_store_fpscr doesn't update bits 0 to 28 and 52
> 
>   target/ppc/cpu.c                   |  2 +-
>   target/ppc/cpu.h                   |  4 ++
>   target/ppc/fpu_helper.c            | 48 +++++++++++++++++++++++
>   target/ppc/helper.h                |  1 +
>   target/ppc/translate/fp-impl.c.inc |  9 ++---
>   tests/tcg/ppc64/Makefile.target    |  1 +
>   tests/tcg/ppc64le/Makefile.target  |  1 +
>   tests/tcg/ppc64le/mtfsf.c          | 61 ++++++++++++++++++++++++++++++
>   8 files changed, 120 insertions(+), 7 deletions(-)
>   create mode 100644 tests/tcg/ppc64le/mtfsf.c
> 


