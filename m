Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C23041161D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 15:54:25 +0200 (CEST)
Received: from localhost ([::1]:47108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSJkW-0007sy-3r
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 09:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSJiq-0005xK-7l
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:52:40 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSJio-000803-L7
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:52:40 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t18so30003764wrb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 06:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=sxECO6B3BOmyCxmIO9t2RtHYUHcrjgGDKK7SjhlprsM=;
 b=ovOHeYzhmiROWw3B21sdPXayFLmKxVFDImuwp1Qa7/FI5i1xRyU0wMBGCre0gLeE7+
 ikD90u9B7guTbvgzANZZah14x0ad26rbiNhicqP6AvX74UfetcqTwsJNX3u85lREnjEE
 +VSCwvAGj7Kncczdem1RdZ/dfrbybntbPx2tbkbPFBHyCSMWXnBuDVerPIrACElJM2gg
 MPACyMafWD+f+Vnh5OgYgjkMLxr3C1nERQqASpVf5dPsDiSVcPf0P0XaV22LX2U/6jXU
 SWdmj1U5WJxCxp+vLdVDVpSr8vgKM4Lk/qAYe653684dyNwBHmhLo/ileLi9AzS0sRb6
 2PcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=sxECO6B3BOmyCxmIO9t2RtHYUHcrjgGDKK7SjhlprsM=;
 b=1DHvjmjiUbFfV9s+nb+OBrHWfDTrqb+clSJVHnrHf7vCXyNQ+hLvV0NhFZWncmbvHi
 02mTwKl97GX7T+E+x+4oYkHPO3Cf6fXKzhsNIOp2lpPX5UxH8rA7qq04I+2FLzdLRn25
 WZ6LUS+CCt/RUWV2U/v31R5/zIoyW+fDQelFF6rDP7iR8wK4veJbvzy/rpSgBXnWaNU5
 pJ3OmS8CBpHaC/NJzGfhVFao72zk4rAcN26jKnR7EyugetDt4NQW9d13L6cCUmMq1HYe
 bADDfBTQTeQoxRaPl9BrdovlzsvPiIVP8RQdT4zrOx8C4sFoB1DEoBVgR3jbmxAkzwFZ
 PJBg==
X-Gm-Message-State: AOAM532bwoJES76Qxnz5imusduHazkUEDHLbRWESmKuWIpANUBoxmeCF
 AbFggd2JYH/pCiuzmRgUt9U=
X-Google-Smtp-Source: ABdhPJxTpQwQautNM4FXybTvKVgcY2Ee0AZBmvVoULXREo5ZmcOtD4pTPzc9rdY/d4rBWCSdA2Vdnw==
X-Received: by 2002:a5d:5042:: with SMTP id h2mr28137663wrt.57.1632145956915; 
 Mon, 20 Sep 2021 06:52:36 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id c14sm10371163wrd.50.2021.09.20.06.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 06:52:35 -0700 (PDT)
Message-ID: <a85376bc-c986-4f47-2e07-2476a1a63b35@amsat.org>
Date: Mon, 20 Sep 2021 15:52:34 +0200
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
In-Reply-To: <a0f85ea3-c677-bc7a-995a-ddc8d4856b4f@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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

On 9/20/21 15:14, Philippe Mathieu-Daudé wrote:
> On 9/20/21 12:07, Peter Maydell wrote:
>> On Thu, 16 Sept 2021 at 16:30, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> The following changes since commit 57b6f58c1d0df757c9311496c32d502925056894:
>>>
>>>   Merge remote-tracking branch 'remotes/hreitz/tags/pull-block-2021-09-15' into staging (2021-09-15 18:55:59 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210916
>>>
>>> for you to fetch changes up to 50febfe212f24a9b91b4224d03f653415fddf8e1:
>>>
>>>   tcg/mips: Drop special alignment for code_gen_buffer (2021-09-16 09:37:39 -0400)
>>>
>>> ----------------------------------------------------------------
>>> Restrict cpu_has_work to sysemu, and move to AccelOpsClass.
>>> Move cpu_signal_handler declaration out of target/.
>>> Misc tcg/mips/ cleanups.
>>>
>>
> 
>> The 'check-acceptance' job also hits a timeout on the emcraft_sf2
>> test:
>> https://gitlab.com/qemu-project/qemu/-/jobs/1604251596
> 
> cd0d814b4b9b732f11885889070adacf87447751 is the first bad commit
> 
>     accel/tcg: Implement AccelOpsClass::has_work() as stub
> 
>     Add TCG target-specific has_work() handler in TCGCPUOps,
>     and add tcg_cpu_has_work() as AccelOpsClass has_work()
>     implementation.

-- >8 --
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index ed4ebe735fe..2f96553f6f7 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -79,7 +79,7 @@ static bool tcg_cpu_has_work(CPUState *cpu)
     CPUClass *cc = CPU_GET_CLASS(cpu);

     if (!cc->tcg_ops->has_work) {
-        return false;
+        return true;
     }
     return cc->tcg_ops->has_work(cpu);
 }
---

