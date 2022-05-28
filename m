Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4590536DC7
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 18:36:05 +0200 (CEST)
Received: from localhost ([::1]:40102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuzQ3-0004Mq-Tl
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 12:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nuzNS-0003E0-I8
 for qemu-devel@nongnu.org; Sat, 28 May 2022 12:33:23 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:60229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nuzNQ-0004H9-Rx
 for qemu-devel@nongnu.org; Sat, 28 May 2022 12:33:22 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MfZ9C-1nJjka1HUO-00fyUy; Sat, 28 May 2022 18:33:16 +0200
Message-ID: <aa940bf1-cf21-bf5f-dc6b-839776a19b9e@vivier.eu>
Date: Sat, 28 May 2022 18:33:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 04/17] linux-user/m68k: Handle EXCP_TRAP1 through
 EXCP_TRAP15
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220527164807.135038-1-richard.henderson@linaro.org>
 <20220527164807.135038-5-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220527164807.135038-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:U3q1taP6pBY6HLqa8cYkNhpkCpHT2FzCQnN/C1EksnJGpEquJXT
 AssmPJm+zHLIgEuDNDG2+QzJvt5VfXW/ZUbJREijH05wPLnzD/FbEaCKGj5fcHPGjLKn8Cx
 pnzBaUCWmq4etZ0eEqy58vsRpTcM0zEPJDVOJufFSLuQmyJKoUzfYjTabH29pjV4LQ9hBYb
 4afNLDHbbxsjR/ixHASfQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vH49mjdkBJQ=:wyTzStA0eKdne2Bx50mrdi
 3+iZ3/bs7YUUoz5rx+p0cljr59y+eAYxXpmLPNenDyzyw3dJ5w6IXBObEuyghu2VQxP0dEAe2
 vJ4ooMHJSPNUXjL5Lkk20nzqmVWH5+0s/hhxwJS53yjHn/hwqbgXCfuDikNt9nXWe1S2aLdSL
 ameNinF8R1ICuJJ1j/tbC/n4zBHb3dh9tBgu4fIGxJDuIOR+HM8IzSGyilt6oZN7rvn1haMYE
 shpMTfvDv4mdr8T5ehYMSAJGryWgJfb/3LM3LpOk5WS3wDtS7OaNa/Yrtsyw6fR936Yq2VLQP
 9IyBTNQJ9sIArguzzg5w6QvAzNO0GSbCm+XJUS3vFQqfOEzxg4F9r6HAroJdCM/aB0oUO+mwb
 g/nYvQMw0XBx5Om1oNhT8Mp1Q7883uLxVEma4nr73mck6YIqoWcmjmxEpjEmqxVJH1/yzXUZp
 K+aSw7s0jzyvmhQa7iBvzyP5Jdselldc5ErvtD+saHLxZ78awENEx3gr+b/DReA1YieWxJYTh
 qsU92KicUH//FooUb0BU34Y9fI5JLzImMy0A5K+yySmKMZ9I2t5zYaI1TynfV5ShP1F5nE7QV
 YKu8t3DpGeLVSdZr8hzp8Dx4zPFqugAQO1BZfl7K03CjBxN7TSll/fg9OzyPC06zia1VQD1ZW
 ymHHX4Kzwp7t2Y1eUymmZvxvC33/zDcx8+jENG+zY5L7dqjyU52OMFZsNPn/Nwu8GI0zcKXRP
 Ay6KTGSSCqEafeGQoRTx9+KpssyyjgjI9wnWEQ==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/05/2022 à 18:47, Richard Henderson a écrit :
> These are raised by guest instructions, and should not
> fall through into the default abort case.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/m68k/cpu_loop.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
> index 56417f7401..12e5d9cd53 100644
> --- a/linux-user/m68k/cpu_loop.c
> +++ b/linux-user/m68k/cpu_loop.c
> @@ -75,7 +75,11 @@ void cpu_loop(CPUM68KState *env)
>           case EXCP_INTERRUPT:
>               /* just indicate that signals should be handled asap */
>               break;
> +        case EXCP_TRAP0 + 1 ... EXCP_TRAP0 + 14:
> +            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLTRP, env->pc);
> +            break;
>           case EXCP_DEBUG:
> +        case EXCP_TRAP15:
>               force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
>               break;
>           case EXCP_ATOMIC:

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

