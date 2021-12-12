Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DBA471CFD
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 21:39:33 +0100 (CET)
Received: from localhost ([::1]:59930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwVd6-0004L1-Ju
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 15:39:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwVcC-0003Ty-ME
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 15:38:36 -0500
Received: from [2607:f8b0:4864:20::1030] (port=41838
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwVcA-0005E4-Jr
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 15:38:36 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso11798728pjb.0
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 12:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cvPvqo2FilxMBtkYK9T5V8F/Uou8nC0AK9u3IHB6g8A=;
 b=kkiUJMGG4KsK5iH77Ld7ueXbkpPRKSkRMh22xKgJnMPQpdumN12e+fipfcg36gpe7A
 ijeSR8s6QfWl3Hb7cYXdt+lM0EIxW4kpUFSwVTmD2kZO4OMIBPqHckbMVY4FBmpRxuNR
 1y97ch4cn8eB1aFawXVV+HpOclupmpk2ssu7n9MkvtQ86cG2qD3myAdofe5vOJXOznM1
 tzMk6cgJVAk4yC7qUxI10ybdzbmVjERhTEGHawHhIisMAU7MiV145ApenifstHYATnoJ
 CPm2yh+s+YplOCUj+jlrmDtf3mcR41gxFeAqSHjwQEjCK2SkvZCx5SBnDsArvPvHM9NB
 bbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cvPvqo2FilxMBtkYK9T5V8F/Uou8nC0AK9u3IHB6g8A=;
 b=nVpWtswqtyDbn0I1/D4Zh2X36jVxBqC3QoD/yt2tCtCMp/sMit5EkVSfUKp9wP5+f/
 yDha7yCDz1qT0CkzLDt7cf7edxQ8/iQylHAMLjpPtv/vtkhfvIH2LM3/7rndgpkGaplZ
 xT6B9xy0dSTKK0hE17pi5C/OTNPM7E+/WdVnxJaj+5WIB71LhAHKWhcbvRG3CHa8Mv8X
 ttygyTpcgjDTJZUPQ+pYuErdXQ8SPA27x2LzFQRq4xpTA7dQCRIT2q0J7okMnOgCiAzT
 g0xtZIwfnKtgrGtwjYfnhhIjicSnOJjd21XXxuIEQ3hH9nQtr4L8yQ+2O+eQuu85yfCg
 G4Rg==
X-Gm-Message-State: AOAM530cB4y9qb/ikiNPCU4i9/FOIIGW1+NpqCaTCEoBZjS6QLEe5ryE
 YL45blmX5t5s1onvIvuAPNedYg==
X-Google-Smtp-Source: ABdhPJyQhNz5vAw9SjVv1lAHurrZ8mjzAkTuSdI2ZgchxrYCsgHRhb3E9pglGq2TVe6L6eAcy3itEQ==
X-Received: by 2002:a17:90a:e7d1:: with SMTP id
 kb17mr39329507pjb.124.1639341513285; 
 Sun, 12 Dec 2021 12:38:33 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id oj11sm4825150pjb.46.2021.12.12.12.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 12:38:32 -0800 (PST)
Subject: Re: [PATCH 15/26] hw/intc/arm_gicv3_its: Rename max_l2_entries to
 num_l2_entries
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f080d8e-b1a2-f6f8-1871-48f38f603075@linaro.org>
Date: Sun, 12 Dec 2021 12:38:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> In several places we have a local variable max_l2_entries which is
> the number of entries which will fit in a level 2 table.  The
> calculations done on this value are correct; rename it to
> num_l2_entries to fit the convention we're using in this code.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

