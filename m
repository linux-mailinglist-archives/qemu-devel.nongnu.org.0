Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE474A5401
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 01:24:35 +0100 (CET)
Received: from localhost ([::1]:59262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEgyH-0006MB-Oi
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 19:24:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEgaR-0004Z0-6t
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 18:59:55 -0500
Received: from [2607:f8b0:4864:20::102e] (port=34622
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEgaP-0003Nt-E5
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 18:59:54 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 l24-20020a17090aec1800b001b55738f633so603962pjy.1
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 15:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SD5TrCdPARc7UDJhCCYBzdbGWR1C9akXCHNQ42Uygn4=;
 b=KbXnkYDiS7ewh0ll7MU9Xu+yizdnGRjolv59Ogc7H1YoTfJGkS1peXGtu4Q8/gZYre
 2+zI866CVCTCwdgu/v87cF61wvKyrWKo/P6mkVr7kq0D9ZC7FIKluYqIl2wHoq6jJ/Km
 lNPSqzFCL8x1Vafd8B6CDPivOHbe3giZ5MAUdSGY9L0njX92/IWbo6+O6Kmp+l7rSyVt
 4DoSqWfWyv9y4z02vlaN6KUHuhoC6Zfpkwi9a3HK/THA9cjApXIe5CBu5ljQrGCGqh+x
 efmKwP/ClB7ov3UJgm4xhYz4wv245xwqhtHTKydfw2xr7Mp1PKH8Fw3zbjYqbX1k6XvM
 ir/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SD5TrCdPARc7UDJhCCYBzdbGWR1C9akXCHNQ42Uygn4=;
 b=FXq++P0wUP6VqkwmRkMUCaQfpGA05yI7lx/1gKOSrv3Cg9n653fPRBkIkdFDcslMzN
 fXuKVukvq1l+eaYi2rmF6NVbeBG81slFstQXneEUFpcrW+LAB/Y+/Fmi6mAUY+Sd1YkV
 fiVtVA9eDsvLpEmUEC6vHi0rE0qq3S7h3qlpuxq1YNlF37UjRzelMPqvGjy1SJ6XTyhy
 sxil9zCWB2IzV+sonJ9mnBOJa0LuZ8MDS4ce4pKxfQ4gBfBDwsKbxFGQoOjDzeRHFwkm
 Ymv8tmF5pD3kl0yQNIH8ZQoZ/N4XwAtO+fBN0brO6Gg0LpEgeTLYaSSuT0l5geaWe1wF
 ROIQ==
X-Gm-Message-State: AOAM530gzFYc8t6v6GCefmQDY7I1K94Ck7wa98bBPfhlLd9ehlwLFKo2
 0ZsvzPX3FOd52GDGY4lEphM=
X-Google-Smtp-Source: ABdhPJyOK+NZkHGUzehC7WXlZONKi3qoQxmDY8hge0X7HxCwbjdSucDn0FbJ86pu7pgmn1h7MBrPyg==
X-Received: by 2002:a17:90a:1383:: with SMTP id
 i3mr27176006pja.40.1643673586267; 
 Mon, 31 Jan 2022 15:59:46 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id h14sm20235797pfh.95.2022.01.31.15.59.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 15:59:45 -0800 (PST)
Message-ID: <d1818f59-db21-bc74-16f7-4508c1237af4@amsat.org>
Date: Tue, 1 Feb 2022 00:59:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] MAINTAINERS: Adding myself as a reviewer of some
 components
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, atar4qemu@gmail.com
References: <20220131122001.1476101-1-ani@anisinha.ca>
In-Reply-To: <20220131122001.1476101-1-ani@anisinha.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 31/1/22 13:20, Ani Sinha wrote:
> Added myself as a reviewer of vmgenid, unimplemented device and empty slot.
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>   MAINTAINERS | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b43344fa98..fed31a5eb5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2182,6 +2182,7 @@ F: tests/qtest/prom-env-test.c
>   
>   VM Generation ID
>   S: Orphan
> +R: Ani Sinha <ani@anisinha.ca>
>   F: hw/acpi/vmgenid.c
>   F: include/hw/acpi/vmgenid.h
>   F: docs/specs/vmgenid.txt
> @@ -2197,6 +2198,7 @@ F: hw/misc/led.c
>   Unimplemented device
>   M: Peter Maydell <peter.maydell@linaro.org>
>   R: Philippe Mathieu-Daudé <f4bug@amsat.org>
> +R: Ani Sinha <ani@anisinha.ca>
>   S: Maintained
>   F: include/hw/misc/unimp.h
>   F: hw/misc/unimp.c
> @@ -2204,6 +2206,7 @@ F: hw/misc/unimp.c
>   Empty slot
>   M: Artyom Tarasenko <atar4qemu@gmail.com>
>   R: Philippe Mathieu-Daudé <f4bug@amsat.org>
> +R: Ani Sinha <ani@anisinha.ca>
>   S: Maintained
>   F: include/hw/misc/empty_slot.h
>   F: hw/misc/empty_slot.c

Don't expect much activity in unimp/empty_slot ;)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

