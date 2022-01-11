Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8C748B49F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 18:54:05 +0100 (CET)
Received: from localhost ([::1]:33694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7LLQ-0003ry-Kq
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 12:54:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7LJW-0001g3-OQ; Tue, 11 Jan 2022 12:52:06 -0500
Received: from [2a00:1450:4864:20::431] (port=38692
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7LJV-0005Vi-4s; Tue, 11 Jan 2022 12:52:06 -0500
Received: by mail-wr1-x431.google.com with SMTP id a5so30494938wrh.5;
 Tue, 11 Jan 2022 09:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9iHn+eJnS5leMPaRz0Vy5nhBDKuwHXYgnjZWGeKryyc=;
 b=KPGnZ/u/tJMEOdy3BWogtZ0FcJ47muyOkE5mXedOs0RsMA8AW0lWwB2wcWddt+RE/w
 3rwpotQfIdsV0xOO03tx9vAt7s1yeX5zl+hhtZ5aj/v7M3jx7udUTlUlat+aq6/znOFY
 Ew8OxZL8lOVywft+oTK1L/H0S+xGDc0ugtTQeqvI0s+ZZogORzd0vJoXiidNfgRcyG84
 qWHfrfZ2/zBpvK40WTcCLT5pWzxkX9HOtGfKdni5vT6EuJc0gv+B6fci9TVkI9JnRSYE
 n4fHSDreqWTuUkwB5F2gKVfWjpYpRVMaL+I6a4HWkKa39vCVBGDsSUkvmpCHDVbUN5jT
 1lMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9iHn+eJnS5leMPaRz0Vy5nhBDKuwHXYgnjZWGeKryyc=;
 b=EIFXklEHKjNMdJw9P+gQofBAGmKSXvb3a39FfHopsRkiNBwwojM/BcClvyaQ2bemsg
 vKuxh0IflRnuySdLxhruL44HcmWRq6UTi/Dw+bYd8pNH2HqVXyjJn6z3ANYXXDEAAIpK
 ar/m7oLIE0r4ZrFbDisLEFjizJTHYdkxUlN8oDdILAklvYJxpEn9mZPCsVCN1Bjv8yOw
 ukC5N4pSKRoJJveFGgMJDWV6pRZucggMqeYGGmZ4lJ+Zh/R0XrVqqTonLgtVYLWf2HUa
 soTwmzgSGwDrRfyXTjyKlPndJVmDf0fifloEiYmbntlxCAJEj9EyusOGyOQ5vCL2ki2r
 hWBg==
X-Gm-Message-State: AOAM533G5w94ewNuuKGlRIK2kxwnk2DPds+qtvkRrQXrZiquY4Qmj2xb
 kXAFz/0gxmYR7iutz0Vv9qg=
X-Google-Smtp-Source: ABdhPJwPLN4FDovyUZ+RzdHMmZMCOHBdSzjbeDf8jZ86b7T9cix9cSvVC2lutPHWbch/9WRpOeqtug==
X-Received: by 2002:a05:6000:181a:: with SMTP id
 m26mr4722966wrh.257.1641923523483; 
 Tue, 11 Jan 2022 09:52:03 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id c12sm9926484wrr.7.2022.01.11.09.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 09:52:03 -0800 (PST)
Message-ID: <a0058808-c18c-e678-d84c-c05b79dca0bb@amsat.org>
Date: Tue, 11 Jan 2022 18:52:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] qdev-core.h: Fix wrongly named reference to TYPE_SPLIT_IRQ
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20220111172655.3546766-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220111172655.3546766-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/11/22 18:26, Peter Maydell wrote:
> Fix a comment in qdev-core.h where we incorrectly referred
> to TYPE_IRQ_SPLIT when we meant TYPE_SPLIT_IRQ.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/qdev-core.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


