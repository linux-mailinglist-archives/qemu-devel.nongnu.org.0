Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35CF339F93
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:39:41 +0100 (CET)
Received: from localhost ([::1]:40186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL8Em-0006Rl-N3
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:39:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL8Br-0004pX-Ke
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:36:39 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL8Bj-00072y-Nv
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:36:33 -0500
Received: by mail-wr1-x42d.google.com with SMTP id x16so3496392wrn.4
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 09:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/yP/qXnVxNRG753aeW2fButugfmVrWgb5zwHK99QMoA=;
 b=l8+MMo2i0ABd/coBJfYDdUrYwbqUFnWlNzhYOZjPu0wuYRCQ9/r7yb4g3vkVE5BA2y
 Ol1oVOno7VmfouJKs8LNViYnn2pRAZQUgtdquXX5For02qvCua+DSUs/SSChVXXmVP+f
 U19CPmZeV27gcV+QaQfgDwq69CZ2U4twQQ9Ldb9s06ekJvWmzxhH3ajgYrNQeVfJTMZS
 xzsuNql+c7NoquHufgO30CGY99nPuWGJ0iX9DgaXkhnQefzgLifPAnQSGY/Njb7uBawL
 77lrWMRnjIP3WSnziiGYvlLTj+COQTGSheG5/iPS+ogXURTtzl07keLmoQw73v71Rh6a
 GbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/yP/qXnVxNRG753aeW2fButugfmVrWgb5zwHK99QMoA=;
 b=Naax9iABgl3SgTTWiRGmy5BJ8ldCXFYV8uIPc71zqkRlIhO09rzKgWLuKuoSA2Utso
 VbXL2R0eSub4gzsB7CdUjLB7ywKhlxyZ3oSUagAtVceUT3ksjrAEKUG7po1r4yD2I9Nr
 USaJGXWaB8sdQpz69/HkObVd9mkv9p1YKNNsI96OihzOtMaOBxKQhv/i1juE0VLK2jHI
 iLgfp9vknWLfH6DlpcGj2aJqvHmOg03cBp7pxrsdvhEGSwfR0wPWofBE7KnSbde/8Rx8
 62KAYnPUZWqe3fte7sCuz1SDkwPHNEM31aY3n8UcQ5wwBYUSBxtknADODTu5miy+nNvq
 d98w==
X-Gm-Message-State: AOAM530c+Ztc21wyOy+Yl0YixsZIM6+7ncYw/iws37mXwJV0rSmvEl9d
 9qY/vROtDkqcp7mejSLA8Cs=
X-Google-Smtp-Source: ABdhPJyeRm+aS31gUTU1v0H3Czn0ROufVFMWFXSJ2kmLQK+oxImB/a0/msmYqgobFZHmOmJ+FaZkng==
X-Received: by 2002:a5d:4521:: with SMTP id j1mr19428193wra.354.1615656990425; 
 Sat, 13 Mar 2021 09:36:30 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id l4sm12693319wrt.60.2021.03.13.09.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 09:36:29 -0800 (PST)
Subject: Re: [PATCH 02/26] meson: Move disas/tci.c to disas/meson.build
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311002156.253711-1-richard.henderson@linaro.org>
 <20210311002156.253711-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6407cca5-4f1d-1167-a833-d4f6d9779624@amsat.org>
Date: Sat, 13 Mar 2021 18:36:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311002156.253711-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 1:21 AM, Richard Henderson wrote:
> There's no reason to do this in the main meson.build.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build       | 1 -
>  disas/meson.build | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

