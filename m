Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 057BD643DB4
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 08:38:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2SUx-0002uP-Dv; Tue, 06 Dec 2022 02:36:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SUu-0002u0-Pt
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:36:12 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SUt-0005wF-5e
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:36:12 -0500
Received: by mail-wr1-x42b.google.com with SMTP id w15so22200155wrl.9
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 23:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sm55WryJhWKn3UKq81sJHKIHTc3mRiBruYXtrhL1M3k=;
 b=x8KhBnZQCBZu5ap/2lJ4DJ+8zwhDJouVW2izy443aYpPpKjB4Lz5jnCelouvJ3XE3H
 At2bmJR0VValuRFQpLW858t9X01VGnA2p+0Xekk8XvQVrCnqpx5djO/1FWirNr77aDuD
 4oUdZ8aSA2QIWHn2l3KRN2uwnRLXcC1WWyvlEKiblhc1GGOuvczGqn6ztIKc72LDOGWz
 kS2FykpN3DSAqOGqprsEZxajGG6c0CRVXgaEVRYnQ1oz64UPR1ehi/JRCotFXItVgBQm
 xAH1av4pWXBZUzfSIs/+r+HzGyM9sirdycv6Z/ZHcwAp2vLIS/KdX4rXvhNGFimCCS/U
 5FWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sm55WryJhWKn3UKq81sJHKIHTc3mRiBruYXtrhL1M3k=;
 b=rm0NtgAE4N6hR8x/ppPoOhpOU896BGkRL6nShxd8SmR1QHoWzUz9tq+Beu23M7QnNx
 G6/ljRfrC8ZmJJuaRGyYR0LkO6d3Lg1dHdc5eTnIt7P6Bo5a8keL8PvUGJ9pOESwP7s3
 4Ii5F1lGN9aFHFlWL+1BH2wvMeK6qXHCQS8K6ns7stsPU9LgDyIeGpGIh4DCD8d5nu+i
 1b7JrtyOQkQGJjalq1hvcpqPMLe9EF/sQmH6rSmHnc6PCez5vJ103doyP8JcdMqTi5CG
 gfm+OGIoS59W1vXZsIiJhRLmSDymFwWzJBj9mvtfJWAh/NI3RaK5FNxx4b361H6M/jnt
 2/2Q==
X-Gm-Message-State: ANoB5pnU5fZ2VaJJlKc6IZN+7Z8xYu5ZcaT86sjJEv8v9hn/w4BKOW2i
 6CCvmArMSzf1mVQ7pemcCQaEKw==
X-Google-Smtp-Source: AA0mqf6i68womg449XsTfQKuUoRk4MMMIDY9RNb0pOwPP2OmtPrxKwRkTtp7TLfBJxevdY3xm0ErMw==
X-Received: by 2002:adf:ef44:0:b0:242:3563:e2a2 with SMTP id
 c4-20020adfef44000000b002423563e2a2mr13488443wrp.418.1670312169513; 
 Mon, 05 Dec 2022 23:36:09 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c4f8e00b003c6f3f6675bsm26096042wmq.26.2022.12.05.23.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 23:36:09 -0800 (PST)
Message-ID: <447cc7ea-eed7-7657-d011-10af4f77381e@linaro.org>
Date: Tue, 6 Dec 2022 08:36:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 08/22] tcg: Split out tcg_out_goto_tb
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: r@hev.cc
References: <20221206041715.314209-1-richard.henderson@linaro.org>
 <20221206041715.314209-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221206041715.314209-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 6/12/22 05:17, Richard Henderson wrote:
> The INDEX_op_goto_tb opcode needs no register allocation.
> Split out a dedicated helper function for it.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        |  4 ++
>   tcg/aarch64/tcg-target.c.inc     | 40 +++++++++---------
>   tcg/arm/tcg-target.c.inc         | 49 +++++++++++-----------
>   tcg/i386/tcg-target.c.inc        | 33 +++++++--------
>   tcg/loongarch64/tcg-target.c.inc | 38 +++++++++--------
>   tcg/mips/tcg-target.c.inc        | 21 ++++++----
>   tcg/ppc/tcg-target.c.inc         | 52 ++++++++++++------------
>   tcg/riscv/tcg-target.c.inc       | 20 +++++----
>   tcg/s390x/tcg-target.c.inc       | 70 ++++++++++++++++----------------
>   tcg/sparc64/tcg-target.c.inc     | 68 ++++++++++++++++---------------
>   tcg/tci/tcg-target.c.inc         | 16 ++++----
>   11 files changed, 219 insertions(+), 192 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


