Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868A2464EA4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 14:16:05 +0100 (CET)
Received: from localhost ([::1]:39672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msPSu-0006Es-9n
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 08:16:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msPLV-0002sL-Qp; Wed, 01 Dec 2021 08:08:27 -0500
Received: from [2a00:1450:4864:20::432] (port=38499
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msPLT-0005Xu-E7; Wed, 01 Dec 2021 08:08:25 -0500
Received: by mail-wr1-x432.google.com with SMTP id q3so29278433wru.5;
 Wed, 01 Dec 2021 05:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m+mNRnxDKHxkpSj8Qiv1sgqfM+EiiXmoJt1pWbXe8Kg=;
 b=lgTqf3MtMRCCmlALTasjMpowOw4/qN6HEUqiUc6cR+grKsoS3IzJv5+Aa+x6oCljOM
 cStVDmaFG7gQkp/S+ylX9TAc2vocCjXkXU/CbmHFsFhFFi9Qy58wtXCzCccTFE2bEEBG
 Hd3Cb9AhVMVj6Vxcboem1dY2ni6PA/yjRaXfn4H0XAVBWgGKbd9hIXHTfrV0Ll8Jw+Xk
 sR+0iWxIAYtOVqomSmueLR6H2hlyDPtaGo5mhlmxw4SrDif8BC5gdnsY1HK38EMSHzb8
 SeC4WU0snfn8//xKwx01JptfpdEIbSOU1gq5NADY3zEdg2J70TQwrUL4f6cC20S+ZEbJ
 vxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m+mNRnxDKHxkpSj8Qiv1sgqfM+EiiXmoJt1pWbXe8Kg=;
 b=XoYg/Leurh+LP9o0IgQiZ3hcgzmHmKpKQCuphU2tE/CdQKik/7bV7b+98QFXfaNZpe
 VLBqRvmgOqgp+kP7FSgi/9kgkeagVbWQptJv9z+7SQ24OSeUeee1o33ss6XJFk9a5DUu
 iDlot4YCcC4thaKPIrYGBTaSnOKrM9Hli+mfhj5RsCBEdGEN30N3NP0+h3WmiAQe2ZLs
 g0zttuwqvnXa+zaTdpETpSoEbaJ6vdTND59PjJHavAnhMDXUC706TI/LnjNmu7QZ+6AY
 7oBgtbtyR267bMWO1NlcgeAnsoQ9akSTNkKQ8T9AmkZy3enu+r11DFvjouAchlZZP3/D
 T9Vw==
X-Gm-Message-State: AOAM531coMDAsjIZvK7sFN32p2GC4mTO4SJ7PNW1Rrm11m42V7X6W1EO
 NmcArQGRasYdN7xrDZqPXAHHEJskuXIXug==
X-Google-Smtp-Source: ABdhPJwkPBoUq66OpxqLIcqdfe1az/oRWrGdj7bJ3h++JsNCWq7NqUp2uFCRA7fBzXbApE1iWfaR0A==
X-Received: by 2002:a05:6000:82:: with SMTP id
 m2mr6400556wrx.202.1638364101805; 
 Wed, 01 Dec 2021 05:08:21 -0800 (PST)
Received: from [192.168.1.12] (abayonne-654-1-79-213.w86-222.abo.wanadoo.fr.
 [86.222.222.213])
 by smtp.gmail.com with ESMTPSA id k187sm1515502wme.0.2021.12.01.05.08.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 05:08:21 -0800 (PST)
Message-ID: <f47d5887-8230-3c11-4cd1-3cda189e9fb7@amsat.org>
Date: Wed, 1 Dec 2021 14:08:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] target/arm: Correct calculation of tlb range invalidate
 length
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211130173257.1274194-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211130173257.1274194-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.211,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/21 18:32, Peter Maydell wrote:
> The calculation of the length of TLB range invalidate operations
> in tlbi_aa64_range_get_length() is incorrect in two ways:
>  * the NUM field is 5 bits, but we read only 4 bits
>  * we miscalculate the page_shift value, because of an
>    off-by-one error:
>     TG 0b00 is invalid
>     TG 0b01 is 4K granule size == 4096 == 2^12
>     TG 0b10 is 16K granule size == 16384 == 2^14
>     TG 0b11 is 64K granule size == 65536 == 2^16
>    so page_shift should be (TG - 1) * 2 + 12
> 
> Thanks to the bug report submitter Cha HyunSoo for identifying
> both these errors.
> 
> Fixes: 84940ed82552d3c
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/734
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Not marked for-6.2 because this isn't a regression: we
> shipped the TLBI range invalidate support in 6.1.
> I have no repro case for this issue, but this doesn't break
> booting an aarch64 kernel, at least.
> ---
>  target/arm/helper.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

