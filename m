Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4244C368A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 21:07:56 +0100 (CET)
Received: from localhost ([::1]:41764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNKP5-0006Qn-DZ
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 15:07:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNKLq-0001ac-3C
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 15:04:34 -0500
Received: from [2607:f8b0:4864:20::433] (port=45917
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNKLo-0000Yj-9Y
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 15:04:33 -0500
Received: by mail-pf1-x433.google.com with SMTP id u16so2785200pfg.12
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 12:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/EwSmjJ9zlhwXDp6Ern1jtjrEg2oMO6zrs3EUifqQg4=;
 b=sXpxiRDqxZl3nweLz7ZsW1+N790+kh4Xc95tkI6cGi4vbYaYZ3wW7zotYW9OyHoFAf
 gLshJQmMDvc81GPsOxbUGNT3CGRe4EX2EM6YaEojc8QxOIpkZzuYXdw4ixggBlz4F6Vv
 U6q3RZ+r7ZccbD7xvM6mezE3XN5yu7zL+Ql8CxFUKkGusu9Bs7tIeVYbectpifZfGSC9
 a7LGMlNdcV25vc8QMFjkvtHjbp+xl0K3QUgMbqiZBTpNxDFKqYKQGXYgaJFnFLlipJmt
 YpquHgptv7yowwalsIxTOq61J9xVzFZPeSDVlP/aUI4U7apZQ1LpL1eOKezJNzLHzhte
 jITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/EwSmjJ9zlhwXDp6Ern1jtjrEg2oMO6zrs3EUifqQg4=;
 b=khTGw/3yM3fXEzl7CSxZWyZxEzgWXsSNhdE42qklX4Xx5k0xr9YN9o6se8wr7kvbkN
 QjK3rMaNqUYAiJhByDbkJu8Ub/xR53068hnz8LlTfMxJpp8k1GCPnZEwVbKdfcEXV5xJ
 NqAXj3hLoPg6tdTVImoVmUUO96CuWqKIQi0PfAz6IBQ6lFffbF7wtTWFGOQDDg6QdnOh
 i/I5r4zMISIyhtSbMZVSCyMHVcKLbdNLpYdCf0T6bdn09ozioEt+f7+6q3n6ffZL7FQc
 BGSuxZGHRN6PN8Ig8KwlRUFTt42ZpL/l1wN/eD7nXULgMg+zXXtc17SOd4rMs7bN94o/
 FB8g==
X-Gm-Message-State: AOAM5335ieyVR2QVOvAVs2YEGVe3WqVrd2BCVJtMzZUcg1xgss+QQ3Ln
 zqr/gOrW7jEJ1p90NrZH2kpS/Q==
X-Google-Smtp-Source: ABdhPJyynQQFVudqRHhgCt8KaER0AiEux+kRu86yTJ6in71OCJ2vk6mssiKwo/sL6GszuHEyui89gw==
X-Received: by 2002:a63:f0d:0:b0:374:916e:52a4 with SMTP id
 e13-20020a630f0d000000b00374916e52a4mr3441985pgl.457.1645733070963; 
 Thu, 24 Feb 2022 12:04:30 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 d7-20020a056a0024c700b004bd03c5045asm298314pfv.138.2022.02.24.12.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 12:04:30 -0800 (PST)
Message-ID: <9134e09c-8dbc-3668-7f77-bb5398de4f6f@linaro.org>
Date: Thu, 24 Feb 2022 10:04:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 11/12] util: remove the net/net.h dependency
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
 <20220224183701.608720-12-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220224183701.608720-12-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 08:37, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> Move qemu_ether_ntoa() which is only needed in net/.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   include/qemu-common.h |  1 -
>   net/announce.c        | 13 +++++++++++++
>   util/cutils.c         | 14 --------------
>   3 files changed, 13 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


