Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038E2462E3B
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 09:07:15 +0100 (CET)
Received: from localhost ([::1]:43544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mryAR-0008EV-PV
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 03:07:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mry7T-0007EM-Hi
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 03:04:07 -0500
Received: from [2a00:1450:4864:20::32a] (port=46624
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mry7R-0006UQ-Kv
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 03:04:07 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso14109271wmr.5
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 00:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L6OnWMfI5c4phPxCdXbCTwl7f4OnocpSWH+Ro5Mp1TY=;
 b=W/nRR7WUNMS2ole6gpJe86XqxIGYuEwqzZd0CBXvSzNx4XKsXZ9rOVqmCxYb+igqQI
 qGvhYNb2GPs9wfKunc+wQRuoa9FIrkrg4QZ5moQ9gaKRJEs18C71PL/77gmmQejmBPUC
 VX42khbgYwORi9XkssWVaPtBew/M+cYHw3jsES5Gi63qFC/j5ItwSGDgasyBPIDR/9oJ
 AzwVAHoIbwQiHs5DXg8om0/TO4I2wg73jDVb631I+Je2HeoQwbuQcL19m+bvTCKxyFiZ
 /3Aowqmm4LJOmYFUBD9ona+Xcitm+DMuugSYnrVxqqwlcG1qlQzZCsRD/f1xqP4/o6Z7
 1a4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L6OnWMfI5c4phPxCdXbCTwl7f4OnocpSWH+Ro5Mp1TY=;
 b=mrgCUW+1e6B04s3OAiJ8ayTVpvGTYEzi44zfo2BlZCvZGZnxbaTgZV1g0/BHPV0Jqq
 NRnA2cTYiCbic36b5wpij0S27kmqmoU4pvKGHI3GgJfcegj+b4x8jlk4ClC7DYkjtTwu
 /YxLjAHT/66WrKuQ7oRCicOFyfmhXXhUSxGBJHDQarMU6z4vLU4RXC+6kotO9WIVi+hM
 F5+MgwGzeK7xbmxFtcJe8tmoflJFKaD3tYZMA5M8y3Bw4fpBEH3jW+lIbcBdCYOH9sAQ
 ekPYBxexKSI6ds6IHimRNajCVA350vAvQFJpSiRjn4I8Pk8LdC06XU18M8MHX57FJqkK
 FHaw==
X-Gm-Message-State: AOAM531S75qs1tS9Dvc+kHE981m32TzCtKATpLiTh2Q8BRWpc71QixIP
 7NFSduWmCrbZt8dIDU6wrl+aDA==
X-Google-Smtp-Source: ABdhPJxMtW5ZmcamoRONANXf6Jf987Llr5gnXeZKfs/Jb7oU3gFKLxEyDzQbdhbip8sSbGllduhgVg==
X-Received: by 2002:a7b:c763:: with SMTP id x3mr3166452wmk.31.1638259443223;
 Tue, 30 Nov 2021 00:04:03 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id a198sm1663212wme.1.2021.11.30.00.04.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 00:04:02 -0800 (PST)
Subject: Re: [PULL 0/1] ppc queue
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211129205327.489558-1-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <15ac9ce1-a725-edd8-444e-6794cf8457fc@linaro.org>
Date: Tue, 30 Nov 2021 09:04:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211129205327.489558-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.211,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/29/21 9:53 PM, Cédric Le Goater wrote:
> The following changes since commit a0fd8a5492240379a07c0b39c8dae3b8341b458f:
> 
>    Merge tag 'pull-for-6.2-291121-1' of https://github.com/stsquad/qemu into staging (2021-11-29 18:58:06 +0100)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-ppc-20211129
> 
> for you to fetch changes up to 7bf00dfb51566070960e0b7977e41abba96c130e:
> 
>    target/ppc: fix Hash64 MMU update of PTE bit R (2021-11-29 21:00:08 +0100)
> 
> ----------------------------------------------------------------
> ppc 6.2 queue:
> 
> * Hash64 MMU fix for FreeBSD installer
> 
> ----------------------------------------------------------------
> Leandro Lupori (1):
>        target/ppc: fix Hash64 MMU update of PTE bit R
> 
>   target/ppc/mmu-hash64.h | 5 +++++
>   hw/ppc/spapr.c          | 8 ++++----
>   hw/ppc/spapr_softmmu.c  | 2 +-
>   target/ppc/mmu-hash64.c | 4 ++--
>   4 files changed, 12 insertions(+), 7 deletions(-)

Applied, thanks.

r~


