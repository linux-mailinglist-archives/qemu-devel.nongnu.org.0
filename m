Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1475149DC0C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 08:58:35 +0100 (CET)
Received: from localhost ([::1]:38876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCzft-0005Cf-Oo
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 02:58:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCzSC-0004Be-79
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:44:25 -0500
Received: from [2607:f8b0:4864:20::102d] (port=36572
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCzS3-0007Q0-WB
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:44:19 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 h20-20020a17090adb9400b001b518bf99ffso6751920pjv.1
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 23:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=P0zUZLZgJxCjyakMOZR0xieg7R0P/5M/CAjU3paQIk0=;
 b=qs9IbjZoB0jVt9C2UMOhRLsvT8OdCcoJOMJSEwZUfSlA83r/xnAk8A3A1kYqWGYAuT
 GpZxGZTvvwpHq5+zm7t+R9/b54W05md1jFfiYrbg7tAiXxQQqG+xLY8wq6NX7+zVQkXd
 hNNs8wh7hr+BtgosybIRd5rA+gXHBUOKOcxpRjEZ9/fvpnjps/XxAXdYULH5GHIzV4EN
 p2qqUwbbcgHMaGBxqeXFDjzYbpBwga/ASWAzPaZPPyU+WlsklsBmToZxtj/Zep1PEg0d
 beMWvbo/7Sp9b+1AxTHA+xojCygyM2KOEsMWwpOkI8pqPBHLb1apk81NL59+SPdIikqY
 lNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P0zUZLZgJxCjyakMOZR0xieg7R0P/5M/CAjU3paQIk0=;
 b=2ycTatf0W5melhc2mmfJ4UC7yuPKgc1FYmCfqq2QeJPkN4JtvAFKjoae4Ivb1R2iR6
 puihbuEgVK5A478DKPDUcNdJZdRHF67Zc589J6in2rZ8xMFCPtaHPW+s+a5u0btawKu/
 MMizuuNYLzTuLtEGUDMOTL/Czc2zW3nFmkUPNkbHUVDOnPdQHwHTBBqlt2fOJzw29/G5
 YwU/rwL2M10f0cKH3piCgFJYzFD8/H/PI2PVflIJkhsHDbGE4l/1TMPpgDtMCnbVMnz0
 kIp3OULx7Vwjl/aFJH9YeTKFnmnZABhUiRne593/MYsLtMnmjEYwcfvU1qxw9EZggjmy
 K6nQ==
X-Gm-Message-State: AOAM531e5Gxt5OHAsqfvhT2lz911+XZXf4DR+FNFrqSZdVZ0udlV2VKH
 ektstKtJFezxjkOuxUj1yH/6eC+rriyV19p2
X-Google-Smtp-Source: ABdhPJx2HYH4ub0Wmmbr2Q1RJnAPT241u3FjdcsbSgMWZNFc6YkUsASuVmHYGPm5sDZa6Ri3L7uvAw==
X-Received: by 2002:a17:903:28c:: with SMTP id j12mr2270390plr.6.1643269449830; 
 Wed, 26 Jan 2022 23:44:09 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id e19sm3442533pfv.62.2022.01.26.23.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 23:44:09 -0800 (PST)
Message-ID: <ee0a09cd-b0d8-59b6-ecc4-dc1fd1705d8f@linaro.org>
Date: Thu, 27 Jan 2022 18:44:02 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 29/40] bsd-user/signal.c: Fill in queue_signal
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-30-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-30-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
 Stacey Son <sson@FreeBSD.org>, jrtc27@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 12:29, Warner Losh wrote:
> Fill in queue signal implementation, as well as routines allocate and
> delete elements of the signal queue.
> 
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/qemu.h   |  1 +
>   bsd-user/signal.c | 13 ++++++++++++-
>   2 files changed, 13 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +    struct emulated_sigtable sync_signal;
>       struct emulated_sigtable sigtab[TARGET_NSIG];

I'll note that we don't need an array of these, since we block all signals while returning 
to the main cpu loop, so we can't receive a second async signal.  Something to be fixed 
for both l-user and b-user later...


r~

