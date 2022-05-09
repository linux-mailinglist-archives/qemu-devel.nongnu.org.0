Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4140851FE54
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:31:06 +0200 (CEST)
Received: from localhost ([::1]:55362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3Td-0005f2-3a
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1no2rf-0004Id-78
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:51:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1no2rd-0002Rr-LP
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:51:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652100709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F7MyTTpwXvuP62UVJrMrIZkMbyqAbGxDFDUW+zCm4mY=;
 b=fQ9xdibW5cLZTxYWaH5RMvsjUXFx73af2ztNtLkNMLNGrx7KRULO07ZeZ4W+KhJ7riazVc
 Mw7nzEsqpt+fiMnUdKllSwh2uOvg5izxp9OuEHK+tPia8365rHhlugLmpg0CPKeCluzGDH
 n9uwQoSyesannyaPnemCmMg5teVGdPw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-FvgLVrK-P06zD6gVuy8TjA-1; Mon, 09 May 2022 08:51:48 -0400
X-MC-Unique: FvgLVrK-P06zD6gVuy8TjA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ba21-20020a0560001c1500b0020ca6a45dfcso3878210wrb.9
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 05:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F7MyTTpwXvuP62UVJrMrIZkMbyqAbGxDFDUW+zCm4mY=;
 b=u66lT5b04l2IL8L5bGnCPzWNcI0lhaJ7iZYPUOreqiC9xzr6OCh0oUbKtU2aoB8Y9r
 ySywC8sZ44tMC3AxqP8JiX10G5gJ/SsnkxmAviwXpxIHSR4vUA1crKnKaDFWnxAakLNa
 DvLMKO9ZqM+T/qIb8nIlG1DSMglXCqEjy8W5XK9SATPE5XZa5+DCQLmZB2A/qsZYdOVl
 UO+7QGraMvZcsRebrDMb53ZjI8eafzXW2w6pip14EZ9/v/EeoeLJh4TlIgLQv07Y5WsO
 7XwumVEGSI/adqcHaupPJQZ1tVBTELS7rZdxyWSUuO3zvQE09Z4/AiPheQpNiXrmoyuF
 SA2Q==
X-Gm-Message-State: AOAM532sBMDrsxwdfVaU8pAT1gVnV4HNa1MRIfKUw2mxHzwoChm1WG9W
 4om7WuSuA7qtriLC3LHp4eIDCuBUeigXs2i+hNUfeY9M9MmVUvNSWamYi7yQBPXjtEpr6IzJtBL
 IXuuVqqAx5vwtWa0=
X-Received: by 2002:a7b:c2a2:0:b0:394:61b0:2e05 with SMTP id
 c2-20020a7bc2a2000000b0039461b02e05mr21620874wmk.119.1652100706953; 
 Mon, 09 May 2022 05:51:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEu09Lx/+wP6LK/9jFiJYO/xfDulovG6uPSrylPZWdhyO9xM/LUWX2CR2zXO1LvKabNY+akA==
X-Received: by 2002:a7b:c2a2:0:b0:394:61b0:2e05 with SMTP id
 c2-20020a7bc2a2000000b0039461b02e05mr21620843wmk.119.1652100706660; 
 Mon, 09 May 2022 05:51:46 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 y12-20020a056000168c00b0020c5253d8d4sm12733798wrd.32.2022.05.09.05.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 05:51:46 -0700 (PDT)
Message-ID: <e8dd7b9d-e89c-1ed4-dd04-468f11cb0009@redhat.com>
Date: Mon, 9 May 2022 14:51:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] .gitlab-ci.d: export meson testlog.txt as an artifact
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220509124134.867431-1-berrange@redhat.com>
 <20220509124134.867431-3-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220509124134.867431-3-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 09/05/2022 14.41, Daniel P. Berrangé wrote:
> When running 'make check' we only get a summary of progress on the
> console. Fortunately meson/ninja have saved the raw test output to a
> logfile. Exposing this log will make it easier to debug failures that
> happen in CI.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/buildtest-template.yml | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index 2c7980a4f6..dc6d67aacf 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -26,7 +26,7 @@
>           make -j"$JOBS" $MAKE_CHECK_ARGS ;
>         fi
>   
> -.native_test_job_template:
> +.common_test_job_template:
>     stage: test
>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>     script:
> @@ -37,8 +37,16 @@
>       # Avoid recompiling by hiding ninja with NINJA=":"
>       - make NINJA=":" $MAKE_CHECK_ARGS
>   
> +.native_test_job_template:
> +  extends: .common_test_job_template
> +  artifacts:
> +    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
> +    expire_in: 7 days
> +    paths:
> +      - build/meson-logs/testlog.txt
> +
>   .avocado_test_job_template:
> -  extends: .native_test_job_template
> +  extends: .common_test_job_template
>     cache:
>       key: "${CI_JOB_NAME}-cache"
>       paths:

Reviewed-by: Thomas Huth <thuth@redhat.com>


