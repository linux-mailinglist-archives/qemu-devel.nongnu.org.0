Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E649E256238
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 22:48:14 +0200 (CEST)
Received: from localhost ([::1]:51120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBlIE-0004Vs-1Y
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 16:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBlGy-0003Jn-F7
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 16:46:56 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:33365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBlGs-0005Vh-HY
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 16:46:56 -0400
Received: by mail-pj1-x1044.google.com with SMTP id q93so239712pjq.0
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 13:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=fvrJS0J5JAtvCHtGn92jeQQIGjakVXL01C+zgxiQjZE=;
 b=QqJkCJv9+tbF25ea0Te+z/0J5xx1WJkIPNpL7ir8z8iCcE13pN4p2V4O2H0Onee+uM
 KbIHIA7vBCj7SN6xzfpECOW1dFUJBswXU+iuYO+x0eHlvuH5nKXxoKZ4XWWChmQx2HsR
 qsJvvwALo/sni3Sf1spKlPxZJ/skw+mM0pm0RFCq2h+XCfhA8nTl1RLgd9ZzunKyDeS3
 bkn3TbbRqDF5t8engJzrNw10U+FzSioI76OEUYVVtwr68ZoQEpDWUOeNBvbIMGABGckr
 wRP2PfCUOp8mZCrpxzSZATNEHhTkNo4I60UmiB2MPftGJnTBO69AvnoAmlh8bcVom8lx
 +jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fvrJS0J5JAtvCHtGn92jeQQIGjakVXL01C+zgxiQjZE=;
 b=a3dNLPa3UsKBBU+8P8AIlwEzv1Hc+ZO6UBpy373xdNi/MWkPY3mlcWXiISQK/nXDQl
 DOKGFn0RRGyK3L6T6R+N66fs7H/OvEmzoY69RIpAb9Hlge/Lgsg5ioBgD4V0p7AjXAXg
 wd7228MTtGmp85HS8CgI9XVgMwLdcPjL7HRRSWhAOqSDm8G1w/oRuXiXyPcc5CN4eyDS
 bsKZB7Hoh5FSu67WwuYjY0IdfE2Ick8LSu2b5To1GcypPmKEuJiypsPcY4EeylMc/nJp
 xuwIBvVPk3HCwKc4sP/YASo9sHiImrZb+0BVRIENT3VpwsIeueZ6EaKOrUTzPyojW5m2
 FljQ==
X-Gm-Message-State: AOAM530OW35uG9ZzWAwh9T9N4QWKJhl/4gltLsW/TPXE4DZFOviS/Npd
 CE0CStR52RLGt7RgCL60n86CiDGm7igLzw==
X-Google-Smtp-Source: ABdhPJzGdTpLQDfJBnia1wSL9Y6foz2d3csujNnd8sNsXJAdd0Atv1Xznktcg4b2YpWAw0+GrJYZMg==
X-Received: by 2002:a17:90a:7b82:: with SMTP id
 z2mr670624pjc.106.1598647609008; 
 Fri, 28 Aug 2020 13:46:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id v20sm203498pju.14.2020.08.28.13.46.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 13:46:48 -0700 (PDT)
Subject: Re: [PATCH v2 28/45] target/arm: Implement fp16 for Neon VMAX, VMIN
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-29-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f5562f27-155d-dbd1-3772-b0f737ea3468@linaro.org>
Date: Fri, 28 Aug 2020 13:46:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-29-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Convert the Neon float-point VMAX and VMIN insns over to using
> a gvec helper, and use this to implement the fp16 case.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h             | 6 ++++++
>  target/arm/vec_helper.c         | 6 ++++++
>  target/arm/translate-neon.c.inc | 5 ++---
>  3 files changed, 14 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


