Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA8B5A0EAA
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 13:05:41 +0200 (CEST)
Received: from localhost ([::1]:52142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRAg7-0001Gq-Qz
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 07:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRAaE-0007X7-Rh
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 06:59:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRAaB-0006Wp-GX
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 06:59:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661425170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1JPKUtXtDw0Y5mx61W9hdRo5tu/MmSWvnG+4wukjpg8=;
 b=iqOs9vDAhXIrtOvW/2nNzvBr/KmlFKrQm0jk2HbsOWw6w10pana1WKDgsgtViVhMqbVpOr
 gm7aU03Ch3WXN8ox5+XMKVmXS3EeKG8mL/D0ftJEmzwgBaop1Khh6HKk0zrPsnNTpWOWwf
 6VvyeTFU4YyVcA3MYEV70xkOaVRk6PQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-44-WhhIYt0XMaa_edDqswbKdA-1; Thu, 25 Aug 2022 06:59:29 -0400
X-MC-Unique: WhhIYt0XMaa_edDqswbKdA-1
Received: by mail-wr1-f69.google.com with SMTP id
 v17-20020adfa1d1000000b0022574d4574aso681468wrv.22
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 03:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=1JPKUtXtDw0Y5mx61W9hdRo5tu/MmSWvnG+4wukjpg8=;
 b=Ir/QcyR1Ofxpwlbtda0awHzzRqzg/skle40CPhrVtVfWSQ8lVkMbrQpzjqnrs75v0/
 vn1nwDIqxZ5h1dmP7nHIdF0MYee21HQtALJef6ziSoNuXveciauE/2ZOGRZuA1K5jgCf
 PfO9a9WhG0BrQVHYO6JtbCwViGh5+T07s85a3cEkJKg80UnX4Hueg/NUZkm2LXWSFHzv
 vaXANp+inyGY7E6FxYm3YK9mOYGnhXwT2WfHN4VwWfLzBdGzEZCYIHN1s4dzSmYImZFp
 n3Aqx16vm0TyXo+WwgunTn0FUsKmT/qwSoRBcvtF9YNIiD+G5Q8Z4Nm1F1oA4OAwLYkD
 BfrQ==
X-Gm-Message-State: ACgBeo1sbk05CuJQHlWYhRqmRsMaA4oUvmPFSkLmytbCVflXhC0P0Q0W
 k9Ve5TFD/GITCrMYJGJHoAJ1ZtArqXp8ncHPvxxWbj/t++XIK01VnP32Voetmr0q3qOQgUU1RSN
 ogptkYFKDqvCgpuA=
X-Received: by 2002:a05:600c:3c8a:b0:3a6:7719:6118 with SMTP id
 bg10-20020a05600c3c8a00b003a677196118mr1964538wmb.199.1661425168421; 
 Thu, 25 Aug 2022 03:59:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4Jl1zgChMtlTi8yQ4yjIyC18u07tHsw10rytrksQ/zQuLW+A6wgC4N9AK8Iz6qR9qnWzE45w==
X-Received: by 2002:a05:600c:3c8a:b0:3a6:7719:6118 with SMTP id
 bg10-20020a05600c3c8a00b003a677196118mr1964523wmb.199.1661425168137; 
 Thu, 25 Aug 2022 03:59:28 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c418500b003a5f4fccd4asm4511530wmh.35.2022.08.25.03.59.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 03:59:27 -0700 (PDT)
Message-ID: <4d2c07b5-cff1-d7ed-ea6f-b1ee49675697@redhat.com>
Date: Thu, 25 Aug 2022 12:59:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 16/51] tests/qtest: Build e1000e-test for posix only
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-17-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-17-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 24/08/2022 11.39, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> The whole e1000e-test test case relies on socketpair() which does
> not exist on win32.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/meson.build | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index be4b30dea2..9d0f82bf1c 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -239,7 +239,6 @@ qos_test_ss.add(
>     'adm1272-test.c',
>     'ds1338-test.c',
>     'e1000-test.c',
> -  'e1000e-test.c',
>     'eepro100-test.c',
>     'es1370-test.c',
>     'ipoctal232-test.c',
> @@ -267,6 +266,9 @@ qos_test_ss.add(
>     'virtio-iommu-test.c',
>     'vmxnet3-test.c',
>   )
> +if config_host.has_key('CONFIG_POSIX')
> +  qos_test_ss.add(files('e1000e-test.c'))
> +endif
>   if have_virtfs
>     qos_test_ss.add(files('virtio-9p-test.c'))
>   endif

Reviewed-by: Thomas Huth <thuth@redhat.com>


