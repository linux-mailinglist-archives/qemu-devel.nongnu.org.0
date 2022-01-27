Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C25449DC69
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 09:19:50 +0100 (CET)
Received: from localhost ([::1]:56886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD00S-00028k-4a
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 03:19:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCziV-00010u-96
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:01:15 -0500
Received: from [2607:f8b0:4864:20::1036] (port=39679
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCziT-0001iK-6V
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:01:14 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 s61-20020a17090a69c300b001b4d0427ea2so6770409pjj.4
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 00:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DquBZ0rp1YEhrnR/hiX39uLRHXYfvp3IDmvwyJEYTrk=;
 b=rTMbVAdSX+6j2IAvSZ/FvxR/Uo6RsmC8/hIBtP7icega/iyC8rYTtM8o0OwocKKpRC
 ee1SP3o56ejWrnHapHpWX4oZJZ8WdxZU/Vg6+JAZiadvan7WhZZl1EUaM2ndD9SL3nC/
 XOfPvmggzJm2lzmyL7Fmx/zbFOW+TKvBT+/EWK6fivXU7ig0c+EcJohTzLu6ol+aD72P
 xLbBQfDsXsNIqAgSRKyf5w2zQ+Cj6g0r4T8/YBqpYy2Q1C/jpQhv3PXFjtrV+sf1uDuI
 9GeTA6yarBhhITQoc4nxe+u/ir5qFdV8ZTA8b70/a/L6JblJDCWmpiSVFW1bEW50kSK7
 pVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DquBZ0rp1YEhrnR/hiX39uLRHXYfvp3IDmvwyJEYTrk=;
 b=sLvLquIHxwTk0Lq5m/tAO808wG9yqbv1F/LlRxsG4lkvfhLAshnjlASi4x4Ff3s29u
 YyYqpO5dKzq6FkxzltLsZ6/fsdg4mGXBDSmVhCazC6qBY0euPbC02kqLAAncK0Z7tZFH
 mtfZSokdgb4dfHZeXbdwoSKwJRnGVz3kc6qMcOZ+5dgaCb95AfcmsYch0DK3XbX4xNF0
 ty5onydHzOo9JjGAuCsG+iNlQBGZYo0xmxVgDOIrAL34ViutrglqoaB8vx1nOAVpfSJy
 mtn5nF0bCW5S4zU5Rb9SbyzfHVucdSOHU1XMA3LOSmq2g+8Ne1mNMcZmr3FDaFGrg/2i
 ojQQ==
X-Gm-Message-State: AOAM5328Q7Ei+orAKhpNTeJiTKr8lt1OoLo6cqd2Dr20d4nLt6NtIffK
 gPXh1msKCnB1kFR3S7Xh1OSBrA==
X-Google-Smtp-Source: ABdhPJwaJWbGSzliFFYKOv0RdHh26TEbjkJS9LoJi/+XroXK1fcN4cW0JzWi5ObEItudIL+jWTSsvw==
X-Received: by 2002:a17:902:6945:: with SMTP id
 k5mr2048613plt.141.1643270466443; 
 Thu, 27 Jan 2022 00:01:06 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id z14sm18988955pgr.34.2022.01.27.00.01.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 00:01:06 -0800 (PST)
Message-ID: <293e8cbb-24c5-074f-2840-a340e3222353@linaro.org>
Date: Thu, 27 Jan 2022 19:00:59 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 40/40] bsd-user/freebsd/target_os_ucontext.h: Prefer
 env as arg name for CPUArchState args
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-41-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-41-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 12:29, Warner Losh wrote:
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/target_os_ucontext.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

