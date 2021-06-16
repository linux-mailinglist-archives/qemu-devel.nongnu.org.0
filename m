Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE14A3AA34B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 20:41:28 +0200 (CEST)
Received: from localhost ([::1]:50874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltaTf-00009E-TL
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 14:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaRE-0006tV-UF
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:38:56 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaRC-0001pW-3i
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:38:56 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 fy24-20020a17090b0218b029016c5a59021fso4565343pjb.0
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 11:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wrU5U33zblwrY3mMuU7yRTruyxE79AwBgc+LeGDdVZI=;
 b=BlTZr+k3bQ6wvt5Cn6d0SkXjoLBDytFANUrpV1a16x0R1RlxYbhUENRB8aDz4TRnMI
 AeWJUMv02NZdWEWaO7SYfOKUVCBXK7zf6ocb+I8e4Tu/k2qFYbwTyiB2HK+w0iE1BFzp
 oWuZlIuMSJLV450p7HG+vtRsU6aheT8Ihpu8MKYZvmhh36KBqhCFhp8dOD/po0Tido4E
 psoCFRQ42zSNNaL6qF5F1TzxqfH29UIrZDzu5UXW7fLd4bofSLkMllmJo0QR711hQce0
 7BPNSJcf/rvDbvblCVFKv+Tlf9WzpowfGOKl+jTsvnKvrSrhq/d8qZWeHtpCyx9074Mr
 itow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wrU5U33zblwrY3mMuU7yRTruyxE79AwBgc+LeGDdVZI=;
 b=hs9b8MEpF4KtsS9vupzNQBrAWjdB/b9PHgwcDDomWOfWFridqBptTX3USye7V1BChv
 Nd6yGeeS81Re0U0kTDCDfoVn6koUUsKTCusnsgqiTrouczlnR/l1DISyAwnwFNP1xdLY
 fKuNg5NibSnegHn1E8bqkSk7Vt3NsBhSin2RYanXEFnIsPGZUvHTOBQLRbGw4a90zUPz
 B2/7KXb7qz5jKH6swKWDtNvc7iOsUHfoOGbK/3OInOYTymZJ/dIAwqPNH0/HSm3XDQfx
 IQuNr0SHYFo1VnTv3bAO1bxLmq4SVHAX7xMIiCvlHV9BUnvyKMiBonbHFo+rZkXT9UNq
 jx8w==
X-Gm-Message-State: AOAM533CoiSTm5MDxWmex/COZ3w7vV0L3aVJcCmzq3fNt2q7Er+q16jg
 cte/RSW6STs+HEn1K2nrme2y3A==
X-Google-Smtp-Source: ABdhPJw4vmC9zpmuFbWBimuDkY55LEb4b/JXbWNIezIXXzgO+j2cY+ZHrq6sIhEf7bdJm5lB+qsqig==
X-Received: by 2002:a17:90a:a40a:: with SMTP id
 y10mr1170241pjp.151.1623868732603; 
 Wed, 16 Jun 2021 11:38:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 r4sm2817037pja.41.2021.06.16.11.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 11:38:52 -0700 (PDT)
Subject: Re: [PATCH v3 01/13] hw/input/lm832x: Move lm832x_key_event()
 declaration to "lm832x.h"
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ac4302f3-9dad-45e0-50dc-3114509448d5@linaro.org>
Date: Wed, 16 Jun 2021 11:38:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> lm832x_key_event() is specific go LM832x devices, not to the
> I2C bus API. Move it out of "i2c.h" to a new header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/i2c/i2c.h      |  3 ---
>   include/hw/input/lm832x.h | 26 ++++++++++++++++++++++++++
>   hw/arm/nseries.c          |  1 +
>   hw/input/lm832x.c         |  1 +
>   MAINTAINERS               |  1 +
>   5 files changed, 29 insertions(+), 3 deletions(-)
>   create mode 100644 include/hw/input/lm832x.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> +#ifndef HW_INPUT_LM832X
> +#define HW_INPUT_L

You fix this error in the next patch, but better here.


r~

