Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B4F2C2D21
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 17:40:42 +0100 (CET)
Received: from localhost ([::1]:54902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khbMr-0008TG-SV
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 11:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khbGr-000271-Qs
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:34:25 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:35371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khbGq-00038Z-4g
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:34:25 -0500
Received: by mail-pg1-x541.google.com with SMTP id v21so17954594pgi.2
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 08:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KUDmCuOtZF7MjsHtOwiG7sNZlJWs8tb0kIDZk5snaoI=;
 b=hbtT7PVlapEOyo0oUOq9xYJ+UoYEf8Od6sKYKSGsCKfNafqJQpPZGaFIoy+C3ocoiE
 +GC5AP8UJOH9Cs91qdSngS/xKtt0DhdPkR+rkVCKFNX0vRd1ZOGZlBgdED1fqj1yhpUa
 WwnyrnrCwa6Uvul8hdgjLW5bxStltm1gLZT9wo5904y1aXYJw43o8YtvAYeUdJvDna15
 LMG7ezwCJLG+2AlQr4NwqQAVABWsFwWQnUHE/bsucxO2ZdaKLkHJ4ifll+DIYtqFIWy0
 jgxcCrxyTpvu0cfgHsrf2vPNQqPup2k45hhDD/0iDPl6dCZvERi6cwkrDV7ht41CM52k
 90pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KUDmCuOtZF7MjsHtOwiG7sNZlJWs8tb0kIDZk5snaoI=;
 b=PpnanJirxr7kdYok/2B8k2+MlT1Ad6LFIFHSf6ID0X0qeugArl+naGw4n14XYgYUVz
 huR9LkmLYx+KvYPJ5caCdzyjsbEeimHUyN2zZpyky5XnoxtqJ9KiDsIMIm31kOM++LMc
 MH37eOgQjcTpZEXWdCEqcNtPESdn+dntu+hKZJQ368ISTpkrJKcjOW+xInxsoDnyy0kq
 fw0ZNZPwmF7Nhvm+puZ5HkPwiaHoxBSyMoQJVbCJxWIsO2XvXqjMJTJws45dqcF3PGif
 5sBiEv8klQL8XB8YFxKIKrfSsOeunyuiSntMzkG/HYluzlAGxZybl2YFb4IXgsipaT3E
 mQXA==
X-Gm-Message-State: AOAM531LFtmFjcFpv54rj+3SMZSGWGUh8+9Lj1UT+Pnz/VNbzd7rJdJU
 WWfRLBJrgW++Hi+pi1cawbZKxA==
X-Google-Smtp-Source: ABdhPJx5jX+e0NWpbWYbRXHupENW+EoyW1YRMl4g6266vmOQ5ViPRUlQfgV8+yr4WglzKse1uQJIWw==
X-Received: by 2002:a63:ed01:: with SMTP id d1mr4210565pgi.361.1606235662676; 
 Tue, 24 Nov 2020 08:34:22 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id k1sm3986723pgm.21.2020.11.24.08.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 08:34:21 -0800 (PST)
Subject: Re: [PATCH] docs/user: Remove outdated 'Quick Start' section
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201122000131.18487-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5f1608bb-931d-620e-724f-0fd3bb7d23e6@linaro.org>
Date: Tue, 24 Nov 2020 08:34:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201122000131.18487-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/21/20 4:01 PM, Peter Maydell wrote:
> The 'Quick Start' section of the userspace emulator documentation is
> very old and outdated. In particular:
>  - it suggests running x86-on-x86 emulation, which is the least
>    interesting possible use case
>  - it recommends that users download tarballs of guest binaries
>    from the QEMU web page which we no longer provide there
> 
> There's nothing salvageable here; delete it all.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


