Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C756E36A261
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 19:27:46 +0200 (CEST)
Received: from localhost ([::1]:44282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laM4H-0005mI-Rg
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 13:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laM0o-0002f1-Tl
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:24:10 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:46001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laM0l-0002oo-KE
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:24:10 -0400
Received: by mail-pg1-x529.google.com with SMTP id d10so37305413pgf.12
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 10:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SjIA2as+EcC702w+IK27YRI8uFiMHjIFfoz/Q1q8ZgA=;
 b=yJ4MsVKLA5lSBF06OL9pLHIZVCh9Osx5OrjDngWHVoNQI4AZdE2XVaZAsN8tHcAkQJ
 aNXhUPjvDAcD8XpFyrJF9VPMVOPnSiDMzEvvEswUr9WLzbVgWdaG30EaaCSurdvvR6gH
 puF2JnDfdbuNn1pt0g9DlKsotFuIiKomn6umSL/fLk6zm0CPCiKq6S0+FO64yStpM53R
 HWlxZCzXNfDC4pz9FT6Fhjq6Hd5o7EbQz1NC52i8VQM6Vp1HSeMhnpqKI6NoZOAbhUmO
 C6AnFBu8k/UGNQ268G2z6+DGrJgNQ2+eBzz5Vp8KSKOq1I1g8Evbpp6BhX8wQuoRmkl+
 GyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SjIA2as+EcC702w+IK27YRI8uFiMHjIFfoz/Q1q8ZgA=;
 b=VY/tUEAoVU7+1F3hhJqrY9dhu0PfAy6NIpHknfVXmohjZBYcFoedpRob3L9Gjz0GCE
 QXVkldMrlokQe7ZKr4OryquwK9DJ948sZEXz7KIXowOyHSaE/UIBNzqB1Kyc4w9Ss8+7
 3sJauJRSuKfh8s8VIU8jDL2Pbkq88L0m3HE40zdhqxxm7kLa2aYYKYRhbn69dkKzltDt
 CKpKl805Qfujffqy5u2Wqyzb33QHQ1JB0Nczg39JqKb54szuxDfZ1hO+5LnmCoUKeoph
 oaHpHRlvyV9yN7nw6+/RfQa0l+KkdsCVx7MZG82V98DLB3dDUfnXOT3BsAoJCorQZwN1
 72YQ==
X-Gm-Message-State: AOAM532C64R+VRo8+gwRid1Y5A7Q0nXjAP4/x3ozDsp7lmlF5w5mHBJ4
 khJN0yfqCeHwJHZZ28ROnoQOZvkB5PvG5Q==
X-Google-Smtp-Source: ABdhPJy7w2cpLcWKuYx8QeI6fOhPkY76+2/CErLmCxk3RfpctJ8XjOoO5MeAY9V4o/0Db7oxd9bhgA==
X-Received: by 2002:a63:e63:: with SMTP id 35mr9063683pgo.27.1619285046444;
 Sat, 24 Apr 2021 10:24:06 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id x22sm7964265pgx.19.2021.04.24.10.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 10:24:06 -0700 (PDT)
Subject: Re: [PATCH v2 14/48] bsd-user: style tweak: Remove #if 0'd code
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-15-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <05e6f8a8-0a44-918e-5eca-aafeeda7c6ca@linaro.org>
Date: Sat, 24 Apr 2021 10:24:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-15-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

On 4/24/21 8:59 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/x86_64/target_syscall.h | 15 ---------------
>   1 file changed, 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


