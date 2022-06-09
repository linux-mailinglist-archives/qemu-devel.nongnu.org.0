Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF01545034
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:09:16 +0200 (CEST)
Received: from localhost ([::1]:45472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJmc-0008MN-OT
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzJ0c-0004ib-Nn
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:19:40 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:38772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzJ0a-00031u-GK
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:19:37 -0400
Received: by mail-pf1-x431.google.com with SMTP id e11so21203682pfj.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 07:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+PrMyUy6GCFvuUHKZVr4II4IgDjVG6WtNnDce63QCvM=;
 b=xjw+iuHURw/hekTo9JauR15g/B2nf3eQbj4/TwY5SeW9Vcr3v5e6vjmnyTWFbSPRjN
 LhhplHE2XGweE2Rpy8bE50a5H7QQuL15hMODqPtL8iy3eCa1TeneLFRIo2GbiywDg00L
 6RLwaC7jJAoTB1Ac2wwWJVMhuKOjkeQy45M5T2JimTTQVu2kj2frH+/uM6ZvU/zFhN+m
 PJrAKFlStsc0FMNIuwN7zMtKKFc4qK8R5+0dL/ugE5jnD0iOlLa0ASjgrT1UqvnJZuzI
 cgl5v5R9KfeHkbfHsc+3LGiL/pF5ibyNE+jEXiUB4tTO3LTx71N0en1tHU86RL9/yIuL
 S26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+PrMyUy6GCFvuUHKZVr4II4IgDjVG6WtNnDce63QCvM=;
 b=FK7ep1aYUXlPRlg92B4XAbSMhFgDzEfZqFn0legORfc7o5eORt2pMVQG2eIjO5LyBe
 CMEIFxn0bbVwyZDn07OF8Wgwz5FocSzE6xk++j8JAS+2iYRWgtt+QMvhRUeNild+h4AP
 U51bKDeTvUPesY49Vt5pnxlzrT2FnmnbSi7mBzPfnIWlpnL+r7cz0IO13SPs7TdkCi6m
 d/zqqqTmyxBhVv9Gqy0R+s0P03tWlvocIBKuBC9oDM37QWvAItLKjeaQigjVfoRWpWfx
 ukQ8g8EX4pRqqc85sStgcWhJsygKt8m37M2J43RNxmjz2OUEzmloHCu+coo4FcgiEYuV
 FJuQ==
X-Gm-Message-State: AOAM533DHM0ZoizgpeXPxqiR/DsbG3RLI3cZVDXqllsQOFfGFZIRwBzc
 qmOETinLWI+CWBSNrv7kstoNxQ==
X-Google-Smtp-Source: ABdhPJygCg3Yq0KZoO6VmmwZ+3rXFQ6RjqTAfgGDWO2E+coW80i6JFWjeplNKGOGPaHoUqOwsP0t5Q==
X-Received: by 2002:a63:f453:0:b0:3fc:7939:9654 with SMTP id
 p19-20020a63f453000000b003fc79399654mr35000178pgk.341.1654784374622; 
 Thu, 09 Jun 2022 07:19:34 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:839f:476f:678:38a?
 ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 mn1-20020a17090b188100b001e2f383110bsm18758059pjb.11.2022.06.09.07.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 07:19:34 -0700 (PDT)
Message-ID: <92b9cd22-a1a7-ae82-1421-e023e6c18d81@linaro.org>
Date: Thu, 9 Jun 2022 07:19:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/3] target/mips: implement Octeon-specific BBIT
 instructions
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, jiaxun.yang@flygoat.com, aurelien@aurel32.net,
 aleksandar.rikalo@syrmia.com
References: <165476301211.40568.5713018312386387782.stgit@pasha-ThinkPad-X280>
 <165476302289.40568.18287487542170689158.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <165476302289.40568.18287487542170689158.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/9/22 01:23, Pavel Dovgalyuk wrote:
> This patch introduces Octeon-specific decoder and implements
> check-bit-and-jump instructions.
> 
> Signed-off-by: Pavel Dovgalyuk<Pavel.Dovgalyuk@ispras.ru>
> 
> --
> 
> v2 changes:
>       - Changed insn field description and simplified the jumps
>         (suggested by Richard Henderson)
> ---
>   target/mips/tcg/meson.build        |    2 ++
>   target/mips/tcg/octeon.decode      |   15 ++++++++++++
>   target/mips/tcg/octeon_translate.c |   46 ++++++++++++++++++++++++++++++++++++
>   target/mips/tcg/translate.c        |    5 ++++
>   target/mips/tcg/translate.h        |    1 +
>   5 files changed, 69 insertions(+)
>   create mode 100644 target/mips/tcg/octeon.decode
>   create mode 100644 target/mips/tcg/octeon_translate.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

