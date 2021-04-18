Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5201E363746
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 21:15:51 +0200 (CEST)
Received: from localhost ([::1]:53136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYCta-00078R-45
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 15:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYCr6-0005kY-TE
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:13:16 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:43793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYCr5-0002hp-4R
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:13:16 -0400
Received: by mail-qt1-x836.google.com with SMTP id a18so882803qtj.10
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 12:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C4AvwS2nSyHdhgRgoyMBHEdd8P9cOUedKrm/y/fSVa8=;
 b=V4vutwTI54nJpMFUuhC7sBNokd5rR17RGiEFTdDknRKIgIYTd1U1tas2CU07YzzPeI
 A2dJvfmOLiJOxS4D6SuBxmUWFCFNRu+L9WZV3uJpf1RuhbNF6PQrD3WpQmjK+uTUli7L
 nn/p5n7SbO/UeCXMnbs7NXgXJDgPR/os9/qGd176mYwEMjm6ikA+B0By6ahzhGezgbLW
 MwRZgo2UKfPdStvUqYLfY2DtFjJ4XYQ5YcZtK2El7NSBnT/TEMGtmhR/UyRYssj6Vapd
 8Vd8RFWFNrv9fE3InirVZSDnZh6ALoVXIGnSHuiqbfgXCfMs+OdJ2SkSvLoy2klZa+oD
 RqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C4AvwS2nSyHdhgRgoyMBHEdd8P9cOUedKrm/y/fSVa8=;
 b=sriEJFrekMtXXIOjB5vZ00+L2Bh29OASRAK9rKlI2YC/5OJbsbslKEPrN/F/KTbDgv
 TdXi2qLK1oiLYk0U9pv7PU4POeYO+UnEdstzzo1r4fIbh/shH7N+d4Brsk7yMoIHkqu7
 CwgNF0++sZRxenrR5tmlQn4CdTraZ0RAGF82Eqx9+tmAl/+TZI/WWbgr/Iqb6FYj+aDJ
 8Zi4FhGKYOaewKjsZ++7UapRuKYZH57ugNeGfgEIYLY/TgNcJbaWOhLALE1qft1vio0T
 V9o0osCarkAxtlXvbidZMN47SM+ywb0D7VVqu2kTX3D/fTqKMho1QV53P86VS2LEo713
 MK5w==
X-Gm-Message-State: AOAM530KutSCOrBOQPLhuUDnWM/zN5xbXqF0auoYMo6b64flFQcy1hbB
 rQe3Vkp4o12L9u0d5ue8C1rzJQ==
X-Google-Smtp-Source: ABdhPJxb96ApBAjXa7xY6zqDAczDRzlHWzWBr5nZCMARjpJQHbjULyZbrAgUkxMg0NuyOBtD/5fZAA==
X-Received: by 2002:a05:622a:2cd:: with SMTP id
 a13mr8825289qtx.226.1618773193758; 
 Sun, 18 Apr 2021 12:13:13 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id n18sm1911051qtv.87.2021.04.18.12.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 12:13:13 -0700 (PDT)
Subject: Re: [PATCH 11/26] target/mips: Move cpu_signal_handler definition
 around
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <437b5def-10de-c49a-5979-bec66e51bc41@linaro.org>
Date: Sun, 18 Apr 2021 12:13:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-12-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
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
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> We have 2 blocks guarded with #ifdef for sysemu, which
> are simply separated by the cpu_signal_handler definition.
> 
> To simplify the following commits which involve various
> changes in internal.h, first join the sysemu-guarded blocks.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/internal.h | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


