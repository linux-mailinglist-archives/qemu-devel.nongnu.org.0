Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E7C482087
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 23:14:58 +0100 (CET)
Received: from localhost ([::1]:57666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n33hI-00040E-Uo
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 17:14:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n33ey-0003CN-DL; Thu, 30 Dec 2021 17:12:33 -0500
Received: from [2607:f8b0:4864:20::a31] (port=39605
 helo=mail-vk1-xa31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n33ew-0003Ti-QP; Thu, 30 Dec 2021 17:12:32 -0500
Received: by mail-vk1-xa31.google.com with SMTP id m200so14370289vka.6;
 Thu, 30 Dec 2021 14:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MnecX+uFpUQpjlRW7PepMxaAiL6WwQM0dLeDIIIndeo=;
 b=VpFazGBS0EgMS32N9qKP0UOPNry+54YBnd7ofeOTI2KcCjiciwj/y7a9OSZmRkcly1
 M1ZBH4wKl3AQ+NmquwwxiU7B5q13ipXrdkfybrr7AF+rLkoap2Sn8WyI23ShTQ4FtDJ6
 Chdm+rvrM4ofCftvJkKEC74HxqYD0bgudcCNRnQVgtVScQTCe6qbIe/pRQDaaKclbrfd
 z3nv8QrlvRuVUeFEXnZwDTwELh+xsrK0jB4NtdZdLm3c2uECm/Qxvna3hNstireCyAyx
 5YsMrtDEyo+8ZQO5loDQBK0a7CYM/cF+f4bK+kJfJdsh2Yo6A1W2Aim6KiWih+YqMFsa
 +t9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MnecX+uFpUQpjlRW7PepMxaAiL6WwQM0dLeDIIIndeo=;
 b=PIy1mz+j3cpa/5g/lYjkw4kqkJm1fw3BtZIJNH2Zk/e+eYh+XVYLiUyh5qkzJToxjy
 Kd5v1U3Gr125RpvEEXL16f1dIxY6EgZNwIfQkhO7HaQobaQemGawkDkRGs9b7G4Zcmqf
 U1qXDjdhUt7V986PIhWKNgXD90hPmEehQsyqtA1u0lJ8N8ok+r6Q1fWJ+n9m5HA7s8Jn
 lSoN72ZAL120XyPBX5U0SEWMX3IlxWp3upypcnS/GFHaajHgRkk5KtDKG/rxGo1NE75+
 cu7/JshTftco77CoElA5do4u3CyHfEopT/Do8EJhKy0Pp71wTYlMIWA5gEv9lPZAsnGE
 1+Cw==
X-Gm-Message-State: AOAM530JgJ3Ku6l5osM/MMEdGJFZ+Yr8SCrb4SrK/lOkmIeIHDWo8s1H
 qqIIhc19t+scBpKNE8/wX/VJTitm/yw=
X-Google-Smtp-Source: ABdhPJzwhPrQQhjjZ7+lwaIVC23OZJ3APyQGS36sn3QYW/Ol8O1qgFutW/gqeQRJRVX5RdYqX5VwGQ==
X-Received: by 2002:a1f:a94b:: with SMTP id s72mr11045453vke.10.1640902349280; 
 Thu, 30 Dec 2021 14:12:29 -0800 (PST)
Received: from ?IPV6:2804:431:c7c7:4491:8fea:55ee:561c:b285?
 ([2804:431:c7c7:4491:8fea:55ee:561c:b285])
 by smtp.gmail.com with ESMTPSA id m3sm5280422vsh.7.2021.12.30.14.12.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 14:12:29 -0800 (PST)
Message-ID: <c2d241d4-d466-c599-e00e-3fdb62722bbb@gmail.com>
Date: Thu, 30 Dec 2021 19:12:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/3] Reorg ppc64 pmu insn counting
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211223030149.1947418-1-richard.henderson@linaro.org>
 <1b988844-075d-beb3-7fd1-a26f30e9f5dc@gmail.com>
 <1928bc96-ace5-3e5b-2da2-723ef3071173@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <1928bc96-ace5-3e5b-2da2-723ef3071173@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa31.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.024, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/23/21 18:19, Richard Henderson wrote:
> On 12/23/21 12:36 PM, Daniel Henrique Barboza wrote:
>> This reorg is breaking PMU-EBB tests, unfortunately. These tests are run from the kernel
>> tree [1] and I test them inside a pSeries TCG guest. You'll need to apply patches 9 and
>> 10 of [2] beforehand (they apply cleanly in current master) because they aren't upstream
>> yet and EBB needs it.
>>
>> The tests that are breaking consistently with this reorg are:
>>
>> back_to_back_ebbs_test.c
>> cpu_event_pinned_vs_ebb_test.c
>> cycles_test.c
>> task_event_pinned_vs_ebb_test.c
> 
> In which case perhaps drop my first patch for now, and instead simply replicate your tcg algorithm in c exactly -- using none of the helpers that currently exist.
> 
> We can improve the code, and the use of pmc_get_event from hreg_compute_hregs_value second.


While attempting to do that I figured what was off with this series and ended up
fixing it.

It's now working with the event-based branch interrupt tests and Avocado seems happy
as well. It took some small adjustments/fixes in patches 1/2 and an extra patch of mine
tuning the existing logic after the reorg.


I'll clean it up and re-send it next week/year.


Thanks


Daniel




> 
> 
> r~

