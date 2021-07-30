Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C003DBDAE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 19:24:58 +0200 (CEST)
Received: from localhost ([::1]:48200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9WFk-0003y0-RC
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 13:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1m9WEd-00037r-4Q
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 13:23:47 -0400
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:36111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1m9WEb-0001BE-9H
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 13:23:46 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.118])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id A5D071FF85;
 Fri, 30 Jul 2021 17:23:42 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 30 Jul
 2021 19:23:41 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00571445348-5dbb-4d86-9bcd-2e6589db47c6,
 76D9A100687C30740A262902056384F06FAB8BF1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Subject: Re: [PATCH for-6.2 07/43] target/ppc: Set fault address in
 ppc_cpu_do_unaligned_access
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-8-richard.henderson@linaro.org>
 <CAFEAcA-SHZbfEppKBZxVw3+t4VRSRfN7yA4PNNHX9LQ=OkKhjw@mail.gmail.com>
 <b20e658f-f400-3921-a31e-25c0e8451b1e@linaro.org>
 <e77dc226-68e9-a48c-7e73-06ab0f89f845@kaod.org>
Message-ID: <33efa829-f154-a96d-ab1b-09f3e79a37a0@kaod.org>
Date: Fri, 30 Jul 2021 19:23:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e77dc226-68e9-a48c-7e73-06ab0f89f845@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 42850b3b-c3bf-4215-a506-6549a261a234
X-Ovh-Tracer-Id: 3863525530755107808
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrheehgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffhvfhfkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeelvdffieekfedufedvgefhfeffffffvdelffehvdfhfffggeeiveejjeekudfgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/21 7:13 PM, Cédric Le Goater wrote:
> On 7/29/21 8:05 PM, Richard Henderson wrote:
>> On 7/29/21 3:44 AM, Peter Maydell wrote:
>>> On Thu, 29 Jul 2021 at 01:51, Richard Henderson
>>> <richard.henderson@linaro.org> wrote:
>>>>
>>>> We ought to have been recording the virtual address for reporting
>>>> to the guest trap handler.
>>>>
>>>> Cc: qemu-ppc@nongnu.org
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>> ---
>>>>   target/ppc/excp_helper.c | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>>>> index a79a0ed465..0b2c6de442 100644
>>>> --- a/target/ppc/excp_helper.c
>>>> +++ b/target/ppc/excp_helper.c
>>>> @@ -1503,6 +1503,8 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>>>>       CPUPPCState *env = cs->env_ptr;
>>>>       uint32_t insn;
>>>>
>>>> +    env->spr[SPR_DAR] = vaddr;
>>>> +
>>>
>>> Is this the right SPR for all PPC variants? For instance the
>>> kernel's code in arch/powerpc/kernel/exceptions-64e.S looks
>>> in SPRN_DEAR, which is our SPR_BOOKE_DEAR or SPR_40x_DEAR.
> 
> Indeed :/
> 
>> I have no idea.  I glanced through a handful of the mmu's, and looked at the current BookS docs, but that's certainly not all.
> 
> I took a look at some more and for instance, e300 uses DAR and e500, 405, 476 use DEAR. 
> 
> DAR should be consistent over the server processors.


and  is_book3s_arch2x(env) is a good way to test.

Thanks,

C. 

