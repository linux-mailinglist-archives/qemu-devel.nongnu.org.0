Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82ED5BFF33
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 15:51:17 +0200 (CEST)
Received: from localhost ([::1]:46734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob08D-00033M-6E
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 09:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oazVe-0002p6-S5
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:11:26 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:34341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oazVc-00027T-Ni
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:11:26 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mw9Dg-1pT5dF1Ncy-00s5Zi; Wed, 21 Sep 2022 15:11:21 +0200
Message-ID: <e1bb22cd-e530-c27e-b4f9-17ca578fabbf@vivier.eu>
Date: Wed, 21 Sep 2022 15:11:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 4/4] target/m68k: always call gen_exit_tb() after writes
 to SR
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 richard.henderson@linaro.org, lucienmp.qemu@gmail.com, qemu-devel@nongnu.org
References: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
 <20220917112515.83905-5-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220917112515.83905-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XObnv8IxQCoAzlgAHIvl5fzpwZOyhX5j23HdTN2X4NFmQ7iqj0h
 0J9/Yio4BGSLMG9A0Ig4Cbpsvz4SMgRyg4mGmflvSDTZzmn0fmMC8+tLzUGmQrK/jenKPry
 4nxLuso7WeX9jlMRzUYt3+8yZsQf/bFrWVebQfcRA/GKJPVCJi+IyxLUeiPvEJzfaEQ/h2b
 nao3BI1oScsG/ScheM2nQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/Tp45Or8m+o=:jAqXIFZCwpfb+7l6KBlSej
 1iGwsSjuM9n6PUGgDV6MQDWqcG19Pc0xWk4FaSAfayhmadcCbVswZqrkfflUAj6hValjdMHm1
 LNuLzZLDC56f8dQ7SfwznfqCRpF4YlDQhzU49NP6Han8UBv+7JaIQqdXUFV5PvzsAzAvKV5sd
 UJLj75ZFJTUP1A99a9LQwtUCVnOeteVA4n2XsR94cy/xSkmIPzmdFp3GLv4BjpYQabL1yzs3l
 OwbpAj0YnxPlOk87BaJiYurSKCG60CWkYcwcyt9stnG6u1sUVDwodI1VqukdXBdDMq90rzsYG
 gbZ04LhvvBvLmkLpyOLmeDiC7xhbrSZm4luKJj0ArEwasN+Pxrjo5LaJSacwBkq9DAfMsIKcu
 zIn4azj2bf5gdXiJ5tCwpTy9JPgDIJPTRPxPbIKSE6joAlTj41AB0+sarlIeIra0YA5HB2m1Z
 2Pr/PpG62azxRTwi94Aiw2o9QhQ/LJ/RfwbidAapxfqOzhBBiDbrFdc6yZZDhrAZnc1Rzldw3
 Z2SfnhkqKLCc2F+eGidYn6pNpCvLFdHhWygrC4YX1kSzjcvZiRtgmpJ/srKrM14DwAR7ggAft
 FWI2xDyYSCrN+lwJWO7UvZVtnFCibvYLEBxuI6f80X3CI5DWuPkuwncBvMjBtat4d+Z/S15te
 BCHDsRVuwAIepMIyKNGmSEkrNTcm+E+/j8Pi2k6b7NLp6g8uZ/6pKAtVpz7PcStyVJQhnr8tA
 roOWRM/3rNfLL6APbcOXu3gRbrVPLqjyNXjt0ouFXEXilT97rLFpX9/c1ft8Zqg49G1qFyglf
 Am4tyeD
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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

Le 17/09/2022 à 13:25, Mark Cave-Ayland a écrit :
> Any write to SR can change the security state so always call gen_exit_tb() when
> this occurs. In particular MacOS makes use of andiw/oriw in a few places to
> handle the switch between user and supervisor mode.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   target/m68k/translate.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index be5561e1e9..892473d01f 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -2373,6 +2373,7 @@ DISAS_INSN(arith_im)
>           tcg_gen_or_i32(dest, src1, im);
>           if (with_SR) {
>               gen_set_sr(s, dest, opsize == OS_BYTE);
> +            gen_exit_tb(s);
>           } else {
>               DEST_EA(env, insn, opsize, dest, &addr);
>               gen_logic_cc(s, dest, opsize);
> @@ -2382,6 +2383,7 @@ DISAS_INSN(arith_im)
>           tcg_gen_and_i32(dest, src1, im);
>           if (with_SR) {
>               gen_set_sr(s, dest, opsize == OS_BYTE);
> +            gen_exit_tb(s);
>           } else {
>               DEST_EA(env, insn, opsize, dest, &addr);
>               gen_logic_cc(s, dest, opsize);
> @@ -2405,6 +2407,7 @@ DISAS_INSN(arith_im)
>           tcg_gen_xor_i32(dest, src1, im);
>           if (with_SR) {
>               gen_set_sr(s, dest, opsize == OS_BYTE);
> +            gen_exit_tb(s);
>           } else {
>               DEST_EA(env, insn, opsize, dest, &addr);
>               gen_logic_cc(s, dest, opsize);
> @@ -4592,6 +4595,7 @@ DISAS_INSN(strldsr)
>       }
>       gen_push(s, gen_get_sr(s));
>       gen_set_sr_im(s, ext, 0);
> +    gen_exit_tb(s);
>   }
>   
>   DISAS_INSN(move_from_sr)

Applied to my m68k-for-7.2 branch

Thanks,
Laurent


