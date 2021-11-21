Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F2145848F
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Nov 2021 16:49:34 +0100 (CET)
Received: from localhost ([::1]:47206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mop5w-0003qg-Lh
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 10:49:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mop4K-00035K-C0
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 10:47:52 -0500
Received: from [2a00:1450:4864:20::32e] (port=46786
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mop4I-0005wR-Lx
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 10:47:51 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so11520800wmb.5
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 07:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=x9VHWbTJLNaDdwMaR8iqBE85djNgZEIL/rv5ztHQ1V4=;
 b=jPjJ8z6RHF9q6Z0ugM+X30wcAtI8TAXVkcyX9BX5AP6HUhjXbcCwqPboTJLHCTIq34
 gfFN4qDYi540mhsORRcVyurUYxbTB83KrfcF/Unp4n/o/20XQDS9XHPTOLan1mv5STQs
 VvkzYW5swoFRF27SwwsIMYvV7HTExlJnONnS2xtpHRQ5JMHkhl+J+Z/AppBFyc902ip7
 xV0YpwKRJlfCVv5l+7Ps/siPYtw18lpAzsJsvn/mRBdgAjQEhKGVGCxnj5dKoLqDllAM
 lG602wjxxz5U+Tn2Bynd4uPkSrOJrj/28any8SUKnymux9GdZAAiOVAt9GGQ/zGfTXrj
 1C1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x9VHWbTJLNaDdwMaR8iqBE85djNgZEIL/rv5ztHQ1V4=;
 b=j2vqpUL53txkLcUSN5hei4AthgKApqdAMNzXPbBNGf9+OY2MO804LHKgEIysZYxD20
 witnkGAu4pv+glDIgd7AzRlL0um533WIswJj/GJ5MNJjg3ROpMP2oin0juD1X0cVSdcz
 fR37/DFJxT2DJHlt6ofxMopZI+akhU4t63c2tW5yQpbkyH+sBQEkFrltY9jPQOH4bHi/
 9z+9UB5UWao/32i26ZIerztSdpFe+el7wuk8WGz1Az5ti6l1uO6o8axq99DqV84DwRkr
 U6I5LRuk+3BlZ3jrdly7d7UzAyrh2T4HLkiR1/Pl/DbOtBqnTzWUKYrrzhis7whXlY5d
 cYAQ==
X-Gm-Message-State: AOAM533HnJfpXCaNZpDnUAWymYxznH4GkcGLDuQAW6iUPlrhWwmGRY6i
 vIxHojE70mrZ41bL+VHXa12vl3Jd71T0hLDa/Kg=
X-Google-Smtp-Source: ABdhPJyXzTkZWiNmjCE8NXSaGlIJkqz1yMmNW4VEYasiLYc2tEc4Zi51rYH5Lr5zVmn8AOsaArs3Rw==
X-Received: by 2002:a05:600c:1914:: with SMTP id
 j20mr21063370wmq.26.1637509668056; 
 Sun, 21 Nov 2021 07:47:48 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id f81sm20672851wmf.22.2021.11.21.07.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Nov 2021 07:47:47 -0800 (PST)
Subject: Re: [PULL 0/2] qemu-sparc queue 20211121
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211121095933.28174-1-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2a3d4701-ba69-9e9d-2246-4cccec2c1d64@linaro.org>
Date: Sun, 21 Nov 2021 16:47:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211121095933.28174-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.022,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/21/21 10:59 AM, Mark Cave-Ayland wrote:
> The following changes since commit 8627edfb3f1fca24a96a0954148885c3241c10f8:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2021-11-19 17:16:57 +0100)
> 
> are available in the Git repository at:
> 
>    git://github.com/mcayland/qemu.git tags/qemu-sparc-20211121
> 
> for you to fetch changes up to 319e89cdc32096432b578152a47d0d156033b711:
> 
>    escc: update the R_SPEC register SPEC_ALLSENT bit when writing to W_TXCTRL1 (2021-11-21 09:56:52 +0000)
> 
> ----------------------------------------------------------------
> qemu-sparc queue
>    - contains fixes for ESCC reset issues with Sun PROM and OpenBSD on SPARC32
> 
> ----------------------------------------------------------------
> Mark Cave-Ayland (2):
>        escc: always set STATUS_TXEMPTY in R_STATUS on device reset
>        escc: update the R_SPEC register SPEC_ALLSENT bit when writing to W_TXCTRL1
> 
>   hw/char/escc.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)

Applied, thanks.

r~


