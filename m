Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927475BBADE
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 00:31:54 +0200 (CEST)
Received: from localhost ([::1]:38596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZgLp-0003BL-DL
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 18:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZgJW-0001fx-NY
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 18:29:30 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZgJV-0006gj-21
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 18:29:30 -0400
Received: by mail-wr1-x42f.google.com with SMTP id g3so20568571wrq.13
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 15:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=vm2aaiUBMxv0/E3MGdffjSguHPmr3JjW5Ryswvdk1YE=;
 b=a3vQvQoFgEu5OYuW4oe17SYlTcBcjryqSprzK8rAJZCXFPvlC27Wp/xmYA63XCGvdL
 HPju3+gN/K9EHIWZrOqtVPO1H+/ob+w8jYVa91MdipVleU4JS+zU5m23asi/XBLcNSlY
 YL4pPKQFJyBXujYOOoqpz4aOOvTJPyT7kzUSwEGuxcfuKJ+Fh92pUmkPargRwPro8YdS
 BX/OyH8BXHW01mkf5emY2Tu/jeZukKrv0l7MVZZZ1ON5lJqx4qH0gd3kfWdkJdH8zWib
 UeTAKpmCEL//skzQCxVjmqmoKv5D1lPHGT6WbZQMuXQE16eJnYl3IZggHkPHIoh4bYYR
 dklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=vm2aaiUBMxv0/E3MGdffjSguHPmr3JjW5Ryswvdk1YE=;
 b=yOA6DBvZi2gIKR0LSoVaDZy0ocdTJB1KtdoGJGNcL+MrnDcjZW2REozgWlYSxwg3M4
 EsG+z8rA9M3D0s8SxDqlbJud6oVRN+o+iXJ8yLKmdnmu0OG7NMwIuVSG6Zs43Vg2nSHT
 UlhiqKuXxzvpQ+coMJtvcJTi/id8OD4kIYlFrXI3V2ANG5p235QVZ5uxKWEps8pPbaO0
 tInBGtmPh8hJZZFcspOHqaCEVFOPhw6PLIbxzuD0U1oP/HZpC+mHzKoROuAJYcZxKVgW
 oyiVdZbfkxQTyvECg7VAqpwVJq6fEEC765QWB9xZqaEN0cYzQkxCu4VPUAAwK8sCpeFx
 NDig==
X-Gm-Message-State: ACrzQf2O99KfxNVQQQ7UVQfjnmml3MiszxqAWSS5wJZJ6+H6dLWcw09J
 IYfpUnE0Gahx9u6Z3/1rTM0=
X-Google-Smtp-Source: AMsMyM4F4pzRceUeNmQv27huk6vLvB6/uYi8byeiQ/H6S287+s5fyX/SSUjMS4jgwKKZJ/kcayMX1g==
X-Received: by 2002:a5d:6d8a:0:b0:22a:9f79:9452 with SMTP id
 l10-20020a5d6d8a000000b0022a9f799452mr6530424wrs.620.1663453766864; 
 Sat, 17 Sep 2022 15:29:26 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a05600c1d9300b003b47ff3807fsm7472630wms.5.2022.09.17.15.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 15:29:26 -0700 (PDT)
Message-ID: <a7eca9e4-e08d-a903-92ec-3ed49c233d5c@amsat.org>
Date: Sun, 18 Sep 2022 00:29:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 4/4] target/m68k: always call gen_exit_tb() after writes
 to SR
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 richard.henderson@linaro.org, lucienmp.qemu@gmail.com, qemu-devel@nongnu.org
References: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
 <20220917112515.83905-5-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220917112515.83905-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 17/9/22 13:25, Mark Cave-Ayland wrote:
> Any write to SR can change the security state so always call gen_exit_tb() when
> this occurs. In particular MacOS makes use of andiw/oriw in a few places to
> handle the switch between user and supervisor mode.

Shouldn't be safer to add the gen_exit_tb() call in gen_set_sr[_im]()?

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


