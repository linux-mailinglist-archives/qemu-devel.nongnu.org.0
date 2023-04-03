Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B27D6D3D89
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 08:47:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjDyN-0005GN-HP; Mon, 03 Apr 2023 02:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjDyK-0005CT-HY
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 02:47:20 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjDyI-0005Vn-S5
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 02:47:20 -0400
Received: by mail-wm1-x334.google.com with SMTP id o32so16403771wms.1
 for <qemu-devel@nongnu.org>; Sun, 02 Apr 2023 23:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680504437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bzzLjPOVJekzQiroNqtERACRS1+dfTXmnzvGJF3Gr5Q=;
 b=KskBoeGVQX1H1UUjR7JQW+InFiHUQZc5G94HWJVpiFte5jeFBy2PRHQRO8YXu/QdWS
 ojBxHK2Sl/u0N8UX1mJC5SyXfyb3eKt20ZPUPM0F08Js3XOU74sXHmDJ6CcVqqmzjLnO
 ONc5iIJwiiJ1sDz/Cj3C/z7yUVBNun71UaN6NLLz2/B9fO/9Fmqg+6EkRhCKT7D4qsmX
 WlFjfydyk/ApDCXvIHAIi94x8I4bEK3JPfI9QFsWS9OonaNBGSYR0E2ThW5NMnxKwvRU
 V5QV4BTUkSbt723J2uVknUKZRy4+S3HL8AeCgG799zNNQLX4aSZYFuHRgYsSbXXvUDCp
 4QXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680504437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bzzLjPOVJekzQiroNqtERACRS1+dfTXmnzvGJF3Gr5Q=;
 b=wl+qMr3cHesSIcD7L4seJDLC+xXsIsLiZGAutSElAdfCa77j8QfHAfnM8DsuTPEbKR
 ipbFD2DCBacnl5g+LXfC2SpQ+ZQEG/odS+nSE7tS5GDTe0vmsUqivmpyJKXPcPhuX+S7
 asynqAaPAEJL8qE98g+wjqMEEOokQfg8eDIgd1J1BdDzjua1tbPU0dubCRbX78Jyn+IF
 SwGjqZ8YP35EYczz7HRV1oki/9k2DCjUfLFepKgASkJXJvA2HxisYXjWuRRo4KJobUCW
 RtTmxCnIySPxPyr+a13w9itBoEQ4cKCEfiL5CGSkGkFTw0p0ttqk5qOq4ThAegBYVnJ1
 w7xg==
X-Gm-Message-State: AO0yUKVVwTUKtKA6Jwpw9LyQ2SGxgABTzYQqJlQrT2UR44/K5g7d441j
 6pMIlYwG2cezSXeVL+m+V24SV9M08AJguA0bIgQu6w==
X-Google-Smtp-Source: AK7set8bW2ocsv75tInPN2kUo/baSs6AEDjYiSSO7lYAqWRap7fBQhQKmcmuLboNLevqHfOuT7dYTg==
X-Received: by 2002:a1c:7516:0:b0:3ef:3ce6:7c69 with SMTP id
 o22-20020a1c7516000000b003ef3ce67c69mr26177581wmc.8.1680504437343; 
 Sun, 02 Apr 2023 23:47:17 -0700 (PDT)
Received: from [192.168.127.175] (246.red-95-127-42.staticip.rima-tde.net.
 [95.127.42.246]) by smtp.gmail.com with ESMTPSA id
 p1-20020a7bcc81000000b003ef5b011b30sm11096052wma.8.2023.04.02.23.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Apr 2023 23:47:17 -0700 (PDT)
Message-ID: <b5a42c93-4f04-1229-8fa3-8fe2beeb1ec2@linaro.org>
Date: Mon, 3 Apr 2023 08:47:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH trivial for-8.0] hw/virtio/virtio-qmp.c: spelling: suppoted
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>
References: <20230401085140.2691965-1-mjt@msgid.tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230401085140.2691965-1-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.37,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/4/23 10:51, Michael Tokarev wrote:
> Fixes: f3034ad71fcd0a6a58bc37830f182b307f089159
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> ---
>   hw/virtio/virtio-qmp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


