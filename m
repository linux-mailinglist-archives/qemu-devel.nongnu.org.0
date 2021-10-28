Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A94CD43D829
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 02:34:36 +0200 (CEST)
Received: from localhost ([::1]:37422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mftNL-00071I-8Q
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 20:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftKN-0005Me-48
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:31:31 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:46633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftKL-00035m-AU
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:31:30 -0400
Received: by mail-pf1-x42b.google.com with SMTP id x66so4269159pfx.13
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 17:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iEjyz3RimAvmfDo4BNj3fU8BjRbWZ9JKBa19bBTPXXM=;
 b=D2kYFoNLb7aJPYTF1pX4/rdjER4jSWryUYul+T4uImSpxsXQH7CDPLQaTE0hM4lkMJ
 Ymw2V5BdZ3wCg79+ft0XJ9ISzkNa2igI5VwU9SJf1CVrPWxAyI8jiSE3icsec9HInjAa
 S4IBcn1vtcJfwsiG0UirzfToXcFfrFJmxqr+qRYvwMxUxN04pDazjGam7hqRUo1JUeNS
 bv0iX97EJD+A8h03e+inliu2NPmh6bzxDYWwHaf5noLYM4VDGHDhQM9+dkSfxJ9bU6Q3
 /0OgZvotFfFGsjZ0nSO0551W6xm1N9eyBBvtTMVt93nFqvY8FeEFIc9WzKLEkD1egMZU
 V69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iEjyz3RimAvmfDo4BNj3fU8BjRbWZ9JKBa19bBTPXXM=;
 b=v4y44XycdT0N7MXnj01vY8Cb77qcJX5cDbypRFsf27tTqQ/DkE1W9F+zdzk84FfidW
 I1IzkoSl/eT9vHR8xVG9kfChMvIsbqbH2FfyqtIFBW6+X217SOkae6CLTEXdiXPqsyuq
 Rp08cl+8+Y1TIMqYiOjVAYzgesLJvo4P9HnhbtS3JomnClyn2j/EN4CdSGeSCmqcmT28
 4Qi8V7W5OKZLfrWtaTf9cpbI2awVJlrHA2nCLYGa4qIWU00xQ0gzTDLnZDndm8FhJ2KL
 xqSmzKmNvFmduPxtAsyBJMf0WI8e0FPYAVW20/SrNQNjMPJ6AuKLaFQVwErCT75H6MEo
 derQ==
X-Gm-Message-State: AOAM5305iFhLW0kILj8bll+ZscEBtxn9PobuDcwyeXyGT8R1z3IH2nQR
 Z05MjdCSIRsqliTxUVV1hfZKXg==
X-Google-Smtp-Source: ABdhPJz+6usne7mlpPdqDS1I01n5EWW+M75iPeF2pxJtsCGLR0cDplSRONVCd+zHpKwljRjlzNJiAw==
X-Received: by 2002:aa7:880d:0:b0:47b:e349:d285 with SMTP id
 c13-20020aa7880d000000b0047be349d285mr951399pfo.31.1635381087679; 
 Wed, 27 Oct 2021 17:31:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z10sm1074710pfh.106.2021.10.27.17.31.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 17:31:27 -0700 (PDT)
Subject: Re: [PATCH v3 03/18] hw/sh4: Change debug printfs to traces
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635371671.git.balaton@eik.bme.hu>
 <107f01a0d2eb72cc2bd7055282a0c5fe2a1999f7.1635371671.git.balaton@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <999f99d4-d12f-fa1f-bf3c-b5181c8bfab4@linaro.org>
Date: Wed, 27 Oct 2021 17:31:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <107f01a0d2eb72cc2bd7055282a0c5fe2a1999f7.1635371671.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 2:54 PM, BALATON Zoltan wrote:
> Signed-off-by: BALATON Zoltan<balaton@eik.bme.hu>
> ---
>   hw/char/sh_serial.c   | 13 ++-----
>   hw/char/trace-events  |  4 +++
>   hw/intc/sh_intc.c     | 79 +++++++++++--------------------------------
>   hw/intc/trace-events  |  8 +++++
>   hw/sh4/sh7750.c       |  8 ++---
>   hw/sh4/trace-events   |  3 ++
>   hw/sh4/trace.h        |  1 +
>   hw/timer/sh_timer.c   | 12 ++-----
>   hw/timer/trace-events |  3 ++
>   meson.build           |  1 +
>   10 files changed, 48 insertions(+), 84 deletions(-)
>   create mode 100644 hw/sh4/trace-events
>   create mode 100644 hw/sh4/trace.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

