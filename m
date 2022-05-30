Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08A0537761
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 10:57:03 +0200 (CEST)
Received: from localhost ([::1]:49090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvbCw-0004Jz-Mg
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 04:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nvbA5-0003O1-73
 for qemu-devel@nongnu.org; Mon, 30 May 2022 04:54:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nvbA3-000450-6I
 for qemu-devel@nongnu.org; Mon, 30 May 2022 04:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653900842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yz475zedJoZxNkUh09SIwjQOeYBl3EGaHOOXS2fZCzw=;
 b=QlRw/GTwLMHR6CWXxJUsRSXx5qiGKE49B9do6doj+cgNZuW2OEl91JM6EgBWjNBglOQn4Y
 1NOfu57tZ8Zpc1kEaPG1AFCJbLqTNTjjkRhED14Bl8do9YWaZpmMDg9ETyRnUzy/12UEDL
 u3X4bnqpTwYE7Rc4lAkvG1xUlTnmvAo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-ZLtgiKBAPlWZ-CpBxSPHqw-1; Mon, 30 May 2022 04:54:00 -0400
X-MC-Unique: ZLtgiKBAPlWZ-CpBxSPHqw-1
Received: by mail-qt1-f198.google.com with SMTP id
 m18-20020a05622a119200b00304b4e57cbfso860872qtk.18
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 01:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=yz475zedJoZxNkUh09SIwjQOeYBl3EGaHOOXS2fZCzw=;
 b=h7fmJOnI+tnNAzeEcUmN+MPJHBWPx1LOXir4n+x+PIC2sr1NeYcDZPCW4MceLUKi3p
 d4oAL/6Z0vKNPkpumohe3ehz1T3Vib3HISVlcbUeAp8fNVB5kILEWlnMdWKZm1JcmwdT
 n3DvkJJHn9VtaHdW7eAAMoHWqfxw7JOhxddE4Kw+LJfVYncs4/dLlvzGvprf5n2eCebf
 unArL/QCejeVFcy2QT9yCxIxhlG3hPUNFgyNTX5Olnxsuzp2WiSSXQzn4lT1Uqmt1l63
 bcIm8plK/t/QDOgJcZtciOcER2kYOirKQKNj3ltq+ikI5z0RgEb2bDOwuDbSAKXFqgKJ
 AkVA==
X-Gm-Message-State: AOAM530GC9KUqeqy4In4ZXaMaHOJKHukjKbddYzmMVgKccWWxzszvVhm
 zvOwMr2IAix0J5T1QyffY98W/JpP4ihaUi1ZhqKjuBByug/LhafNZXkFVDG5ZHLiarx3UV+v5dU
 ukzyi2Otv6ijttPY=
X-Received: by 2002:a05:620a:784:b0:6a3:596b:d9a3 with SMTP id
 4-20020a05620a078400b006a3596bd9a3mr30962124qka.394.1653900840139; 
 Mon, 30 May 2022 01:54:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaY+QS2ToKwWWWMr2DjOQCSuYd6O0UH7Q6ja9IZ8B3xiSpBR6s7D4qb884gChbww5kkrpCjQ==
X-Received: by 2002:a05:620a:784:b0:6a3:596b:d9a3 with SMTP id
 4-20020a05620a078400b006a3596bd9a3mr30962116qka.394.1653900839908; 
 Mon, 30 May 2022 01:53:59 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-216.web.vodafone.de.
 [109.43.179.216]) by smtp.gmail.com with ESMTPSA id
 n76-20020a37274f000000b0069fc13ce1dasm7001623qkn.11.2022.05.30.01.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 01:53:59 -0700 (PDT)
Message-ID: <0b1b41d8-d8f9-1b5a-bc3c-67557ecbdde7@redhat.com>
Date: Mon, 30 May 2022 10:53:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
 <20220527153603.887929-32-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v1 31/33] gitlab: convert build/container jobs to
 .base_job_template
In-Reply-To: <20220527153603.887929-32-alex.bennee@linaro.org>
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

On 27/05/2022 17.36, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
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
> Message-Id: <20220526110705.59952-5-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
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
>   
>   check-cfi-ppc64-s390x:
>     extends: .native_test_job_template
> @@ -579,6 +577,7 @@ build-without-default-features:
>       MAKE_CHECK_ARGS: check-unit check-qtest SPEED=slow
>   
>   build-libvhost-user:
> +  extends: .base_job_template
>     stage: build
>     image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
>     needs:
> @@ -595,10 +594,13 @@ build-tools-and-docs-debian:
>     extends: .native_build_job_template
>     needs:
>       job: amd64-debian-container
> +    # when running on 'master' we use pre-existing container
> +    optional: true

This change doesn't look like it's related to the other changes in here? 
Maybe mention it in the patch description at least?

Apart from that:
Reviewed-by: Thomas Huth <thuth@redhat.com>


