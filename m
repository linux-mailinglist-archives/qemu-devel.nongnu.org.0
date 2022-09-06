Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C1E5AED85
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:46:34 +0200 (CEST)
Received: from localhost ([::1]:51864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZqT-0004BJ-2B
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZmn-0006Ot-SJ
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 10:42:45 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:40844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZmm-0005ve-0F
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 10:42:45 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 t11-20020a17090a510b00b001fac77e9d1fso15171617pjh.5
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 07:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=zhq5AxjjY635bheyVlL27H1KeArs50MCnNXMctAwRt0=;
 b=OzhDQlir5YLfPegsY9R1pmI96Zwk17QzS2XanAdr8qm8UG1tJkL4c5Dm3kaeUhMGJY
 6z3YUX/P/Ac8N4Bkgb3UH110poc+5BomDffYqDKokVwYWaDVj6twMwfOoMHy6gdggDgj
 N0Tah9fROHGqAe0j4K/rmZVk1RYdIsxzXv2Q0CNEHlNZPzw9Mk9WFG4xgQG5JUBzwp6L
 COmKKSxXOs1u+Q3XcrIj9iPhzmHKpmDVncU4E5YM6nPR0EcQCDaqwhFyFVvLR8rtnPvz
 9VFHPVufqiA/mQo0KH3jGBH5nsO8uVNgQAJT6KvLl6z1RB+SIXMX5DX9vdngQnc3pKys
 rKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=zhq5AxjjY635bheyVlL27H1KeArs50MCnNXMctAwRt0=;
 b=0mW/cZ/PO7U5d38K+gjw9vevuZz7sVynCJGHONZilzJZTsHzHEnHNU/OEJZigSGeK0
 r2cyXc846DLG/Chdk3gEK0z0kELaJ77JI680ADYBJH0LzDwo1/yDiATWQhpgpM3FMzrF
 giH1Z/fWTeUmVsp6K1SGjU5g1pEogrkCdEgx3AmjZJ83wESFGjIWjcSHi7rybofFNxZS
 Lq+cXFM0YgGQAbRwXKuznOMs3n/3af6VJIoEpbwIMM3WYjsoUeWRBJC4z/3DzGtS0oh/
 88Iue+Jw12GpvoCVU0WtSlxLISYYYT9bfQqhbcKzXTohvlxU9r3Ra3fmYVoqIZ1buL0T
 8ivg==
X-Gm-Message-State: ACgBeo2mACpPaZlp2iWzYx8wFRl8ZkYkrMIS3MJKQjenO319AQnIzZLK
 7/j8ZaL7zJikm822drxUsoU=
X-Google-Smtp-Source: AA6agR47cOS8MAacf42L/HbiBMsdjJbO0j+S7bHXQNym4eCSG7rv2xqOwXR27Fh3dUHo/ZS+k+KtoA==
X-Received: by 2002:a17:902:7615:b0:172:c28a:5506 with SMTP id
 k21-20020a170902761500b00172c28a5506mr53558361pll.8.1662475362554; 
 Tue, 06 Sep 2022 07:42:42 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a170902ce8600b001714e7608fdsm4518703plg.256.2022.09.06.07.42.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 07:42:42 -0700 (PDT)
Message-ID: <b0adb12e-56d7-76ca-0eed-ec4938ffcb58@amsat.org>
Date: Tue, 6 Sep 2022 16:42:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2 02/23] target/i386: Return bool from disas_insn
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-3-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.752,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 6/9/22 12:09, Richard Henderson wrote:
> Instead of returning the new pc, which is present in
> DisasContext, return true if an insn was translated.
> This is false when we detect a page crossing and must
> undo the insn under translation.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 42 +++++++++++++++++++------------------
>   1 file changed, 22 insertions(+), 20 deletions(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 1e24bb2985..46300ffd91 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -4665,7 +4665,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
>   
>   /* convert one instruction. s->base.is_jmp is set if the translation must
>      be stopped. Return the next pc value */
> -static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
> +static bool disas_insn(DisasContext *s, CPUState *cpu)
>   {
>       CPUX86State *env = cpu->env_ptr;
>       int b, prefixes;
> @@ -4695,12 +4695,13 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>           return s->pc;

Shouldn't we return 'true' here?

>       case 2:
>           /* Restore state that may affect the next instruction. */
> +        s->pc = s->base.pc_next;
>           s->cc_op_dirty = orig_cc_op_dirty;
>           s->cc_op = orig_cc_op;
>           s->base.num_insns--;
>           tcg_remove_ops_after(s->prev_insn_end);
>           s->base.is_jmp = DISAS_TOO_MANY;
> -        return s->base.pc_next;
> +        return false;
>       default:
>           g_assert_not_reached();
>       }
> @@ -8609,13 +8610,13 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>       default:
>           goto unknown_op;
>       }
> -    return s->pc;
> +    return true;
>    illegal_op:
>       gen_illegal_opcode(s);
> -    return s->pc;
> +    return true;
>    unknown_op:
>       gen_unknown_opcode(env, s);
> -    return s->pc;
> +    return true;
>   }

