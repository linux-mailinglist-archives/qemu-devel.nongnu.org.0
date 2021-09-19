Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647FA410CEF
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:41:54 +0200 (CEST)
Received: from localhost ([::1]:48556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1lB-0000l8-AR
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1iU-0006n4-R9
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:39:08 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1iT-0006TT-Gk
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:39:06 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso13899459wme.4
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PWxq+DTO5Wa1jOZ4ndKE/KOM7Q62dwPRvArrx/tyXBk=;
 b=gEVmjYfqHay4wTyrekXQBDB1WToZ+tDVVQDwSpGAl78lyPPmRXqL9dGPRZcg2zdgVM
 A2OseKhFASrOn2o6X9jzDIro213DTxC1Df0lnuCwzxXJNXUggYHLksyKNiPJt99sxjLB
 upmSTKstLN2CsG1dsMR3AWa2Fn7wBaeX6L/StKUmnOO8mEESI2PEbYmN82d0+4FiFQvr
 z82Fg3M7VBJbTOfYxrmtc+akVn20ClO1a/MLLrts5uaVAgorW8q5SdsEt3ij1XMFagfO
 8jkUgcMBnxqDmKtJ0Atx1lmr/TZe/qdaGIZNJWzT0W7+JbvUqrJqcb3ypO4XAd9ilgcS
 L3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PWxq+DTO5Wa1jOZ4ndKE/KOM7Q62dwPRvArrx/tyXBk=;
 b=lzkdvHUdc4dSMbVqSL4DACpubbFh+4RRdV8EJCoYRc5rNN6cPfbVZVcljZeFomiqrZ
 4W0bev2Letn83eKv8HxGgsXOipIYUR/VLA69d2cZ6qgQhtS1BmaY8j0qGafTVIhy45lI
 c6shBMScKG9SIgVQo7KRpmFyUNxY11pXy3xCyXYrwXhVyQ8fRIHoGW+WdqiZ+NmOYGSb
 mSrUm2RFeFeumTazkdDgV0Q5un+Fq7MwTk/sBgIR+h9Ok0tsRieFW0lzqRs1k0YY3rfQ
 r2T8TXe2VVI8G+b7caN3V7SL8gQY6hhSXjfs/CfPncJpp4SJln7yN+RlFFm4jxrKdA0j
 srPA==
X-Gm-Message-State: AOAM532zeJ8ggI6DXASjwXrm3JsGqOJ7cDsKoUd4sKPfwLYPort8KBXM
 PUPHBZTj86juQOuZQv9a8A4=
X-Google-Smtp-Source: ABdhPJz5pD0jgGXr9NwiZ7J6rnXhkYBQoN5oD+FXQYLNPtXGUQ4wah6J8LrBsCChVPR8BdSvM6dMmQ==
X-Received: by 2002:a05:600c:4ed1:: with SMTP id
 g17mr25484478wmq.193.1632076744101; 
 Sun, 19 Sep 2021 11:39:04 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id c30sm13539921wrb.74.2021.09.19.11.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:39:03 -0700 (PDT)
Message-ID: <331bc06e-9032-417e-7275-f51061c90b1e@amsat.org>
Date: Sun, 19 Sep 2021 20:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 37/41] target/s390x: Implement s390_cpu_record_sigsegv
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-38-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210918184527.408540-38-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
> Move the masking of the address from cpu_loop into
> s390_cpu_record_sigsegv -- this is governed by hw, not linux.
> This does mean we have to raise our own exception, rather
> than return to the fallback.
> 
> Use maperr to choose between PGM_PROTECTION and PGM_ADDRESSING.
> Use the appropriate si_code for each in cpu_loop.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/s390x-internal.h  | 13 ++++++++++---
>  linux-user/s390x/cpu_loop.c    | 14 +++++++-------
>  target/s390x/cpu.c             |  6 ++++--
>  target/s390x/tcg/excp_helper.c | 18 +++++++++++-------
>  4 files changed, 32 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

