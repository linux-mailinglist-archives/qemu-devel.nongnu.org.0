Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579163B65CF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 17:37:17 +0200 (CEST)
Received: from localhost ([::1]:52786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtK0-0003s7-Du
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 11:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxtIz-0002q8-QH
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:36:13 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:35451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxtIx-000611-F9
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:36:13 -0400
Received: by mail-pg1-x52d.google.com with SMTP id v7so15799165pgl.2
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=7jlagpo4AUlheQevVqLvJ85BvUN14xq4gkanarUnJ1E=;
 b=pnxuqiiL7eF/HvmFOSHbVKUrGfi2LRr7FAdKLt93XeNvKsaXwir74A9CaEuieQmqlx
 PmyVSJH/FPgVjULEs2tNHS2Pa/dHSaPwCQ9Czp+nphWqNDamB9wOXstIhqtoRoXrLhk8
 WfY7L1vWHMgYcUhgTiixnJXPHtHpsApdvRMUDTCF4dcCqgoxeQCYxMLFeK8011+YJUqT
 esDofIN5aIDhNNe2N9USj4XMjMa2JIOYLXyHoQ7LC44tCQKlR3Rmcsu4oW2UO+qrZwRI
 3ud7Xu4LlDhlWG13jNpbjLkykDdOZq3PLdJ8NxcNioLLeYcWJdlNHIl+1U4oDxv4d5Gw
 QKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7jlagpo4AUlheQevVqLvJ85BvUN14xq4gkanarUnJ1E=;
 b=c3LO4OS1cbB20qYSmV5+drkYGF6cQuOmcj6C/4o6v2UWNPYlhk+tBxE0Rrx1nzEF3b
 5PE1ePGmtSwx8/ggb1MrktREm2YLodxpUxkwgk6ET/evWe789tb9GUn31c1H2431fif8
 Uon0RNsPRt1Gwp1jI6QjY4VjzEVVr3dXiGQ5qvmwsQUpZcIDMy9dfqi/VXUz3slwTrwg
 gMCCLOkCDygj6/EE9bFasYGB22lAt18f+7icCEHskvBCr7rNUiAii6la3VoAxKPfzTeM
 t69QWhwc5zCbJB72ofeH2VzafpO2UYOvStJD99s/hggSAdWVIi5sRJlRWC3lJMhE9hvA
 p1UA==
X-Gm-Message-State: AOAM531yj9FF9hyyCRQxclO9shXKuZ8IjoDWJSEShWr6NtEim9xpL3jR
 X2f6OR3GcoRKbypEyfOmoARxGS3VxFcMZw==
X-Google-Smtp-Source: ABdhPJwLbLIhZCUq64maa/9KQLUXAoO343zLYNVRRCdjUOHbKP5m/ghD9V9Wl4I1D09c+cXMJPHBcw==
X-Received: by 2002:a65:454b:: with SMTP id x11mr23927515pgr.48.1624894569997; 
 Mon, 28 Jun 2021 08:36:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m5sm5158598pgv.24.2021.06.28.08.36.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 08:36:09 -0700 (PDT)
Subject: Re: [PATCH 04/18] target/arm: Use asimd_imm_const for A64 decode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5a8318b3-ee48-927d-4a41-06b78c77ee7f@linaro.org>
Date: Mon, 28 Jun 2021 08:36:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 6:58 AM, Peter Maydell wrote:
> The A64 AdvSIMD modified-immediate grouping uses almost the same
> constant encoding that A32 Neon does; reuse asimd_imm_const() (to
> which we add the AArch64-specific case for cmode 15 op 1) instead of
> reimplementing it all.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate.h     |  3 +-
>   target/arm/translate-a64.c | 86 ++++----------------------------------
>   target/arm/translate.c     | 17 +++++++-
>   3 files changed, 24 insertions(+), 82 deletions(-)

I'm a little surprised that the fp16 case didn't move as well, but either way,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

