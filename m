Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410364CD568
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 14:46:40 +0100 (CET)
Received: from localhost ([::1]:37078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8GV-0008PR-7b
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 08:46:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nQ7xh-0002Lz-Ub; Fri, 04 Mar 2022 08:27:15 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:47849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nQ7xf-00070d-VN; Fri, 04 Mar 2022 08:27:13 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MMGZS-1niLb745t0-00JLBa; Fri, 04 Mar 2022 14:27:04 +0100
Message-ID: <dffb5828-5750-e460-d42f-97fb4ff8ef93@vivier.eu>
Date: Fri, 4 Mar 2022 14:27:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/3] linux-user/ppc: deliver SIGTRAP on
 POWERPC_EXCP_TRAP
Content-Language: fr
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220113170456.1796911-1-matheus.ferst@eldorado.org.br>
 <20220113170456.1796911-2-matheus.ferst@eldorado.org.br>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220113170456.1796911-2-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2Mgal6fQRYho8OHDMft+3/G2zdn2+NXOA1qlBW/CpPhaZ65kJ5u
 vl6u0C/ETN0/orKMHj2RledA2YZrQRuaUrPWGVlg6TWlrg4t8tIiaPa0dC32vMlzPMA2GiQ
 OiNCdvGeHxm+kQPfE/Cl8/0A2u9V7l1+DgAyBp1bEr56nqgMuvvVtBLU5H+2MCQlSLQC9Xd
 G2r6TjIbCTfHhDmYnSfRQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:s3ZeuRXWD4k=:UxTaupvamsFw919EepYBVk
 5uL4Dl/em0AoJVzmbXeKlJj+MWPWJWC4/BlQdPJgs6bn0yGmmRZ0PkppfYUfqCubcOJdD2lIR
 s02zfegNOJB00Wjx/2fbeD7szfJ+Ttc9P7WG6fU2i6HzTP3UqekoY1y36k+JLqq0ZC23psugC
 lo/j4yzK/H9NcNO6l3FjYgBxUIaFh3phj4EPP9h4TyBtO4E0gGNvf1jZjKKHYrF6mIn+z0/gM
 ZKWCdkS85VD5SABDSokyzrv44UJwdDHjwExB7HSZ2SHXJzbjgEZtScNuTsudP+cq6OBJi86Hg
 53wjKzSzn6334EdZPE/tlmJCZjg9AjHl9a2RR3VaJHhTOE9dDnExrdfyjZvKoboX2ZdmV7vXp
 Qo5JGfe7fzhKcK0vFofv7vFflFJ85aZXHR2dNoUF0aljQWctokkT/YhtvQ9Ep+aJrsXgIHQPG
 yvFhWABbNg0W7yl+1YpBLUF4V82PmzzeEfyREi9bxgdL0KgYsoxrYJPt6m8f6R9cEH0RIoRWf
 gXDshpJ+m85BFWbkOjB727N+lLn/viSsopQPgQxCmRuRkYovDWRePll2RoSlUhliM1GsZYRik
 VTCV/Ddej/rSInbE4xIIOHlEe/eQ822Z3tJp5m/r8iCzUfM0CSwiG7RPmKBPWXpM1pCXt7ncK
 W0ARGYQevm1ptiN7GlTJ6+CGfMWswD8y12Yo+9CUvCNnxoKRiVVbj4l9iTvClIw49nF8=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: groug@kaod.org, danielhb413@gmail.com, richard.henderson@linaro.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/01/2022 à 18:04, matheus.ferst@eldorado.org.br a écrit :
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Handle POWERPC_EXCP_TRAP in cpu_loop to deliver SIGTRAP on tw[i]/td[i].
> The si_code comes from do_program_check in the kernel source file
> arch/powerpc/kernel/traps.c
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
>                   break;
>               default:
>                   /* Should not happen ! */

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent



