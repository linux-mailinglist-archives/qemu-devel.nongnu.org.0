Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 830DA4171AD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:20:31 +0200 (CEST)
Received: from localhost ([::1]:53410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTkBm-00014m-PR
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsJ-0006sL-S1
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:21 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:41767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsB-0002vd-Rz
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:15 -0400
Received: by mail-qk1-x729.google.com with SMTP id m7so10842952qke.8
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 05:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=23KVP94OhCyMJ+0fgs4Sh1elYBH6LtkA6iAZVJ5P+DI=;
 b=jAxcAKoHOPdioJ+L620ayQTrE2KXkEtLSgHCTS3kok5vln2horAvv+wnhNP28h5oDw
 MBwQnAZ7Eb7O6vLp6U2iymePFus+EvH3eMPQ+YXUeeAYZR4hmxTtxLigktj2K51+Z9IZ
 1sI5RRAJpxtfTVgNxUA4MMQhj5NU01RPzEgeAEMjzTEm56CuQWhX/Izx0TfakBs3qhJb
 OsE8pxUr/vbsgGTeeYapKgPxKi1b+XJQY/wXjwaVvUOiCyu4wJtCtYFZhXBnfd6UlZI9
 +YZaE/X5EjX7LuiHwJKBSoEFZL+HY3x7aYPfrItLnwHJbJv3Yx8agrLXc1PiTfyV0eU4
 ofjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=23KVP94OhCyMJ+0fgs4Sh1elYBH6LtkA6iAZVJ5P+DI=;
 b=Z5MonewnDsWa1UJuzS2bcIvYBABVQ07FqCpVVwnjX7u2zqnHKepV0Xni3jeYwSbT2B
 B2vCdQ9PkeJjH1Hb+mVtubgewr3YGrI4zO1DOOKchCjcup4smZW5yALIFuE7+TEAlXcP
 vueN/LJnbQE80He2IXfSYNPrDdLdo1DFBgbBM7Fk/izeF+BswLBJYm9Ti0qq3gsAXDE2
 lGAr8jKs4WRK0n/nECPB4wM/wMbd9hh3dUDnf+AQwQncDSAQagNxi1m5iLgbfarHr2pU
 vdsY/yUGaHlc6bhbMvSP4DechRtuo25R5xRgNl2tYkuWmwdcZtT6GnHf8i26lNMu53TE
 xwZQ==
X-Gm-Message-State: AOAM533Zq5ArUhJueg0vuPwu8xpRUUcvCmxNuwuzggCyb8Hw//6J4Tb5
 rugSsiOhuAZVH2lFGskge3WV3d/vC+1ADw==
X-Google-Smtp-Source: ABdhPJyHSOg/MFLxaRYEmS9+9UrtBoObTS/yYCJUzzjUh7wckkSSO6j4MQ6rrgPe501jdcIrSV+ncQ==
X-Received: by 2002:ae9:de84:: with SMTP id
 s126mr10021011qkf.350.1632484811009; 
 Fri, 24 Sep 2021 05:00:11 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r10sm6285922qkk.95.2021.09.24.05.00.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 05:00:10 -0700 (PDT)
Subject: Re: [PATCH 03/14] bsd-user: TARGET_RESET define is unused, remove it
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-4-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <68467b8b-e929-227f-7162-96f586c81f6c@linaro.org>
Date: Thu, 23 Sep 2021 10:57:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922061438.27645-4-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 11:14 PM, Warner Losh wrote:
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/i386/target_arch_cpu.h   | 2 --
>   bsd-user/x86_64/target_arch_cpu.h | 2 --
>   2 files changed, 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

