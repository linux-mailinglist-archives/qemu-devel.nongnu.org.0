Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D5C2B9DFD
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 00:16:37 +0100 (CET)
Received: from localhost ([::1]:49672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kftAK-0007iT-Fa
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 18:16:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kft8W-00079u-OR
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 18:14:44 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:40152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kft8V-0008Jk-0Z
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 18:14:44 -0500
Received: by mail-pg1-x544.google.com with SMTP id t37so5551728pga.7
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 15:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kpb34iC0IdSuYa9XX52XfZ8ni4MnfvimFZfFtezUkl8=;
 b=FxuB4CxZlBnk1+O4NTWh1d9Rye1xIdvafB/pQAVqwFVsXikL5tgWVFVNOXaU4dll3J
 KjBuj/aCmo8aqYObAFJdRzPg+oK1ibqh+K2n+7Yf7GAzf2fhBS+fhwzfX2sjyzKa9PJ5
 nybhUhs88gOsrQHP6QCZg4tfz/6sfIc0rkcBp2+9jOp3rFN/SzJIHt+g9sOMP9ArPhpU
 zNN0JMqDOOObhnJIHBogGAOvb48uqZR6PcKuu/RbZ2MCBZteygSQ0gFBTnAQR8zTdcNq
 xbNCJzk+JMYUBbA2+yyb06hG7cqVTlRk1OIW8TIKICFv6oEDGaRzQhNIc5Lc5KLF9quh
 8jNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kpb34iC0IdSuYa9XX52XfZ8ni4MnfvimFZfFtezUkl8=;
 b=N6DF+blRsv25RpU+GaQemNGy8j+o8x9BMmjQCUVRxgRwhsT+vQvqQeuIQJWM71wrBG
 qif1aJdnLSj1FcgnkoyGYT/tAGOIm6QlXDucwp1PYMtB06w5H/qM2LM0rmkGYuawratG
 dWEXEpzsc7VODXt5MLgnG4D+nfWRC5u+kc7ZPuz1e5I/VJO0NlktcofpeJM0Cql1c8Ne
 esS8ti0QiYjTy/74YyBN5pV/LIgwNg8SA6WXfmu3ojI3DCEo58DmFyobp4+Z4wJOvx8d
 gnmuugzolonFdPfIQLigu5LsRFQu2MnSqBjBO6gBWsEW6iwYj43NxVU5ZFwp/EHU7rSy
 hCVQ==
X-Gm-Message-State: AOAM531uPmI6vSuLiM5NKPe+F3IkpSscevEGrH9w4TDaWpYLx/UxnJuq
 mNAN3atjyUwQFHBB4wTAm7hP8A==
X-Google-Smtp-Source: ABdhPJxCwNpIt/71BbMIC03SIcEGcRO5mkKe102000QmK6H4/XgcePUa+yyBKKNRavQ+KgBsZMB4Hw==
X-Received: by 2002:a63:461b:: with SMTP id t27mr14100862pga.122.1605827681475; 
 Thu, 19 Nov 2020 15:14:41 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id r73sm1067259pfc.20.2020.11.19.15.14.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 15:14:40 -0800 (PST)
Subject: Re: [PATCH 4/4] RFC qemu-binfmt-conf.sh: Add MIPS64 o32 ABI
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201119161710.1985083-1-f4bug@amsat.org>
 <20201119161710.1985083-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cea08e52-2d92-b44b-feba-4921f3e797d5@linaro.org>
Date: Thu, 19 Nov 2020 15:14:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119161710.1985083-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 8:17 AM, Philippe Mathieu-Daudé wrote:
> ... but this is wrong as the same header matches MIPS32 o32 ELFs...
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---

Yeah, I don't think you'll be able to include this.


r~

