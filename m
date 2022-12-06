Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E07D7643D9B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 08:25:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2SJo-0006kG-HW; Tue, 06 Dec 2022 02:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SJk-0006k1-DK
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:24:40 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SJi-0003n9-SM
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:24:40 -0500
Received: by mail-wr1-x433.google.com with SMTP id q7so22184256wrr.8
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 23:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uWKPmBhfeEyUoKxARYMB/0y+x1yG+eRErBWMonO7Auw=;
 b=tquVp2N7cIn7IRFWmS0MUr2coVHgii1RK3tpQiCsDBdi3yKOtbG6mczf/5zq78ZGEK
 TBR66MbVsbYckX5uxWtrMFVtLuoloy9Bv85IOkTlUhuxj+9YyYPEl5A4mTrpyUkSz6Rt
 9anuMJYkMRgSPqM9BhrJ9wHzFN02gFJ8upt8Gflzrp7VKhIxtVNLBws5AEDNhrwKTor3
 GoRANQ2JiAZ0K/ZPYMuuaO83KqjhLVRUU6h0E4qPvmnY840mij9RaeVy9mGgr6lGgRVc
 um51ZoMwk5iv7WbWoKU8RUmShpLqfS7mpc7s2gtXSmCmVjX0C6tewBgONp43jtZqHvsX
 HP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uWKPmBhfeEyUoKxARYMB/0y+x1yG+eRErBWMonO7Auw=;
 b=ngikltMcAlhAGH9Bx/Ct2yttc1RcL15SSmSIgWP0ZA744KaElD1qMEABy31RxWXgxQ
 tK8vW/S2LHv0WzXNe3uLYN7htlBf/+H9z+UgeCS8GPTlFN1OmSIlb9MLsT3teHFosBgP
 F5EjCRI6Th0XytURlT0uxZ55gO4/rB2fx3dej4w89TNNAFifQEyYf+Ex793lB8b07Kls
 2PeLf3K+iUTg5bxIWUJ3QO+ul3nH0ZW1Hzdi8v6+jFPyKVfS0HAKHXqJJS5Iubs/iYGE
 655qQL58OB6mD4RTeClVRcmvVUPBt97xgMT7oS2I5DUHBFpi8paS8XBY+n/IVz7BTTsX
 ErpA==
X-Gm-Message-State: ANoB5plvX64T15CF5S1ZvkOHZ7KUrCXldSowwE3eDgXLwlyx5nDOjtFa
 WqfbXVJkFEtunkUWK1UpWw3EPQ==
X-Google-Smtp-Source: AA0mqf6v/Tm5siRoWa9wmRQdGoMgghXQWjbP2bIlBQWNkULA8+vEazLREbs8aaJDrTJ8777dGHTaIQ==
X-Received: by 2002:a05:6000:1f11:b0:242:1c3b:7132 with SMTP id
 bv17-20020a0560001f1100b002421c3b7132mr21072085wrb.569.1670311477446; 
 Mon, 05 Dec 2022 23:24:37 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c000900b003cfd58409desm22566676wmc.13.2022.12.05.23.24.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 23:24:37 -0800 (PST)
Message-ID: <a2d5fa3c-145d-cc2d-2e1a-ae0e04ec644d@linaro.org>
Date: Tue, 6 Dec 2022 08:24:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 01/22] tcg: Split out tcg_out_exit_tb
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: r@hev.cc
References: <20221206041715.314209-1-richard.henderson@linaro.org>
 <20221206041715.314209-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221206041715.314209-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 6/12/22 05:16, Richard Henderson wrote:
> The INDEX_op_exit_tb opcode needs no register allocation.
> Split out a dedicated helper function for it.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        |  4 ++++
>   tcg/aarch64/tcg-target.c.inc     | 22 ++++++++++--------
>   tcg/arm/tcg-target.c.inc         | 11 +++++----
>   tcg/i386/tcg-target.c.inc        | 21 +++++++++--------
>   tcg/loongarch64/tcg-target.c.inc | 22 ++++++++++--------
>   tcg/mips/tcg-target.c.inc        | 33 +++++++++++++--------------
>   tcg/ppc/tcg-target.c.inc         | 11 +++++----
>   tcg/riscv/tcg-target.c.inc       | 22 ++++++++++--------
>   tcg/s390x/tcg-target.c.inc       | 23 ++++++++++---------
>   tcg/sparc64/tcg-target.c.inc     | 39 +++++++++++++++++---------------
>   tcg/tci/tcg-target.c.inc         | 10 ++++----
>   11 files changed, 121 insertions(+), 97 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


