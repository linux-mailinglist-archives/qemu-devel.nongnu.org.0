Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D54D6B53BF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:04:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakqC-0003Z3-Uy; Fri, 10 Mar 2023 17:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pakq7-0003RW-7p
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:03:52 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pakq5-0001jK-N1
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:03:51 -0500
Received: by mail-ed1-x52b.google.com with SMTP id j11so26262066edq.4
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 14:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678485828;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1Zt1pIELLhIF8q1m+Rf70QFQbczU+j0DxmAbLO5V27w=;
 b=sLoOQerZTp83X61VVnW+ldWZsBsSvRHxHNjGlr5uPjWoes1LePDqtAD4ln8m9cM3/x
 HBzZLDS9pRdj27FZRWez3ZoleVcDioSoH8dzvpcM0DuSzkwZ7TEnCiF4O0P00Fbp6lYs
 5tyf59pVl7TjWiXdyZawQENigpEV7HqQbV5a32f5kp7oEx/mF031ub1DbJjAXFKCvf5K
 Su5oKN8dG/RX5emokQ9Px+u3wtnx6JdjqPTKtufiudeAjFA+A2s8p69xGhaTeSaIKfpn
 BIkeE6CfDd+mblYn5towMv9NudJc9/FVeiM/j62aotsdy+bOlVp38rEImxcNmPdSRnkD
 I5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678485828;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Zt1pIELLhIF8q1m+Rf70QFQbczU+j0DxmAbLO5V27w=;
 b=MDpI0u/uYgwVFC/fdSgV+wRXu196BYPnhjznurAN3BcPesscFp2TER10ANNyAx8fK8
 uiBuJ59hoFQW29J6dBch9fCfur61HK+xCtwpAuQuLMfD2R9ZWIHiiHe5UZUaaCLbYMVL
 wozqjIH5qmD1fGI6f5AyiGw4hLBs8Wn+Zqzo6OXpNXB65LGvm+9UQEMg+V8zlMDnSoqp
 rXX0UFkkyhjr+6UIBm64wvNdWSivP0zGe6satmItSmG/rzFFRio1b5SRPjavHGOwyT8z
 8F0y5uf9to9ImXyms2vts2tctmdt9Np9TROz81UvpXfbYb9gIRBKmQVdx8z5qzXidJWT
 mPvw==
X-Gm-Message-State: AO0yUKWausGIaV6b+lCWc4rLM1lcspquQlkZ3v8sDKWyRHv/ANrUpehJ
 cMUjjUMPkO/fHxWHwP+TvE9HaA==
X-Google-Smtp-Source: AK7set+La7fnKOkrxhgK08RXd9ZtTcHsmAbfZ7cXoyvgvyrj84WOOfH/x5tmJakEGcHFnBGnQG+D5A==
X-Received: by 2002:a17:907:6e8c:b0:8e6:d08d:f5e8 with SMTP id
 sh12-20020a1709076e8c00b008e6d08df5e8mr36267808ejc.11.1678485828349; 
 Fri, 10 Mar 2023 14:03:48 -0800 (PST)
Received: from [192.168.1.115] (116.red-88-29-161.dynamicip.rima-tde.net.
 [88.29.161.116]) by smtp.gmail.com with ESMTPSA id
 hx12-20020a170906846c00b008f702684c51sm336365ejc.161.2023.03.10.14.03.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 14:03:48 -0800 (PST)
Message-ID: <d89d871c-7205-8da1-f1d7-464b76bbd6c0@linaro.org>
Date: Fri, 10 Mar 2023 23:03:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 5/7] *: Add missing includes of qemu/plugin.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: cota@braap.org, alex.bennee@linaro.org
References: <20230310195252.210956-1-richard.henderson@linaro.org>
 <20230310195252.210956-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230310195252.210956-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 10/3/23 20:52, Richard Henderson wrote:
> This had been pulled in from hw/core/cpu.h,
> but that will be removed.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/cpu-exec-common.c | 1 +
>   cpu.c                       | 1 +
>   linux-user/exit.c           | 1 +
>   linux-user/syscall.c        | 1 +
>   4 files changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


