Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C014664F50D
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 00:29:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6K7R-0004YX-3L; Fri, 16 Dec 2022 18:27:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6K7P-0004YA-NR
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 18:27:55 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6K7N-0006Jh-RK
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 18:27:55 -0500
Received: by mail-ej1-x631.google.com with SMTP id u19so9570473ejm.8
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 15:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BXdd9LLYTvk2fhZ0MYK4SCCrpxpzaVmwXHoCth8hCk8=;
 b=BbXwiyohwK9CsMDcysA9HJ65A4g+AOdQjHrGzS0pzdM/NckF7nXa3lJQnNEzbfTom6
 2O4U9ZOHuYN91fF5LnsxgM3TzQrdb/S5s7QYeLydldQKfYM+XkJlG4IQMy7yQ90lj0mr
 KjsCTWpXvzzNbh4/Qd9tCFbedv5dzaoAHFuwiehpdfVhyvGzgQ05NAqrJ/88QUipuKev
 9jvaEtix8H2pKxZXo7Rnzw4A6yl8U9WdON+u0GCR9JT6ETVyFKKyAm5P5weu8GFJ88eG
 BtEXh00D358Bk4x+K2WteRayy85H31+42OzVgyT1cUc3E13vbCf+2inFOpB+v6Q7xPRJ
 UAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BXdd9LLYTvk2fhZ0MYK4SCCrpxpzaVmwXHoCth8hCk8=;
 b=ROA/3vEEpNPVePWGLc94jTzHi4V6FqOVx1N6Wiqkx+JirfYv1Pjc0ZBQH9GRvVAwtf
 ImoegkzTtTUfM4W+0ZaL8ia35UelciX2/3/EfCRBlEdlSboJGL+lyiNj0gjpFdd7QnJe
 JmvrxU8doX6HFOtMePVRByrTsb2tktop4cUn0xels86BUQ7WUX/P+y4YL/A8qhA6hEIM
 lZZOIsAtCZctSVYzwETpRXSCsdIbjISukgtf/SgB7a9uNYxd7aepTf6BeH4PHRTYDs21
 p6/5N6bsXRS7ezo0Vev07fwaaeB/By6hLI4q6oFjQOsj4aBnAFx9DIgpwQ9NrsfBc8wz
 qnYg==
X-Gm-Message-State: ANoB5pm6XVWSadlE6gtangv6KQiA3SFSajcDbj+J/6+rQHHajdUE0VUf
 gFibuROB8nD29PD+Ni5MxjFZwCtb2gtxuOyZO3k=
X-Google-Smtp-Source: AA0mqf4+6kw7Ns/UZmh09CsAQVjS1xyJ6jvZ8LPuMoDWF+z+nIHjMphbf2pDhOEWI54nuAa8W7StBA==
X-Received: by 2002:a17:906:7751:b0:78d:f454:388d with SMTP id
 o17-20020a170906775100b0078df454388dmr27881108ejn.74.1671233272029; 
 Fri, 16 Dec 2022 15:27:52 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a17090604d100b007c0f5d6f754sm1340696eja.79.2022.12.16.15.27.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 15:27:51 -0800 (PST)
Message-ID: <cd5048e0-846b-49c5-08ac-24b7ca55f103@linaro.org>
Date: Sat, 17 Dec 2022 00:27:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 2/5] hw/s390x/pv: Un-inline s390_pv_init()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>
References: <20221216220411.6779-1-philmd@linaro.org>
 <20221216220411.6779-3-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221216220411.6779-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
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

On 16/12/22 23:04, Philippe Mathieu-Daudé wrote:
> There is no point in having s390_pv_init() inlined.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/s390x/pv.c         | 13 +++++++++++++
>   include/hw/s390x/pv.h | 14 +-------------
>   2 files changed, 14 insertions(+), 13 deletions(-)


> diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
> index 9360aa1091..5bca5bcaf1 100644
> --- a/include/hw/s390x/pv.h
> +++ b/include/hw/s390x/pv.h
> @@ -12,7 +12,6 @@
>   #ifndef HW_S390_PV_H
>   #define HW_S390_PV_H
>   
> -#include "qapi/error.h"
>   #include "sysemu/kvm.h"
>   
>   #ifdef CONFIG_KVM
> @@ -78,17 +77,6 @@ static inline int kvm_s390_dump_completion_data(void *buff) { return 0; }
>   #endif /* CONFIG_KVM */
>   
>   int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
> -static inline int s390_pv_init(ConfidentialGuestSupport *cgs, Error **errp)
> -{
> -    if (!cgs) {
> -        return 0;
> -    }
> -    if (kvm_enabled()) {
> -        return s390_pv_kvm_init(cgs, errp);
> -    }
> -
> -    error_setg(errp, "Protected Virtualization requires KVM");
> -    return -1;
> -}
> +int s390_pv_init(ConfidentialGuestSupport *cgs, Error **errp);

OK I understood why this function is inlined. It is called from:

$ git grep s390_pv_init
hw/s390x/pv.c:29:int s390_pv_init(ConfidentialGuestSupport *cgs, Error 
**errp)
hw/s390x/s390-virtio-ccw.c:259:    s390_pv_init(machine->cgs, &error_fatal);
include/hw/s390x/pv.h:86:int s390_pv_init(ConfidentialGuestSupport *cgs, 
Error **errp);

Now note in meson.build:

s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
   'tod-kvm.c',
   's390-skeys-kvm.c',
   's390-stattrib-kvm.c',
   'pv.c',
   's390-pci-kvm.c',
))

So when CONFIG_KVM=false s390-virtio-ccw.c doesn't have to link with
the kvm-specific pv.o.

I'll rework this patch.

