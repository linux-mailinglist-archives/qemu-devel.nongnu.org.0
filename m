Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC446B2434
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 13:32:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paFRP-0001kX-2C; Thu, 09 Mar 2023 07:32:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paFRM-0001gr-5z
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 07:32:12 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paFRK-0007lX-Cd
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 07:32:11 -0500
Received: by mail-wr1-x432.google.com with SMTP id r18so1704587wrx.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 04:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678365128;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2GuMlVrOYitS/sfnU95p6hMl4GzVwDkQKb9nml/ClO4=;
 b=BC+Kr59mh7flPreISbZkIjD/TSqQ/s4ao8BwA2XdasJ+8p8wG99XMtwmZZ/uDbI4cv
 OpugAqKxwjPA4GeNn+B7H+ega7twIflgMBQClDQG/5B+C/W/8nm4ruEfedgCB9AVT4ZF
 JkBJsxMuHlnIWHiHZQdAa1HQ/NPbVW7v2/02Ie7z0CIc5pG/qHZxfLE26eH+OYhu4qyu
 yj0b5sabtWFjKjsgzD8B+11pCRvhGXiwVaEjIQXpBOlUsBZ1nbifLYlaI49MjASPP2aC
 0wCNuB6XPQlBSFVV8kMtzn04Mq2SH/bmQ18A2rTZ9Bd9I0vNTsK2u6xSg42p8a0iZy6c
 M7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678365128;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2GuMlVrOYitS/sfnU95p6hMl4GzVwDkQKb9nml/ClO4=;
 b=1XDzPG5+Aw9ZYJJq/KjjgueIe0o6ZMzs/QeYoV+/TusP1oZodGf+lxCa40teCB2PKr
 94p/dB5xrJShHnDoBixONezbqJX+7suor5zcYH48fBwrpBS65ltjU8u1Ux6Ai7NsztW6
 dJ7lUWr9eaA1AhJC0J2e+w/7PR2dwkdfvah3JttUWakwZFZGCQo0pRjj8QV+gnhD5pGm
 uYvTiy7AHwAA0IHCxEdMK/MBMvPcSNINhWu9nscyVh13ii8Clk0KM53dGkTmh3ouKxML
 8EedebouzdKISZjl/OynPAnhZa03ou2PLIJZvvAnvYUOiCaK7ogWO9uPp2jFskUn1j7Z
 1Z6g==
X-Gm-Message-State: AO0yUKWWzhYzyJlLKKG521q2Zx/HF4GdBjp7UpaB2w8TFjvWiT0Jpu3a
 sXVZUJUY3ON/D4BojkBMgKpl8MEJwZWfpKhfe4Q=
X-Google-Smtp-Source: AK7set/KJuQqIG5MaS4ugqBKLJjg+IxxWWqKcusfB3B8hbyNQHd4rKjcJ+Ac3vZnhNthD7E1ah5gxQ==
X-Received: by 2002:a5d:4404:0:b0:2c7:107c:e172 with SMTP id
 z4-20020a5d4404000000b002c7107ce172mr12309239wrq.41.1678365128071; 
 Thu, 09 Mar 2023 04:32:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l13-20020adfe58d000000b002c569acab1esm17852348wrm.73.2023.03.09.04.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 04:32:07 -0800 (PST)
Message-ID: <aca2a158-ebb6-4010-3b94-8b60026a30ac@linaro.org>
Date: Thu, 9 Mar 2023 13:32:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] linux-user/mips: Low down switchable NaN2008 requirement
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu
References: <20230211173401.13902-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230211173401.13902-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Jiaxun,

On 11/2/23 18:34, Jiaxun Yang wrote:
> Previously switchable NaN2008 requires fcsr31.nan2008 to be writable
> for guest. However as per MIPS arch spec this bit can never be writable.
> This cause NaN2008 ELF to be rejected by QEMU.
> 
> NaN2008 can be enabled on R2~R5 processors, just make it available
> unconditionally.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   linux-user/mips/cpu_loop.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
> index d5c1c7941d..b5c2ca4a3e 100644
> --- a/linux-user/mips/cpu_loop.c
> +++ b/linux-user/mips/cpu_loop.c
> @@ -301,8 +301,7 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
>       }
>       if (((info->elf_flags & EF_MIPS_NAN2008) != 0) !=
>           ((env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) != 0)) {
> -        if ((env->active_fpu.fcr31_rw_bitmask &
> -              (1 << FCR31_NAN2008)) == 0) {
> +        if (!(env->insn_flags & ISA_MIPS_R2)) {
>               fprintf(stderr, "ELF binary's NaN mode not supported by CPU\n");
>               exit(1);
>           }

Looking at R6.06 revision history:

   5.03 August 21, 2013

   • ABS2008 and NAN2008 fields of Table 5.7 “FCSR RegisterField
     Descriptions” were optional in release 3 and could be R/W,
     but as of release 5 are required, read-only, and preset by
     hardware.

So I tried with this change:

-- >8 --
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 05caf54999..5f1364ffaf 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -243,6 +243,13 @@ static void mips_cpu_reset_hold(Object *obj)
      env->CP0_EBaseWG_rw_bitmask = env->cpu_model->CP0_EBaseWG_rw_bitmask;
      env->active_fpu.fcr0 = env->cpu_model->CP1_fcr0;
      env->active_fpu.fcr31_rw_bitmask = 
env->cpu_model->CP1_fcr31_rw_bitmask;
+    if (env->insn_flags & ISA_MIPS_R5) {
+        assert(!(env->cpu_model->CP1_fcr31_rw_bitmask & (1 << 
FCR31_ABS2008)));
+        assert(!(env->cpu_model->CP1_fcr31_rw_bitmask & (1 << 
FCR31_NAN2008)));
+    } else if (env->insn_flags & ISA_MIPS_R3) {
+        assert(env->cpu_model->CP1_fcr31_rw_bitmask & (1 << 
FCR31_ABS2008));
+        assert(env->cpu_model->CP1_fcr31_rw_bitmask & (1 << 
FCR31_NAN2008));
+    }
      env->active_fpu.fcr31 = env->cpu_model->CP1_fcr31;
      env->msair = env->cpu_model->MSAIR;
      env->insn_flags = env->cpu_model->insn_flags;
---

and got:

$ for cpu in $(./qemu-system-mips64el -cpu help | cut -d\' -f2); do \
   echo -n ${cpu}...;echo q \
   | ./qemu-system-mips64el -accel tcg -cpu ${cpu} \
                            -S -monitor stdio 1> /dev/null || break; \
   echo OK; done
4Kc...OK
4Km...OK
4KEcR1...OK
4KEmR1...OK
4KEc...OK
4KEm...OK
24Kc...OK
24KEc...OK
24Kf...OK
34Kf...OK
74Kf...OK
M14K...OK
M14Kc...OK
P5600...OK
mips32r6-generic...OK
I7200...OK
R4000...OK
VR5432...OK
5Kc...OK
5Kf...OK
20Kc...OK
MIPS64R2-generic...OK
5KEc...OK
5KEf...OK
I6400...OK
I6500...OK
Loongson-2E...OK
Loongson-2F...OK
Loongson-3A1000...OK
Loongson-3A4000...OK
mips64dspr2...OK
Octeon68XX...OK
$

Which CPU are you testing? Where can I get such ELF binary for testing?

Thanks,

Phil.

