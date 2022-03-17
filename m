Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C1D4DC087
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 08:56:57 +0100 (CET)
Received: from localhost ([::1]:40602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUl0C-0000no-1S
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 03:56:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nUkz4-0008ST-3g
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 03:55:46 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:33939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nUkz1-0001AF-Ra
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 03:55:45 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.216])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B8C6C26C4C;
 Thu, 17 Mar 2022 07:55:40 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 17 Mar
 2022 08:55:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004e6aef6f0-26e7-47a8-93a0-904e10f93149,
 0530BE337510AE92842F4B01C4CA167143738EB5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <33f9b376-4236-cee1-c7ea-7604ad272937@kaod.org>
Date: Thu, 17 Mar 2022 08:55:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4] ppc64: Avoid pt_regs struct definition
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
References: <20220315015740.847370-1-raj.khem@gmail.com>
 <71be7777-9888-18fd-bdd0-3cef3ada8728@linaro.org>
 <CAFEAcA9+ppnpHxjzScesj4ZzNDVJ8bNzb2nkcd8cN5+zMJwJfg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA9+ppnpHxjzScesj4ZzNDVJ8bNzb2nkcd8cN5+zMJwJfg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 63966c53-8c89-49d2-bd10-ee2e95baf50a
X-Ovh-Tracer-Id: 16824322309625580393
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeffedguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlvhhivhhivghrsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Khem Raj <raj.khem@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent,

On 3/15/22 11:31, Peter Maydell wrote:
> On Tue, 15 Mar 2022 at 02:14, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 3/14/22 18:57, Khem Raj wrote:
>>> Remove pt_regs indirection and instead reference gp_regs directly, this
>>> makes it portable across musl/glibc
>>>
>>> Use PT_* constants defined in asm/ptrace.h
>>>
>>> Move the file to ppc64 subdir and leave ppc empty
>>>
>>> Fixes
>>> ../qemu-6.2.0/linux-user/host/ppc64/../ppc/host-signal.h:16:32: error: incomplete definition of type 'struct pt_regs'
>>>       return uc->uc_mcontext.regs->nip;
>>>              ~~~~~~~~~~~~~~~~~~~~^
>>>
>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>> Cc: Peter Maydell<peter.maydell@linaro.org>
>>> Cc: Philippe Mathieu-Daudé<f4bug@amsat.org>
>>> Cc: Richard Henderson<richard.henderson@linaro.org>
>>> ---
>>> v2: Drop ifdef __powerpc__
>>> v3: Access go_regs directly and move the file to ppc64 dir
>>> v4: Use PT_* constants defined in asm/ptrace.h
>>>
>>>    linux-user/include/host/ppc/host-signal.h   | 38 -------------------
>>>    linux-user/include/host/ppc64/host-signal.h | 42 ++++++++++++++++++++-
>>>    2 files changed, 41 insertions(+), 39 deletions(-)
>>>    delete mode 100644 linux-user/include/host/ppc/host-signal.h
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> I did a compile-check and confirmed that this builds OK
> on glibc headers too.

I can queue this patch for 7.0. I have a few already.

C.

