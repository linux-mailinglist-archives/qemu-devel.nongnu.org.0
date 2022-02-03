Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBAD4A7E32
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 04:03:21 +0100 (CET)
Received: from localhost ([::1]:38256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFSP2-0000o1-85
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 22:03:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFSMc-0007hU-U8
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 22:00:50 -0500
Received: from [2607:f8b0:4864:20::42b] (port=38910
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFSMa-0002CD-AC
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 22:00:50 -0500
Received: by mail-pf1-x42b.google.com with SMTP id e28so1028291pfj.5
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 19:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pC5MO/b/XHy7CcW4lwsMv9vH0UZCr/PBAQ2khe6PfVQ=;
 b=TnotnBObwfiT5zNtwiMTqjAdXiWFFc1luey1c3u2JQtmjudK2WWGEM+JDpnmR9OSGD
 fWKu09sg3tIEzcXpYkLm7O7aXiORXvWA/sGRAPDoNW23bBdPrYX6ZEJT5qh0v06Oktm/
 uuKPBh5MXYU0s5YDcDtlDzS2GzhVUEOrcuVjO/JM2TSteZIC0TLvrZtxXeGPfmEAL5lm
 TVabNT4Ah5E+Enifj1tR4iHHxQMnTddM8eZcvAsjiuLfNZAMiMFRRNGkVbOqGxj7YrcL
 Sz9SQKj1Xg2u6iEFIN454FXDJQDDR6npK/6WdCNru2G4yUOHSmBIKic8sPxV3ct28lX0
 d/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pC5MO/b/XHy7CcW4lwsMv9vH0UZCr/PBAQ2khe6PfVQ=;
 b=e0jC2mWXWYRQn328Y+oVr44+tvUtjIBbK0xqEddXpFh6bop6GOYZ4ZgaKv44RVZ8md
 Y9KULZL6lLiSr8Iv/g5OzogcnYIJApeWGU6TAJTmyFG8AEI2uABIrNVDyQRqqSV1uzhJ
 n1MdlyxIegi3LxJxeq1cCQLb+Y8dHkG/lTR/anxd/VPTcnmwz59oEWD4iqARbyh6DMdE
 T1nB1XIdMEN7KG4KBh0Q9/miUNZoAXQ6YFgpg2PYe5DCRtOwFMGDE6lkaIVlRGfK8LUB
 +q87gL6OY6B2UC+W6KsDA7OZfe8iO+Oli/g/McD1JE/4TTzRZZOJ46x9TTDYQVAkibCL
 R5lQ==
X-Gm-Message-State: AOAM531z6TVLPCnsVV9QKwSFaVtLtFb8lQJSLhWd8zl47uao2dJrm1TT
 rglYZVfH7i2J9fn1H4TiT0jHBQ==
X-Google-Smtp-Source: ABdhPJwJQesLBJdWBRk69+KJAAx3NCOAlm2lJdE8UrOrlFqWIewZRHGgUCQ/Ld4yLSGDXZIyUJ/IHw==
X-Received: by 2002:a63:6a4a:: with SMTP id f71mr15522058pgc.252.1643857246476; 
 Wed, 02 Feb 2022 19:00:46 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca?
 ([2001:8003:3a49:fd00:801:72a7:386c:deca])
 by smtp.gmail.com with ESMTPSA id lb3sm8330399pjb.47.2022.02.02.19.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 19:00:46 -0800 (PST)
Message-ID: <3fe945dd-e3bc-8473-2b7b-d3e03594ad0c@linaro.org>
Date: Thu, 3 Feb 2022 14:00:41 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 05/13] hw/intc/arm_gicv3_its: Pass CTEntry to update_cte()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/22 06:31, Peter Maydell wrote:
> Make update_cte() take a CTEntry struct rather than all the fields
> of the new CTE as separate arguments.
> 
> This brings it into line with the update_dte() API.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 32 +++++++++++++++++---------------
>   1 file changed, 17 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

