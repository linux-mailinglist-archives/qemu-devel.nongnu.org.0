Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC1941FC72
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 16:16:22 +0200 (CEST)
Received: from localhost ([::1]:54932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWfoL-0004yX-Hm
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 10:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfmS-00047j-8i
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:14:24 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfmQ-0002Zw-Rg
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:14:24 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r7so4842973wrc.10
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 07:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bsihsifsxwVcsHx0LdNv8RcFti4uG/OVFFYFJR5TlIc=;
 b=HefwOfBcr7uySJI31ICE/NH3OapLpJV1ITr0mocN6DQ2+3V9+vB4OTa2/UDVkJimjx
 Q8wU5LMyo7UPehkj0QW/eneOe4W4/lKGPVkt3ayOOPVTwHv12w1Lgxkjc4hytc34Ht+8
 tH3gX+6bMlxg1Y0SuLyTJgAhcFQMRwNLMaAyCM1vCoJemyjw6j8Y8ebDot+OrMmxiEbE
 /PLfbS/82uacSAR1KIuSTqTgtd41Z9XNPlNZ+9YCiZvc9k4GaQFIx6jGL74bpM770j1w
 sVowx6KHr1EpFGxb5FHjWAceGy4iu28TnSnHhSJHDloUxAAxcK4x5XeIfz4O0JqgiRUQ
 XQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bsihsifsxwVcsHx0LdNv8RcFti4uG/OVFFYFJR5TlIc=;
 b=okftiTLWkaKbFvykkdeiBa1h9kdbZIRVqUaERhSMIZr5+EYdBRsJ8BCRU5jaxI3Er1
 dnYdgb76qE2L85sQevuB+CJ8ifiq22W8j9mX74yADnYGwAeLQ/DALzOrwdYgClZxKoOA
 BAY0wwkF7wChRLQBlj9oufs85JzAl5KLnSiy0OPQA++bVz3tT1dJQ7woStgcoOdag2ue
 KlnbSH8kyUZnCtqj835wkIx3L1IFwubYg6agZeQFT1kK+BGrsMkWuK6dgCZRxQz9x4cD
 eLEVlJrzEmP7MRHVOpyiPLFdWFe2zAxbphIiN245aH4iq+AbzeaZXckig+udE6sx0OKM
 C4+Q==
X-Gm-Message-State: AOAM530QY51OMZDZZ0k8KlTVwjfQozJKy0T4Qe4mLNoZ9oka0O8VrD9A
 vpwH9dqe6mI7NzcmEegdklA=
X-Google-Smtp-Source: ABdhPJwlNqc3zj+xkmiadeSSwsz7QpBtcr5hbgsZJ/bRQ9lLt/V0o7R7dP5iUTcXuOP4UbgBWiB1zw==
X-Received: by 2002:adf:97d0:: with SMTP id t16mr497627wrb.124.1633184061110; 
 Sat, 02 Oct 2021 07:14:21 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d129sm11536113wmd.23.2021.10.02.07.14.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 07:14:19 -0700 (PDT)
Message-ID: <16eec147-b4ee-bfec-b014-539ccbe50a0f@amsat.org>
Date: Sat, 2 Oct 2021 16:14:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 10/41] linux-user/host/sparc: Populate host_signal.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
 <20211001171151.1739472-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211001171151.1739472-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.413,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/21 19:11, Richard Henderson wrote:
> Split host_signal_pc and host_signal_write out of user-exec.c.
> Drop the *BSD code, to be re-created under bsd-user/ later.
> Drop the Solais code as completely unused.

Typo 'Solaris'.

> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/host/sparc/host-signal.h   | 54 ++++++++++++++++++++++-
>  linux-user/host/sparc64/host-signal.h |  2 +-
>  accel/tcg/user-exec.c                 | 62 +--------------------------
>  3 files changed, 55 insertions(+), 63 deletions(-)

