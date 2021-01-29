Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F2E3086C5
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 08:58:55 +0100 (CET)
Received: from localhost ([::1]:59932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5OgA-0007M9-BT
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 02:58:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l5OfH-0006nR-SW; Fri, 29 Jan 2021 02:57:59 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:53247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l5OfG-0003wh-2H; Fri, 29 Jan 2021 02:57:59 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MJEtx-1lOQXy3kuR-00Ki0v; Fri, 29 Jan 2021 08:57:46 +0100
Subject: Re: [PATCH] target/rx: Fix compiler errors for build with sanitizers
To: Stefan Weil <sw@weilnetz.de>, Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20210128172127.46041-1-sw@weilnetz.de>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1519606e-54cc-d0c2-32bd-6d44278059d5@vivier.eu>
Date: Fri, 29 Jan 2021 08:57:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128172127.46041-1-sw@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Vr8FxA6xvg+i4OyYMfdpS/+CYTYv94hXSV3B86Hj7M4n5AUjk/F
 f1LzUWpKf5s6XcXZdHqTp3oTioszBGruAZ1LQkDwvyfW2n6kOKcTQvBI4sEi0+rlEYS37vK
 0h3rTpU3iplJ7jG6q5TmMhn2SRoPWqsbUYS25IlS6JUd1oc9CS/FLnLjJIi+HOZ83FhR6BX
 4b6P7U1qBY/dog3+IAVLQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+SZBWB45JWY=:Wr+CWHvx16i+G73yOEr6Gf
 /e61qic36KCUnpm1adm+1LSHNND548w/fUzrQa9B12mCm9LmRnT9rcZNJaN4YZCyU904kuf6k
 k+qzVI/uwdZQC+OUGMQRi4NmmZ55RYdu1TKe/8ndIquw1wNJ9/a2RdPu/V0SzeQBxQx83jZww
 YqvaJDaXTclNLLUgHlrmxntu0OSGfuWgmrRNB1oEPatlIrSsoo9FpK/elONPGV7YkTLUm6GAr
 sCzadAv4KFO8HFJmbSPooJEDjC+0DpUSSi3cLRmr9AFxla2zKfLZsZZFjRuoW+AzZbzuTlOcq
 W0C8Y45wtugbVt77v5jf9x4rp1UgEjChJwOjndsahu7hnBehwII+oxM9cUewyFTOV+JGO+RJW
 ku3jY00dftPQPHTVGOc5Obd0MFoLicp5vJFmQ6rCeW0OPJ/tiZsEXgqJFxjqLUK2pjc4z3Trb
 B2Xza1xEYg==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 28/01/2021 à 18:21, Stefan Weil a écrit :
> gcc (Debian 10.2.1-6) 10.2.1 20210110 aborts builds with enabled sanitizers:
> 
> ../../../target/rx/op_helper.c: In function ‘helper_scmpu’:
> ../../../target/rx/op_helper.c:213:24: error: ‘tmp1’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>   213 |     env->psw_c = (tmp0 >= tmp1);
>       |                  ~~~~~~^~~~~~~~
> ../../../target/rx/op_helper.c:213:24: error: ‘tmp0’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
> ../../../target/rx/op_helper.c: In function ‘helper_suntil’:
> ../../../target/rx/op_helper.c:299:23: error: ‘tmp’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>   299 |     env->psw_c = (tmp <= env->regs[2]);
>       |                  ~~~~~^~~~~~~~~~~~~~~~
> ../../../target/rx/op_helper.c: In function ‘helper_swhile’:
> ../../../target/rx/op_helper.c:318:23: error: ‘tmp’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>   318 |     env->psw_c = (tmp <= env->regs[2]);
>       |                  ~~~~~^~~~~~~~~~~~~~~~
> 
> Rewriting the code fixes those errors.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> Those error are false positives, but simple code changes help the
> compiler (and perhaps reviewers) to understand it better.
> 
> Stefan
> 
> 
>  target/rx/op_helper.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
> index 59389f4992..4d315b4449 100644
> --- a/target/rx/op_helper.c
> +++ b/target/rx/op_helper.c
> @@ -201,14 +201,14 @@ void helper_scmpu(CPURXState *env)
>      if (env->regs[3] == 0) {
>          return;
>      }
> -    while (env->regs[3] != 0) {
> +    do {
>          tmp0 = cpu_ldub_data_ra(env, env->regs[1]++, GETPC());
>          tmp1 = cpu_ldub_data_ra(env, env->regs[2]++, GETPC());
>          env->regs[3]--;
>          if (tmp0 != tmp1 || tmp0 == '\0') {
>              break;
>          }
> -    }
> +    } while (env->regs[3] != 0);
>      env->psw_z = tmp0 - tmp1;
>      env->psw_c = (tmp0 >= tmp1);
>  }
> @@ -287,14 +287,14 @@ void helper_suntil(CPURXState *env, uint32_t sz)
>      if (env->regs[3] == 0) {
>          return ;
>      }
> -    while (env->regs[3] != 0) {
> +    do {
>          tmp = cpu_ldufn[sz](env, env->regs[1], GETPC());
>          env->regs[1] += 1 << sz;
>          env->regs[3]--;
>          if (tmp == env->regs[2]) {
>              break;
>          }
> -    }
> +    } while (env->regs[3] != 0);
>      env->psw_z = tmp - env->regs[2];
>      env->psw_c = (tmp <= env->regs[2]);
>  }
> @@ -306,14 +306,14 @@ void helper_swhile(CPURXState *env, uint32_t sz)
>      if (env->regs[3] == 0) {
>          return ;
>      }
> -    while (env->regs[3] != 0) {
> +    do {
>          tmp = cpu_ldufn[sz](env, env->regs[1], GETPC());
>          env->regs[1] += 1 << sz;
>          env->regs[3]--;
>          if (tmp != env->regs[2]) {
>              break;
>          }
> -    }
> +    } while (env->regs[3] != 0);
>      env->psw_z = env->regs[3];
>      env->psw_c = (tmp <= env->regs[2]);
>  }
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


