Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B16A410CF0
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:43:15 +0200 (CEST)
Received: from localhost ([::1]:52230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1mU-0003Ch-7y
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1h2-0004TS-TY
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:37:36 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1h1-0005Vl-BX
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:37:36 -0400
Received: by mail-wr1-x431.google.com with SMTP id q26so24645460wrc.7
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RbUU7fQe8U8d1b3w7h4PfSLwNokn87mVONfz6zyEKE0=;
 b=W+e44kGLWHT7BlWz3neBe7JnxFXfue1FahazTOTMjyi0Te+fq4KCVCENiNDS3EtTE5
 NL6HIHmJdZlRNqftDQppTWp+rkAwcwH2YGJA2oMWnAcf3s3oGfUqkCjUh+3PVJhsZCKz
 uTgAq2TX+Lm5nCBC0TMhY2uiVNEc1puCd1884YrtU5CR4vA/wqSQ+VCEHKySJ+M4jUWL
 venTiq9uicoRKFm4nwsBtwrMnrMCqUacW3phWovO/o/BIswqTSPwirBik8GS5t5tQaOB
 chcJdftevA97uqnT6DitI1/Q885rd8CwYLbZ+3SD/0rrLIsBWkVysr9my6c8B668ZSkr
 fLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RbUU7fQe8U8d1b3w7h4PfSLwNokn87mVONfz6zyEKE0=;
 b=rjgZxyivVl4U7BSPWBV3/6RSyBHsQeZGlRv5IfcCmIdlk3YG+SaWw1jO9rVG9cRLcv
 Fvpf+R090oH3v3i4wBAmTUDV6TejofPS8zd9We0htesr90Y4XKBY1vromCdJIBm02/Ey
 lkyMilVcORXO2MC9Kh8MrGfeNS08SE6AV+BnRFTWjBr9zp520LjnvtjZAo9yEelNh5iE
 UUJzTJj6Bd83kazcSR940BrGxNzNJBoVWX6M9/JNuZq+90KnDqTvEzKkcVWIWddXkNuD
 JXKmtmNi7/UIpFbhbvyyUDG6yRYuVrN8FgIEi5V4/h3dogChB57z7FfSVnaGu8b+QB+K
 b08Q==
X-Gm-Message-State: AOAM532wmHRwVGjhf1FuaFjZiGoSt/wVLQWPAi6RuiyGK8PDDHim6gCh
 Bv6fbU+PaSqPZYkYOjFZPNM=
X-Google-Smtp-Source: ABdhPJwPl9nbsh7ZhgkBdWNHc7FCPoq4QBujzU+iVg0vkPBI/EVMI/Ygy+Gw7ZpvxVbBSt34XFqeuQ==
X-Received: by 2002:adf:e603:: with SMTP id p3mr24361534wrm.357.1632076653864; 
 Sun, 19 Sep 2021 11:37:33 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id h18sm13091021wrb.33.2021.09.19.11.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:37:33 -0700 (PDT)
Message-ID: <37d823e0-7f47-8d0c-ade8-42f7c53a7c6c@amsat.org>
Date: Sun, 19 Sep 2021 20:37:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 34/41] target/ppc: Implement ppc_cpu_record_sigsegv
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-35-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210918184527.408540-35-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/18/21 20:45, Richard Henderson wrote:
> Record DAR, DSISR, and exception_index.  That last means
> that we must exit to cpu_loop ourselves, instead of letting
> exception_index being overwritten.

Maybe complete:

"This is exactly what the user-mode ppc_cpu_tlb_fill() does,
so simply rename it as ppc_cpu_record_sigsegv()."

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/cpu.h              |  3 ---
>  target/ppc/internal.h         |  9 +++++++++
>  target/ppc/cpu_init.c         |  6 ++++--
>  target/ppc/user_only_helper.c | 15 +++++++++++----
>  4 files changed, 24 insertions(+), 9 deletions(-)

