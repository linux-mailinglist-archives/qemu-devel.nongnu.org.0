Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839A23DBD70
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 19:01:02 +0200 (CEST)
Received: from localhost ([::1]:33242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Vsa-0000kw-Vz
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 13:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1m9Vqj-0007iM-5Y; Fri, 30 Jul 2021 12:59:05 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:53391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1m9Vqh-0001cg-CN; Fri, 30 Jul 2021 12:59:04 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.173])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id C020BB7BB14C;
 Fri, 30 Jul 2021 18:58:59 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 30 Jul
 2021 18:58:59 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0043f397700-5eed-40a2-8434-650c686fac0b,
 76D9A100687C30740A262902056384F06FAB8BF1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Subject: Re: [PATCH for-6.2 07/43] target/ppc: Set fault address in
 ppc_cpu_do_unaligned_access
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <80f4370f-a401-5873-9c39-fb41bd4116fa@kaod.org>
Date: Fri, 30 Jul 2021 18:58:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5e26b9a9-dc4c-4f2b-907c-0ec6fdb784a0
X-Ovh-Tracer-Id: 3446098143824088029
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrheehgddutdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 2:46 AM, Richard Henderson wrote:
> We ought to have been recording the virtual address for reporting
> to the guest trap handler.
> 
> Cc: qemu-ppc@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


> ---
>  target/ppc/excp_helper.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index a79a0ed465..0b2c6de442 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1503,6 +1503,8 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>      CPUPPCState *env = cs->env_ptr;
>      uint32_t insn;
>  
> +    env->spr[SPR_DAR] = vaddr;
> +
>      /* Restore state and reload the insn we executed, for filling in DSISR.  */
>      cpu_restore_state(cs, retaddr, true);
>      insn = cpu_ldl_code(env, env->nip);
> 


