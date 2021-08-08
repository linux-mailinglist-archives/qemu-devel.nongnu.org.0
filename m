Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61B03E3873
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 06:32:04 +0200 (CEST)
Received: from localhost ([::1]:34896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCaTj-000499-UL
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 00:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCaRt-0001cK-KP
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:30:09 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:44556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCaRr-0004iD-VC
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:30:09 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so24385515pjh.3
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 21:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7ZpPPEEjYt4XfkYilgsi3M/ppjepUVaSbiptAlhk4Ls=;
 b=FsaWAlHW1ut+qG4sEDqYY8BJ6Hor0UVjuNOfIC+4j100Oq5hCmZLVhZBJxYLJaf5KR
 Y6A3SLSRKfEfo7HPabMVKaWoLR4I/dMHMSVMjpXCI0fg7mcB5TnpV8/Y4whVnvDvinbe
 mYaNizcWm1xkcBgYQpMMVIUPh8gThQOxtfTzOXag2j0A29TsYMs26ylAxBW2Hw97EcAM
 FRtz0qJhTh0nOQU8Q2kZRYDv4VexP1m5wJZHwi5ZcQz8kiwRNsfqWa5lc55Bs8a+gjrL
 L7n/QtToI4DXCRNxcavRwzW7WsWgBrqCDcTU1cJV/MoDjyHAWKyIi4x9ug9dSyvxOY+w
 fTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7ZpPPEEjYt4XfkYilgsi3M/ppjepUVaSbiptAlhk4Ls=;
 b=JgpMTnjvrNcD9wARWNtNAFLb/lsQvqhrqRCRJQtAdgW7ZVJlwwrpdkeiXiBHmCvZba
 getE05/YXqm0SfpKiqJdwLkKs+DCaON3X1XOTpnkx3ObAWajzDy3d1+dLEXRcZKnWzwv
 Cm57sd1XFq717Gvdo4cftBvEkUXUJBEWjSg2myNvwX+vn+RDp5ZRbJV0fbh8mcb+WbJW
 JP9lP/81U9W1YIzfcUBV5+rINja7y8ciGKsfqRrHJwgWB5cDYHCon93lcbrM0eJeddZ9
 nPVgDUxywOYMQJ5w9vw9OGHSJiHmKfkQB+jekr9wA5XHXAiT7NbbmiUSGC3rFrKhLwYY
 L5Aw==
X-Gm-Message-State: AOAM531R1PoQzcpTaYURGGl7QhoVW+3kT8TQoX534/W2hvFVEmp4ZfXJ
 7b9uVfeDIzKSQRClY3cxurHT7kmwCzb3Qg==
X-Google-Smtp-Source: ABdhPJwnmJGBsD5aBebX8K8SWMPh6xNyO9oujKrM2gCgztWZH8Al0gSJbdsJgQLWeWZR4BpY87KsIw==
X-Received: by 2002:a62:a111:0:b029:3b0:2f39:7cfb with SMTP id
 b17-20020a62a1110000b02903b02f397cfbmr17914082pff.24.1628397006536; 
 Sat, 07 Aug 2021 21:30:06 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id b10sm15362372pfi.122.2021.08.07.21.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 21:30:06 -0700 (PDT)
Subject: Re: [PATCH for 6.2 03/49] bsd-user: Add Stacey's copyright to main.c
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-4-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <034aae34-65ae-95ae-3875-8efaa46abf24@linaro.org>
Date: Sat, 7 Aug 2021 18:30:03 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-4-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:41 AM, Warner Losh wrote:
> From: Warner Losh<imp@FreeBSD.org>
> 
> Add Stacey's updated copyright to main.c
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> 
> Sponsored by:		Netflix
> ---
>   bsd-user/main.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

