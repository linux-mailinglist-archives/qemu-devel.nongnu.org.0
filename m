Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697C92DAF02
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:35:20 +0100 (CET)
Received: from localhost ([::1]:50244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBQ7-0003Pe-F8
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:35:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpB4o-0001fC-BC
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:22 -0500
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:46198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpB4h-0007D5-1T
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:18 -0500
Received: by mail-oo1-xc44.google.com with SMTP id w9so4839201ooh.13
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dVUkPoad/SeiPntSomVY//ORmqr7oRWlTnxdMN71LZw=;
 b=Z6z5Ql2aH2A4spzZewnw2EUAs0dF6N0tUnsp2c4vKIx9dRGeGEGVgWalwk96pLa2D2
 oxQyul7geTmfKgApp267oXYWFkbFrvo/YY4cr9u6zehnm0XPolYklanHpbX5I/qQtRtS
 NHaeVIwqdh63kFYAfaZkbprJYW/fGIZfH6GObwCzp9iiIzxKqMi+Xez6hWb1qizBd5gZ
 gMTEYh4vkGOjeTsycmzYv+6tPGcYk8y+8I2IpdhSRNCWN/H22vAfri+C8LOKHhJ2DCqx
 q0xyJMLSOYSMUn/78toPmdLux2sdVWiZZtDngOqGc1RwqqqEAPxXW0JnQodjnBgauUaH
 WDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dVUkPoad/SeiPntSomVY//ORmqr7oRWlTnxdMN71LZw=;
 b=CJ2DUj+1yVs1M/7iDH3mZEVbsAhpDFN3e6mAALJxQf+mN8TWcc3lLTnD1fP/11cF/7
 v8f4LADqpk8kEldEuxYS2w/gurlJFP5nqIq5lzOGZ/gBx8niyZPMmbsHkNmqQQiLC32Q
 uiykGeyC+rnmKBnlaL/m0efD6NXvePHi4uoW2DH9XBeMZB2XE5k4WkBTYLaQ6wWz5CCX
 T1iZ+IMqokkk4p9fCylASO8bdo2XArTPhFrdtMh58JLjDn8hoLpDmacWzYgHswnehxUY
 Kbh53NiNz5fY511w7QqmNDhre04wBohot+kFdIsytaCxAM+3iuPPtbeN0hrXPxDbUVEF
 gttw==
X-Gm-Message-State: AOAM533SWmFw4bUhaUrIEwFuzDMLYWlHqicdDEMVnASAZKeitzyuAreT
 kK0eGUXOfWyXH/HihOI8j+sQ3Q==
X-Google-Smtp-Source: ABdhPJx+b0rJsvQI91GxcXWQIypRaD2yivBz9fawA1lWHLh5IdX+3h1P5glRtLUnBAiJwiKMKfk6fQ==
X-Received: by 2002:a05:6820:30e:: with SMTP id
 l14mr4890962ooe.38.1608041587284; 
 Tue, 15 Dec 2020 06:13:07 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a24sm4665919oop.40.2020.12.15.06.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 06:13:06 -0800 (PST)
Subject: Re: [PATCH v2 14/16] target/mips: Declare generic FPU functions in
 'translate.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201214183739.500368-1-f4bug@amsat.org>
 <20201214183739.500368-15-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <51090a30-44da-4371-6d63-3f4e7ac71a6e@linaro.org>
Date: Tue, 15 Dec 2020 08:13:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214183739.500368-15-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc44.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 12:37 PM, Philippe Mathieu-Daudé wrote:
> Some FPU translation functions / registers can be used by
> ISA / ASE / extensions out of the big translate.c file.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.h |  7 +++++++
>  target/mips/translate.c | 12 ++++++------
>  2 files changed, 13 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


