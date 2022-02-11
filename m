Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6624B221B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 10:37:17 +0100 (CET)
Received: from localhost ([::1]:55676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nISMe-0004ME-QZ
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 04:37:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nISKC-0002YY-9S
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 04:34:45 -0500
Received: from [2607:f8b0:4864:20::102f] (port=50821
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nISJt-0006ZJ-JJ
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 04:34:39 -0500
Received: by mail-pj1-x102f.google.com with SMTP id m7so7635406pjk.0
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 01:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lyuXtUju+/dwa/un75UAjKJM7Jl/EqZ72OSzADRKK3s=;
 b=n2RL69wZcqZwvH1OENgGIeavCY+j2pqvqSGVUXqshGa3VeHK9OL5cXDAY4XTuOPBRw
 QT02EVESw5Z1ATfK1X7J5tizeoFUh006mox/SEOPDmfScnBwrqu7nmXYgpzw4ckAdptv
 N8KzyqESUlA60D6v1FC5FknfQWJvpWUnHcXrc5VmgTuO0Ccq+R2TypFs4S81Tk9ZTWjU
 z1RFv8JIGMR8rfasbZSme0X3ufg3WO2Ia/FtaFNLZjx8M4gYhdeNExxL4DJh68QX9PoL
 l6kThKRObWOaVgC8OfK/3sSCLj+YBw0ySKFd1+zXRe2q5rAew6kbPrQLItMg/9oaLdoD
 d9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lyuXtUju+/dwa/un75UAjKJM7Jl/EqZ72OSzADRKK3s=;
 b=YOGJBI162lIFCFa93Y9JleMdd4dNApPvMFX8Ai9+FyHWYze6rQ26EygV2bQKmQQ3DR
 mkcKDAIZ9BTvLgd95C2rWrqn3tQyS4cZdpNlrRAk0w3UpzmAkD8vQuFuiLF7C1vntyEn
 2NcQvQTjj129FxoyeuN/iQMPs3yEYDYuw9EgSqV1r60y9vv01yIufQJrFzwxdkq/RX4b
 vF7oXWa4FJRBLmkuTMT/Rpv9VPj7TgQLiUVCbY0b26cNINoWTLhsN24x+F9alXdT41iF
 Fmhh9pTPM4wi1RJinZvAgFTzH6i/+Po5Gb+2Cgt1hyu85Gx8+MgMDePekSA3rSt7TdDp
 S/tQ==
X-Gm-Message-State: AOAM533WULpIWjyZipVvpdBlNdg0k1JviE/B5AJfqA/Ajl8O/kDIe74/
 T1/m9bY3W8IPbYjsBaDYyofaO6CrktU=
X-Google-Smtp-Source: ABdhPJx6CfF6c2R60fH27zan2C3IZHvSnhCqPHsnbkdb3q9Akps9QdVQ+NFCqy70onl0NEqMwOhL8w==
X-Received: by 2002:a17:90b:1d03:: with SMTP id
 on3mr855871pjb.92.1644572063227; 
 Fri, 11 Feb 2022 01:34:23 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id p1sm28340419pfh.98.2022.02.11.01.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 01:34:22 -0800 (PST)
Message-ID: <7d079805-006e-48ff-22ac-d932c14bc74b@amsat.org>
Date: Fri, 11 Feb 2022 10:34:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 1/9] accel/tcg: Add missing 'tcg/tcg.h' header
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220209230030.93987-1-f4bug@amsat.org>
 <20220209230030.93987-2-f4bug@amsat.org>
 <06019c44-0623-e08a-2819-07422c5dbf22@linaro.org>
In-Reply-To: <06019c44-0623-e08a-2819-07422c5dbf22@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 11/2/22 00:25, Richard Henderson wrote:
> On 2/10/22 10:00, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   accel/tcg/tcg-accel-ops-icount.c | 1 +
>>   accel/tcg/tcg-accel-ops-mttcg.c  | 1 +
>>   accel/tcg/tcg-accel-ops-rr.c     | 1 +
>>   accel/tcg/tcg-accel-ops.c        | 1 +
>>   4 files changed, 4 insertions(+)
> 
> What exactly are these files using from tcg.h?
> I briefly scanned tcg-accel-ops-icount.c and didn't see anything.

extern __thread TCGContext *tcg_ctx;

I'll mention it in the description.

