Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F22358D66
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 21:19:13 +0200 (CEST)
Received: from localhost ([::1]:42184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUaBL-0006Px-To
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 15:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUaAP-0005lA-33
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:18:13 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:36720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUaA7-0001mg-En
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:18:12 -0400
Received: by mail-pl1-x62b.google.com with SMTP id ay2so1561348plb.3
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 12:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dzovaKG6uonXinAnvD5Vxj7OJ9md4MeXE26sdrsytfc=;
 b=W9EpwCqs3K6mia3mcFM+1qU/BzULzApsSdRh31Qp2ihLqFmwAUFe7I/IscOxbrTRyJ
 uqfeKVDVuysvLtZpG9ylXB7rkfxAN4hNEUyNSi1guMaY4gPZdqbgwhGLABPdiqYQdd/+
 dJQwRLXKzKPOIsux1XKLCTYBeLeyBj7zhd6mbmoyHC0K0xXgAinoUPgCpy/6w8WfiVUW
 nNIm4OFPNh8vkkUGHR0JYAfcamIZofKStnnBHyg2JzZ6BG03L/AuWd4HU8JWTOClli4p
 /h4DIpAHL3KRpyD8QHojIINQ3YiWSgq4M5244iMgf2796p8QbRL8hgBO80Qrk2bYNWu3
 88lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dzovaKG6uonXinAnvD5Vxj7OJ9md4MeXE26sdrsytfc=;
 b=PXLmbgANT0zohTAolvNrZ5sdF2KNntfzN/ZM7yZciUj4jJulStfvYiqWpjxZmFN6ab
 R2Ldn2aatXh0r317gu0ms5u1J7HzXTw9iRwTAYWk2WFHAruJV6VBRGdeC8KqL1mSornD
 ZOW7H0Sh7KooHCTmYtDPFgzXvM8NpkPMn1T9xbaRasNoOESkXm62lf9Wl9K2VNk4255/
 vphPtEQdLG+R+cus95rPRnYliRVZODRkVcqBZe1Ws2A7ECeKky2atBoSVBVu+JRoVjFW
 7yP7xnun2xQa3A4G1lRcXe3lkyiL76Hz1lgLQSii0kI4wwCDm8mgPLLLiNWZ6RwtGIOQ
 aI5g==
X-Gm-Message-State: AOAM531zQ4bGgehIaIaIqhnbSfE6KoZEgjxipeW6NQYuS4DNNk+ZTN74
 /RCgolP2FW6pq42efzHZl7dMpg==
X-Google-Smtp-Source: ABdhPJwrShy2LlgRc0dS+Pu7Z0TtTgGRP+rtFixKibkpAbxaQOQ2QipRrsisZWJFJrVnMAWyvcA6DQ==
X-Received: by 2002:a17:902:24:b029:e9:3f8f:9af9 with SMTP id
 33-20020a1709020024b02900e93f8f9af9mr9466706pla.34.1617909471482; 
 Thu, 08 Apr 2021 12:17:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id o23sm136238pgm.74.2021.04.08.12.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 12:17:51 -0700 (PDT)
Subject: Re: [PATCH v3 13/26] Hexagon (target/hexagon) cleanup ternary
 operators in semantics
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617847067-9867-1-git-send-email-tsimpson@quicinc.com>
 <1617847067-9867-14-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <83937de0-b24a-8d64-b248-2e8063bd2bd9@linaro.org>
Date: Thu, 8 Apr 2021 12:17:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617847067-9867-14-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/21 6:57 PM, Taylor Simpson wrote:
> Change  (cond ? (res = x) : (res = y)) to res = (cond ? x : y)
> 
> This makes the semnatics easier to for idef-parser to deal with
> 
> The following instructions are impacted
>      C2_any8
>      C2_all8
>      C2_mux
>      C2_muxii
>      C2_muxir
>      C2_muxri
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/imported/compare.idef | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

I presume this change has also been made in the upstream Qualcomm source, so 
that the next import does not revert it?  Anyway,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

