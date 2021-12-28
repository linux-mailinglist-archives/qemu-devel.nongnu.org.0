Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E8C480B27
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 17:16:40 +0100 (CET)
Received: from localhost ([::1]:53032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2F9T-0004aL-6j
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 11:16:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n2F8G-0003nX-3l
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 11:15:24 -0500
Received: from [2a00:1450:4864:20::336] (port=43741
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n2F8D-0000mz-P4
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 11:15:23 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 k66-20020a1ca145000000b00345fa984108so4641460wme.2
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 08:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2oH/++t8Ni3zwf582M+iKxbAOjY3ET6Gkgpo6Ishfc8=;
 b=SvYAdqSs77ZAmW7qxAA3h8z3koJ2FQ/6q5ON9q/V/EjVo7dXUlexn5GwCQ6gmhRbhU
 1DPSrYXxPpWgvBWu4TodQQfGPso758uyNqcoDKhbzcVGZI0b9g1ErPgRvV+VviTxTalR
 60GeuD0fy9EwgT4FqPP8OA18S0fU430B6NZc+uKboFtN1RG9xYHQUucjD7ljSfl7xrz6
 JxEQFzleHDkMowi57MRBUcf8taD2CAANB8iV1hR8jx08T0M9UjYcVU2cL4gz0qPsqN1y
 y0MyvSuynvgQXpkEWGB53YYaTotwfDWevOVjbGAW/sO/eXBiBMgp2xrZspO+AM04Aty/
 0WAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2oH/++t8Ni3zwf582M+iKxbAOjY3ET6Gkgpo6Ishfc8=;
 b=kLsHi0A1iNZbvwOvS8FOYPP2V79sg+721yGe0F0diuM/kkRi+WD4K8JCBq8p8lxA+w
 qbxn7DfDQpV7cl2OQCTwUengivh3zSpFiyaUa6m6skABhk5uXtpaEeYroT+MOnrnJQMH
 NaYyxwHsgeXtmYtow1V7v33ul2phkPIeL1TMhL43toLGlkp/Bjp6Yv8+brvezdgbIoMs
 Rs0RrJy+Znnw4gugKtnUT7FBCw94pgQleC6GobXBwqc83ilQOSZI3KUAbeXzP1KQE9EJ
 kVsdxrkt0PccL3LdH0PzxHnJ42WiBls8wzuR0UQfw2XzYuX2DRcOWPzKk+NnGjxMLXvI
 r8RA==
X-Gm-Message-State: AOAM533rOu9EN0QtiQi0UOZ1y6Yu5XrfekoC/tATQHmWgGhIfsLnrxnp
 OuyfCmofAu/WDFQneZtb2jo=
X-Google-Smtp-Source: ABdhPJwwh2zIe3/dhqb0OuwV3VY6EhbES1s7icWUWo8x9rxSg4wx8fvk/QtA6LCIprKdyVZk5KQyxA==
X-Received: by 2002:a05:600c:600a:: with SMTP id
 az10mr17720049wmb.69.1640708120486; 
 Tue, 28 Dec 2021 08:15:20 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id u9sm21526039wmm.7.2021.12.28.08.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 08:15:19 -0800 (PST)
Message-ID: <bfe978cb-5b3d-5ca0-ffdb-6a50dca68e26@amsat.org>
Date: Tue, 28 Dec 2021 17:15:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] tests/tcg: Use $cpu in configure.sh
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211224212117.2404218-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211224212117.2404218-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/24/21 22:21, Richard Henderson wrote:
> Use $cpu instead of $ARCH, which has been removed from
> the top-level configure.
> 
> Fixes: 823eb013452e

Fixes: 823eb013452 ("configure, meson: move ARCH to meson.build")

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  configure              | 2 +-
>  tests/tcg/configure.sh | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

