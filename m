Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAA13D9DA1
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 08:28:16 +0200 (CEST)
Received: from localhost ([::1]:49322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8zWh-0005Rc-Ij
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 02:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zVc-0003yR-1A
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:27:08 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zVa-0002eE-Ee
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:27:07 -0400
Received: by mail-wr1-x435.google.com with SMTP id n12so5441827wrr.2
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 23:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vgVdneSZqHX+W3l0L++BT6bYcw5BpTc5teDdNybZ2Po=;
 b=YQKpbOOhLwGe9gvmuxV1Gozd3PyGwltD8tqDP6h5UwR42/xniEFarZAGyVWYwg5eov
 8WFY1YCvWUaWkdNXZLjFXjIhv1kSfe0zwSN8KnNGAaWycHiqZsqKxiohYg4qXqJjvhjM
 Bc6Jz/oVcEr1gUKddMyEkbXp4w/PgcpYl2W+ZLHZoZgGWTGD8eU5SNLDTBfmt9OQ0hFS
 mRkn69u/nriOaGMnRNV5KfFsrPnMrhZbc9lCnozQmAeFwOGHB+ooRCZR2ZWkE1PyNFmU
 3JvEZdCx5jcXXHAC/ca4YoRpI41bZMJFXygKSt8BQ97ZJbRyaVYawXf6TvlIHA5L3Bi/
 6Lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vgVdneSZqHX+W3l0L++BT6bYcw5BpTc5teDdNybZ2Po=;
 b=duH9xO6FaXcdyXFQ/W+F8DN+6PdX1k+JsVZUXANlP0Dviq7pNrxXlP32US1Q5Xhe74
 lkNwiQVHOFtXloswlYSM/z2DNWrGhHQm3SEKSxtgW5PrrLW/PTN9aKLaMiKvu5tEPJmk
 R4nQL0xeBNlGfCudgJ3GJAzw4yn2pLCuFaK3pWVXL3G67RLs9LewCiIXCOvp8zKlkRL3
 UXZ0qM1TXGA6vZN8WgT101VDJZov2HZMIafWhqyHZqd8UHX9aRznLl1HIoQRkVd03eBR
 9jm/JCy7/F0yucAsNt+2XL212EPxQiB8SVzBpAeOKfgS0StFQGbCqfY7/XHcfWJptdd8
 jL9w==
X-Gm-Message-State: AOAM531mG3Hn8hKwq2Da5OhIvikrTSu1CtVbICJSzGlG5afa9tg/ImN+
 n1nL/9hC6+5HGJ0FvBJaiGOQp3lXR+CNKQ==
X-Google-Smtp-Source: ABdhPJzx+HdTCTJI68hSFmzK1EA1fadmYSxHUftxjDLxaw4Tl/Tm6nQqud9k7zELksIDl3K06Vbhfg==
X-Received: by 2002:adf:ed4a:: with SMTP id u10mr2877974wro.86.1627540024767; 
 Wed, 28 Jul 2021 23:27:04 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id a8sm2044210wrt.61.2021.07.28.23.27.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 23:27:04 -0700 (PDT)
Subject: Re: [PATCH for-6.2 20/43] tcg: Rename TCGMemOpIdx to MemOpIdx
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <89845d05-91ac-f9ae-cf8e-52ef7bbbcd5c@amsat.org>
Date: Thu, 29 Jul 2021 08:27:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
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

On 7/29/21 2:46 AM, Richard Henderson wrote:
> We're about to move this out of tcg.h, so rename it
> as we did when moving MemOp.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/atomic_template.h   | 24 +++++------
>  include/tcg/tcg.h             | 74 ++++++++++++++++-----------------
>  accel/tcg/cputlb.c            | 78 +++++++++++++++++------------------
>  accel/tcg/user-exec.c         |  2 +-
>  target/arm/helper-a64.c       | 16 +++----
>  target/arm/m_helper.c         |  2 +-
>  target/i386/tcg/mem_helper.c  |  4 +-
>  target/m68k/op_helper.c       |  2 +-
>  target/mips/tcg/msa_helper.c  |  6 +--
>  target/s390x/tcg/mem_helper.c | 20 ++++-----
>  target/sparc/ldst_helper.c    |  2 +-
>  tcg/optimize.c                |  2 +-
>  tcg/tcg-op.c                  | 12 +++---
>  tcg/tcg.c                     |  2 +-
>  tcg/tci.c                     | 14 +++----
>  accel/tcg/atomic_common.c.inc |  6 +--
>  tcg/aarch64/tcg-target.c.inc  | 14 +++----
>  tcg/arm/tcg-target.c.inc      | 10 ++---
>  tcg/i386/tcg-target.c.inc     | 10 ++---
>  tcg/mips/tcg-target.c.inc     | 12 +++---
>  tcg/ppc/tcg-target.c.inc      | 10 ++---
>  tcg/riscv/tcg-target.c.inc    | 16 +++----
>  tcg/s390/tcg-target.c.inc     | 10 ++---
>  tcg/sparc/tcg-target.c.inc    |  4 +-
>  tcg/tcg-ldst.c.inc            |  2 +-
>  25 files changed, 177 insertions(+), 177 deletions(-)

Maybe mention "mechanical change using sed".

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

