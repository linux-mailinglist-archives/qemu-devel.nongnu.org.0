Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2332849DC0B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 08:58:26 +0100 (CET)
Received: from localhost ([::1]:38186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCzfk-0004hv-Nb
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 02:58:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCzVg-0004zv-0r
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:48:08 -0500
Received: from [2607:f8b0:4864:20::1032] (port=56154
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCzVd-00084w-P4
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:47:59 -0500
Received: by mail-pj1-x1032.google.com with SMTP id d5so2104973pjk.5
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 23:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=j1M0f24HMGXN9bxtVQS5jhIaREJTDw05TWrSq4PgqsY=;
 b=fxYpP7F4oKnj5/fCt3QDaazt6xJg/eB2TIi2qs6RqF38DKnKpwrgA3XWg9LkaQtO3w
 kyfh3xHu59uDOy70aJFBdmnyy5Tc24WFlYzKqDJDxaPtLnw0Lg6erZcaNFqzNRsfcGdV
 MbDljFeqQfXuLjsjjNcI+7/GfOSuc899yIlLMVcmj6oUTe1VGsVnikXGMg5ULm7vtjRT
 PazO0+QfmITm4B3I5SC+Z6ZjCEHe7QF8T0iqLThizWS6jp5aNiSCLyz4Tv3HIjhPjLvn
 zDRh043fhMUQJ0J9NeR4Ir6ADwh65do+OIaq71HAdLAs0jY+zBIPY5u4vqN2TYwULNiC
 jJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j1M0f24HMGXN9bxtVQS5jhIaREJTDw05TWrSq4PgqsY=;
 b=fJ3CSy13YDYRLCK98LkXW4JEuk9sDgklgVHxqfmbooUFM9gaSvLO4JR57EEgRbFH0U
 qsmGaBi9gzXmdki+BjstdE49Ya3POYmoq6k4ra5jcPYXQ0oSyqnkEOb6y2HZyM7HHYjM
 nAdUYWtSyK/T/VCYg9vyF7qvHT42Bbz1uF//z2Xm+2HhEwmivhSzx7IFNz9g6dj+r4md
 M9l0IUIx3yxzQd4RS3WXDy1nBiRiveQR7IuXYCdIZqNZeD6tzSsNIAzU/agVAfGcy3sz
 dubLKZAlXLaUorT3mFqhFQQ0scKkITWTf4Pi/S1u21+VcANYYrwevn5RqdAznDe5m09q
 JVeg==
X-Gm-Message-State: AOAM530bSVtNqYVsPVBKQo5RvNyUIlHdW3x5dwezRq/n9BJch81T28II
 Ld4aoMF5sMz1g4mhgMCrgYGE7Q==
X-Google-Smtp-Source: ABdhPJzHqcFrxHDsl5+KtnTdtImjVps+r/76EHYfiRFr4jTeFf10aUfJUtoKeSCxyav3oxthmf55Bg==
X-Received: by 2002:a17:902:dac3:: with SMTP id
 q3mr2258093plx.161.1643269674342; 
 Wed, 26 Jan 2022 23:47:54 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id v13sm4296397pfi.201.2022.01.26.23.47.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 23:47:53 -0800 (PST)
Message-ID: <04bd7a8b-78b7-c437-f67d-25a13cbcec88@linaro.org>
Date: Thu, 27 Jan 2022 18:47:47 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 31/40] bsd-user/signal.c: setup_frame
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-32-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-32-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
> setup_frame sets up a signalled stack frame. Associated routines to
> extract the pointer to the stack frame and to support alternate stacks.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@freebsd.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c   |  5 +++
>   bsd-user/qemu.h   |  3 +-
>   bsd-user/signal.c | 82 +++++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 89 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> +#if defined(TARGET_ARM)
> +    return (sp - frame_size) & ~7;
> +#elif defined(TARGET_AARCH64)
> +    return (sp - frame_size) & ~15;
> +#else
> +    return sp - frame_size;
> +#endif

Just double-checking that this is still in the cleanup queue.
I would expect x86 to require 16 byte alignment as well, for sse.


r~

