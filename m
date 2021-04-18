Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE90363798
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 22:46:45 +0200 (CEST)
Received: from localhost ([::1]:54396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYEJY-0005kS-Lw
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 16:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYEGM-0004aM-1q
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:43:26 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:41472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYEGK-0006Kf-FQ
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:43:25 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso410637pjn.0
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 13:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8UNy1eqwuWnzMXJRTvI7zfUhyeWCtoFOo+SjgZuxraQ=;
 b=bpmD8pO5etxR+VmuSY5V3r2nbXxVDjdeplxBU4bDWjw/0zaWCDD6biXW6UWA//ZVx9
 Du6jvcfl5oj6rLuGe8rS2CBUXmPQ+QVjOwxchgJJMm/17bswWCOe8i/sQD5woLsXjwEO
 a+MzD/5/RFA6R16EzZQ3J37j1STTQ0zhgRRp+xrRs4/BXULLU29GaPC0Giv2PzIhURGn
 /4aez8REOGFmWV/xrlOKfA2ogvcbRORtYG3ONLxKvCSpJWQI1z6LgKhivS71qV6laYon
 mR2cf1S7Bp+w4g20kIhPhkjAOehTdojvECj905K2yrWmhcqodtnut3OvkGAVc/4/hecU
 eu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8UNy1eqwuWnzMXJRTvI7zfUhyeWCtoFOo+SjgZuxraQ=;
 b=NDNrTBrTGB0BbEz2RSIE+x320gpWDWfLeXijuDSxJ5rHqYXjwt7PkKubU9pw7ho6xm
 XTMNOIiIoSkQGWDdVrDvIcYOM2sAI2ZNuhcxBstVuYu5kxsvaNu3FD3zKJSqH3C30uIv
 1oO3oTZltBwXL5SBDMDVrum0KxqFhEBnQ9zi32xIYr2hmRhepveyTZSJwLpyUf3trO8+
 CVta4CfFFG+zXjA/HUxigLs/bQypDAT+HTmpWEck4SHzJBgeoUkQqRsepXvKb6OuHC1/
 +KK+abNorNXdbHzcpwzFxveZKoGtqgmzIwKOMWHrllIamlEs0KXsmXcLFOqTD7Nrlj3t
 Krlg==
X-Gm-Message-State: AOAM530cr9qnvqvpLsWzBE5ZYBalU3I+J2XXGZbgWvpIK7Nowk3n2rRE
 IYgslWxClAuqJ44M4wDjFcGvng==
X-Google-Smtp-Source: ABdhPJyWfAP9a9c+thN4QrL1s7gZRJO5Is0SISuXWCjakWhrOdMFVlnGKVK8W6FHhSnfkAaZIbHptQ==
X-Received: by 2002:a17:902:525:b029:e8:e347:b07f with SMTP id
 34-20020a1709020525b02900e8e347b07fmr19765866plf.34.1618778601225; 
 Sun, 18 Apr 2021 13:43:21 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id f19sm3156365pga.71.2021.04.18.13.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 13:43:20 -0700 (PDT)
Subject: Re: [PATCH 09/26] target/mips: Add simple user-mode
 mips_cpu_do_interrupt()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8bfe0dd6-9869-e327-938f-34af0f28ff46@linaro.org>
Date: Sun, 18 Apr 2021 13:43:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
>   target/mips/tcg/user/helper.c    | 28 ++++++++++++++++++++++++++++

Since only this and the next helper go in here, perhaps continue to call it 
tlb_helper.c?  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

