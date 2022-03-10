Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581954D47D7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:14:28 +0100 (CET)
Received: from localhost ([::1]:57208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIcd-0004J2-CX
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:14:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSHpP-0004fo-Rz
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:23:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSHpM-0000hC-NY
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:23:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646915010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6XICn0HNumJD+cdiR+2gW6xViP+N7fPK1urBCMWc/Us=;
 b=gBRkEL9uEXmgRAyXPxQyBWoMseGaApbYxd/+/bXXoIXiyCtK8gnknD5DLhKPg87zD/+LsF
 Y3Qz7cFoqAs2ebgVx/kdeqKHC3R6S6G5o39RoaV1LH1YyYxJskk44eHcuoLGu5t4Ur/V6D
 +6p+szh35MWvmGjkRwADudkDw/Icx8M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-1wz6c5T-OZu8OhELaZWPlA-1; Thu, 10 Mar 2022 07:23:29 -0500
X-MC-Unique: 1wz6c5T-OZu8OhELaZWPlA-1
Received: by mail-wr1-f72.google.com with SMTP id
 t15-20020a5d534f000000b001f1e5759cebso1641346wrv.7
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 04:23:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6XICn0HNumJD+cdiR+2gW6xViP+N7fPK1urBCMWc/Us=;
 b=F5k6vI+SxmMNmHZ5TIG0kGho8WD+hqGjwRA698C/s8PIznuv9kfJQ7e82PGjn1VDdP
 JiH7YMnIDNtM7ZW1nX9aQ3XG3Zo8q8OXKgrHt+wPsqh2hoJcLBohGalO6UggANqwLnzZ
 skfFbVR8JLEVAyl5Eo3kczPGwHEzeIa3uAUJhKA/2OzmZ++fLR3gVADFaIN9fYQmL7C5
 paI6gR+HCc1oI5dyEKsPxmy9zSDg5sur21VcutQoxI0X3AaK3/+zRV0kh+9cY9w0qvXg
 7p50cExrKo8wx5hMNZc0WHsHw31QAQ49vrRJIxerS5n+43kQ1KR83AmQrOjqyw0FYQwH
 6qmw==
X-Gm-Message-State: AOAM533+sTrDzCo16LFqF/A+xkDHoC4AYERcpr6eOO/ivvy2NMmYxbho
 Rie7P6n0AKx1zVoTfDwSw6ReNcP+iD/oNliU5C/bpaK3M99hAM0/ZKh6xo20mtehWtG5j9FswAb
 +XOc5fFEjkbahJ/A=
X-Received: by 2002:a7b:c04e:0:b0:380:ead9:254a with SMTP id
 u14-20020a7bc04e000000b00380ead9254amr11384942wmc.58.1646915007956; 
 Thu, 10 Mar 2022 04:23:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmFFAlVeCz8Xn3Whoe0bOLhF4MWK6vrl5nJhfhqqbqvI1qXN1FJDsgzFE/QIw+EsGP/6KPcA==
X-Received: by 2002:a7b:c04e:0:b0:380:ead9:254a with SMTP id
 u14-20020a7bc04e000000b00380ead9254amr11384915wmc.58.1646915007635; 
 Thu, 10 Mar 2022 04:23:27 -0800 (PST)
Received: from [192.168.42.76] (tmo-097-147.customers.d1-online.com.
 [80.187.97.147]) by smtp.gmail.com with ESMTPSA id
 m16-20020a05600c3b1000b00389e93b173dsm72042wms.44.2022.03.10.04.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 04:23:26 -0800 (PST)
Message-ID: <0061fb85-fbe5-9304-6e6b-ae82bbf47482@redhat.com>
Date: Thu, 10 Mar 2022 13:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH-for-7.0] softmmu: List CPU types again
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220310115502.3311-1-philippe.mathieu.daude@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220310115502.3311-1-philippe.mathieu.daude@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/2022 12.55, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Commit e0220bb5b2 made cpus.c target-agnostic but didn't notice
> the cpu_list() function is only defined in target-specific code
> in "cpu.h". Extract list_cpus() from the generic cpus.c into a
> new target-specific unit.
> 
> Fixes: e0220bb5b2 ("softmmu: Build target-agnostic objects once")
> Reported-by: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   softmmu/cpus.c      |  8 --------
>   softmmu/cpus_list.c | 36 ++++++++++++++++++++++++++++++++++++
>   softmmu/meson.build |  1 +
>   3 files changed, 37 insertions(+), 8 deletions(-)
>   create mode 100644 softmmu/cpus_list.c
> 
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index e1d84c8ccb..7b75bb66d5 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -728,14 +728,6 @@ int vm_stop_force_state(RunState state)
>       }
>   }
>   
> -void list_cpus(const char *optarg)
> -{
> -    /* XXX: implement xxx_cpu_list for targets that still miss it */
> -#if defined(cpu_list)
> -    cpu_list();
> -#endif
> -}
> -
>   void qmp_memsave(int64_t addr, int64_t size, const char *filename,
>                    bool has_cpu, int64_t cpu_index, Error **errp)
>   {
> diff --git a/softmmu/cpus_list.c b/softmmu/cpus_list.c
> new file mode 100644
> index 0000000000..59ef604423
> --- /dev/null
> +++ b/softmmu/cpus_list.c

The other cpu*.c files in softmmu use a "-" instead of "_", so I'd also use 
a "-" for cpu-list.c.


> @@ -0,0 +1,36 @@
> +/*
> + * QEMU per target CPU list
> + *
> + * Copyright (c) 2003-2008 Fabrice Bellard

If you look at the history, Fabrice was hardly involved in this function, so 
I think it should be ok to drop this line in the new file.

> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "sysemu/cpus.h"
> +#include "cpu.h"
> +
> +void list_cpus(const char *optarg)
> +{
> +    /* XXX: implement xxx_cpu_list for targets that still miss it */
> +#if defined(cpu_list)
> +    cpu_list();
> +#endif
> +}
> +

No empty new lines at the end of files, please.

  Thomas


