Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A974A675B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 22:52:30 +0100 (CET)
Received: from localhost ([::1]:60362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF14e-0005em-He
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 16:52:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEwz6-0003JB-MA
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:30:30 -0500
Received: from [2607:f8b0:4864:20::131] (port=43911
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEwyh-0000Rh-Mm
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:30:07 -0500
Received: by mail-il1-x131.google.com with SMTP id d3so14875770ilr.10
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 09:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mw9/3TzsmhVk50voR98JrLBbQ2RmAqxJL8VpuZCuPUY=;
 b=cOHflOK9RTynYvg+5u7CLKXxLjzZMF3sWffX+TI3zBhMCaU8L/KZWpEE4Y8PY7/WN0
 rPooUURTmhiEboaNXGkh3KQqZ5jehQDH45wiB/+qwohIn74+X6mMp4/olbqT7a0oqX2q
 2W0lBTodUFsrppjtd9oGi3FxeCFmhP582BhSFX78EZdHsTDLaJ10d9K0Sb107vzRx1gT
 75d0w+YNFCNiQQ/LepJVAvWe8pjRzi69DK3/rkxDe6sWczuD0fgwqIbRgJos2hpw//gC
 dgJmjveYy+RtFqwcSX5RfVA8jtfIOJj+OxFVbm6j9uqyPmVdL/iz2i66Eeb1TYdTn4wN
 sgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mw9/3TzsmhVk50voR98JrLBbQ2RmAqxJL8VpuZCuPUY=;
 b=tzCmsHv7sODQm1fXVEnI/hAATfTeazzCPjm2OIryUbV9Nhgsz2iBGjC/o3u3hwSlo8
 kQP9FU72MV0slCS26CU8f/I1YODwv9jETyaTbC3wzcPjIEkn180DvJyVglsTPTSLyji2
 OUr7IqdLz3r0Wg9sPonCOc5USIAze3iOUIwvlA0Xh9G++BycOtUifNavbIxPGJZ3GcRU
 J3yyJaF3qb02OcT1U+5BWtuBFHpDRkqoH2Jkwei3gE2cabE02ddh/dqS5y/P6cTiumv2
 mrzCsUVsCpYEf4hbMw5hHKLs8MB8rW4W8CLT0rsdGjUSCQSK24LnRhQ3f6alG6NL4XEQ
 YVag==
X-Gm-Message-State: AOAM532EhewKcHResc8CW07WwMmresooWbhxSIZPMC1rB29BoYHm0SIZ
 Fskq1gQADkB1I1n8xbnva2KgyQ==
X-Google-Smtp-Source: ABdhPJyJIRwfPj/fzvx2vpPQtiQT89itQ2mrlChG0nHOl0zLNtZ8Gahx3HUAK1m0rzS9P5YaaEgDKA==
X-Received: by 2002:a05:6e02:20eb:: with SMTP id
 q11mr15266435ilv.130.1643736600559; 
 Tue, 01 Feb 2022 09:30:00 -0800 (PST)
Received: from [192.168.62.227] ([172.58.160.76])
 by smtp.gmail.com with ESMTPSA id k5sm9528585ilr.7.2022.02.01.09.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 09:30:00 -0800 (PST)
Message-ID: <a3ba1ee6-1235-98f2-c7c6-f8e01052cc52@linaro.org>
Date: Wed, 2 Feb 2022 04:29:49 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/22] bsd-user/i386/target_arch_cpu.h: Remove openbsd
 syscall
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-5-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-5-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x131.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>, def@FreeBSD.org, jrtc27@FreeBSD.org,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 22:14, Warner Losh wrote:
> This doesn't build on openbsd at the moment, and this could
> should arguably be in bsd-user/*bsd/i386 somewhere. Until
> we refactor to support OpenBSD/NetBSD again, drop it here.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/i386/target_arch_cpu.h | 84 +++++++++++++++------------------
>   1 file changed, 37 insertions(+), 47 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

