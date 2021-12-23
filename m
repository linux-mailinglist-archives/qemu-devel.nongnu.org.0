Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B7547E991
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 23:49:18 +0100 (CET)
Received: from localhost ([::1]:34802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Wth-0006v8-1v
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 17:49:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n0WsM-0005ZD-Vj; Thu, 23 Dec 2021 17:47:54 -0500
Received: from [2607:f8b0:4864:20::f30] (port=33788
 helo=mail-qv1-xf30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n0WsK-0008T2-Iz; Thu, 23 Dec 2021 17:47:54 -0500
Received: by mail-qv1-xf30.google.com with SMTP id kk22so6463528qvb.0;
 Thu, 23 Dec 2021 14:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2fV8IZ0puLNZwS6SZbRZUbgCayQYVQvRAw8NdKpsrXM=;
 b=U78uA3E99CEqD8y/LCw8Fc0ZylNnqTEZmt+iXMWGhv43YLJkRiqFM5BKJ5dvX/VSzX
 HyVwmUXs05cbh8zJSs/Wsl8ndiDl8dujV+WTBK20IoEEgr4yFbwVZ50P2x4DY90a/skO
 JgZjBLInsJk+LJDcXzTBWK9VHIhwhNniTJCkNnB9l8+JX5EmVN0jDMTIxmY1+ou1PC13
 UlimmnFBpyvSeIB398tP1yz1U1C/Rs5/HaWUOSofpBSGG/E4JkIumO+TjfLz6BZIuZa6
 JJGCiimT/CjIrCATzsiufbTWsNWa3jwXoJDg4rzEwssrCqmn9dE5PJwdiCPs2rQvzwL5
 PgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2fV8IZ0puLNZwS6SZbRZUbgCayQYVQvRAw8NdKpsrXM=;
 b=ZZ8f73+2ni1z0rgea4+ySZxqDdTtjp7xXtpejYPC7YdpwDdYp5A+mliHjsfgTbocnR
 /Tm/g4PEBdr2Xp+zR+B0ZAFZDjvVDhSUecj3FfvwV1rWAzXY/6p0zRUeN4i84MGwfu5E
 coIudE7017+Sf1Gma8MfAI7hEOJIV0Siv2R76HqEZJpCEkGkyaJ62q05/8B4YciLOm/4
 FXAYm8zPWKm+uYgIKJ4TFAvWQcJrhwNG82YQg7N4yaG6P+uhd5oUBagEApFG+Zkct/ne
 4l8XUzMT9j0KSNwTkaCmzeguGmbTCnlmJAjf31p8RUR1DD5d3KqoDIsFkrAhZiGT/Hog
 CE3g==
X-Gm-Message-State: AOAM531rI7RDJUT6qBE3EUpK4Aby+x8OwWjoC45dMLfBt81WzxoSQww/
 2UfVcWHwlMwTHFACPbbYwhY=
X-Google-Smtp-Source: ABdhPJyCpP8xA9WmlfLnk6ZOMNAVmUtuAcbWQ643mLxM6oCIk8liIZsKx5WeOaYrn3WIT7Mqfg5WlQ==
X-Received: by 2002:a05:6214:400e:: with SMTP id
 kd14mr3583053qvb.68.1640299671352; 
 Thu, 23 Dec 2021 14:47:51 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:7ce4:b718:2cc0:32df:97ee?
 ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id e15sm4736263qtq.83.2021.12.23.14.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 14:47:51 -0800 (PST)
Message-ID: <d2917677-faf6-08f0-b1f3-dd53addfd37d@gmail.com>
Date: Thu, 23 Dec 2021 19:47:48 -0300
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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


I'll try this out. I'll let you know how that goes.


Thanks,


Daniel

> 
> 
> r~

