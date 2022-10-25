Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C8660C958
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 12:04:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onGhx-000103-RC; Tue, 25 Oct 2022 05:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onGhv-0000bw-7c
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:58:51 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onGhs-0003R0-Mr
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:58:50 -0400
Received: by mail-wr1-x436.google.com with SMTP id bp11so19357983wrb.9
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 02:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uZ+L/SFYERLUE8KEeLTR4NE99v/902HU2wOJjiFNhEI=;
 b=TFjWMDTWIe9FPA/7T3i23CXJPcXRPKQATChazCzLuZhX020H38oulBfdWHrtBDMIUH
 WobtsUvSMkKBTxv7PGGZJkex2R/PpwlLFyT6oKSojshCtC5YwRW6sjZr0J1taNLC+BX0
 CMb3hdmLeorSoSrYUVX14k4KIjMLbvQdYHPKGOZAJwZnkCuIFDZPATV/x856ZL6bPkQU
 vbNmNXkxLIYUPZjDvMdpa60D8JKTj/+NDJ/y12Cwuqoaob4UbRtpOMvaFdfDRy7PUunZ
 oUVszwZ1HSjU0PArb/f6HBhgXwcofcU5yxWVT6MhO+B2cuSmLbu/5ly2LffUC0HPpXCX
 CA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uZ+L/SFYERLUE8KEeLTR4NE99v/902HU2wOJjiFNhEI=;
 b=g8WvErF0WFKBBxKDEy5n8VtBDTR3BDzm2aDaYIQoAfPU2aHygI1MvTrw/CYs0hFCw2
 paZdYkRy+ZUQ0Ip7qIL/WNVYPHgN1dU7ZUbi4kU/qeIUrpbjBUzI4hRPcFUPWkfagIC+
 +zhaX6D7lZ2yYENP34rxbe7VFo5xty8rNx/c55Sa6N0Dn2GfhKtxyUCKZpS0H8cL45wV
 5Qm6x/j8Jkh/RLj7C6U9Qwx0Q1ce80W0UMu0YKHLZxdrNeE5s34SjiV4BSnWu2qTSm+e
 KfkRaTFrXalqkZU60+7KmiCEcQBAA+zFAxuZkpGoyASowyGzGGHslq9jvcFBsjrxZ0wM
 C36Q==
X-Gm-Message-State: ACrzQf1DEQ1mC5RnNFkJd3ntJu1cwM+ZJyzq2SmrkON2FTbxVNGxOrgo
 CRSBJ3D8xjzPxmDWoTWfLvt7Jw==
X-Google-Smtp-Source: AMsMyM7VG6/yxNH3UZe8wfuk/UtH1oEnl2D2jWNXL4lOdqChmbMmrjqrfc1+6SxDIHQ6+tD2IvhocA==
X-Received: by 2002:adf:e84a:0:b0:236:5f2d:9027 with SMTP id
 d10-20020adfe84a000000b002365f2d9027mr10947206wrn.89.1666691925637; 
 Tue, 25 Oct 2022 02:58:45 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y1-20020adff141000000b0022cc0a2cbecsm2069401wro.15.2022.10.25.02.58.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 02:58:45 -0700 (PDT)
Message-ID: <a3fb2dc3-0470-b981-e8c7-80aff6caeb66@linaro.org>
Date: Tue, 25 Oct 2022 11:58:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 8/9] target/s390x: Use Int128 for returning float128
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
 <20221021073006.2398819-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021073006.2398819-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/10/22 09:30, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/helper.h          | 22 +++++++--------
>   target/s390x/tcg/fpu_helper.c  | 29 ++++++++++----------
>   target/s390x/tcg/translate.c   | 49 +++++++++++++++++++---------------
>   target/s390x/tcg/insn-data.def | 20 +++++++-------
>   4 files changed, 63 insertions(+), 57 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


