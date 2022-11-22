Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D002634B04
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 00:22:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxcZG-0006ES-Rd; Tue, 22 Nov 2022 18:20:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxcZD-0006E0-MV
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 18:20:40 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxcZA-0001Gk-BF
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 18:20:37 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 l39-20020a05600c1d2700b003cf93c8156dso188402wms.4
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 15:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XzQwYd0ljDCD2BD7q4+PBjSP8BSDYJnldGVr+EVDcOs=;
 b=WRKbGUHX0jVNMvQJ7PVXNud/OLPrzFRBu6eiZRwCP/gcoT1ULdsc1T3oeChIPAI1x7
 o/hGe+QspM3iXSnfg05KH1sxHfKG1jXfII1sKImUNocndK7k2S+vBx4o2ogSJwpOeSUa
 mtFLTCSio/vJ1RGzpSJQjPHi3Uxikh9GHU/eDiCCbA6DpnOPYgSnHC9VS6+5R5Va0vQQ
 WpS592kZZ0oe4y3wRp3lTL7DEMneiLTmmn3rs4R8N9vr7ZNXsWIFSgv89WS53lmr7qc9
 ZNh1TQI41FJ8t6QtS05z7zf8zyyZYrNGFcOuldPszKIIk7sWM3/cCZ9MIk/r/acpBNmD
 rkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XzQwYd0ljDCD2BD7q4+PBjSP8BSDYJnldGVr+EVDcOs=;
 b=kMBuKqsDISprhAuq9qbqHRZvDB3J2agXgWw0UhsutKR17un9K2r33SCK74BD6ThBeY
 mDVyL3jLk/yWnjaPJ0qzm6Gq5Mtr6mxSnMFLNtNY59frCt34RFzsZoBV/YveK52HCnTC
 CBpdiBy5vN4KNq+wPq33FKQja1EOrvSu69HMZmgOkLSJS2pYi43uDHo9GtKvYvg9CjkM
 9MGNozPj9khRJteImaUbu0sFpZpRwHVNdc5vNpZ5zJEI0isnfAmE/Hj4vvhIzNr3oJGn
 kHAZorI1rke5gyScj23TlmeptdkGaKRKEnD0RKTi6hSTFi1ECoZT2lwLxRmSYYoOIRDo
 QGUg==
X-Gm-Message-State: ANoB5pmDz43eFXTWllzy1F31iGmPgnN3jNkCFgmUo7ttolrcTWW4kNU9
 4il0s4RzSyI9b+E/x5+m5pMbQQ==
X-Google-Smtp-Source: AA0mqf5OByZQWnjj8/YPnIbRfNSgDsm0SYFnV8i9FKvWH1As40/AcbVTujfiCz/aqDZZo29CwYPfoA==
X-Received: by 2002:a05:600c:3652:b0:3c6:c013:9345 with SMTP id
 y18-20020a05600c365200b003c6c0139345mr13669033wmq.172.1669159234624; 
 Tue, 22 Nov 2022 15:20:34 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t187-20020a1c46c4000000b003cfa622a18asm275221wma.3.2022.11.22.15.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 15:20:34 -0800 (PST)
Message-ID: <d1983f26-c272-cb7b-2568-bddd10676654@linaro.org>
Date: Wed, 23 Nov 2022 00:20:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/7] qemu/main-loop: Introduce
 QEMU_IOTHREAD_LOCK_GUARD, WITH_QEMU_IOTHREAD_LOCK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, alex.bennee@linaro.org
References: <20221122205739.603510-1-richard.henderson@linaro.org>
 <20221122205739.603510-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221122205739.603510-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 22/11/22 21:57, Richard Henderson wrote:
> Create a couple of wrappers for locking/unlocking the iothread lock.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/main-loop.h | 39 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)


> +#define QEMU_IOTHREAD_LOCK_GUARD()                              \
> +    g_auto(IOThreadLockAuto) _iothread_lock_auto                \
> +        = qemu_iothread_auto_lock(__FILE__, __LINE__)           \
> +
> +#define WITH_QEMU_IOTHREAD_LOCK()                               \
> +    for (QEMU_IOTHREAD_LOCK_GUARD();                            \
> +         _iothread_lock_auto.iterate;                           \
> +         _iothread_lock_auto.iterate = false)

Nice, thanks!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

