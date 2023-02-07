Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6524668DB8C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:33:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPP1M-0000XW-Qq; Tue, 07 Feb 2023 09:32:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPP1J-0000WV-44
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:32:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPP1G-0007ox-5x
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675780344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2KNl7/RT8ivNgYFG7xjIKTZlEz/8iaqEFHGju9JP/dY=;
 b=ScJ+bPWOm3YjsjwBTqB+yKkobarA36lMnLj2gyEw9XimA9hPJDNQXJY+6DvybUGkFKbf5v
 3gDBdwUWnonD6+9pDoV4SWlmMpuDK7ZULmodLMpbZHF2Di+M6AQZtcNNlZUqOLj7CbtkI3
 hJVyOXK677OU04XX7z25ugbfykbWlfA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-163-JLZUdZk4MPCF9PrnSlG86Q-1; Tue, 07 Feb 2023 09:31:45 -0500
X-MC-Unique: JLZUdZk4MPCF9PrnSlG86Q-1
Received: by mail-qv1-f70.google.com with SMTP id
 ly4-20020a0562145c0400b0054d2629a759so7746787qvb.16
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:31:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2KNl7/RT8ivNgYFG7xjIKTZlEz/8iaqEFHGju9JP/dY=;
 b=jd61ESc2S/+Qm40KD3hfvb/tl8rwZY49et1E0Itr0ZlGVsR2TURfJUbeIobcQrsXdL
 BRHtIy8D1W7F8UbAMcN/hdd2xktXuBPzBWYdnb8XhvHYAB2W9PeOxXMnODMLkG3QWvFi
 HYEuU6X0Tr++8WppTnM4nXG6eZoM+6HdjIIJjsy6nPpXjqfGtH6nMicLwNQwI3CvyV3L
 4OkmH7F//my6QYLElc+VlWGtVYs8reGUdMc7MSwA63hPxUtU4RmDY6OOabdHFnzOHhOO
 t08rfskjae0DLEouireN+N+J5NNg9enzOqgmjThkbJ8E+GGFjY8Dr25DqKmsCts35rq/
 VgcA==
X-Gm-Message-State: AO0yUKWc1z5VCKV8ePSbH4Nj/RVe0pGJXEjDcdvF5C2WizIz8iPvVCON
 YC3Nyvtn2AozmcVfQMWmivbnRW1rnBSw+kjzNu/ow6/3E9f+S9pNAsm3NDTKgpRlDfm0bMJFAir
 O3xfymQOsBf3ePe8=
X-Received: by 2002:a05:622a:15d2:b0:3b8:6d23:9727 with SMTP id
 d18-20020a05622a15d200b003b86d239727mr6021524qty.33.1675780218839; 
 Tue, 07 Feb 2023 06:30:18 -0800 (PST)
X-Google-Smtp-Source: AK7set8Ze+zduSmGjVzMJPoF4tFuI++685eXl9BC3PIBIcYdAadgA9uQCZ/jXNE3Wpy1l9fFC4C1Vg==
X-Received: by 2002:a05:622a:15d2:b0:3b8:6d23:9727 with SMTP id
 d18-20020a05622a15d200b003b86d239727mr6021482qty.33.1675780218556; 
 Tue, 07 Feb 2023 06:30:18 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de.
 [109.43.176.120]) by smtp.gmail.com with ESMTPSA id
 z20-20020ac87cb4000000b003b950b03b6dsm9463244qtv.37.2023.02.07.06.30.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 06:30:17 -0800 (PST)
Message-ID: <6f9dc151-5894-e619-4e97-987c88bb0d71@redhat.com>
Date: Tue, 7 Feb 2023 15:30:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 09/12] tests/qtest: Do not include hexloader-test if
 loader device is not present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Su Hang <suhang16@mails.ucas.ac.cn>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-10-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230206150416.4604-10-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 06/02/2023 16.04, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/hexloader-test.c | 5 +++++
>   tests/qtest/meson.build      | 4 ++--
>   2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/hexloader-test.c b/tests/qtest/hexloader-test.c
> index 3023548041..3ab464f438 100644
> --- a/tests/qtest/hexloader-test.c
> +++ b/tests/qtest/hexloader-test.c
> @@ -22,6 +22,11 @@ static void hex_loader_test(void)
>       unsigned int i;
>       const unsigned int base_addr = 0x00010000;
>   
> +    if (!qtest_has_device("loader")) {
> +        g_test_skip("Device 'loader' not available");
> +        return;
> +    }
> +
>       QTestState *s = qtest_initf(
>           "-M vexpress-a9 -device loader,file=tests/data/hex-loader/test.hex");
>   
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 431b623df9..a930706a43 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -197,11 +197,11 @@ qtests_arm = \
>     (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-test'] : []) +         \
>     (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed : []) + \
>     (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
> +  (config_all_devices.has_key('CONFIG_GENERIC_LOADER') ? ['hexloader-test'] : []) + \
>     ['arm-cpu-features',
>      'microbit-test',
>      'test-arm-mptimer',
> -   'boot-serial-test',
> -   'hexloader-test']
> +   'boot-serial-test']

In this case, I think the change to meson.build should be enough, since 
there is no machine that does "select GENERIC_LOADER" in the Kconfig files 
... or do I miss something again?

  Thomas


