Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54D66AF6D7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 21:39:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZe5k-000441-EI; Tue, 07 Mar 2023 15:39:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZe5i-00040B-5Q
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:39:22 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZe5g-0004bx-P0
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:39:21 -0500
Received: by mail-wm1-x336.google.com with SMTP id p26so8612544wmc.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 12:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678221559;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fsvX7xMr2C4RwleQpBCzme5Q1yRxqK3Cguvci9S3CTg=;
 b=lnfGrRj1KZn9kgBOvKQhtCitGzmucBi4A5diiVPZBZyyF3fndDFVlGY1S5HD8CXOKU
 PYFCLyLZW48ZEJpf/+SDkbWiGIM6A2A8gpuWAQTrNFVv5Nvz7t8YF9n41xLvj8SSPCEA
 Lil3pAs1D0ncq1tGJe3kGTpwIlHmqz1wKhdEgxyMN6/WLHFKNKBhQw+BN/2PzWA/YFSX
 T+mRcGoKuzv+RIgkv7O65phfLbGSG/ypiS3+1w7doT0/3ECLY0DXUS/neHnhmiu4hiEI
 yBo5k4Ncf8sY/3VDeGteECPObraFVdH7RIUPXgCGeP+8qoGHqhaEXRpDftuGE8bh306L
 kunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678221559;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fsvX7xMr2C4RwleQpBCzme5Q1yRxqK3Cguvci9S3CTg=;
 b=fd1P3hX/CaQqVO4cwjN+5zOhAqnNxIYDZ3BW4HGYeVeaRaq9Vi+/gtm9DIEbddRwEN
 iH9eoA1aDUUJRyNSdvBFs7a+FbcJn4dsIS+MU4096Hmc0teEhi6ka+IdFaLEPeQsezU0
 r0la367uJ6Olqjx3T50FX7GOQ26jxF8BmbK62C47pZLdh0QkBKbYU0x+vH+yMHUg1hw8
 gWeOcgC7ERqFcP6dCktyBmi8duUlUuLmpwXpPR6dAxJL6qro/iJ/Sl7wmXiM7Jny/wrh
 /fDIeBJAqje3ETeFtGpumZINy/x9CbdYhG0aKijKXm+UzrB1A/QKkob0UKKiGEzKDCwJ
 KRRw==
X-Gm-Message-State: AO0yUKV/hv4cPso1HHKBWfVOamu90qnZY5YFjBLXQLFQejupgbzZWtei
 8u+k10DDqOn6vZiVp8S6fD8Uvw==
X-Google-Smtp-Source: AK7set+Mbp9lAYL18OYRAK5E5GtExwmBLGXI9vUJm4eIcy+I0u3BP0x5ot4lvPrGuf6S6ms8YlDeCA==
X-Received: by 2002:a05:600c:45c8:b0:3ea:ed4d:38fc with SMTP id
 s8-20020a05600c45c800b003eaed4d38fcmr14985809wmo.31.1678221559197; 
 Tue, 07 Mar 2023 12:39:19 -0800 (PST)
Received: from [192.168.1.115] (126.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.126]) by smtp.gmail.com with ESMTPSA id
 t25-20020a05600c329900b003eb5ce1b734sm14478463wmp.7.2023.03.07.12.39.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 12:39:18 -0800 (PST)
Message-ID: <7a489b63-dbd9-9a99-5878-dfda2c98e9ad@linaro.org>
Date: Tue, 7 Mar 2023 21:39:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 6/6] monitor: convert monitor_cleanup() to
 AIO_WAIT_WHILE_UNLOCKED()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20230301205801.2453491-1-stefanha@redhat.com>
 <20230301205801.2453491-7-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230301205801.2453491-7-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/3/23 21:58, Stefan Hajnoczi wrote:
> monitor_cleanup() is called from the main loop thread. Calling
> AIO_WAIT_WHILE(qemu_get_aio_context(), ...) from the main loop thread is
> equivalent to AIO_WAIT_WHILE_UNLOCKED(NULL, ...) because neither unlocks
> the AioContext and the latter's assertion that we're in the main loop
> succeeds.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   monitor/monitor.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

