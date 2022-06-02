Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDCC53B78A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 12:57:12 +0200 (CEST)
Received: from localhost ([::1]:39534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwiVr-0008Qt-6l
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 06:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nwiPR-0002w1-4d; Thu, 02 Jun 2022 06:50:33 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:35480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nwiPP-0003OC-6h; Thu, 02 Jun 2022 06:50:32 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so9033540pjo.0; 
 Thu, 02 Jun 2022 03:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4YSM8DA23j8zeytGq1H9aHR8ft1JlFCHLYxg9iQLISY=;
 b=kTf0+RevKZl75rq49zcEbcMviE5/DJq709ht+oQbRFPIEoWcOESH1v+l/PxRAm1zrE
 zGBzKNi1u5eN5tG97+2m5dhJoP/undfizM35Ozao7Rcu32EC5D7eRJqSxszg4uM3y+VN
 y4bN4UELqjtycShiRtmULGH2Y+zF6fHbabvzgbaYCJzC+mkjYr8niHtWbZOX+SoLu3hO
 4Dr4d4PIVO0sam+lgeGdGa81ggRcgXRWGMBLIDMu2XR+FUBOlcoOEy7Jm5dSBrwcl6rc
 pk0yHTmMd5LnLErbsETb8bgNaJ/xWvFq3JSm+Fdvtah26z6oICR+agVIOH6pNW1jYuwp
 xcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4YSM8DA23j8zeytGq1H9aHR8ft1JlFCHLYxg9iQLISY=;
 b=zLtSV79bzKq+DI+gwYwpi463Dh/Ko0UnvwFKK0QpwPR1YVzinCMCpl8s6LVoGlZAj2
 AMAVsPt4EAbTz/PAQX/TJdbn5v1Tq5lti5oQHpyW1EMxrsoOaIFHvufQt5vK3mjOxluQ
 FaV5lpjSlWvMdfBpTNdVaVrFQ2N8Gb4p7mEWj65VCNfDFO99yxtooBUhs4oEKhBe/mpw
 a7zNEsUR7a6JuzZ/Wag3F9R7Y9tE50zyHOcDGsOZ+2hIZfY2UuYYnBShmaAulYrFKCmG
 P+Kgxlg8WG0HkEjjvmAcb0kuaXh+Jbkqq+HXd02sHKUd60485BfCCwmXtsYUaPaEp7hr
 7k+A==
X-Gm-Message-State: AOAM532kVqNV7JTTNX0QQ1RFyzeQkivB5dsZ7XM26wPWRxB+Yp5wLkrH
 ZM/2hoMgsagBuC1uMvm0Lxg=
X-Google-Smtp-Source: ABdhPJzUWyVRGuoHGMNTDNTFsH6vf7H4mUPgF/Y2DHSzh7v1fDvJPSWHHZb1gDZ7Fx1huhfE0RjKOA==
X-Received: by 2002:a17:902:c40e:b0:162:4b86:8dc5 with SMTP id
 k14-20020a170902c40e00b001624b868dc5mr4331682plk.144.1654167028004; 
 Thu, 02 Jun 2022 03:50:28 -0700 (PDT)
Received: from [192.168.109.175] (32.red-88-29-183.dynamicip.rima-tde.net.
 [88.29.183.32]) by smtp.gmail.com with ESMTPSA id
 i10-20020a17090332ca00b001664bc2e2e6sm238369plr.154.2022.06.02.03.50.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 03:50:27 -0700 (PDT)
Message-ID: <279dc7dd-9423-ce0e-788f-6cebce8878b1@amsat.org>
Date: Thu, 2 Jun 2022 12:50:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PULL 32/33] gitlab: don't run CI jobs in forks by default
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-stable@nongnu.org
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
 <20220601180537.2329566-33-alex.bennee@linaro.org>
In-Reply-To: <20220601180537.2329566-33-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Cc'ing qemu-stable@

Thank you Daniel / Thomas / Alex!

On 1/6/22 20:05, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> To preserve CI shared runner credits we don't want to run
> pipelines on every push.
> 
> This sets up the config so that pipelines are never created
> for contributors by default. To override this the QEMU_CI
> variable can be set to a non-zero value. If set to 1, the
> pipeline will be created but all jobs will remain manually
> started. The contributor can selectively run jobs that they
> care about. If set to 2, the pipeline will be created and
> all jobs will immediately start.
> 
> This behavior can be controlled using push variables
> 
>    git push -o ci.variable=QEMU_CI=1
> 
> To make this more convenient define an alias
> 
>     git config --local alias.push-ci "push -o ci.variable=QEMU_CI=1"
>     git config --local alias.push-ci-now "push -o ci.variable=QEMU_CI=2"
> 
> Which lets you run
> 
>    git push-ci
> 
> to create the pipeline, or
> 
>    git push-ci-now
> 
> to create and run the pipeline
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20220526110705.59952-6-berrange@redhat.com>
> [AJB: fix typo, replicate alias tips in ci.rst]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20220527153603.887929-33-alex.bennee@linaro.org>
> 
> diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc
> index 0b4926e537..9118a61a17 100644
> --- a/docs/devel/ci-jobs.rst.inc
> +++ b/docs/devel/ci-jobs.rst.inc
> @@ -28,6 +28,32 @@ For further information about how to set these variables, please refer to::
>   
>     https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
>   
> +Setting aliases in your git config
> +----------------------------------
> +
> +You can use aliases to make it easier to push branches with different
> +CI configurations. For example define an alias for triggering CI:
> +
> +.. code::
> +
> +   git config --local alias.push-ci "push -o ci.variable=QEMU_CI=1"
> +   git config --local alias.push-ci-now "push -o ci.variable=QEMU_CI=2"
> +
> +Which lets you run:
> +
> +.. code::
> +
> +   git push-ci
> +
> +to create the pipeline, or:
> +
> +.. code::
> +
> +   git push-ci-now
> +
> +to create and run the pipeline
> +
> +
>   Variable naming and grouping
>   ----------------------------
>   
> @@ -98,6 +124,18 @@ Contributor controlled runtime variables
>   The following variables may be set by contributors to control
>   job execution
>   
> +QEMU_CI
> +~~~~~~~
> +
> +By default, no pipelines will be created on contributor forks
> +in order to preserve CI credits
> +
> +Set this variable to 1 to create the pipelines, but leave all
> +the jobs to be manually started from the UI
> +
> +Set this variable to 2 to create the pipelines and run all
> +the jobs immediately, as was historicaly behaviour
> +
>   QEMU_CI_AVOCADO_TESTING
>   ~~~~~~~~~~~~~~~~~~~~~~~
>   By default, tests using the Avocado framework are not run automatically in
> diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
> index 4f091d5aad..f334f3ded7 100644
> --- a/.gitlab-ci.d/base.yml
> +++ b/.gitlab-ci.d/base.yml
> @@ -28,6 +28,10 @@
>       - if: '$QEMU_JOB_ONLY_FORKS == "1" && $CI_PROJECT_NAMESPACE == "qemu-project"'
>         when: never
>   
> +    # Forks don't get pipelines unless QEMU_CI=1 or QEMU_CI=2 is set
> +    - if: '$QEMU_CI != "1" && $QEMU_CI != "2" && $CI_PROJECT_NAMESPACE != "qemu-project"'
> +      when: never
> +
>       # Avocado jobs don't run in forks unless $QEMU_CI_AVOCADO_TESTING is set
>       - if: '$QEMU_JOB_AVOCADO && $QEMU_CI_AVOCADO_TESTING != "1" && $CI_PROJECT_NAMESPACE != "qemu-project"'
>         when: never
> @@ -59,5 +63,10 @@
>       # an earlier criteria
>       #############################################################
>   
> +    # Forks pipeline jobs don't start automatically unless
> +    # QEMU_CI=2 is set
> +    - if: '$QEMU_CI != "2" && $CI_PROJECT_NAMESPACE != "qemu-project"'
> +      when: manual
> +
>       # Jobs can run if any jobs they depend on were successfull
>       - when: on_success


