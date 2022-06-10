Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB74546C2D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 20:13:07 +0200 (CEST)
Received: from localhost ([::1]:52620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzj86-0003TR-1O
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 14:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzj6N-0002ev-P9
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 14:11:19 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:41775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzj6M-00027P-14
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 14:11:19 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 g10-20020a17090a708a00b001ea8aadd42bso141161pjk.0
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 11:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tkzJfM5b1FTuP5oIZpXzMQUE+MuxcllfLFSNQUcduiE=;
 b=Teyc1ohcuKSQGWTJNBGNbY/Gy91TbF45wO/S8zsZCdey0WJzrQFrINaVbL0JhFyRvP
 SxommJHApk6cLHe4RvJJw9W7fU9lKkeHKjhyF1hu0EgNvVpEKxkNeRals1nJ+pBCaOBs
 NVnhec7ow/CAfbZn+dGHZJ0y/kSQqJIxeGSaYAK6zhK/hRgfTgdywUEL+1vwmnCqZdZo
 zL/YCKemd+ABq0hfHlaBGtII3ZB1IADkghFL5k4MUMi9uPIQf59pYoajoOibLxSODo4P
 AtW1alG8T2tUPWmBDhVoBuA6AEpAhvAuuKJ20+qivbopVuJCk2JX8Y/4Fk7H24M+2ehN
 P4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tkzJfM5b1FTuP5oIZpXzMQUE+MuxcllfLFSNQUcduiE=;
 b=sr9PgvT/7tOQcp5T0qxyhaXrFegxsRljzZ6TRLFaaXjCgLINWjqgZd9lmyntgxJstV
 JW2opeN72wL+RCcF63sxpkjkBewjZjgFnymV2OlfzkSZp2C7oCMw1i0zOZLXpRQGrt2B
 pmn2KC55FrJKFL8oxUFqf9ksj2HcM48FVCsxkI7z310KUD1i6mby+3k7o5h6B/GSUZwi
 stTpjIbA/gKj+kjVCJs6nHjOCzXdpi/Eb3H4N2apBhNPPUdvg7T1XxVzOup37l+Yujt5
 xFZZueJLvsUJGjV4Koc+gpDiXbhR400unEqUtjA+xAcnKsHubcbbfpaPKgyRkorgFwur
 9yjA==
X-Gm-Message-State: AOAM5322npnp6MAcbeap2GDAuekQcQZg3pxrIAIwDeoLQoSSepzrH6x7
 2OyganDLGwIGNBIG2cpMkHajTg==
X-Google-Smtp-Source: ABdhPJwAE4p+ocqACuKOzj5jcHg4ab3KPLN0DlNtWUgBKtARarPu6Qz+obUqyG0h6EkldZiO1/S5aw==
X-Received: by 2002:a17:903:2411:b0:167:396:e31 with SMTP id
 e17-20020a170903241100b0016703960e31mr41573001plo.155.1654884676513; 
 Fri, 10 Jun 2022 11:11:16 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 j189-20020a6380c6000000b003fc32f8e030sm19546204pgd.79.2022.06.10.11.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 11:11:15 -0700 (PDT)
Message-ID: <929ec347-a0eb-44bb-dd75-77944010a828@linaro.org>
Date: Fri, 10 Jun 2022 11:11:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/riscv: Remove condition guarding register zero for
 auipc and lui
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com
References: <20220610165517.47517-1-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220610165517.47517-1-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 6/10/22 09:55, Víctor Colombo wrote:
> Commit 57c108b8646 introduced gen_set_gpri(), which already contains
> a check for if the destination register is 'zero'. The check in auipc
> and lui are then redundant. This patch removes those checks.
> 
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> ---
>   target/riscv/insn_trans/trans_rvi.c.inc | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

