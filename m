Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B873187F8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:20:16 +0100 (CET)
Received: from localhost ([::1]:47390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA955-0007Rd-68
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:20:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA8zY-0003iu-SS; Thu, 11 Feb 2021 05:14:33 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA8zX-0006YE-CI; Thu, 11 Feb 2021 05:14:32 -0500
Received: by mail-ej1-x636.google.com with SMTP id f14so9174822ejc.8;
 Thu, 11 Feb 2021 02:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+2PHMDkSqQyHmTkq0AhIiIBdn8pX/hMU5s527CBYpFc=;
 b=g507dUF0zIV15G6zmNKUB0846xIqF6bAXCtO+q9FlFOJeK3BWpCQE65Ixd+CAvBEdQ
 XKI404chFA4ewkti5APT5Jevy1om5JO0sxprZHf05br7xmAxluoG+INxt9fVaxJpf87X
 8CxqjeeUAvgbShbywVYoUdXrdLZ5qTIWgUKC8rzokg1n2YTf8emBzFv1HaAW0uBSZmkq
 trERfZ99AZQ1GjeoLa0QSdXlJt1iILkJDUMILNy5DgiOoKmI0blom9pWpRipr4iZ3GVU
 ws0mdDEki/T1wmRIz5+CABNGFvlUVTvIOAMc1h9BRlu19FRRFGWqxmRBYNV9jVmHdVD4
 LsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+2PHMDkSqQyHmTkq0AhIiIBdn8pX/hMU5s527CBYpFc=;
 b=Jmdjs2OLUfaEX7sK8RuOdNVAb5CT6QJOxNAu4wTuuMTbX8gtlo+mirjTTQMCe93/Im
 2KecXobyvHDvX1CJ7TOEDjyiU31Sg62kQ10tfP9YyuWlUM0p40haCIQ0NySZ8HOSX+2i
 lzrhXYRO8GkoehdxJEPyCHFSAOzcIQnkg8BsBAjiaOITUawb+QVyy0H7qlQXQdDEIkX2
 MsQQnjH1crZD877MNwtuYy8PQwVXe9znnDTTF0rt/cWO3ZVqsTj4PqFWrY8Nimy3ZEoM
 rmZ9HU9+C2n1VdepEncuHJEiPtZJc8r+d1SB503NUWiE2BdAsv+VFt34k4/mFfQ0IRTz
 Dp0w==
X-Gm-Message-State: AOAM532wGVeWRdRj4Vhm4/0ywI9rPxdEUKf92WRDARdDWSWSJ361zEpp
 +ps/F3s1ChHCIPnz+i0hmQxB3T+VciI=
X-Google-Smtp-Source: ABdhPJyaRE306YymBg7bDimEUVJnsGuUuOGQhO7rrOftOBj51E40hUBOyxLfjkbdU1FdlBzBzDjOkg==
X-Received: by 2002:a17:907:210d:: with SMTP id
 qn13mr7614050ejb.377.1613038469149; 
 Thu, 11 Feb 2021 02:14:29 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id cf25sm3780839ejb.71.2021.02.11.02.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 02:14:28 -0800 (PST)
Subject: Re: [PATCH v2 10/21] exec: Move TranslationBlock typedef to
 qemu/typedefs.h
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-11-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <975bb94d-390a-c8d8-8880-313184664e3f@amsat.org>
Date: Thu, 11 Feb 2021 11:14:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210210221053.18050-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Anthony Green <green@moxielogic.com>,
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Michael Walle <michael@walle.cc>, cota@braap.org, kuhn.chenqun@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 11:10 PM, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> This also means we don't need an extra declaration of
> the structure in hw/core/cpu.h.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210208233906.479571-2-richard.henderson@linaro.org>

I'd say this one matters ^,

> Message-Id: <20210209182749.31323-2-alex.bennee@linaro.org>

but this one less.

> ---
>  include/exec/tb-context.h     | 1 -
>  include/hw/core/cpu.h         | 4 +---
>  include/hw/core/tcg-cpu-ops.h | 3 +--
>  include/qemu/typedefs.h       | 1 +
>  target/arm/internals.h        | 3 +--
>  target/cris/translate.c       | 2 +-
>  target/lm32/translate.c       | 2 +-
>  target/moxie/translate.c      | 2 +-
>  target/unicore32/translate.c  | 2 +-
>  9 files changed, 8 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

