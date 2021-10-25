Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC64543A4C1
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 22:34:13 +0200 (CEST)
Received: from localhost ([::1]:36492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf6fc-0002tP-Qk
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 16:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf6d2-0000Tz-1Z
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 16:31:32 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:45951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf6d0-0003gi-2L
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 16:31:31 -0400
Received: by mail-pl1-x629.google.com with SMTP id f8so1936331plo.12
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 13:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2VvqpAyW3FheyorVm7KaMQwFHl56fkn7c7gRaM6NQHQ=;
 b=S2/sAUxs4SUDYIliK0lWYnpIIMBItVKLys8Q8h10cfzTCGQ6InJibYdSPUydIrxo1Z
 yQLudgj5VXazkKBePrL6ACQzJAJVtU8ELrhTrWzo7icEKTR/yxnAT+LSOiWRFWRKZ7gq
 WNfQiDfJNoHsi4GGHUjBy1+SScmHnk1tVSqybN6m2zi8XRy1j0UCTCjsKOCsH2Lk4cvp
 YrX+VvOn8CZh+ZfefNxqRKo2n2a9lzR0/Y6406fuMF9ICjddyjl9PCWM9yJgRN4TeXM+
 X5gMmKMNxPnMdPk3pcDQOYfvwNQnFnDSHGabLmnb4DTnT83/hmXWbY29Can9VT9eZMJU
 afuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2VvqpAyW3FheyorVm7KaMQwFHl56fkn7c7gRaM6NQHQ=;
 b=khbQnYCmIcgBcUxIYdSjlYd82XZDpGpT/sQX/ufUujm9K5gQkcTeFQtSokcZWMImy6
 rKTMcp4DHypzaTlhyDtby9eDi3iHglLmzEPCSbDdAhOaZQXU49e5D39Ln3GMXLK6Vqli
 L0fm9Ylm7FU3E1j80xbtjQhDvLJcFim32nMow4SiXICTLEMlt9/OPVvDcKtYBg2nxmlH
 x15LJWHDSEbERVxq60ykuV6P+PDrTTz65Iyr/touVWL+QoMoE/cA37KQfjr0hr3OONhn
 8fDnt+CWKjnk3YgY9qJRtf+vZhWcQzAa2SYz+SqBZBDTTPYj97r8GbjWFjiXL0FBwuqs
 pGwg==
X-Gm-Message-State: AOAM53346gIa8SuD+EWBWtzPFq3ipdkRO1m5sfNixctBGxERrwWeJlrU
 WlbzIjuK/YKXnH3CtXekihIOSw==
X-Google-Smtp-Source: ABdhPJx5jsm1CTuG999temjSZUwt++V6sPassI6f6fEypfHcNR2UL+qJ0hsD9qp3qS/WyhagG4v36w==
X-Received: by 2002:a17:90a:b111:: with SMTP id
 z17mr13498677pjq.142.1635193888339; 
 Mon, 25 Oct 2021 13:31:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id il17sm19813838pjb.52.2021.10.25.13.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 13:31:27 -0700 (PDT)
Subject: Re: [PATCH v4 04/19] host-utils: add unit tests for divu128/divs128
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211025191154.350831-1-luis.pires@eldorado.org.br>
 <20211025191154.350831-5-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9956394c-343b-1936-5b8b-5aac22278a85@linaro.org>
Date: Mon, 25 Oct 2021 13:31:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025191154.350831-5-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.846,
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
Cc: groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 12:11 PM, Luis Pires wrote:
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/unit/meson.build   |   1 +
>   tests/unit/test-div128.c | 197 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 198 insertions(+)
>   create mode 100644 tests/unit/test-div128.c

I'm queuing patches 1-4 into tcg-next.


r~

