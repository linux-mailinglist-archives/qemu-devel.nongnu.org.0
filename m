Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7F636A29E
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 20:29:33 +0200 (CEST)
Received: from localhost ([::1]:34534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laN24-0004Y2-O5
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 14:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMtx-0006aD-Kv
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:21:09 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:33670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMts-0004xx-Gc
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:21:09 -0400
Received: by mail-pf1-x435.google.com with SMTP id h11so5197093pfn.0
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 11:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kwdnML9NQSt1CC6DQeFBMwtRO1GGLTsWgjcSNeiRHks=;
 b=fhP1HLL+pDPO/8Up3hgsyThi/pBiARem9jyY3pJ0KwiFKsaJ6bdbpTM3IKoU+++7I0
 6Xq4sLlHH1nYhh/yQo0jND8aO94cV+N87IsRdYHMX0KB7vJQqwtBmpC4j1q5RPPxnWHL
 tOlUBpdE+LZmpl51XM2PAHT29MH7GH5vEV8Qf2BxctSkg3/oZPN5I6ohQV52kaVt6sHg
 RiqPb8rK714j6AHc69D9UB9S/IduiSrCLNoz0zXBX8fcH9XzYraRCTCit/+0SyVPg/MR
 0pXz9IypyhL58Obqgs3qvFVbrx944Xkv5KMo8mBOTST77pya5fGH9tNyA1Lhite1x/o5
 aEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kwdnML9NQSt1CC6DQeFBMwtRO1GGLTsWgjcSNeiRHks=;
 b=PQb7GqUvONiSlXl9P3ugd5cooHP6QVS0dMegTDDP5kUOFAo5Ono+tqiwD8wambqhWd
 0nFmafudhp0EAUCesDMvrvVjdx81ebepP0/f7Y2RO4mnlsDCz0dcuAptQFHWalYixjH0
 w1rcb10r5WHRxnEeZuEMChhBUqEsjueTOpKoeTPJefdeLyFscINv2MixqP2YpY8crwwZ
 DosPoY+zNWRKpo3gOPYscEqIPI+Yr7tlN6PbiK2lqrHOekQxlMLvtcfHx/gVrgfIyMmw
 NbcnQ+cXcTqgw5fukJFKxnuzHzWjR93JTgV6PH7SDfk7hK+mK53YnoUxkxAr5gu4Ff7V
 hG4A==
X-Gm-Message-State: AOAM532H2JOWu3FDD0o35VRjPECMw26A2t3/tqgQ+I5t+WEH6k5eVUuw
 bjqXJrzjbPHCSBu2NgPl96OioQ==
X-Google-Smtp-Source: ABdhPJwoTn9NWGMhgw/RjspgSiJf1TS3Oa/BY3hdreM+DrtLrgF6fXsGqMjhTdasV+Cp+7RMOQP9WQ==
X-Received: by 2002:a63:144d:: with SMTP id 13mr1848456pgu.138.1619288462099; 
 Sat, 24 Apr 2021 11:21:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id mz18sm7721372pjb.13.2021.04.24.11.21.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 11:21:01 -0700 (PDT)
Subject: Re: [PATCH v2 45/48] bsd-user: style tweak: Use preferred {} in
 if/else statements.
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-46-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <54a68453-8ec5-8a49-d42e-2d0be0492b6e@linaro.org>
Date: Sat, 24 Apr 2021 11:21:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-46-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 9:00 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/syscall.c | 120 +++++++++++++++++++++++++++++----------------
>   1 file changed, 78 insertions(+), 42 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


