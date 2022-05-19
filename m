Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE0952D7AB
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 17:33:23 +0200 (CEST)
Received: from localhost ([::1]:59586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nri9S-00076a-Ds
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 11:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nri7G-0005b1-1z
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:31:06 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nri78-0007Ua-R0
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:31:05 -0400
Received: by mail-pg1-x530.google.com with SMTP id g184so5410070pgc.1
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 08:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5SoyLHqlVjSaFxZRYoQQJzcjVwQG6Q9gtiImUx1M5iU=;
 b=tiZlJ1Z58kVIVasN8a9Dv75lzcGnHNq1f7VcKoFMN7KSaLT1DceXCGzCIcc9HyWznk
 ipTE8CUzg7kZ3oU4/c6Wz29GW4ovs/8VNPTLHf4CvCOt6cRqK4a3CmhgD1uPlRkKfJ9C
 rYqCtjcgx1bhim8Us9DztaC7cdUOpceCwguLRL5hpzLLai6a4DZ/otQSL7p44drYZred
 rbqCafP12WJg9tPK5pufqIaGlZhqmbRdNoy5N0stmDiFLJ5RMHEXlrWIwYKlBbJUXqws
 3g8TvJTwQo1o+2wttJeoUG3ssttE1JQSPRhGT7zuHH2fbBGduZy3dUwJ2rAZhngeFtht
 a8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5SoyLHqlVjSaFxZRYoQQJzcjVwQG6Q9gtiImUx1M5iU=;
 b=k3n9JN+onzhIJ/kHBc8tQ5qwwwl18tsfnC6QAWOkq5eR611oIpy10jkEQpj5jPDX1X
 Ama/Wz4KOG454nvO41QyhcLm7TOkETxKPJKqcP3PsN+AKAiEf9rsEey5qd6ZHmsbRCtD
 qO8CzmSzr0LNYAYWQhF8YMn+MEzS0f5365VLSPa7x60IPxObX8I4HrQaEviwpuXtGtbm
 GXqjclFzDzx1K2pEH9X3SDEB5luQgu9fylWsiUk229bZr/Ws/Pl+BpeF8JaIj31bRMPv
 IPLyBUD89FVsTJpCVQ5tyZmrHird91bLCSxyOwHqegZLewqAi3qryA0UA6JkFqFd7c0D
 EF1w==
X-Gm-Message-State: AOAM532KnqQHy2bSinx5nRBWfpzNF4Z8dCUaFOuFTJI4ExtqRfipwgRU
 xwezCVoTu4D/r4AArTkAJ1yWqSullcEVIA==
X-Google-Smtp-Source: ABdhPJyA2IejQA+PeVR1Y0f4PONJfkdZ4GEO78Fxe3hrMtGVDSI8ifv8JW8QJn8yZa6grL7+yMvGfg==
X-Received: by 2002:a05:6a00:140a:b0:4e0:54d5:d01 with SMTP id
 l10-20020a056a00140a00b004e054d50d01mr5493771pfu.20.1652974257479; 
 Thu, 19 May 2022 08:30:57 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63fd4b000000b003c14af50607sm3708268pgj.31.2022.05.19.08.30.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 08:30:56 -0700 (PDT)
Message-ID: <1066cce6-6814-c8ef-b88e-e4bfe7172eb2@linaro.org>
Date: Thu, 19 May 2022 08:30:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/4] tcg/ppc: Optimize memory ordering generation with
 lwsync
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20220519135908.21282-1-npiggin@gmail.com>
 <20220519135908.21282-4-npiggin@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220519135908.21282-4-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/19/22 06:59, Nicholas Piggin wrote:
> lwsync orders more than just LD_LD, importantly it matches x86 and
> s390 default memory ordering.
> 
> Signed-off-by: Nicholas Piggin<npiggin@gmail.com>
> ---
>   tcg/ppc/tcg-target.c.inc | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

