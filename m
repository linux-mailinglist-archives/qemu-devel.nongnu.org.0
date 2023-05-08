Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E7F6FB4B4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 18:08:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw3O2-0001ti-SU; Mon, 08 May 2023 12:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pw3O1-0001sn-4b
 for qemu-devel@nongnu.org; Mon, 08 May 2023 12:06:53 -0400
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pw3Nz-0006lg-En
 for qemu-devel@nongnu.org; Mon, 08 May 2023 12:06:52 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MPGNn-1pYihh2ru9-00PeNe; Mon, 08 May 2023 18:06:48 +0200
Message-ID: <2586a5d3-d944-59e9-07c6-0e638f5a679f@vivier.eu>
Date: Mon, 8 May 2023 18:06:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] target/m68k: Fix gen_load_fp for OS_LONG
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230508140857.137405-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230508140857.137405-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eMgtBTADC7foO27dHhSawJcUtJkL6zbVwQJpMbNQiWC2AVVDrRP
 v51kNCuqXeQ8YVXUjMuD6+3Q58ueoQGkyY+ZltIVAS11RXC5HaYaqBOFIoynAb6i2JPV39h
 quwQCNjGim/UyAFVVIyep+QAcTBCmPpeXheJ95i07YLHUWxfe/VgsErd99r1KjuglhdH3jl
 Yiru5IaEdJUnOtZUZBA0g==
UI-OutboundReport: notjunk:1;M01:P0:jWD2v/zh4AM=;WEM+hRrm/4ZsZVx7BI+iWzRXtyP
 VT/bpbHQ6Cp39eQcZhnpEOOle50KJu7E0uEEuikgI1p6WEC9bcJrWeBWKCVtvz75aXBDYOHB2
 Lv+OABdks/N2EnDrTlVHId4BI2eC0ySVZiHHuDkMum2CZXiWVzqD2w0D1t9QNwOpospsLwFzm
 iL4pLzC+sHdKiRIKcUQhbR53o78jjAfeCPvUHx1YP8KCBgQTy58EGzhHEgizaaOjjHVz4VunT
 H4Srpsfz37S1TG3sg9iWwuU+Ft0ePbnWDmTJvh1Gsun8rvItBMk8LnYeh8moF3Gex/mULNtHB
 qRMQbE3WtYNO20OfrxJmcIabKuP8ImgBl638KN7TaC3MzLIW8WmlPKAq0KOW3NXFXnxgYy8Xz
 8F+lhtSnj2BNAgH/tVYcPWUBHCgItC9iesuzbIo0sS1avpvhR0X4Ik0RhdlYdfGnW5dGiWkXZ
 CGSbfCKhe04wZdegjplbkucViEfJTt4wPCqctN71Gg+J6td6KNpPCthvPiWgAUdl7LvF76i3V
 Hkxzl3tMrvAHXhk2JJxen46De2/9PjCwHXDtyDXtATR7wDQ7JNIikmMDRIPG/siK3C+s8ggF3
 PZvJVZnvT27r4Ht2lVMImGy1+LsdousejBpexSnZD2akbP6PElrH6lvXeXFATa6CHB5bJN1Bk
 Md6+wQHkigZhoGLhhWUKtjBut3//2yQLVc3wf8L2ng==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.802,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 08/05/2023 à 16:08, Richard Henderson a écrit :
> Case was accidentally dropped in b7a94da9550b.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 744eb3748b..44d852b106 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -959,6 +959,7 @@ static void gen_load_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp,
>       switch (opsize) {
>       case OS_BYTE:
>       case OS_WORD:
> +    case OS_LONG:
>           tcg_gen_qemu_ld_tl(tmp, addr, index, opsize | MO_SIGN | MO_TE);
>           gen_helper_exts32(cpu_env, fp, tmp);
>           break;

Tested-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>

