Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B7C51A6C8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 18:56:42 +0200 (CEST)
Received: from localhost ([::1]:34694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmIIq-0006sA-Vy
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 12:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmIEE-00087l-Qv
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:51:54 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:41527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmIED-0002LD-6g
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:51:54 -0400
Received: by mail-oi1-x236.google.com with SMTP id e189so1747918oia.8
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 09:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=9WaKCYgrQx0BN+N4FNIWi8aESkJX+1mMvX+CLdIT8qI=;
 b=w2lTPDtpL7/nrMIcCUYzG1YAMK1mtpRbsvPIVJvsoTUwL3BsLeQSVx0DOEjHSsQANm
 FfMgSwHb4vZN7nJ/IlYTUXWag2HUDHRX36dtSv6AQ4Lf6scFDMK0TvHdg72RbAy17hmV
 2xQh/aKUw09S9JLebx/bYaHz9ocQi0oDHaxo5ZLQ5kghD4uaAwpwOTdpV2RALKEHz8/7
 a03bjdvo15dSyMZBc8mwpkAJ1pSc92L12pT0mbTm9ileewAzsMJjaWt6o86UzrP2Wqyr
 N24vkdBhEpJo5D7t92MubZgbYFNhVuKZOP3uft9vSgMkeAh8n2owEY+qgQrlX1/727N3
 lCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9WaKCYgrQx0BN+N4FNIWi8aESkJX+1mMvX+CLdIT8qI=;
 b=ikLKQFAtdph1KuAT222TsCqgTZ2uXz7eijGx4i88v3W4YY50zZW3AlEddGrjM/7r80
 lqwByhupVXTlXVoU1FvhMG+vgBLOs3kKljToIhDD2rA5PNHU8qtZvRzEYc392sjS1fSL
 30ySQ/YSah++u53isqzhgco6G15E96XJrXdZHxJXjelIbYvofWH6K1UQNDQpu2TjsyI1
 wELEBGDhLVs9bkOCk5lGszExgGkpZ39SnyrIa3jd1eToy3OMrHpklgWwGFbCzLIsy5Jq
 EuwyANq75gPJ3IOMW17HNhylV/nIe3cUEBpx+PCv0UUIsVz6gPrhbDL8qWy0wmDRLUMI
 PQrw==
X-Gm-Message-State: AOAM530QC4r6VgGn6mdUp7LDj6olVX10Gy2lO7BPZ7SJk332T1P8R1JV
 ka+ZxLaAG+OueUaCkOjQM5YzaA==
X-Google-Smtp-Source: ABdhPJysxqbo/OsbsfQ3i700sgvmOB6Whhf129GXQ/vlTMWgjBPFdQ+O2apW2D3UfDbKB8r8hwk0KA==
X-Received: by 2002:a05:6808:1a22:b0:325:be76:f246 with SMTP id
 bk34-20020a0568081a2200b00325be76f246mr190019oib.74.1651683111557; 
 Wed, 04 May 2022 09:51:51 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1?
 ([2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1])
 by smtp.gmail.com with ESMTPSA id
 i3-20020aca0c43000000b00325cda1ff98sm4474132oiy.23.2022.05.04.09.51.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 09:51:50 -0700 (PDT)
Message-ID: <8096bb03-9c20-99d2-0f3b-514597505dd4@linaro.org>
Date: Wed, 4 May 2022 11:51:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 04/50] dino: move PCI windows initialisation to
 dino_pcihost_init()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-5-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
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

On 5/4/22 02:25, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/dino.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

