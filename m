Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741135BFF30
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 15:51:08 +0200 (CEST)
Received: from localhost ([::1]:49010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob083-0002uE-IB
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 09:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oazMU-00035F-Ai
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:01:59 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:39071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oazMR-0000TI-UJ
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:01:58 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MVaQW-1okzm11gFY-00RbKr; Wed, 21 Sep 2022 15:01:53 +0200
Message-ID: <7a97f680-da84-9631-3e78-9e103bbd20e5@vivier.eu>
Date: Wed, 21 Sep 2022 15:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/2] target/m68k: Fix MACSR to CCR
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk
References: <20220913142818.7802-1-richard.henderson@linaro.org>
 <20220913142818.7802-2-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220913142818.7802-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:li2kRMmVY9gEX21zzQey2NfnssEaMuo/rUz196jOdVtmGicBv+G
 ESOHQ84ekLNmmWMusoGHG1kssPa2QEHkoNty5HPXysnIl1dlwn/RouavkBRHtAXcDVHcWQ4
 RJqiQJZMNycDsha3ZnqBr7ibXOMhuMUpgS9zmsBsZofOZvyI6wNZceCvXi+7htURQOS5fUu
 YOM9ekjWQIuMnZ8/Ys0rw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Kq1/GMeRSI8=:l8cp+Mw/HG+zaXmtkUsEpx
 j1v9PnWeURrJ/HZAfh6LI1UAEuOWS2XXb3pvC78/J//zbenuPQRb+kawUfv/P7BehWCiLh7+k
 Odl6yEhG07yK1lNR3ILC6ifENYNB7EOM5aFGiDwMKxytk+IZSLNsm8WC/n/CtWx7TdoAAqAwF
 OZGzj9XuyqUkS7cpBp0k1Zt13cq/sQb7beDfLNcCvDgrWYhFNS8GzLebRzYON0caQKHbcVtNl
 06Z3Xb/kEcQcprnF7ATcgUBLcpI+TGDjICplIC7zGqB4NpvAiDCqZNeyF6xMO0u7npsiwcsiP
 puOhbWzKD0La9612aze3tKM62YHLvnSFzkzBeb+/8IIqJt+MTTb6Yi9LW+3Asm39QEQHBEewJ
 5iBHT5lgaKGSpH71kIKSt7v4ZSMGL1SqSf3ltBNCrkERM8UOq/u8zlzeXi0doBlk89XvDDwh1
 yi7x+ROYQEfvzVjuT4COCCM7qNp+nAuRrb9PulREVuP8ohWV+ebR7H5oAMtpp3TFcsjFVgh6G
 N6adyMi18urq+hDwkSnZLQikOwxN24EJpWKcnZ1coQ/B7bnlm34CYXGCXy3YIPBPRs40sL5Um
 Rn7kjl+Qc64gtm/OsuBT0pVL9prSgnUnqlBh7FH0IImGejYQ7aRr0JlEcBA0QTPwAGjRv3VdJ
 I1Izsz2pGNMvUp9Z77A5UmULFK114NaZKqhi5jtpmflW3hrf9T34E1U6PSENfQX3yg8SJiLq0
 7tHUpFUJiBEhBuMP2Y6f/LMlGup7DwvCYD+lEFqDVBZfbGFD/AaYowhln71/h+MnL7v9U30VO
 mks46/e
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.702,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 13/09/2022 à 16:28, Richard Henderson a écrit :
> First, we were writing to the entire SR register, instead
> of only the flags portion.  Second, we were not clearing C
> as per the documentation (X was cleared via the 0xf mask).
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 5098f7e570..87044382c3 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -5892,8 +5892,10 @@ DISAS_INSN(from_mext)
>   DISAS_INSN(macsr_to_ccr)
>   {
>       TCGv tmp = tcg_temp_new();
> -    tcg_gen_andi_i32(tmp, QREG_MACSR, 0xf);
> -    gen_helper_set_sr(cpu_env, tmp);
> +
> +    /* Note that X and C are always cleared. */
> +    tcg_gen_andi_i32(tmp, QREG_MACSR, CCF_N | CCF_Z | CCF_V);
> +    gen_helper_set_ccr(cpu_env, tmp);
>       tcg_temp_free(tmp);
>       set_cc_op(s, CC_OP_FLAGS);
>   }

Applied to my m68k-for-7.2 branch

Thanks,
Laurent


