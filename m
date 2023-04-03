Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AB56D3EAF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 10:10:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjFFi-00041S-BZ; Mon, 03 Apr 2023 04:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjFFg-00040R-B7
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 04:09:20 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjFFd-000153-MK
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 04:09:20 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso19218448wmb.0
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 01:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680509356;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eNKP3M4ZnnjnYOTDK7VoqHmT/HL4sNWWjFhUz33OpGE=;
 b=roTgUgvc4Rp+W9JkDJRll+PIdCdpV1830Wmm8cB2zUfmMeDbuQAlOyCe64GTLMHwEo
 o1n6HiCw/vGNRRE0ZLKTygawOLjqKOkAtIj2I9dJlaxB3+o/SL97DBn9JdfDzIT9TNBh
 uPF26nYgEr7dFeOTOx7D1yurZCqmzzHBClZQpPw4252odgaZMfCPgnupT07HSvC+wlRi
 5FtIhiKbLX45KFQfVrRXlS9G2avNtQBsZkWqy90+gE+APKOdgMOCr87o9pBbOacmZX85
 cY2qlSIP4ILRwEqa5n4KogA4Bkxe6CTl3+yTeU7Q+M66M6nkmXuD04k39pIcL1a1L70T
 WINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680509356;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eNKP3M4ZnnjnYOTDK7VoqHmT/HL4sNWWjFhUz33OpGE=;
 b=LL3QbAyzvJ41ICMjmebJmQiOJI17+Cz7rRyJbdqnrs5+soDuAcL1Y69drbpegeHg2F
 PqO6PDln45an9D7iKU15eVsyP6iqaJtDfzZYe0W4sYwYgOV2taTgHa/FMKZlQ8cL1kk9
 QvJ5b9cWOdsAQ6isLXg18bsiBkE7f34mnrsnZGulfzptVZWt7CXFQl0hHqj9bIX9DOky
 633B20FJHdpmPzhvUz9sLpt6LCYRxt44nxNPE31kPYvTymNXOfchVZ1Ya63+M/K9sjeA
 q4fcG+hl/oRbLTAgLlxqdSRMDQaQFam392G/cy1pZLQvGrgQt51mmKsQL7tjK/A1wmR7
 5MyQ==
X-Gm-Message-State: AO0yUKUfaTYnB8sOHjqyF8usdSIXdGDeVP4YO4XHrNOFJLtkIsjOzY3a
 jAxPZOikZQYDyZ9XxjXey1BOCA==
X-Google-Smtp-Source: AK7set+B5LyoQKDUGHfVVb6W9WFFjQOKB0di/PIOEQ/uSN7V27McxFhBM6WYWArdb8XQkumFLwsm4A==
X-Received: by 2002:a7b:cb93:0:b0:3ee:814b:9c39 with SMTP id
 m19-20020a7bcb93000000b003ee814b9c39mr25771200wmi.18.1680509355907; 
 Mon, 03 Apr 2023 01:09:15 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s15-20020a05600c45cf00b003eb2e33f327sm29100172wmo.2.2023.04.03.01.09.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 01:09:15 -0700 (PDT)
Message-ID: <c91e5f52-32db-c381-3286-1d22e15a2141@linaro.org>
Date: Mon, 3 Apr 2023 10:09:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 2/3] accel/tcg: Fix overwrite problems of tcg_cflags
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>, Anton Johansson <anjo@rev.ng>
References: <20230401045106.3885562-1-richard.henderson@linaro.org>
 <20230401045106.3885562-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230401045106.3885562-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.37,
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

On 1/4/23 06:51, Richard Henderson wrote:
> From: Weiwei Li <liweiwei@iscas.ac.cn>
> 
> CPUs often set CF_PCREL in tcg_cflags before qemu_init_vcpu(), in which
> tcg_cflags will be overwrited by tcg_cpu_init_cflags().

The description makes sense, but I couldn't reproduce using:

-- >8 --
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index af35e0d092..23ebf7de21 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -59,6 +59,7 @@ void tcg_cpu_init_cflags(CPUState *cpu, bool parallel)

      cflags |= parallel ? CF_PARALLEL : 0;
      cflags |= icount_enabled() ? CF_USE_ICOUNT : 0;
+    tcg_debug_assert(!cpu->tcg_cflags);
      cpu->tcg_cflags = cflags;
  }
---

Li and Junqiang, what is your use case?

> Fixes: 4be790263ffc ("accel/tcg: Replace `TARGET_TB_PCREL` with `CF_PCREL`")
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Message-Id: <20230331150609.114401-6-liweiwei@iscas.ac.cn>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/tcg-accel-ops.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
> index af35e0d092..58c8e64096 100644
> --- a/accel/tcg/tcg-accel-ops.c
> +++ b/accel/tcg/tcg-accel-ops.c
> @@ -59,7 +59,7 @@ void tcg_cpu_init_cflags(CPUState *cpu, bool parallel)
>   
>       cflags |= parallel ? CF_PARALLEL : 0;
>       cflags |= icount_enabled() ? CF_USE_ICOUNT : 0;
> -    cpu->tcg_cflags = cflags;
> +    cpu->tcg_cflags |= cflags;

This could be acceptable as a release kludge, but semantically
tcg_cpu_init_cflags() is meant to *initialize* all flags, not
set few of them. Either we aren't calling it from the proper place,
or we need to rename it.

>   }
>   
>   void tcg_cpus_destroy(CPUState *cpu)


