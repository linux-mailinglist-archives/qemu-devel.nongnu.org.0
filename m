Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22111484E87
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 07:56:54 +0100 (CET)
Received: from localhost ([::1]:40220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n50E9-0005fl-7e
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 01:56:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n504S-0001M0-5Q
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 01:46:52 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:45849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n504Q-0006oL-7X
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 01:46:51 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.173])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 2089FD5A071C;
 Wed,  5 Jan 2022 07:46:46 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 5 Jan
 2022 07:46:46 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002889ad811-5f7e-4dd6-917e-d511b6509a31,
 F300054E251B1656E5F742D8639387136BB44EF7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a31423b5-2d76-12a9-5bea-fcc4e608342a@kaod.org>
Date: Wed, 5 Jan 2022 07:46:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/2] linux-user/ppc: deliver SIGTRAP on
 POWERPC_EXCP_TRAP
Content-Language: en-US
To: <matheus.ferst@eldorado.org.br>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
References: <20220104210015.457468-1-matheus.ferst@eldorado.org.br>
 <20220104210015.457468-2-matheus.ferst@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220104210015.457468-2-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 64751960-71bc-4c64-bacf-64b95eaacef5
X-Ovh-Tracer-Id: 4527806478695369580
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefgedgleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.057,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, laurent@vivier.eu,
 david@gibson.dropbear.id.au, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 22:00, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Handle POWERPC_EXCP_TRAP in cpu_loop to deliver SIGTRAP on tw[i]/td[i].
> The si_code comes from do_program_check in the kernel source file
> arch/powerpc/kernel/traps.c
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   linux-user/ppc/cpu_loop.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
> index 46e6ffd6d3..6c99feb19b 100644
> --- a/linux-user/ppc/cpu_loop.c
> +++ b/linux-user/ppc/cpu_loop.c
> @@ -188,7 +188,8 @@ void cpu_loop(CPUPPCState *env)
>                   }
>                   break;
>               case POWERPC_EXCP_TRAP:
> -                cpu_abort(cs, "Tried to call a TRAP\n");
> +                si_signo = TARGET_SIGTRAP;
> +                si_code = TARGET_TRAP_BRKPT;

These lack 'info.'

Thanks,

C.

>                   break;
>               default:
>                   /* Should not happen ! */
> 


