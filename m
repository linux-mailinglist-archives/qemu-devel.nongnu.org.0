Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C055F382D08
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 15:12:40 +0200 (CEST)
Received: from localhost ([::1]:39414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lid31-0000UD-R4
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 09:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lid1D-0008A3-HW
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:10:47 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lid1B-0006JS-Tj
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:10:47 -0400
Received: by mail-ej1-x636.google.com with SMTP id k10so9113078ejj.8
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 06:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T9uMF0lGUGrYPcXiEbk2HRSJwedEgbNjCt0HvZVJG+Q=;
 b=LJrwwcYjBJ0NM7BwHQtwxEW/1gKZryJPnxbWcWP5UcaaVMAPZyrlOxh5BigywNeBFJ
 B6h5xK1RYY56xzuiDxSBrJWWru7RxfyozvKGaFejUROaVA+DcNK9e+sWRhdv9ftnAqcQ
 32n9iSYGfqd6FSeLAphkbJrZtFkI/bS2OGJilQZNQesxxpY/Z73Ys0TOdvwF5opCmUJn
 rr1+bQrRQLYxBdr0xaqidA/uoGrtzyFUO4ZtdWDisfKp6nGM0Ss6d3RTmevpVxv++lr5
 vMnD8eXSW9kuUk7OrLS6ykor7oOZt+3toUqqtZDHq7BKWadKy3taZivNE89ucCcJsYVJ
 odGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T9uMF0lGUGrYPcXiEbk2HRSJwedEgbNjCt0HvZVJG+Q=;
 b=of1FlpLa15Ei62HTufFA77kd5w3wqqFsmGXndUzabji31G1VUueM2sN3T4/VbLGdPs
 p0+jIc2ndUvj2LB7q2d0b1NfbZEOhgddRS3jXTVxHGRfF0Ovx9WgDjAPw70tkSWDCNOx
 Q948giovTQwcuBlUHuPWaU28ilqERC4FBz4oHqI8nUOckNL4CybIDLHva8AA7Yz/9+0U
 12qSE5RSCzsU8Ab2OykNF80SzBSxOWj+CLoLv2dhU+YVAYrJMYJIurNZDfs1Ttd3SSjq
 6Hq2GXoOtUwsMR73cy+Ww+jkiIqEo0f/Xm3dWnCfaRU+bdB7qFnV8zBOhh8+FrXzw7uU
 hu9A==
X-Gm-Message-State: AOAM5302RVN/dh+5jGidKa6/GUvLJ2QvS0ge03uXr2hsGoPZKsMAwRqX
 fqGWZ2DCfmCyTyeTr0HAkp2ztk9I3EgoMQ==
X-Google-Smtp-Source: ABdhPJyDwwYNUKku9SZ/ionyNV4oTyLooFPwLPQ6P3TlR4MIKv1hOcrei5xhuEOWOs7sZGrtV8WhJQ==
X-Received: by 2002:a17:906:3b10:: with SMTP id
 g16mr63483482ejf.232.1621257043619; 
 Mon, 17 May 2021 06:10:43 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id q16sm8563866ejm.12.2021.05.17.06.10.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 06:10:42 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH 7/7] target/xtensa: move non-HELPER functions
 to helper.c
To: Max Filippov <jcmvbkbc@gmail.com>
References: <20190114074855.16891-1-jcmvbkbc@gmail.com>
 <20190114074855.16891-8-jcmvbkbc@gmail.com>
 <CAAdtpL5NoHLoUZR6MQKMg92h=Cm-Fqyc+zJvXz-GWqbtobyu2A@mail.gmail.com>
 <CAMo8BfLotZPVu5XWZ=EKZPgW3yir1Fsddj31Q6jzGcYehhzGbQ@mail.gmail.com>
 <CAMo8Bf+zdmFgRgpq_kCi=jP0KDbHw=9+Ai_46i_Z8veek+qemg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c8189bc2-79e3-3b57-2f4a-54012ed6ebb7@amsat.org>
Date: Mon, 17 May 2021 15:10:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMo8Bf+zdmFgRgpq_kCi=jP0KDbHw=9+Ai_46i_Z8veek+qemg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 2:11 PM, Max Filippov wrote:
> On Mon, May 17, 2021 at 4:50 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
>>
>> Hi Philippe,
>>
>> On Sun, May 16, 2021 at 10:05 PM Philippe Mathieu-Daudé
>> <philippe@mathieu-daude.net> wrote:
>>>
>>> Hi Max,
>>>
>>> On Mon, Jan 14, 2019 at 8:52 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
>>>>
>>>> Move remaining non-HELPER functions from op_helper.c to helper.c.
>>>> No functional changes.
>>>>
>>>> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
>>>> ---
>>>>  target/xtensa/helper.c    | 61 ++++++++++++++++++++++++++++++++++++++++++++---
>>>>  target/xtensa/op_helper.c | 56 -------------------------------------------
>>>>  2 files changed, 58 insertions(+), 59 deletions(-)
>>>
>>>> +void xtensa_cpu_do_unaligned_access(CPUState *cs,
>>>> +                                    vaddr addr, MMUAccessType access_type,
>>>> +                                    int mmu_idx, uintptr_t retaddr)
>>>> +{
>>>> +    XtensaCPU *cpu = XTENSA_CPU(cs);
>>>> +    CPUXtensaState *env = &cpu->env;
>>>> +
>>>> +    if (xtensa_option_enabled(env->config, XTENSA_OPTION_UNALIGNED_EXCEPTION) &&
>>>> +        !xtensa_option_enabled(env->config, XTENSA_OPTION_HW_ALIGNMENT)) {
>>>
>>> I know this is a simple code movement, but I wonder, what should
>>> happen when there is
>>> an unaligned fault and the options are disabled? Is this an impossible
>>> case (unreachable)?
>>
>> It should be unreachable when XTENSA_OPTION_UNALIGNED_EXCEPTION
>> is disabled. In that case the translation code generates access on aligned
>> addresses according to the xtensa ISA, see the function
>> gen_load_store_alignment in target/xtensa/translate.c
> 
> There's also a case when both options are enabled, i.e. the
> xtensa core has support for transparent unaligned access.
> In that case the helper does nothing and the generic TCG
> code is supposed to deal with the unaligned access correctly,

IIRC we can simplify as:

-- >8 --
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index eeffee297d1..6e8a6cdc99e 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -270,13 +270,14 @@ void xtensa_cpu_do_unaligned_access(CPUState *cs,
     XtensaCPU *cpu = XTENSA_CPU(cs);
     CPUXtensaState *env = &cpu->env;

-    if (xtensa_option_enabled(env->config,
XTENSA_OPTION_UNALIGNED_EXCEPTION) &&
-        !xtensa_option_enabled(env->config, XTENSA_OPTION_HW_ALIGNMENT)) {
-        cpu_restore_state(CPU(cpu), retaddr, true);
-        HELPER(exception_cause_vaddr)(env,
-                                      env->pc, LOAD_STORE_ALIGNMENT_CAUSE,
-                                      addr);
-    }
+    assert(xtensa_option_enabled(env->config,
+                                 XTENSA_OPTION_UNALIGNED_EXCEPTION));
+    assert(!xtensa_option_enabled(env->config,
XTENSA_OPTION_HW_ALIGNMENT));
+
+    cpu_restore_state(CPU(cpu), retaddr, true);
+    HELPER(exception_cause_vaddr)(env,
+                                  env->pc, LOAD_STORE_ALIGNMENT_CAUSE,
+                                  addr);
 }
---

?

Thanks for the quick response btw :)

Phil.

