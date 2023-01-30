Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25F0681FD1
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 00:45:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMdps-0004j4-4I; Mon, 30 Jan 2023 18:45:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdpn-0004et-UX
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:45:11 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdpm-0002z8-1x
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:45:11 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso9406150wms.3
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LXxcyVFut9T5nxZ8ePis/MkeYun/eKSeFaI3GmzARhQ=;
 b=FGU7CilR87jXtcKUDec+ZpiCy9eG96T5NHA4x63xWW/sBfpud85GdLpIeUBsrb6YBM
 gMBxGrR0DRGJCL4vWwlutwevnncIg1P6mvnkPgOaU+sQiD2s+xbIM6zj5Dl+qoXcShtO
 oXuPe9l5QfYXwkvqV6/uIUBZTwntWI6EGuPQx+ZZHeUe/QMLr4yWPmFd/seMLpcWvMNB
 r2lFSmjf6PpJRHHqEZj0vEcWI/q9tPoRBND7n+MR5tZoc7GSWW1gGWE5sfG8yBh3fCGN
 6W8sekonuOzuU0ylaCL6u6X+nnynA2bYv0nQmWhow79MI9EnBbeCOz8XQjRvhZ6O3McE
 8whQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LXxcyVFut9T5nxZ8ePis/MkeYun/eKSeFaI3GmzARhQ=;
 b=RYrN5EQOX5JdFw0nP3Mq5yhziR6f23RVURyfsSKgJS8/vC1wYMGifgk5mf7nz1i/mk
 08rp0dsCXpBbbnz/2lG+g80JlU5qvTnhIFPPcVXyyjluP+IPWfxiSbjH3wyl+kcyCnqN
 mnC80/y85LCz8FrMviJYIxtex/Oew5Hbk9Uab4PSlOqhjNSArfiZAnLNzlGWVT7HIDRw
 xrQh5/qh0PwpNln/kfLxpo6B5DM6xJvbp8MFNXubhIf5PO+gRl+OQZ81Cq3fd4WzsoxG
 3X/TsDpTzsVhSkC1ffaTxjdkBcOZGJZkDdM4OPBdDzPf162G1cKiZD4vFQf21+Lq+wkp
 FdnA==
X-Gm-Message-State: AO0yUKVS5QggsXTNFCZq1IKMLZyZVLOfSjfWNCzyhVxLdUnDRDh3nOhw
 5BGShJuTiozDkQpR4XQ0M0z2xg==
X-Google-Smtp-Source: AK7set8GLoPu8Ryd9kW9jNFygiyoSJ+toZsFWGQdUhb3yrLW2PuaoHlPBYeKx9jFNpPfNod/jlb0Sw==
X-Received: by 2002:a05:600c:434b:b0:3dd:1982:4d14 with SMTP id
 r11-20020a05600c434b00b003dd19824d14mr2784855wme.1.1675122308526; 
 Mon, 30 Jan 2023 15:45:08 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a05600c2e9400b003d9862ec435sm13942689wmn.20.2023.01.30.15.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:45:08 -0800 (PST)
Message-ID: <03a4e0a9-8b3e-c192-7d2d-c190dfa8d6ed@linaro.org>
Date: Tue, 31 Jan 2023 00:45:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 25/27] exec/gen-icount: Don't use tcg_temp_local_new_i32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-27-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130205935.1157347-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 30/1/23 21:59, Richard Henderson wrote:
> Since tcg_temp_new_i32 is now identical, use that.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/gen-icount.h | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


