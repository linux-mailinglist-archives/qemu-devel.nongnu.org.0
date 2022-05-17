Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 686DE529F22
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 12:15:56 +0200 (CEST)
Received: from localhost ([::1]:46362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nquF8-0004HI-Ve
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 06:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nquA5-0003NC-22
 for qemu-devel@nongnu.org; Tue, 17 May 2022 06:10:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nquA2-00031o-3m
 for qemu-devel@nongnu.org; Tue, 17 May 2022 06:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652782234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+sgbleYW0hFxyUj5Sm6mM2oeyGnN1XyJO4pH4vbcN8=;
 b=A3PETFkZLduO7mbp/I+qwRktbJMt3B30RKKFrJ5y2g+Ttpzr/x+72rUiMrOTepjeWyXEd2
 /Bm2sPBGnKANVPTC4W2CCkATDjK1mfjxI/8lpuIn4JqXAPptHTcpyUrzG8hAqErgACSyou
 qIspJiETDtPn/Xii89VbXfKJhHUEK/M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-jo5mqSU7NdC-jD96YOVDqQ-1; Tue, 17 May 2022 06:10:33 -0400
X-MC-Unique: jo5mqSU7NdC-jD96YOVDqQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 a18-20020adffb92000000b0020cff565b91so1219647wrr.4
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 03:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=e+sgbleYW0hFxyUj5Sm6mM2oeyGnN1XyJO4pH4vbcN8=;
 b=A+pgngYTaSoqh+6XXr5/m4Cx40a7aF1WkVhgsbFTPFk1r/8pZFX0GH/4/tp3kWMUTD
 Rrwu00iTT8C/AJa3QyrpfiI+mrNHhlll/kmAMMtngIf1/qkc56w9g68gyvGciN8U5iZ9
 ekkNpmBgb7WHHbFBfC3DJfya7pX0x+p7Q4Q9VdmtTeMkjIHBTfUDSc2xcG8zMVqNafTY
 iojhoeMzbTncbU74roiqExaqHhJiQ2DIX43PzFkGt/7fRJmdXTcE1XQhT9T8Q6KWqPvV
 JlqQtf7vHTFf1wydyl/3CaFVk7RABCAKFQRUMuNE0+V4zSXnBN0nmdJW8li+J0ohqgCx
 nihA==
X-Gm-Message-State: AOAM530gl1rpxm6EvVbxl1apcbJMZbl4Ej54mlY5mKeGmAQwcSq8edzM
 5XXcXDhG6MxDvs3jUbi50MEUs14gE6TsSGFoejpJRlRQBFCgHqM7PH8h628b+MZCwYLBLPX0PS6
 274gFlqPkBOlYhL8=
X-Received: by 2002:a05:600c:354f:b0:394:6103:1f20 with SMTP id
 i15-20020a05600c354f00b0039461031f20mr31527775wmq.142.1652782232247; 
 Tue, 17 May 2022 03:10:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuQkhHLlo2jL3DwNxtA+06Ait4rcHKun7Yk9roMdoL+Vf7gtbGlj6XwpQuvT+CGoe5Cw7m0g==
X-Received: by 2002:a05:600c:354f:b0:394:6103:1f20 with SMTP id
 i15-20020a05600c354f00b0039461031f20mr31527756wmq.142.1652782231987; 
 Tue, 17 May 2022 03:10:31 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a7bc04c000000b00394351e35edsm1425757wmc.26.2022.05.17.03.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 03:10:31 -0700 (PDT)
Message-ID: <2a52914a-d129-cd20-d54d-ee8cfd38a8d7@redhat.com>
Date: Tue, 17 May 2022 12:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220314143130.28503-1-philippe.mathieu.daude@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci: Allow adding manual jobs on cirrus-ci
In-Reply-To: <20220314143130.28503-1-philippe.mathieu.daude@gmail.com>
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

On 14/03/2022 15.31, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> By default, all Cirrus-CI jobs are added as 'on_success' (the
> default value). Add a ${MANUAL_JOB} variable (default to 0)
> to be able to add manual jobs.
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   .gitlab-ci.d/cirrus.yml       | 2 ++
>   .gitlab-ci.d/cirrus/build.yml | 1 +
>   2 files changed, 3 insertions(+)
> 
> diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
> index b96b22e269..9e640019dd 100644
> --- a/.gitlab-ci.d/cirrus.yml
> +++ b/.gitlab-ci.d/cirrus.yml
> @@ -44,6 +44,8 @@
>       # Allow on 'staging' branch and 'stable-X.Y-staging' branches only
>       - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH !~ /staging/'
>         when: never
> +    - if: '$CIRRUS_GITHUB_REPO && $CIRRUS_API_TOKEN && $MANUAL_JOB == "1"'
> +      when: manual
>       - if: "$CIRRUS_GITHUB_REPO && $CIRRUS_API_TOKEN"
>   
>   x64-freebsd-12-build:
> diff --git a/.gitlab-ci.d/cirrus/build.yml b/.gitlab-ci.d/cirrus/build.yml
> index c555f5d36e..c58dc86855 100644
> --- a/.gitlab-ci.d/cirrus/build.yml
> +++ b/.gitlab-ci.d/cirrus/build.yml
> @@ -14,6 +14,7 @@ env:
>     MAKE: "@MAKE@"
>     CONFIGURE_ARGS: "@CONFIGURE_ARGS@"
>     TEST_TARGETS: "@TEST_TARGETS@"
> +  MANUAL_JOB: 0
>   
>   build_task:
>     install_script:

  Hi Philippe!

Sorry for the late reply ... I think this might collide with Daniel's patch 
that turns most jobs to manual mode
(https://lore.kernel.org/all/20210812180403.4129067-3-berrange@redhat.com/) 
which he is hopefully going to respin soon ... but anyway, if you add a 
variable like this, there should be an update to docs/devel/ci-jobs.rst.inc 
to describe the new variable, otherwise you might be the only one who's 
using it.

  Thomas


