Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA114127D3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 23:18:28 +0200 (CEST)
Received: from localhost ([::1]:34680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSQgF-0006Qy-7j
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 17:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSQeJ-0005Jb-UL
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:16:27 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSQeI-0003hX-6m
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:16:27 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u15so33433981wru.6
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=YH6b+f5eB+pAHfAXYjmYkQDO5k6062jRESsstYW1FiQ=;
 b=IpejlCxiorX8vrIC0H73FlyKCa9UX3HJgblRX1XDES7kpvOr5xiGEzKIBaKD8MMppp
 sMiZbL5zJ5nekZFHSc8SIa1r2/ZMzhu9ozV1QOjNxJ2O6W8NnuwdtBHWJT9ZbWXYeSvH
 pAETCiG/TH5IhlwhRw3lj+a1XnjwS7RnGUIxG8DN7I4A9oE/ki43AjvtCzpjkwS19kDZ
 17uUNATFN4gr9wyDow/V0hWKPokN8q2+fZ0HpXMw8DFujuPOH3OvIaELluTtkB+550s6
 JAHaIyQYvShpzJfXXAc9+2qLYxDJHmiHYswdqv49AUniXTgrtpLHtFsXW8Hp2387Ov+t
 SRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=YH6b+f5eB+pAHfAXYjmYkQDO5k6062jRESsstYW1FiQ=;
 b=lCwawMN9Ek4FUakApHs4O3/4PnZV9VImAW9uuYlObKRy0kg3fT1TwePijVsPPgXFL4
 UWwpwtM0ZetIkOmTP2/zMZ+uY9yqPt99n4YOMTwRiwIbfXhhTQGwdQIyKRl8/xDJvDI2
 oq7ILilv43AukhNZd1G7MbqI8XdJsnUFoUsE7LRvTm0+fr4IKahted8jjUF2/HKGh2JU
 uPPmn7mMPfF+6ZLOU4b3kicjbzlQe6if+0Xb0IE2s28Dqjez55VyQ5yVjYrOWxN3L6RH
 gRa6+gUzqbnny91XQRhsFzND/zZUYEGrME3a7LOfgRP7E0rov+6LY8wjDccuBGmYCowC
 rQRA==
X-Gm-Message-State: AOAM531Ca0D4zy5cLuHcbsMZ1HTCDQgPyPvNbQTzPqWk/rb2miX/Fhhy
 qcoi0cnr8HJLRTyvaeU9cRk=
X-Google-Smtp-Source: ABdhPJzUIv3hzqa6tTEl2NeycsMBfMBFVdLbBDvzPm4DhW166cZn4OXEBvjbymvYcT57ZMzSDlc0Qw==
X-Received: by 2002:a05:600c:4154:: with SMTP id
 h20mr1026239wmm.172.1632172584573; 
 Mon, 20 Sep 2021 14:16:24 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id j14sm17269368wrp.21.2021.09.20.14.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 14:16:23 -0700 (PDT)
Message-ID: <b4d17773-b226-b537-0374-46a668df0af2@amsat.org>
Date: Mon, 20 Sep 2021 23:16:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PULL 00/35] tcg patch queue
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
 <CAFEAcA9XxgFYj6jzNGEhgMHhB2UQF_X3ZLigu4sRPrR3Zfj8sg@mail.gmail.com>
 <a0f85ea3-c677-bc7a-995a-ddc8d4856b4f@amsat.org>
 <a85376bc-c986-4f47-2e07-2476a1a63b35@amsat.org>
In-Reply-To: <a85376bc-c986-4f47-2e07-2476a1a63b35@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 15:52, Philippe Mathieu-Daudé wrote:
> On 9/20/21 15:14, Philippe Mathieu-Daudé wrote:
>> On 9/20/21 12:07, Peter Maydell wrote:
>>> On Thu, 16 Sept 2021 at 16:30, Richard Henderson
>>> <richard.henderson@linaro.org> wrote:
>>>>
>>>> The following changes since commit 57b6f58c1d0df757c9311496c32d502925056894:
>>>>
>>>>   Merge remote-tracking branch 'remotes/hreitz/tags/pull-block-2021-09-15' into staging (2021-09-15 18:55:59 +0100)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210916
>>>>
>>>> for you to fetch changes up to 50febfe212f24a9b91b4224d03f653415fddf8e1:
>>>>
>>>>   tcg/mips: Drop special alignment for code_gen_buffer (2021-09-16 09:37:39 -0400)
>>>>
>>>> ----------------------------------------------------------------
>>>> Restrict cpu_has_work to sysemu, and move to AccelOpsClass.
>>>> Move cpu_signal_handler declaration out of target/.
>>>> Misc tcg/mips/ cleanups.
>>>>
>>>
>>
>>> The 'check-acceptance' job also hits a timeout on the emcraft_sf2
>>> test:
>>> https://gitlab.com/qemu-project/qemu/-/jobs/1604251596
>>
>> cd0d814b4b9b732f11885889070adacf87447751 is the first bad commit
>>
>>     accel/tcg: Implement AccelOpsClass::has_work() as stub
>>
>>     Add TCG target-specific has_work() handler in TCGCPUOps,
>>     and add tcg_cpu_has_work() as AccelOpsClass has_work()
>>     implementation.
> 
> -- >8 --
> diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
> index ed4ebe735fe..2f96553f6f7 100644
> --- a/accel/tcg/tcg-accel-ops.c
> +++ b/accel/tcg/tcg-accel-ops.c
> @@ -79,7 +79,7 @@ static bool tcg_cpu_has_work(CPUState *cpu)
>      CPUClass *cc = CPU_GET_CLASS(cpu);
> 
>      if (!cc->tcg_ops->has_work) {
> -        return false;
> +        return true;

Forget this crap. The missing piece was:

-- >8 --
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 0d5adccf1a7..da348938407 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -23,6 +23,11 @@
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)

 #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
+static bool arm_v7m_cpu_has_work(CPUState *cs)
+{
+    return cs->interrupt_request & CPU_INTERRUPT_HARD;
+}
+
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -920,6 +925,7 @@ static void arm_v7m_class_init(ObjectClass *oc, void
*data)

     acc->info = data;
 #ifdef CONFIG_TCG
+    cc->has_work = arm_v7m_cpu_has_work;
     cc->tcg_ops = &arm_v7m_tcg_ops;
 #endif /* CONFIG_TCG */

---

