Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6634955AE8C
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 05:53:17 +0200 (CEST)
Received: from localhost ([::1]:51114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5JKm-0001X0-2c
	for lists+qemu-devel@lfdr.de; Sat, 25 Jun 2022 23:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5JHP-0006fH-R2
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 23:49:47 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:37616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5JHO-0008GF-AU
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 23:49:47 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 w19-20020a17090a8a1300b001ec79064d8dso9250864pjn.2
 for <qemu-devel@nongnu.org>; Sat, 25 Jun 2022 20:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Qm3+yI2IZ4eWIMrwq7ezShX8erww4b8Lqj2DifiJCBE=;
 b=Q/Spv5IeV5K0bMzYCcKkL7iaTXC0eUZqG4bVg4AdK3xYuyU/m136ks2nykFvUpLoje
 EDkW9QxaK+Xkh72LvBDwSCvZ4MbvE4z4fUxveHrk7qnKO9WWPNkLwk8RarN2IkOafNVL
 abIL11+jkX1L410WX+Y+lh4rCJNTo7m/Dq6qH7Evurh0hupfRX+dcr2ukjfznlJ0ql2L
 +k9uzL1gwGZoyXIEobLkt/m6yhl6EPh+nBJbTH6/7xgrYkgTLVwg6dH/HJEy2DjJOwvO
 w7VCeXoZap6kkAn2tTbk25IX11C7unQtnAMYMg1CdyI1lYEXb44plv1KMtuWgQnSoGii
 Lvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qm3+yI2IZ4eWIMrwq7ezShX8erww4b8Lqj2DifiJCBE=;
 b=RcyyyKXXkeGAXUAmM5lPri9h9gFSLwTBBL+2BYoOldJ3UbxVXXThlkcboz4F5qgN3Q
 i59Z+lZKRVzAeo97yMXIPhTUaS65uZ3Hz8LMHYqJb1aa0I/lAeCY4NHuBqPkwDDq6M76
 xy42XvYArReawzSJhwt6/1FqLXQl381WGyLVP/VcR2mO4/LpQ9FlGH+GfFAUgPXFFenZ
 3URGu2DVot08XZhm83eYzeUGTnQZbQhF20eANT0lNCoAlvegaHaN6jY3DLBiihuW1ndZ
 ZB3VEG7oALj4IIKVxAMlGoKqvTHshWZZs4gSgToaklW+hwIVuYC8VsfBSBRDojpHfrDg
 X6qg==
X-Gm-Message-State: AJIora/NDykHqM21tdzue1XcO3bjJXip5AGeEqDW+2XPOVmDXMonSkVM
 GmIfzAs9iqq86UUzUwoQlZe/ZQ==
X-Google-Smtp-Source: AGRyM1t7AaK3AMRWRmTezH5wlxlDe1AHnx+p14OK6z4csx6t/1fxU4/7q7KpRilrdxIG2RVH+6GxNg==
X-Received: by 2002:a17:90b:3ec7:b0:1ed:ded:abd1 with SMTP id
 rm7-20020a17090b3ec700b001ed0dedabd1mr7807412pjb.56.1656215384818; 
 Sat, 25 Jun 2022 20:49:44 -0700 (PDT)
Received: from [10.10.67.53] ([116.12.83.234])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a62ea0e000000b00525521a288dsm4355004pfh.28.2022.06.25.20.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Jun 2022 20:49:44 -0700 (PDT)
Message-ID: <f1018d12-c005-1dca-0a44-248f44c2a50b@linaro.org>
Date: Sun, 26 Jun 2022 09:19:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 11/11] bsd-user: Remove stray 'inline' from do_bsd_close
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>
References: <20220624214742.89229-1-imp@bsdimp.com>
 <20220624214742.89229-12-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220624214742.89229-12-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 6/24/22 14:47, Warner Losh wrote:
> In the last series, I inadvertantly didn't remove this inline, but did
> all the others. Remove it for consistency.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsd-file.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

