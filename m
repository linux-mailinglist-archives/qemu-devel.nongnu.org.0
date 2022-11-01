Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ED3614E5E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 16:31:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprW6-00034I-Sz; Tue, 01 Nov 2022 09:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oprW4-000338-MA
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:41:20 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oprVw-0005oe-Sw
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:41:20 -0400
Received: by mail-wm1-x333.google.com with SMTP id t4so8868616wmj.5
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 06:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YPSefXiqB1hPGtveeIz7JYQzASvi/uYjJwubaWw50fc=;
 b=Rm8Ooj0jL8oYmqAyavWFVniw+HNmzEXZPxVYG1hYNBXOehCG/e/RnwOxjd7ur6JXdM
 fkn9BtoYplWncD73cy2yoLNoeGpOe+vlEVYSj4o0bzTpYBaPIzs6YTeK1/cqZAbQWfHg
 6tsfFkOx+lzBVPATUJ92RV2wdd8x70EH1ILQEgQYDnsgOq82giyJks/jRcHV3AUWraPV
 WEAZC95ucQdAkhhhjgNZhkFJm6svfoov0GUFzZ7c1OX0AOMqyoMrO0XbDM075yqyNfE7
 8CJ+btB6VY4vi3KRIBTZyZcU/ejQFgvuP2FqyKnS859ouzMFepz0qaQCmA+shxGqmZSc
 ycwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YPSefXiqB1hPGtveeIz7JYQzASvi/uYjJwubaWw50fc=;
 b=SZnYZnyypTybusxN4oErThNoRYLbS6aWQbDdNCRCBYmOvU6J7hSxqel3ehWhACSm3F
 AVQrLvkcgUOsu8WM8u8FVGLVyJg8vfNC3iLOU0gqysbZHeWT/EBLuit7bKgtPNldFVwI
 oI8icXou43vorXx+Ox25nVACmWSVJT7NnRj+W96GTZX2gixsXIa7gZv8SRN43coNMXw4
 eA5jrXkstJuKIHbywfkxDs4SKh+XjKJSEn9chj7YtOt7vCCSYsuTizEVIBqqgP1p+Oz1
 cBRbwfpu0130TTSvbFQ6vkn0SSswK2dV9FLYeUbPf6eeLPwaXtnj/ROCpU/zHSfV1N+b
 xEBg==
X-Gm-Message-State: ACrzQf0gjZlX/lTrcuD0laaxlq43Gua80vmSBQkqKaHIlPhdYU8alKVv
 +4tBDqBX75BVHAfofS0/1YL//w==
X-Google-Smtp-Source: AMsMyM7dc46wcNEK/DZcKMnCqC0eknZ7ZsHCoFLk2GjPRl5j2kGkS1otQkMWxQ64EZR/lgp4jrr+0A==
X-Received: by 2002:a05:600c:2314:b0:3cf:6b2a:7d93 with SMTP id
 20-20020a05600c231400b003cf6b2a7d93mr8936494wmo.33.1667310071310; 
 Tue, 01 Nov 2022 06:41:11 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e7-20020adff347000000b00226dba960b4sm10222248wrp.3.2022.11.01.06.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 06:41:10 -0700 (PDT)
Message-ID: <f9289746-f2e2-fb36-4adf-045e0dd8cb6a@linaro.org>
Date: Tue, 1 Nov 2022 14:41:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v4 3/3] util/aio-win32: Correct the event array size in
 aio_poll()
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org
References: <20221019102015.2441622-1-bmeng.cn@gmail.com>
 <20221019102015.2441622-3-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221019102015.2441622-3-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 19/10/22 12:20, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> WaitForMultipleObjects() can only wait for MAXIMUM_WAIT_OBJECTS
> object handles. Correct the event array size in aio_poll() and
> add a assert() to ensure it does not cause out of bound access.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - change 'count' to unsigned
> 
>   util/aio-win32.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


