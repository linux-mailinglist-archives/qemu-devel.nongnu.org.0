Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548A365E03D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:51:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDCB1-00023P-S8; Wed, 04 Jan 2023 17:24:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDCAy-0001vI-SL
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:24:00 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDCAx-0007B4-8l
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:24:00 -0500
Received: by mail-ej1-x62a.google.com with SMTP id ud5so86155516ejc.4
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 14:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DIkypwTaaWTlckWXQefPtrQkiwOP24I05HAJaAq06ag=;
 b=wJ974XB9BpxMBe9Pgnchlz+l4L1HTk4gyKGA9Fj0dys6orTWN+EGeH15zw2PFmtIqe
 Xpzr/2jfkkU0//NwoZRldGuqXMDpHXpgIcLl2sQbvlmJRIvGfWFaKBSWNlMmwrSDcSES
 W7xTYPTCvtP9NE7YfD7Sy39Fy0DUDBgjP8Wa8H/5b8LqNOMQPSPIafi2OBV2DFc2AFz4
 EVfpe8rGvE7vLtYT6qanTlDrH49Fi+msm1iiChE0OsTxBV6gkfQKgFQ0g/VuakyPDj6+
 l6TRkmhAsRSc84Qtm1TDx79tHFy6NoiXu+aZpyjQCjTx3jz9BAnDJbz7/CqD1MBqnchL
 8RGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DIkypwTaaWTlckWXQefPtrQkiwOP24I05HAJaAq06ag=;
 b=eOZYd9tIchfoRytsSSkxUwpsnqlqf4/A8g4Qxay5/jN5eevHGHWZHxF5nVGb8q50uH
 nhjUhJliMtwvd2fORyecA1BK0IpZwJAYz5I9/D6MsdNRjP/ZxtTW+DyNqjOroZ3JEvFh
 wALwKxJHPFN8sJE8SbE5iUOt0CmyuR+Mtf7vt7lXqpytiiMbOZMnMD8I60gWTZ2eWq2E
 EqKlQ17GJ5C0EDkqhtiLrBMnuN6iIzcmweYRM9YLa4QU1e21M/eU72iLH5KVviSLDQW+
 C9c4Ywdm5bfjyVghfhmrtsGkfCMdzv7W5AiG56GacAZ28b6qisctGyGFR7T9janpy5re
 DUgw==
X-Gm-Message-State: AFqh2koKhSLy7LqHxWQKYYCbCuadRMF5mR5oJMd0vHz4PZRuYTKQw3ZZ
 X842TTtpLLflCfB8bzl7jt+Xww==
X-Google-Smtp-Source: AMrXdXscnnFLjpXh0r03eNcxCaiOQrTTjyYml8FdPgN4eLCvrx7hJfLKULXGQX2oBHQeRgpRSANirQ==
X-Received: by 2002:a17:906:8447:b0:7c8:9f04:ae7e with SMTP id
 e7-20020a170906844700b007c89f04ae7emr42606095ejy.22.1672871037797; 
 Wed, 04 Jan 2023 14:23:57 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a170906181200b0077f324979absm15602113eje.67.2023.01.04.14.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 14:23:57 -0800 (PST)
Message-ID: <d08701a5-a9ee-2392-6218-764411af54da@linaro.org>
Date: Wed, 4 Jan 2023 23:23:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 12/27] target/arm: Add tcg/meson.build
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-13-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104215835.24692-13-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 4/1/23 22:58, Fabiano Rosas wrote:
> This introduces the target/arm/tcg directory. Its purpose is to hold
> the TCG code that is selected by CONFIG_TCG.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
> We could squash this onto the next one perhaps.

Yes please.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> ---
>   MAINTAINERS                | 1 +
>   target/arm/meson.build     | 4 ++++
>   target/arm/tcg/meson.build | 0
>   3 files changed, 5 insertions(+)
>   create mode 100644 target/arm/tcg/meson.build




