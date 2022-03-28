Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120B94E9B96
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 17:47:48 +0200 (CEST)
Received: from localhost ([::1]:36410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYras-0005np-I1
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 11:47:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nYrZh-0004wb-Ur
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 11:46:33 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:34911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nYrZf-00051i-Ro
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 11:46:33 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.250])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B6C99F089BA8;
 Mon, 28 Mar 2022 17:46:28 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 28 Mar
 2022 17:46:28 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006c807d495-0082-4c00-aa47-6276ba779434,
 CFE7A3AAE61928554BF17059C30BCFB3D76DD066) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7c98d489-678e-5c4a-8c6a-d24fb9dc7e3f@kaod.org>
Date: Mon, 28 Mar 2022 17:46:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 1/6] target/ppc: Add support for the Processor
 Attention instruction
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, Leandro Lupori
 <leandro.lupori@eldorado.org.br>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
References: <20220324190854.156898-1-leandro.lupori@eldorado.org.br>
 <20220324190854.156898-2-leandro.lupori@eldorado.org.br>
 <43660ac0-a920-0271-cd99-0100271f937d@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <43660ac0-a920-0271-cd99-0100271f937d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 04f1a34e-5086-4270-8beb-80a615677160
X-Ovh-Tracer-Id: 15588084213009779503
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudehjedgleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
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
Cc: pbonzini@redhat.com, danielhb413@gmail.com, alex.bennee@linaro.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/22 14:04, Richard Henderson wrote:
> On 3/24/22 13:08, Leandro Lupori wrote:
>> +    /* Processor Attention                                                   */
>> +    POWERPC_EXCP_ATTN          = 0x100,
>> +    /*
>> +     * NOTE: POWERPC_EXCP_ATTN uses values from 0x100 to 0x1ff to return
>> +     *       error codes.
>> +     */
> 
> As used below, this is not an exception -- the exception is POWERPC_EXCP_MCHECK.  This is something else, for env->error_code.  

Yes. I hacked my way through.

> You could probably come up with a better name, but see below.
> 
>> +            if ((env->error_code & ~0xff) == POWERPC_EXCP_ATTN) {
>> +                exit(env->error_code & 0xff);
>> +            }
> 
> This will want gdb_exit(value) as well; see e.g. semihosting/arm-compat-semi.c.
> 
> In this and the next patch, I do not see anything that makes support for attn conditional, and importantly, off by default.  Otherwise this seems to have the potential for denial of service.

Indeed.

>> +void helper_attn(CPUPPCState *env, target_ulong r3)
>> +{
>> +    bool attn = false;
>> +
>> +    if (env->excp_model == POWERPC_EXCP_POWER8) {
>> +        attn = !!(env->spr[SPR_HID0] & HID0_ATTN);
>> +    } else if (env->excp_model == POWERPC_EXCP_POWER9 ||
>> +               env->excp_model == POWERPC_EXCP_POWER10) {
>> +        attn = !!(env->spr[SPR_HID0] & HID0_POWER9_ATTN);
>> +    }
>> +
>> +    if (attn) {
>> +        raise_exception_err(env, POWERPC_EXCP_MCHECK,
>> +                            POWERPC_EXCP_ATTN | (r3 & 0xff));
>> +    } else {
>> +        raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
>> +                               POWERPC_EXCP_INVAL |
>> +                               POWERPC_EXCP_INVAL_INVAL, GETPC());
>> +    }
>> +}
> 
> Why did you decide to raise an exception instead of exiting right here?

attn quiesce the thread/core but it can generate an 'host attn'
interrupt event for the service processor, it behaves like a
checkstop.

I think my idea was to raise an interrupt in the instruction model,
and then from the exception model, reach the machine through some
QOM Interface to take action. pSeries would do nothing or exit
depending on some machine option, PowerNV could raise a PSI IRQ
line to signal the embedded BMC simulator to do poweroff

I took a shortcut and introduced an exit() call when I saw the
complexity increase.

But really, the need in this series is to be able to exit from
QEMU after some test has run.
   
> 
> I suggest syncing env state before calling the helper, so that you don't need to unwind here, and so that state is up-to-date for the debugger before exiting.

ok.

>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index 408ae26173..5ace6f3a29 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -4123,6 +4123,19 @@ static void gen_rvwinkle(DisasContext *ctx)
>>       gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
>>   #endif /* defined(CONFIG_USER_ONLY) */
>>   }
>> +
>> +static void gen_attn(DisasContext *ctx)
>> +{
>> + #if defined(CONFIG_USER_ONLY)
>> +    GEN_PRIV;
>> +#else
>> +    CHK_SV;
>> +
>> +    gen_helper_attn(cpu_env, cpu_gpr[3]);
>> +    ctx->base.is_jmp = DISAS_NORETURN;
>> +#endif
>> +}
> 
> You want gen_update_nip(ctx, ctx->cia) in there, like gen_exception_err.
> 
> 
>> +GEN_HANDLER(attn, 0x0, 0x00, 0x8, 0xfffffdff, PPC_FLOW),
> 
> New insns into insns32.decode, I would expect.
> 

Thanks,

C.

