Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2752C6A94C4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:04:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2GD-0004EB-Q0; Fri, 03 Mar 2023 05:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY2GC-0004E2-0P
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:03:32 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY2GA-0005he-Ds
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:03:31 -0500
Received: by mail-wm1-x32d.google.com with SMTP id p16so1202557wmq.5
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 02:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677837809;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KpEj2OTkrfDzX5Dql/Ca4gf1Qdubi7p7BI780UINR5k=;
 b=bcZ/A+ULKeORTGlyYUUmfjtKzmilnNZLQT5tCYT5nLVgzMWablDwrtpZri4Jd/9q/A
 e8dwCrD8VtqrbNl/aCLcXhCKUaic587q1RqoYZrwW2S1UUzKzAjL4avWqTs6HhAIx7bz
 LKIIj8+tLeVyxjABJshaYWZIAhDaTjEVqLcUtVPcFFMam/E6ieSmKGojgjKQFfpPaTj3
 qmbeEUBZwLur0WeOPXzSXkp4ee7QxrtY/pOdfEqlMQGwer8uBgqo1HkQXH4ifGWSkIzv
 ZfFXs8EXclTZfU1x5nIkFHfCYFBDeXhnWtnVFMEevCoKG0yz3PYhieVT4eerTi4O7GYh
 Ymjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677837809;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KpEj2OTkrfDzX5Dql/Ca4gf1Qdubi7p7BI780UINR5k=;
 b=FGOuk/pn8ecgPHqZ4K2NLDNDsaQPQNlXgsLUS4DwcptxppcNwdAYPwCRuxwFYEGlNl
 FKPLCNwzlTFMNzM8+LQnG8WMtfFtrQUGnt6sKQDS310iCHGrvBGgA2xto94R8kgAepLa
 85OVwB7vJn3CXY5ZtZt7BkvfT5H7tngrq3MqSwHtE7k1hiCM4SXglDbEnvC15fri12da
 lIToWxoBekrV1xuaBBHo4yKEqqrmH0oA75qyfcGs0ebYqmLfqy2c5UZUd4UCXadrMJd6
 nUTud/PJ+/vzKNbmtJa/5ySYjDuN3njoK6bRMjs0VsIBqk9njfMlPNZmZUWRGEqhGb90
 t8mQ==
X-Gm-Message-State: AO0yUKUM29CVcntq/xVuoUpkefSZlKOMHXW9AgKoNrq400oEHUnXoFpE
 kkeY0DlvZhrn1f28JEl+ah4Z/w==
X-Google-Smtp-Source: AK7set+8KetItfmuLlSbEeMaYg7+rREA0AdKQkqMFq1usGfkYiTs1e9xGnv19SMb4y5+xQl3aJP1Aw==
X-Received: by 2002:a05:600c:4f53:b0:3ea:e4bb:4e84 with SMTP id
 m19-20020a05600c4f5300b003eae4bb4e84mr1040708wmq.20.1677837808742; 
 Fri, 03 Mar 2023 02:03:28 -0800 (PST)
Received: from [192.168.59.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 r39-20020a05600c322700b003eafc47eb09sm1835865wmp.43.2023.03.03.02.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 02:03:28 -0800 (PST)
Message-ID: <ef261447-8a9f-316d-83f4-036da85edd2a@linaro.org>
Date: Fri, 3 Mar 2023 11:03:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 4/6] Add the aehd-ioapic device type.
Content-Language: en-US
To: Haitao Shan <hshan@google.com>, qemu-devel@nongnu.org
Cc: Haitao Shan <haitao.shan@google.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:Android Emulator..." <emu-dev@google.com>
References: <20230303022618.4098825-1-hshan@google.com>
 <20230303022618.4098825-4-hshan@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230303022618.4098825-4-hshan@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 3/3/23 03:26, Haitao Shan wrote:
> The aehd-ioapic device type represents the AEHD in kernel IO-APIC.
> The irqchips should be always in kernel when AEHD is used.
> 
> Signed-off-by: Haitao Shan <hshan@google.com>
> ---
>   hw/i386/aehd/ioapic.c       | 164 ++++++++++++++++++++++++++++++++++++
>   hw/i386/aehd/meson.build    |   1 +
>   hw/i386/pc.c                |   3 +
>   hw/i386/x86.c               |   3 +
>   include/hw/intc/ioapic.h    |   1 +
>   include/sysemu/aehd.h       |   4 +
>   target/i386/aehd/aehd-all.c |  14 +++
>   7 files changed, 190 insertions(+)
>   create mode 100644 hw/i386/aehd/ioapic.c


> +static const TypeInfo aehd_ioapic_info = {
> +    .name  = TYPE_AEHD_IOAPIC,
> +    .parent = TYPE_IOAPIC_COMMON,

Instead of duplicating TYPE_KVM_IOAPIC, as a first step we should
extract the common code in an abstract TYPE_INKERNEL_IOAPIC object,
then TYPE_AEHD_IOAPIC inherits it.

> +    .instance_size = sizeof(AEHDIOAPICState),
> +    .class_init = aehd_ioapic_class_init,
> +};



