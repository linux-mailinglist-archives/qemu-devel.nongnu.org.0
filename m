Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 054BD476BCE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 09:22:55 +0100 (CET)
Received: from localhost ([::1]:50998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxm2Q-0004UP-1r
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 03:22:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxm0q-00037Y-RL; Thu, 16 Dec 2021 03:21:16 -0500
Received: from [2a00:1450:4864:20::42c] (port=45652
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxm0m-000571-Cn; Thu, 16 Dec 2021 03:21:16 -0500
Received: by mail-wr1-x42c.google.com with SMTP id o13so42570736wrs.12;
 Thu, 16 Dec 2021 00:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vd3H6S1aTLN50ghgeY+AqThH60JIHlU7y/p5g+hOCtw=;
 b=iUpuRpsyaR1OVM4WLlZ0BYErCd5GU9G97eDzpl+pSv/sA1nrdYjYEIgEKSdsU9DSVK
 1ODSeucwDIcKnobEyICDEXwuZmv7o0hKPBFMAl4+mJFEFAjlsumAvsM4kbFl7yLdsiB8
 K21B8gwF/zv2XDexeeojMDsjI4NDIHBloij5hA+kLtdpPnqpPveS7GUh+7siF4XTTXbh
 O9VLlnBfFDqCKpug/a8arFPM9zwTDGBPmXVItDjcu5wWUKMMgSS4WgmoDcoSGyEMbg4b
 r2roPedQNan5clQQ5FSfosPjWIYKuZBnEO6uEhcHJTHzuMVmN59evjpWB2d1uCdHGHrT
 O9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vd3H6S1aTLN50ghgeY+AqThH60JIHlU7y/p5g+hOCtw=;
 b=wKtakj5CvUPErjZMtwRg/UsDQVz2WWXb3OY0qQoEzybtKPMqkZm1eHAGO9zmfII9ea
 TkptPtlboVeEt9oaT8oiv0HrkD6yRw11tc6k4EhcsRbYup81FyD+M0zggU1+chAhPqWY
 QophFmom2yrm3x0gDQMg4M6/2S5LrG3Ze1pX3Am7uvFPHTDP837SK8Rld2tdN15Fo4OA
 R5DAH1sH/YTDfk9RqLUiedsY6+BpKG7hcCgx/6NiWwMeTXZqZDarl/daAKDYHGA/lZjO
 /EBNWaktOFNEQFsH7je/X4I+Bhi9wEX4QAkxMwZkl6r4SChJITg5wWbZlU4X4gMRYx9T
 6E9w==
X-Gm-Message-State: AOAM532Fjl8kVgZw1vMQRnoE0Upg+OtmSGwPJ7FSFaZkfIcRmuu+UcDq
 dZN9QgISoqBQjru1pYbjdgU=
X-Google-Smtp-Source: ABdhPJx2aDKdY/BaP7v8xBTiPW45hZ8bbIkrSvAmDJWdEV5jIPEFzA9dBGMICmQujkio1i6xnaPPSA==
X-Received: by 2002:a5d:61ca:: with SMTP id q10mr7830083wrv.102.1639642870715; 
 Thu, 16 Dec 2021 00:21:10 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id u14sm4273327wrf.39.2021.12.16.00.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 00:21:10 -0800 (PST)
Message-ID: <dca5a41b-858d-1270-1105-54fcee7fecc8@amsat.org>
Date: Thu, 16 Dec 2021 09:21:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 2/2] hw/arm: Add Cortex-A5 to virt device
Content-Language: en-US
To: Byron Lathi <bslathi19@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, bslathi19@gmail.org
References: <20211216064820.61342-1-bslathi19@gmail.com>
 <20211216064820.61342-3-bslathi19@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211216064820.61342-3-bslathi19@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.034,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 12/16/21 07:48, Byron Lathi wrote:
> Add the Cortex-A5 to the list of supported CPUs by the virt platform.
> 
> Signed-off-by: Byron Lathi <bslathi19@gmail.com>
> ---
>  docs/system/arm/virt.rst | 1 +
>  hw/arm/virt.c            | 1 +
>  2 files changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

