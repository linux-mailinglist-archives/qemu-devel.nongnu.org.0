Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052A736FED1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:43:10 +0200 (CEST)
Received: from localhost ([::1]:36214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWEO-0005bl-Qj
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lcVzd-00043W-10
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:27:54 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:55978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lcVza-0005HM-LH
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:27:52 -0400
Received: by mail-wm1-x32f.google.com with SMTP id n127so26335948wmb.5
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gnnYrKly1sT0monoPu44e520fulazCIwH+PEWQIdUx0=;
 b=isQDtedFmsksWrx90sJbXgK+Wtp3Kl9CFl7LsWUMJJhWtxePid0H2hSEDfdoxefanK
 y9IioKXZbMc3KlgmGcndjrbp5n3LvfqnFBuB7I5npNLnFyLar3NpGJnbHBD8ghdAw5kp
 EsgIyMcqSHkNptXlT7qYHEVuOlzw/1hrQ7mOcMsJdvfMgr+kSGmstNPO4HvuDVlrzFgU
 P4dpaOseDvNKtfX9Iu7/i5K3uP5dVVENVvCrfjncOL2PijtvPQNBF/t7onW4Z41SEyz1
 i6T6FSsnfZ5SRKo+3k1OzmVoudULNKuoILZguyP0DpCr/+Pb56pILMHaGWHM+kE1tH6E
 YHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gnnYrKly1sT0monoPu44e520fulazCIwH+PEWQIdUx0=;
 b=ke0s37jzf9oZ997uhDzh03voIPHPxR5buHlry15b5Zemmc8qUJU6QPAWB0aGHXjGbw
 5AUhrCmkdQtNmOiBlYc5B0J0moJdYFSKXZDJusYi2mX1JVSs373eUTJqD87XcQPbJJSg
 3ADJbdobSSae3kOjtwa0YEgkx9t3gBcS79/DL9SozYeU836DzGCUClo+8Wc0mi8aXhj5
 Cz3VoegYReXTysg+nB0iutP8E7tqW3trgGwAUgGZQ4yd/ixVlSMbqxNsUKr4BOu3KJM3
 1olKFTkdyJId04JhwrDCb7ylqRp8lA8fSfrOdRM9Qtvx2fmJKaTEtY078c9rCKoGSBWm
 4ycQ==
X-Gm-Message-State: AOAM530E6vJDpGdoQjQtj/NfYaCRNkWy+CJjDKt3UHpO7tRDdW/tz9Ox
 AyMQgKWhjfTXw7nLXl3XjeUh4Y722VrSJ5B4
X-Google-Smtp-Source: ABdhPJwTvPVfucSI1KtmvTDgP4ZZkZ+QuCL58z+Q0YmCPwN9AdkvgXifMW/U0DL1c2j7M5GwXEWjig==
X-Received: by 2002:a1c:7501:: with SMTP id o1mr7097098wmc.65.1619800067968;
 Fri, 30 Apr 2021 09:27:47 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id f18sm11702926wmg.26.2021.04.30.09.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 09:27:47 -0700 (PDT)
Subject: Re: [PATCH v2 10/13] target/arm: Delete unused typedef
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210430132740.10391-1-peter.maydell@linaro.org>
 <20210430132740.10391-11-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f18c7c7c-b75d-6a79-518f-71b14a6a0fd4@amsat.org>
Date: Fri, 30 Apr 2021 18:27:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430132740.10391-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 3:27 PM, Peter Maydell wrote:
> The VFPGenFixPointFn typedef is unused; delete it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

