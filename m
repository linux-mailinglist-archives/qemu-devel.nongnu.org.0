Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 750AD4B2202
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 10:32:54 +0100 (CET)
Received: from localhost ([::1]:49142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nISIP-0007ef-B3
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 04:32:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nISFt-0005L4-VJ
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 04:30:17 -0500
Received: from [2607:f8b0:4864:20::1035] (port=54240
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nISFs-0005t0-Fz
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 04:30:17 -0500
Received: by mail-pj1-x1035.google.com with SMTP id qe15so7568816pjb.3
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 01:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QDKJzCezhB8HP6DgVp1eIStuzv9CaD7y/W3ToopzSq0=;
 b=QxwRhhv6aYHpqMtqDnKoRGCtkBqiRvsT4CRIuB4YKD8p7nBtyaOFNF80Ly1gE1532M
 lYBhJUwrN505KuQephysDLm244d+GJriPxBBkSaMrH76sYlxP2LdFuY81xh7tZ6suQwP
 GBZnhmy8qv+sFO6Bpo2xpfsyGql58W2SQWlQ8gNUFZCgb9WgbQGQ0y1SAaORupkxRqft
 1IGB2lUgz7cdJKmHUjKtpsQtGt7o9uWRUpfOfozbpDKS0aVJiF0+fFQP8cJ6p4elYRcp
 UQxl1qBvD/J3FIBydRA/8k5TjpXfDCg4U8tA1uFYKnOyRwa2TwBCok0WfYyCz041m9Oq
 MO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QDKJzCezhB8HP6DgVp1eIStuzv9CaD7y/W3ToopzSq0=;
 b=dIdy7ytZJaII6WNKw384jXz9xzPwuuLwj0SLvg6rn06xSN6VKqRusfoqtP/clKQ3sI
 T7zKeIulap1RpJXATxIhT2hcAiCfbMEsqXfRoX3FnOlbQfeE2HYlTeeFFzxuf+mtvVjs
 /h53M2ri7bl0KFy9+Ql9NL8cczy/8VsbtoS38AItOnDGEwfGfBQSZbeXmmOTaFUwtxKC
 OQNJDtQfs3R0fgBGdobDDPmrThdiqajFXtRE5lpn0JsQ/C6U4A8qmUFt/8IfNgqMwDc8
 ogNvmR4UDeIxYYWYvgJ1nxD9oUuN1A2NMQsS4/EVwy+wfuWaH3W9d7o4gPFOQQUE48OG
 xzoQ==
X-Gm-Message-State: AOAM532Asx7+jfvpL0LJSS2B+7wOOM3nULylF8qIiqhy3KEm3Nq6B8rM
 cNBOAxEuSv24mJ6Qj47WR5o=
X-Google-Smtp-Source: ABdhPJxtDTAsZ/8VkQDZImFKaNFykEnGlLqhdqFL6JqblOw8G8ejx4V4+Lk3qeE6iSRli2BOv+R0vg==
X-Received: by 2002:a17:902:dcca:: with SMTP id
 t10mr600962pll.133.1644571814973; 
 Fri, 11 Feb 2022 01:30:14 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id q16sm26948764pfu.194.2022.02.11.01.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 01:30:14 -0800 (PST)
Message-ID: <aecd54d8-a159-7dbb-7361-879096497359@amsat.org>
Date: Fri, 11 Feb 2022 10:30:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 7/9] user: Declare target-specific prototypes in
 'user/cpu-target.h'
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220209230030.93987-1-f4bug@amsat.org>
 <20220209230030.93987-8-f4bug@amsat.org>
 <cdd11da9-a90d-75ac-40f7-7086e7e40f66@linaro.org>
In-Reply-To: <cdd11da9-a90d-75ac-40f7-7086e7e40f66@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

+Thomas

On 11/2/22 00:19, Richard Henderson wrote:
> On 2/10/22 10:00, Philippe Mathieu-Daudé wrote:
>> Move user-mode specific prototypes from "exec/exec-all.h"
>> to "user/cpu-target.h".
>>
>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>> ---
> 
> Why a new cpu-target.h, and what is it supposed to mean?  What else is 
> going in there?  It all looks cpu_loop related so far.

I'd like to put all declarations using target_ulong in foo-target.h and
the ones which don't in foo-common.h (cpu, user,  exec).

That way I can move implementations from target-specific to target
agnostic meson source set, and better isolate the target-specific APIs.

> Why is this separate from the next patch, with "cpu-common.h", which 
> also appears to be basically cpu_loop related?

I can squash both. The commit description could be "Move APIs using
target_ulong to cpu-target.h, keep the rest in cpu-common.h".

