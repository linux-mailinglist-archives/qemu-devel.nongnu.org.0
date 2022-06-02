Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D38E53BD7C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 19:45:01 +0200 (CEST)
Received: from localhost ([::1]:46092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwosV-0006Mz-Sr
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 13:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwopr-0004xb-Ju
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 13:42:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwopn-0000S4-4C
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 13:42:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654191726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IA4ieKb5gur6LHR1KtJeVgfHw6QWPkbuWqO8eaASLWo=;
 b=Egc0YXLlnDMXLA2Y0nfU9UbmrXX0lWDZExltdqv3us7BVAJE3FCNzIEOS6Zm7d9mCBu0HY
 5lhK/SejqSMT3yUlq6bJSc1gI/D48Q/zGguucgr2Jw5Xy9U01qx0JbH/0LvuKA6rIKe1zb
 UKhyoIpA1dUtrcl+iWmEDA+nv9wb/N8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-sRvwh6HxMUi0_45_hyzidQ-1; Thu, 02 Jun 2022 13:42:04 -0400
X-MC-Unique: sRvwh6HxMUi0_45_hyzidQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a05600c1c8500b003974c5d636dso3161380wms.1
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 10:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IA4ieKb5gur6LHR1KtJeVgfHw6QWPkbuWqO8eaASLWo=;
 b=2mteVE8H4HRPpVovyjfXfhkHBLcJto9rKTeDh08KHMb9U9MwiQg3pxgOFgypSNs/4c
 CcEUIL0jIpNpoDL/ga36gQVLc5Uikasj3AGcMg8QqOKm0FGSqXY8hgr0nvkefTZ3TAlF
 yyDzNHxG8oz+SLUOe47gvY6T0+uKuhNBR3JLQOx6SRIXL03LheWEeamW/LdUqzcSjTUk
 DTxWv0QKKh938/e8F94uZkW/Ph1w8sXvpVM/CxvYiOAmMXEYreGuHo8yjhvSqu8mJy1t
 aKm9R/x5gJU+/umU84F3gqVCr1JpY9iiLgy0aEdj3v0zvIfVOVjUAcW/DdA3dMHyyMmu
 Z2bg==
X-Gm-Message-State: AOAM533w6r7cTkABHLhSCrSZ5rHT1STgZuN0FsPDnx2ZSEf60Cn/mmjS
 T5/W++FCWfzmeq/ZMB7SfaXTdsJ/1e7Xp04PUrMgzdah2RrcO/MQpY3q7nucYIG7Znyl3fptmi9
 OgviSXm6dIWC1kpc=
X-Received: by 2002:a05:600c:20c6:b0:397:408f:effb with SMTP id
 y6-20020a05600c20c600b00397408feffbmr4935370wmm.1.1654191723670; 
 Thu, 02 Jun 2022 10:42:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzD7LVSrtbhms7KtV4mmwxRm31x2pa6k+BV84nXSZRP5JRjLgt+4KaWQQO9F6Nphd4d04SYJg==
X-Received: by 2002:a05:600c:20c6:b0:397:408f:effb with SMTP id
 y6-20020a05600c20c600b00397408feffbmr4935353wmm.1.1654191723441; 
 Thu, 02 Jun 2022 10:42:03 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-213.customers.d1-online.com.
 [80.187.98.213]) by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c3b1200b00397122e63b6sm6458324wms.29.2022.06.02.10.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 10:42:02 -0700 (PDT)
Message-ID: <05ef1192-eb81-c49f-d08c-61ed2ac7072b@redhat.com>
Date: Thu, 2 Jun 2022 19:41:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/5] gitlab: convert build/container jobs to
 .base_job_template
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
References: <20220526110705.59952-1-berrange@redhat.com>
 <20220526110705.59952-5-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220526110705.59952-5-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On 26/05/2022 13.07, Daniel P. Berrangé wrote:
> This converts the main build and container jobs to use the
> base job rules, defining the following new variables
> 
>   - QEMU_JOB_SKIPPED - jobs that are known to be currently
>     broken and should not be run. Can still be manually
>     launched if desired.
> 
>   - QEMU_JOB_AVOCADO - jobs that run the Avocado integration
>     test harness.
> 
>   - QEMU_JOB_PUBLISH - jobs that publish content after the
>     branch is merged upstream
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/base.yml                | 22 ++++++++++++++++++++++
>   .gitlab-ci.d/buildtest-template.yml  | 16 ++++------------
>   .gitlab-ci.d/buildtest.yml           | 28 +++++++++++++---------------
>   .gitlab-ci.d/container-cross.yml     |  6 ++----
>   .gitlab-ci.d/container-template.yml  |  1 +
>   .gitlab-ci.d/crossbuild-template.yml |  3 +++
>   .gitlab-ci.d/windows.yml             |  1 +
>   docs/devel/ci-jobs.rst.inc           | 19 +++++++++++++++++++
>   8 files changed, 65 insertions(+), 31 deletions(-)
...
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index e9620c3074..ecac3ec50c 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -360,12 +360,11 @@ build-cfi-aarch64:
>       expire_in: 2 days
>       paths:
>         - build
> -  rules:
> +  variables:
>       # FIXME: This job is often failing, likely due to out-of-memory problems in
>       # the constrained containers of the shared runners. Thus this is marked as
> -    # manual until the situation has been solved.
> -    - when: manual
> -      allow_failure: true
> +    # skipped until the situation has been solved.
> +    QEMU_JOB_SKIPPED: 1
>   
>   check-cfi-aarch64:
>     extends: .native_test_job_template
> @@ -402,12 +401,11 @@ build-cfi-ppc64-s390x:
>       expire_in: 2 days
>       paths:
>         - build
> -  rules:
> +  variables:
>       # FIXME: This job is often failing, likely due to out-of-memory problems in
>       # the constrained containers of the shared runners. Thus this is marked as
> -    # manual until the situation has been solved.
> -    - when: manual
> -      allow_failure: true
> +    # skipped until the situation has been solved.
> +    QEMU_JOB_SKIPPED: 1

FYI, this patch broke the build-cfi-aarch64 and build-cfi-ppc64-s390x jobs 
since they've now got two "variables:" sections and apparently only the 
second one is taken into account...

  Thomas


