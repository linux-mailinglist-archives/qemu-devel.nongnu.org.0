Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE85667060
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 12:01:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFunr-00047M-AT; Thu, 12 Jan 2023 05:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFunq-00045G-0A
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:27:22 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFuno-0000xy-23
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:27:21 -0500
Received: by mail-wm1-x32d.google.com with SMTP id o15so12831858wmr.4
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W8GmK+uNUnkDVDzwM4yhux6PYYqbmCTOw9JUA7P0H0o=;
 b=fDiMB82hYHFCqfhp7Y+DO5xj0/lAIIM8fvnFJ81cSaFtY60aSDy2ShghfaSY16s+O8
 hZ61zhPgDpEOXVNhVlorQMT6kCVSTi9L/vejaOfFYeXq4IeVrrGlzQ3XMuzEqnocgRy1
 76MDtNY9j68ZQN8DSmYEq8WyZjuyWnw8wykfJosX6DvWXhVrwiXvMX1gdeZMcNP67oM0
 +w6nG2L+8kMUDs2dvu/yCqdisjm9OQLSd5pv1T3bLq5f2XR+FhneFdKLMiYwEPxDrwyc
 3nA/hbv6VVUZLdQfQ/jsLtufGepGwTrQCYDIFphDGFVM5iKMbgsnI1GPu+bkC7O4kzQ3
 UyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W8GmK+uNUnkDVDzwM4yhux6PYYqbmCTOw9JUA7P0H0o=;
 b=mdtGpJM8NAhhLz6oi3YOir0/9+KqfoRay1dIPC8Xk3dH5ADhz64ExyEG5wxd6aw3RG
 JJlJKMEPLq3WcFgEeBS8U3VFVCTuMjSEwKXx88kh+l/9AGl3KCJf8fEeE2OqXyKFnRgy
 Iglzf+RaHkj9+vP/4FjRsTqmYLRaETyfZI3Xyy3WnH+F0aUt1J8fV/b2jXW6HBOJRGOE
 cab0CN7Tq/yR3eC306/UVp9MP3QJ8FrcyfxlHbpkN4/tB5kq62rH1OFGCYDCmQNFVgo+
 enlrzTTsSaXumqTRfu0cFavHxIFv8FUv2cojH4pUmInKCNsM6O8G0kctw5xfokVttic9
 A8hA==
X-Gm-Message-State: AFqh2kpo4Oon7BcVi+vq2GcBCKNBbsBibLy1UTv4A59sBa7z2Eq+tEgO
 /N6S76tMi1PE2WXF+oBf1TnJyw==
X-Google-Smtp-Source: AMrXdXuLxqto7G59o93Kd2UVLpxBpeSoYNNU523PwaYXMpt3LkHmaWLDJlFJjjZIMxmmG0UUHY2UHA==
X-Received: by 2002:a05:600c:1603:b0:3d1:c895:930c with SMTP id
 m3-20020a05600c160300b003d1c895930cmr54530525wmn.35.1673519237861; 
 Thu, 12 Jan 2023 02:27:17 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d6-20020a05600c3ac600b003da0dc39872sm4060501wms.6.2023.01.12.02.27.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 02:27:17 -0800 (PST)
Message-ID: <4a707a8b-fc19-c7a2-3ee7-935b448c27be@linaro.org>
Date: Thu, 12 Jan 2023 11:27:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] target/arm: Introduce aarch64_set_svcr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>
References: <20230112004322.161330-1-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230112004322.161330-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 12/1/23 01:43, Richard Henderson wrote:
> Unify the two helper_set_pstate_{sm,za} in this function.
> Do not call helper_* functions from svcr_write.
> Cleans up linux-user usage by consolodating logic.
> 
> Cc: Fabiano Rosas <farosas@suse.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> Fabiano, I expect this to replace much of your
> 
>    [RFC PATCH v2 07/19] target/arm: Move helper_set_pstate_* into cpregs.c
> 
> r~
> ---
>   target/arm/cpu.h              |  2 +-
>   target/arm/helper-sme.h       |  3 +--
>   linux-user/aarch64/cpu_loop.c | 11 ++--------
>   linux-user/aarch64/signal.c   | 13 ++---------
>   target/arm/helper.c           | 41 ++++++++++++++++++++++++++++++++---
>   target/arm/sme_helper.c       | 37 ++-----------------------------
>   target/arm/translate-a64.c    | 19 ++++++----------
>   7 files changed, 53 insertions(+), 73 deletions(-)

Since this patch was a bit too hard to digest at once, I split it
in trivial steps here:
https://lore.kernel.org/qemu-devel/20230112102436.1913-1-philmd@linaro.org/

For whichever version you prefer:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


