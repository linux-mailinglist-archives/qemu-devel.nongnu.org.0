Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD754AE312
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 22:33:13 +0100 (CET)
Received: from localhost ([::1]:45498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHY6q-00042u-Bo
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 16:33:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHY4f-0002My-Fs
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 16:30:57 -0500
Received: from [2607:f8b0:4864:20::62f] (port=36385
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHY4d-0002mI-Cz
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 16:30:57 -0500
Received: by mail-pl1-x62f.google.com with SMTP id x3so474332pll.3
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 13:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hGPytC3ddr/cfMIkx0Zn0P4iDloDotl7CcYURp0gOqc=;
 b=MNTz6Tp76WIAshJ9UKYSXLiRzAC8y4kPMerhHDwEJIX1otAjBk14SKZdJggwtWMP4V
 zusOGk4v0lPBTvEFdFIsskaLzaXeH/EfdoUzD7FjM/A/jQEgctaHt3d0GqGTQzFDqmRp
 twGs5wRYtulQ5E0qN6t0UvbS/ADQWDccrxpMAFIguynNMXhUF/16PkF27Rdfc6pn+zgU
 E7oqOTcGmfM7Gfnpm2CXLdBn1UNiTunfGaEJZ37wmpm0JQbDv5YM7/bU4bRUZ/xq9drm
 7XCHM72MrNFnatrkLQzJ5PxIaaT1vCOPgR4D8NFynihBIYgJjyjOxXaxMn1QW3dKBed4
 R5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hGPytC3ddr/cfMIkx0Zn0P4iDloDotl7CcYURp0gOqc=;
 b=o+IMK1BpVyW/pf+fymqgPaaro2eCmF5V1JftiNhEOMAbGaq4vo2MHyS5ozVuWPo1lD
 TnhTabTVUP1rfXGTMcA0zx15LnFF/k87WUaf4Go5UfGx2cimyYLqaNvDgGIvltac/aK5
 HaRfA2iTX0woqM6vMWyU1OOlxDgH10e1yEnmk4Mu2f4yUrAcnzxEiFLn83maPei67C9d
 Whtmyclu+eXUOzl4i0akpHSauZ3mpbh/HCvzTdJv3TSl3SRB8wVjJOv1yYJbPaEr0C9V
 XoEEWltn4ehfqIJmY09kUY4Tivq4X/bmmlxeB1rZbtWgRGUJhYHnbISGBKoQemFMsQXj
 Kaag==
X-Gm-Message-State: AOAM530UwTL2laEkRtxoKYzfAXdmjJ11kvAAjgGvQuj0kK7TcSXRCU3Z
 8wZhmQx2EnJYL5IQJcn7ojqUMw==
X-Google-Smtp-Source: ABdhPJwjusCemAhFPS1GTYO/skqvMKJS4wXf2IEwuUp+4h/weNe5kXZStMi0Wd6apWT+6++wfD46cA==
X-Received: by 2002:a17:90a:13c5:: with SMTP id
 s5mr3474418pjf.181.1644355853688; 
 Tue, 08 Feb 2022 13:30:53 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id lk15sm3999083pjb.31.2022.02.08.13.30.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 13:30:53 -0800 (PST)
Message-ID: <85884290-7d13-20ab-d6f1-dee4ba192597@linaro.org>
Date: Wed, 9 Feb 2022 08:30:47 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] Hexagon (tests/tcg/hexagon) fix inline asm in preg_alias.c
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <20220208171652.31085-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220208171652.31085-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, mlambert@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/22 04:16, Taylor Simpson wrote:
> Replace consecutive inline asm blocks with a single one with proper
> outputs/inputs/clobbers rather than making assumptions about register
> values being carried between separate blocks.
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   tests/tcg/hexagon/preg_alias.c | 46 ++++++++++++++++------------------
>   1 file changed, 22 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

