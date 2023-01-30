Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2A2681FC9
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 00:43:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMdnQ-0000bC-Vo; Mon, 30 Jan 2023 18:42:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdnO-0000b1-Ms
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:42:42 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdnN-0002O1-7u
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:42:42 -0500
Received: by mail-wr1-x42b.google.com with SMTP id a3so6026265wrt.6
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IPr9bKJBpiJk0QSqqdsuuI0Y6DtYLUkDCmf3ZV1mF1I=;
 b=dlE5jkUgoza488JlplAm6vF+3esfmatPq+I1pitq6OS4m34jpz8NMfkXdNlq2Pa9vj
 Bp0qDBlR93dz8A2zIgIAMvJ1uCskXtVfC6NjFOwS1GSkpVeIo/R4D4fbjq198/jz8WAr
 V3zYGnTwHBozPLlPb+7SSHZwa/8k/T1SrcwJXrZHmsSJtgEKlu/8nnvvUOlhDKbHd8nw
 zQDanDAvvhWJbYQ3YxymMbvbeJNl5vvW5GMcgtIdKvxZgOXAWIFgbXDfx7R6fz8XLr5Q
 bFzjpWj2E4H+NZsW9/7uphRpsc2puN7ntY2lhkffzBRm1HFBI6id10zd1GFvoqEtR7Oq
 jl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IPr9bKJBpiJk0QSqqdsuuI0Y6DtYLUkDCmf3ZV1mF1I=;
 b=b2So3Fl7up/8W14hXNGGtrK0tWYPCQ5cOpPzZquWbeNqLB8k/obhiAyfGAFlMzgflG
 CQ51h0nPtj6D/s3Zi3apJ4TMQeBEOl5C1YXiwERcw5wDtZJZAPDKwlHtFvIVIDzFkYVo
 2fmL0PHknt2pbT8otC/dUQMUbWvieBBLlnatqC+Ak1+9E3RGRG49Tt8TLEUdfU4qJx0H
 8AE/PqZdy6neSz8Zts8uStXSL00gF//mmm/SZmnN2T61N7TOZYW13FNUjWDds1t9oPuI
 XGchc1jPAixDICl/Sbj8FQCbeMjEk2yJA79O3qWMiCDJOrpkZxcO3ma735WaPxOuQ5eP
 a2Cw==
X-Gm-Message-State: AFqh2krDL2zMwLLTP/zCrFLXU1P0SqYODMVqIxVqKbuxQBBABFyQQfFK
 TbWUCZwMcPzM7QD2I85+vVEmRw==
X-Google-Smtp-Source: AMrXdXu0Lv3f6YRee13wjae6E+qSH2zkERcc2kidhBSmhzXKBuvDGCFDbQ2afHjhfVyWVhBqrPE3CA==
X-Received: by 2002:a5d:59c4:0:b0:242:1b0d:9c58 with SMTP id
 v4-20020a5d59c4000000b002421b0d9c58mr48555664wry.69.1675122159035; 
 Mon, 30 Jan 2023 15:42:39 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a05600c19cc00b003db0ee277b2sm20064036wmq.5.2023.01.30.15.42.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:42:38 -0800 (PST)
Message-ID: <e26cffde-7a5b-d9ef-2d28-b16d4d9220e2@linaro.org>
Date: Tue, 31 Jan 2023 00:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 22/27] target/mips: Don't use tcg_temp_local_new
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-24-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130205935.1157347-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 30/1/23 21:59, Richard Henderson wrote:
> Since tcg_temp_new is now identical, use that.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/translate.c              | 57 ++++++------------------
>   target/mips/tcg/nanomips_translate.c.inc |  4 +-
>   2 files changed, 16 insertions(+), 45 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


