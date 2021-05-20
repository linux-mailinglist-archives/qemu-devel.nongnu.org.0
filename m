Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC5838B86E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 22:30:02 +0200 (CEST)
Received: from localhost ([::1]:35658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljpIv-0002O2-ED
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 16:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljpHi-0001Gd-HP
 for qemu-devel@nongnu.org; Thu, 20 May 2021 16:28:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljpHe-0006Np-Ud
 for qemu-devel@nongnu.org; Thu, 20 May 2021 16:28:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621542522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DVyZCWHx/zyYX2R3PytFoCon6gMd6iSU+XA8VeSG3Nc=;
 b=WBm0sv3TyhECTE9pIE6UB/pOaHMbE6Fi0hmyd497rcg1tBzWWXlnahrMaitVx/B/UVm82U
 VbGQaMDOeVmrcwkwVo5vj24Oqz9YD57D0UjXqrE3XMZeMIFN9UY6FrqIfQnHaudJm54MPi
 m4ZjZqvGjVqGFyXYcaVEFGfpNYDeBpg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-ytwlCO0eORyRKAP4xLYuuQ-1; Thu, 20 May 2021 16:28:36 -0400
X-MC-Unique: ytwlCO0eORyRKAP4xLYuuQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 z1-20020a1709068141b02903cd421d7803so5489054ejw.22
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 13:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DVyZCWHx/zyYX2R3PytFoCon6gMd6iSU+XA8VeSG3Nc=;
 b=oifa6MO6wABBNzJfJJdIi1NGxgoOA0uZmNAIRKE8ZQ4/tt+1VZYXju2eAiaNlo9oNx
 gUPOP82jo/0oC7Lm9p32zDUVeCsQvnmJK4Kk+bYlk1+LV3Bwhzl5Zz/9Hn2sPKHbucdm
 8QytQqu8JqZfip/gN8pKVZDSjRg78taZ6HhlMv+SGje/xdxRpt0yg/gESIY2VbS812/z
 dcvloCwz8KJg8y+En7oN+oEhnM/RBfYP/RVl6iAi5h+CEgurcSrGYbc6+rCU4ieCxTpk
 fBvtvKVgppzA4MhZ51POIgFWNfDLDemDSBb75cYB7Zmafj4urA6/UjlAj/AiagOPs36z
 cV7A==
X-Gm-Message-State: AOAM532mTd1xaBU+yjJ8GaWkfkMn9VqV4dQV9Mj8hEyTcMhUdIwa9tch
 +/GiOc2T0d23b0JjNNms1xvQfJQPlm0YK/BQCbhy3MOtA3hIGwfowF3u3AvWQsCuQmqHrmtShtZ
 XmscUk983z98vi88=
X-Received: by 2002:aa7:dc4a:: with SMTP id g10mr6962266edu.316.1621542515081; 
 Thu, 20 May 2021 13:28:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVlvQ4H8xtVOYCFKAiOrmsuX5NPSNYZ8SrTGCcpofsPvhrdLuQ1HV6FT7fF5M79L8PB8ntMg==
X-Received: by 2002:aa7:dc4a:: with SMTP id g10mr6962250edu.316.1621542514779; 
 Thu, 20 May 2021 13:28:34 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id d25sm1995581ejd.59.2021.05.20.13.28.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 13:28:34 -0700 (PDT)
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
Date: Thu, 20 May 2021 22:28:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520195322.205691-2-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 9:53 PM, Willian Rampazzo wrote:
> Conceptually speaking, acceptance tests "are a series of specific tests
> conducted by the customer in an attempt to uncover product errors before
> accepting the software from the developer. Conducted by the end-user rather
> than software engineers, acceptance testing can range from an informal
> “test drive” to a planned and systematically executed series of scripted
> tests" [1]. Every time Pressman refers to the term "acceptance testing," he
> also refers to user's agreement in the final state of an implemented feature.
> Today, QEMU is not implementing user acceptance tests as described by Pressman.
> 
> There are other three possible terms we could use to describe what is currently
> QEMU "acceptance" tests:
> 
>   1 - Integration tests:
>       - "Integration testing is a systematic technique for constructing the
>          software architecture while at the same time conducting tests to
>          uncover errors associated with interfacing. The objective is to take
>          unit-tested components and build a program structure that has been
>          dictated by design." [2]
>       * Note: Sommerville does not have a clear definition of integration
>         testing. He refers to incremental integration of components inside
>         the system testing (see [3]).
> 
>   2 - Validation tests:
>       - "Validation testing begins at the culmination of integration testing,
>          when individual components have been exercised, the software is
>          completely assembled as a package, and interfacing errors have been
>          uncovered and corrected. At the validation or system level, the
>          distinction between different software categories disappears. Testing
>          focuses on user-visible actions and user-recognizable output from the
>          system." [4]
>       - "where you expect the system to perform correctly using a set of test
>          cases that reflect the system’s expected use." [5]
>       * Note: the definition of "validation testing" from Sommerville reflects
>         the same definition found around the Internet, as one of the processes
>         inside the "Verification & Validation (V&V)." In this concept,
>         validation testing is a high-level definition that covers unit testing,
>         functional testing, integration testing, system testing, and acceptance
>         testing.
> 
>   3 - System tests:
>       - "verifies that all elements mesh properly and that overall system
>          function and performance is achieved." [6]
>       - "involves integrating components to create a version of the system and
>          then testing the integrated system. System testing checks that
>          components are compatible, interact correctly, and transfer the right
>          data at the right time across their interfaces." [7]
> 
> The tests implemented inside the QEMU "acceptance" directory depend on the
> software completely assembled and, sometimes, on other elements, like operating
> system images. In this case, the proposal here is to rename the current
> "acceptance" directory to "system."

Are user-mode tests using Avocado also system tests?
https://www.mail-archive.com/qemu-devel@nongnu.org/msg782505.html

> [1] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, A
>     Practitioner’s Approach. p. 430.
> [2] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, A
>     Practitioner’s Approach. Software Engineering, p. 398.
> [3] Sommerville, Ian (2016). Software Engineering. p. 240-242.
> [4] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, A
>     Practitioner’s Approach. Software Engineering, p. 407.
> [5] Sommerville, Ian (2016). Software Engineering. p. 227.
> [6] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, A
>     Practitioner’s Approach. Software Engineering, p. 377.
> [7] Sommerville, Ian (2016). Software Engineering. p. 240.
> 
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---

> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index f718b61fa7..c5de3c9fd5 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -52,7 +52,7 @@ include:
>      # Avoid recompiling by hiding ninja with NINJA=":"
>      - make NINJA=":" $MAKE_CHECK_ARGS
>  
> -.acceptance_template: &acceptance_definition
> +.system_template: &system_definition

.system_test_template: &system_test_definition ?

> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 8f220e15d1..c580292bb5 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -16,7 +16,7 @@ ifneq ($(filter $(all-check-targets), check-softfloat),)
>  	@echo " $(MAKE) check-tcg            Run TCG tests"
>  	@echo " $(MAKE) check-softfloat      Run FPU emulation tests"
>  endif
> -	@echo " $(MAKE) check-acceptance     Run all acceptance (functional) tests"
> +	@echo " $(MAKE) check-system         Run all system tests"


