Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7BF2B9DD9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:54:30 +0100 (CET)
Received: from localhost ([::1]:59430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfsou-0006nW-LA
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:54:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfsnZ-0006KY-UY
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 17:53:07 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:42063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfsnX-0004nL-Tf
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 17:53:05 -0500
Received: by mail-pl1-x644.google.com with SMTP id s2so3789859plr.9
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 14:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=myIdFOGeopgB+Y1xLSfy2cx4lbCT5J5e2aI1EWDuBr4=;
 b=X9gE83nSIJPBwSNt3UOIQ9yowRDVfXNY6s6qhY2KQBkjpMFOytPrqJs71uhRTC4Peg
 fddhzYu5QxTLqnFTPxB0TqC0tiPBzLzm6gow+7ntyZOe6MnRQNlIlQX37oMHkiMollhM
 qGtDVFRGzxOm9/LYDK9c6maO3LaJdNKaW/7A7q2gsvrEVceeQ25FqV75+eKclKlpD04n
 uwMcKeuChWsLen9NxLdkjS9zihNE3fDipY3B//7Ct8kigdIvP8fp7e/6cXhBsTA82iac
 p7XKwbBdkZmfiz7ZrzaIGeEKJd6OpwBsvf//QzJCmjXZD7e2lcLHNYRZemXtGCFZ+PGv
 t+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=myIdFOGeopgB+Y1xLSfy2cx4lbCT5J5e2aI1EWDuBr4=;
 b=Xqze8+Jcn+phu4mM58OpctZ8EJy9b0XFcxsKfmi5IxmIvK0YfmOz5KLkBDvgJ8jwym
 abgYLEC/m+SpSLV/9tnghI5UTGhZAuvvyEdaYYWEaZUpKZgEHqI4T92Nm7R2CD5WG2Fr
 Fh5FEh116oG2vgeugnoQCqsKAfU3twMbRzI5op+RqGdrbyOnEDPzxs1bV8raBXS4ihD9
 2Us2A6ZE9BYreeUqf34By4NPsg2TFh3Q/bI36+wfz14uwnl+mlAxp4MuzMUiOVIukn9K
 A7R30rTJIzg3DSIvnWVsbez7Anu7QPdGKdXVJdaekaVyjXuEi04AVUIAb39bsBK3QwEh
 4Cxw==
X-Gm-Message-State: AOAM532QkOjqqaeEpVgs4P2CZLqTVWQRhbpUNDDQ+AvDaTJHAV2rAMk+
 SWkRWUuK33zIeVeCFnYL7fHMag==
X-Google-Smtp-Source: ABdhPJyMSXAzZQA+YI3Rc12GkfMlUerZJdaS+M+8rqjvZVZHbktd8lt/V9PPhl361WGsxbwqi/cR3w==
X-Received: by 2002:a17:902:a415:b029:d8:f55b:5e9b with SMTP id
 p21-20020a170902a415b02900d8f55b5e9bmr10322281plq.6.1605826381969; 
 Thu, 19 Nov 2020 14:53:01 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id fu5sm856008pjb.11.2020.11.19.14.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 14:53:01 -0800 (PST)
Subject: Re: [PATCH v2] target/mips/helper: Also display exception names in
 user-mode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201119160536.1980329-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b70809b3-652a-cadc-bccb-0f0c149a5e16@linaro.org>
Date: Thu, 19 Nov 2020 14:52:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119160536.1980329-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 8:05 AM, Philippe Mathieu-Daudé wrote:
> Currently MIPS exceptions are displayed as string in system-mode
> emulation, but as number in user-mode.
> Unify by extracting the current system-mode code as excp_name()
> and use that in user-mode.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Since v1: Fixed failed cherry-pick conflict resolution
> ---
>  target/mips/helper.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

