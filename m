Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEB2541F52
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 01:06:27 +0200 (CEST)
Received: from localhost ([::1]:45478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyiHK-0004sx-1I
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 19:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nygKl-00057e-E8
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 17:01:51 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:40479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nygKj-0003nQ-LE
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 17:01:50 -0400
Received: by mail-pl1-x62d.google.com with SMTP id i1so15849470plg.7
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 14:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Yf9/p/hKkh0EOCcYQXIh3lhJ7eqzIxzFsx+/f/VzhnA=;
 b=qTmfJ8qm2OZNFc9i5PvG+v4sXfz/p7nWCQ8jNgM/uv+oTSiIw19LFWesIyHY2KYYB/
 5ANhacDaZG23e2Af4Gm06UHmhDV5VW9fZJ9k4UxF9XtRUT0s/bjsd9dMsdgMcyZg7Gwv
 7tFEUHL4yvZ57y/dLZZ2ykjtVAQQHA9AMRdG77c/RUkQGdWCgW9wusPfLD3uAIZYQRMu
 k4I2BES/prsvm58HhK2YsEcUiNrX9rTO83pr7V5ivIQzhYv0nr6OserDU8XSxQOGjtp7
 Qn1MWrRqNHZW7rlcrT+Ja/Z1wBIALawJ4JqG2fFMzcD7svqFu1o32JYRVbnBFlpj5LSu
 lr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Yf9/p/hKkh0EOCcYQXIh3lhJ7eqzIxzFsx+/f/VzhnA=;
 b=Xi3lWOkMU+vEkOFcO90nBXMGacXzOcOJQeczp0Re8wKU4496EOwTYA5cWjlrYh60a/
 vJDEzLofqymP8UaPcEHOHXlbBCUpa4t3OZEdgEK/X3Kn+1EgMr9nfG2c7UeL7RhoY9jx
 sVYJx9KxG8PZInFOT5Y/afjJjzANamDMDxBmmLOwC12ymg+buoZx+lzhmdBT4HEltGCS
 lWTwPXIYe3ZGf3ohJXSLOVcrECmtTvoiQ/wRrn/Vwpc2JrcWFK9mPhGXVddhqdXbeFvg
 sycQAwbVsHa9WeRm40C2e0WWnPXOpHeL8x9yEBc81bZ234zY6rJt9CtPUvty3Rchn6Mr
 pKTw==
X-Gm-Message-State: AOAM533WjGOzbVs1rOo63wVLMiQMkrqwWtViNoVuo3RjBPqTIhoqLAuj
 10mGj7KDhzDchMLzFw/AktZ09A==
X-Google-Smtp-Source: ABdhPJyiQ5XGeuIbIG99bjD6XUiogJjfIQiAZjoYYFFBiGq6MCK3stTA7Ji1vp3PjMYw5AD/zhU6ww==
X-Received: by 2002:a17:90b:1101:b0:1e8:5df5:b2ac with SMTP id
 gi1-20020a17090b110100b001e85df5b2acmr19741220pjb.239.1654635708025; 
 Tue, 07 Jun 2022 14:01:48 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3cf2:c634:5b19:25f6?
 ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 ja17-20020a170902efd100b0015e8d4eb219sm1835270plb.99.2022.06.07.14.01.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 14:01:47 -0700 (PDT)
Message-ID: <90234281-b315-f6b6-270c-19cdcbf4c8ee@linaro.org>
Date: Tue, 7 Jun 2022 14:01:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/6] bsd-user/freebsd/os-syscall.c: lock_iovec
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: arrowd@freebsd.org, def@freebsd.org, jrtc27@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>
References: <20220607201440.41464-1-imp@bsdimp.com>
 <20220607201440.41464-2-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220607201440.41464-2-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/7/22 13:14, Warner Losh wrote:
> +static void helper_unlock_iovec(struct target_iovec *target_vec,
> +                                abi_ulong target_addr, struct iovec *vec,
> +                                int count, int copy)
> +{
> +    for (int i = 0; i < count; i++) {
> +        abi_ulong base = tswapal(target_vec[i].iov_base);
> +        abi_long len = tswapal(target_vec[i].iov_len);
> +        if (len < 0) {
> +            /*
> +             * Can't really happen: we'll fail to lock if any elements have a
> +             * length < 0. Better to fail-safe though.
> +             */
> +            break;
> +        }

I think this is over-complicated, could be fixed by...

> +    vec = g_try_new(struct iovec, count);

... using g_try_new0.

> +    /*
> +     * ??? If host page size > target page size, this will result in a value
> +     * larger than what we can actually support.
> +     * ??? Should we just assert something for new 16k page size on aarch64?
> +     */
> +    max_len = 0x7fffffff & TARGET_PAGE_MASK;

Use minimum value, I think.


r~

