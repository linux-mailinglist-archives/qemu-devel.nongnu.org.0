Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 794D4410CC7
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:06:51 +0200 (CEST)
Received: from localhost ([::1]:46456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1DG-0002i5-Cj
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS19p-0000zS-En
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:03:18 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:46783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS19o-0007Xw-4j
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:03:17 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso10438297wmd.5
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XvvXGlYC4Z3TcrH07Ulq5+VVqG72A5lXyHzBAuj/3fg=;
 b=SUZ8M7WZssJZ4DppJmdZ/xfGvXf8rqJEDUg2T/qjPsY6he2+xINi47hY1g7G6hmBUa
 cEtRALOyQAadsIFFk0TLEtyvIYBTJvrJ7tLbmqpywxQZrZB35DuKH60QKGmDrohCYLpq
 Uh3LPDLZm69wAFKSgUZe462AxRYsi7Z3f8005L0tyBuJVxwES8WUADqnzaHiPzbJVu9I
 kXFj16/8Dt+bacI5ZRB6TWlKWc3RhRM9LUmkabUoBGwWpZBjtyaoAnvPNoPkLaq2vnmJ
 i4zrd1YV/M31QzuALHtG4o3S7QT8apGJFlQ4nJjVZILK+zNkNd0iXiqip6tcgv57bMk3
 zThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XvvXGlYC4Z3TcrH07Ulq5+VVqG72A5lXyHzBAuj/3fg=;
 b=UOlW1gVCnofrm0bbtwrYxBIohM0rl4uRHTcu9OudyaFandSct6nfqtV1StvUaTsGNC
 hdLRk5+V9OLwMO7UBXuXEUzeHMTnS3greG5CuwS2XJy8vdllvcGXprP5WaBwu9ZdDCqc
 9pmfYsOm8uokESV6aBV31VnZdNS5vYUZeNWQP05uEJgNSKkRBF6jO4Mj3ZGtOZKQAmOk
 74G5W2WZ6pizIbDxVL4seOSDivvZjMh8Glcl7cYSuTohIkbI8JnDcj3+bKxlFyEVmdPR
 9lI4h3hz71tgA7ttFPxcE8od0+cxNUdxCApg0UOx8aEz44ejtl4ucfMwKABQ1zyKkDmf
 KguA==
X-Gm-Message-State: AOAM533n/Uy1yQZZWzQ4xecpRF9UHI1lfBZTZKcUJGGqjA8Jfq7biUCe
 xVnCJwHIobcTxxSx8aFw/vw=
X-Google-Smtp-Source: ABdhPJzOLA8yDg2YeFOKmSLiy36q+Kizmj6e+ffaVEG30bfQzWwPBJsL4y2unSJV7M6YfinRUiqPbg==
X-Received: by 2002:a1c:c918:: with SMTP id f24mr25276980wmb.61.1632074593285; 
 Sun, 19 Sep 2021 11:03:13 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id t1sm13321463wrz.39.2021.09.19.11.03.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:03:12 -0700 (PDT)
Message-ID: <cdfcbb18-a3b6-3986-4b0c-97dd40ced27f@amsat.org>
Date: Sun, 19 Sep 2021 20:03:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 09/41] linux-user/host/alpha: Populate host_signal.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210918184527.408540-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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

On 9/18/21 20:44, Richard Henderson wrote:
> Split host_signal_pc and host_signal_write out of user-exec.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/host/alpha/host-signal.h | 41 +++++++++++++++++++++++++++++
>  accel/tcg/user-exec.c               | 31 +---------------------
>  2 files changed, 42 insertions(+), 30 deletions(-)
>  create mode 100644 linux-user/host/alpha/host-signal.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

