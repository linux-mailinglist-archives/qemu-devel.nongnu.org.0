Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0462B61FADA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 18:10:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os5cG-0004H2-Q7; Mon, 07 Nov 2022 12:08:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1os5cE-0004EM-1R
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 12:08:54 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1os5cC-0001Mj-Bj
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 12:08:53 -0500
Received: by mail-wr1-x434.google.com with SMTP id h9so17267288wrt.0
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 09:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5R80Uub1pz6HbzRYw8c1/4IHWMnbFf6Yc5Ix7yI69CM=;
 b=bX2yOCaOyXJ0bcG0UuQsmybwVBFQc7VM8BhBZ3sKBy4gvVXPRSLKFcnc6oiUP3ihsK
 IkPYDvfaeHqr8mPtcQrz1xqtMRGsgoWSwLXIZEFk0yznt8UPa2g+NW/ecYQhO+0k9XwG
 I59Z73EiYGEg9V61ioDilvaCs605Gd6NU1TIuOeX73cTTU6bkCUUASeiDddpCMWES8yc
 XKjsdopAFFaW9EXxO+aszK0pHgeKXD1cfPufo6GLKfE9IH0r/aio5XOtKHbXWYhQ2XZi
 NSDeZwc7mRP02w3N1/ok3OIoL6rTAfDse/Sx+WiCEs4jJuDfLNX9TEfMPdmlSYAvEBI+
 2r8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5R80Uub1pz6HbzRYw8c1/4IHWMnbFf6Yc5Ix7yI69CM=;
 b=ryeQlXI2ABtyGypSurhQU8w9A/JP9eJlalMTUgVhOhV1ucvLLsTNGD/a32OjY0+YrL
 PzK5JC5Ys5GfqCKDxkQVwxcCMJkp4WPVqBu/gQkcSnShGW1ACFNMjjeSaGATWsMLnfQw
 HDU0xAf+o8Z33tc64Wu3a4V1jAW5VL3crGFKiFFM0R1IHoEAOZs+JjW8PzdSTClokB1D
 7k3cZq+7POIbbGEM7zFvHvf+lobsi+nbf5g1CJ0nCHscHGOZN3c/Rdko3MNpwOaLM1hX
 M+GOHjziEwl9kWLYo7BafCDjK0JmfRsB3VqOjEmVq/74IFPJNix8j2CfrzTEVKp5KFYx
 Xs0Q==
X-Gm-Message-State: ACrzQf3kBpKXdE15eD0Y1Ghx7c0XSRdqbtdvisESz7pd/Jkx3fBW66JS
 chemTCQvDnqzHsQNlvReBn0C4Q==
X-Google-Smtp-Source: AMsMyM5CZjVHECLpHhD2WDBFORFJLErzqXBl2jd1a6KYGaN4xiazlVNhS6Wjqk8/6vdel/MWR6ssgA==
X-Received: by 2002:a5d:5744:0:b0:236:5c21:177f with SMTP id
 q4-20020a5d5744000000b002365c21177fmr31764596wrw.449.1667840930828; 
 Mon, 07 Nov 2022 09:08:50 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 fc15-20020a05600c524f00b003cf57329221sm13353716wmb.14.2022.11.07.09.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 09:08:50 -0800 (PST)
Message-ID: <34fa9010-b654-a8dd-6591-5b0f4aa4e5f6@linaro.org>
Date: Mon, 7 Nov 2022 18:08:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v2] hw/acpi: fix breakage due to missing aml stub
 definitions when acpi is off
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20221107152744.868434-1-ani@anisinha.ca>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221107152744.868434-1-ani@anisinha.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

On 7/11/22 16:27, Ani Sinha wrote:
> Some HW architectures do not support acpi and CONFIG_ACPI is off for them. For
> those architectures, dummy stub function definitions help to resolve symbols.
> This change adds couple of dummy stub definitions so that symbols for those can
> be resolved and failures such as the following can be fixed for or1k targets.
> 
> Configuration:
> qemu/build $ ../configure --enable-werror --disable-docs --disable-nettle \
>               --enable-gcrypt --enable-fdt=system --enable-modules \
>               --enable-trace-backends=dtrace --enable-docs \
> 	     --enable-vfio-user-server \
>               --target-list="ppc64-softmmu or1k-softmmu s390x-softmmu x86_64-softmmu
>   rx-softmmu sh4-softmmu nios2-softmmu"
> 
> actual failure:
> 
> qemu/build $ QTEST_QEMU_BINARY=./qemu-system-or1k  ./tests/qtest/qos-test
> 
> failed to open module:
> /build/qemu/qemu/build/qemu-bundle/usr/local/lib64/qemu/hw-display-virtio-vga.so:
> undefined symbol: aml_return
> qemu-system-or1k: ../util/error.c:59: error_setv: Assertion `*errp ==
> NULL' failed.
> Broken pipe
> ../tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from
> signal 6 (Aborted) (core dumped)
> Aborted (core dumped)
> 
> CC: Bernhard Beschow <shentey@gmail.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>   hw/acpi/aml-build-stub.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> changelog:
> v2: cosmetic commit description format update.
> 
> diff --git a/hw/acpi/aml-build-stub.c b/hw/acpi/aml-build-stub.c
> index 8d8ad1a314..89a8fec4af 100644
> --- a/hw/acpi/aml-build-stub.c
> +++ b/hw/acpi/aml-build-stub.c
> @@ -26,6 +26,16 @@ void aml_append(Aml *parent_ctx, Aml *child)
>   {
>   }
>   
> +Aml *aml_return(Aml *val)
> +{
> +    return NULL;

Can't return NULL, otherwise aml_append() will crash.

We just want the symbol to be defined, so instead:

       g_assert_not_reached();

> +}

