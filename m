Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8D93A1720
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:24:16 +0200 (CEST)
Received: from localhost ([::1]:41430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqz7v-0002sz-NB
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqz6p-0001WJ-7o
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:23:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqz6n-0006ir-HC
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:23:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623248584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1u9fJqHIm3mlzIyjUYe5OyBEfVpHBlQ3358nfqqnokQ=;
 b=D1/1zyi4g6T7sgMzQYa5WjWODCzwe+GgEtzo7p6/vNHSfT3WJG7S6ZYCtwrt/RR+1W74YL
 ox0IukGdDyGSJM664ouc1dlhPCsrInT6Zdvd60LS0cCCR++/JhQMz7LGG25xNl3BcMUV7F
 hfRggqiZYj1JEmitm32x5WDqR7XtLmE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-KjuZOjq1Njayraqo_ZkM0g-1; Wed, 09 Jun 2021 10:23:02 -0400
X-MC-Unique: KjuZOjq1Njayraqo_ZkM0g-1
Received: by mail-wr1-f71.google.com with SMTP id
 z3-20020adfdf830000b02901198337bc39so10264211wrl.0
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 07:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1u9fJqHIm3mlzIyjUYe5OyBEfVpHBlQ3358nfqqnokQ=;
 b=WWkikgtuSXGqknp0WevZqi9iR4T4va0/KTjHx2l9iV2CtPuzdZu4kukM1ob3/sNtcq
 Fkaml+IF19tA3gc/KJkHkc0DILv9QGURhBwnCX2kLvk9Aty/QLZzCsbfM7jCm3S4pi1m
 bwEkrIdtBCoAy6+9JDrK39GVO7VOWg7vo5j7THzP7nVxvVHcbsLwhs0zoxR82e7mkWFD
 EcWyvURyN2yLT850hbiA2iW+8BLpccOOM3r8T0IhVhY5CriIf3TB4D4r3egzyHxRx8yb
 8Qv1upX6O5JwctnAUVpSt9w8sQIXKE0EbfYRSszNqiWEAxp9GhnZks0CSO5F1Jv00fVR
 gZTQ==
X-Gm-Message-State: AOAM532edc7j5kgJcZ5mw6RPomjtCsjdskDjg4NjblMTSBhTT4COt4gK
 Xc4o8BO968ZrTXp0mINtb7UkcC16fz1/Pm0tKhYMWYyGxw9QXRheydpecQUOxEyN726PjWue80E
 xWipfI5XIdyShw3s=
X-Received: by 2002:a7b:c8d0:: with SMTP id f16mr10516730wml.115.1623248581193; 
 Wed, 09 Jun 2021 07:23:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN6trRyDW3iK+m1Eksn2iqJUV15JVeT3Y6+0OiAYEc7tbz5QJGsNlTAEFfvMlmpBBn6grT9A==
X-Received: by 2002:a7b:c8d0:: with SMTP id f16mr10516703wml.115.1623248580977; 
 Wed, 09 Jun 2021 07:23:00 -0700 (PDT)
Received: from thuth.remote.csb (pd9e839fb.dip0.t-ipconnect.de.
 [217.232.57.251])
 by smtp.gmail.com with ESMTPSA id 25sm6450791wmk.20.2021.06.09.07.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 07:23:00 -0700 (PDT)
Subject: Re: [PATCH v6 1/4] Jobs based on custom runners: documentation and
 configuration placeholder
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-2-crosa@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5f651c30-87a5-0181-92ad-8bddc7d5a7bb@redhat.com>
Date: Wed, 9 Jun 2021 16:22:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210608031425.833536-2-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/06/2021 05.14, Cleber Rosa wrote:
> As described in the included documentation, the "custom runner" jobs
> extend the GitLab CI jobs already in place.  One of their primary
> goals of catching and preventing regressions on a wider number of host
> systems than the ones provided by GitLab's shared runners.
> 
> This sets the stage in which other community members can add their own
> machine configuration documentation/scripts, and accompanying job
> definitions.  As a general rule, those newly added contributed jobs
> should run as "non-gating", until their reliability is verified (AKA
> "allow_failure: true").
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   .gitlab-ci.d/custom-runners.yml | 14 ++++++++++++++
>   .gitlab-ci.d/qemu-project.yml   |  1 +
>   docs/devel/ci.rst               | 28 ++++++++++++++++++++++++++++
>   docs/devel/index.rst            |  1 +
>   4 files changed, 44 insertions(+)
>   create mode 100644 .gitlab-ci.d/custom-runners.yml
>   create mode 100644 docs/devel/ci.rst
> 
> diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
> new file mode 100644
> index 0000000000..a07b27384c
> --- /dev/null
> +++ b/.gitlab-ci.d/custom-runners.yml
> @@ -0,0 +1,14 @@
> +# The CI jobs defined here require GitLab runners installed and
> +# registered on machines that match their operating system names,
> +# versions and architectures.  This is in contrast to the other CI
> +# jobs that are intended to run on GitLab's "shared" runners.
> +
> +# Different than the default approach on "shared" runners, based on
> +# containers, the custom runners have no such *requirement*, as those
> +# jobs should be capable of running on operating systems with no
> +# compatible container implementation, or no support from
> +# gitlab-runner.  To avoid problems that gitlab-runner can cause while
> +# reusing the GIT repository, let's enable the clone strategy, which
> +# guarantees a fresh repository on each job run.
> +variables:
> +  GIT_STRATEGY: clone

I assume this now does not influence the shared runners anymore, now that 
the file is handled as last entry in the list below? Or is this a global 
setting that will also be used for the shared runners? Anyway, let's keep it 
for now, we can still try to improve later...

> diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
> index 64cb2ba1da..dde8270301 100644
> --- a/.gitlab-ci.d/qemu-project.yml
> +++ b/.gitlab-ci.d/qemu-project.yml
> @@ -9,3 +9,4 @@ include:
>     - local: '/.gitlab-ci.d/crossbuilds.yml'
>     - local: '/.gitlab-ci.d/buildtest.yml'
>     - local: '/.gitlab-ci.d/static_checks.yml'
> +  - local: '/.gitlab-ci.d/custom-runners.yml'

Reviewed-by: Thomas Huth <thuth@redhat.com>


