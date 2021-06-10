Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C51D83A2459
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:19:11 +0200 (CEST)
Received: from localhost ([::1]:38754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrE22-0002t0-Sd
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lrE18-00027T-5H
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:18:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lrE14-0007zB-Lq
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:18:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623305888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=05MN/ehG2w90gLj27ddoDKauF0qAG/5EzL+uM1ZFazY=;
 b=a0ndzaELTs1dooAq64bKi/+5ukykEnuZDXg6XM5zR7YQ8vvPx1McuPgdOTjLEWJlKJv/wj
 7oCrGO8TyHf1tO9ydhWGfN9wcGbzuGs8WusPp7O5npOzkJt6AJTuaePZlf2bXhvBG9qUzQ
 4XmA4EFW2j2mH6l32+JlAiFtQLo64Mk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-9fE-KAWqOe2Z77fv-g0OXQ-1; Thu, 10 Jun 2021 02:18:04 -0400
X-MC-Unique: 9fE-KAWqOe2Z77fv-g0OXQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso384159wrh.12
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 23:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=05MN/ehG2w90gLj27ddoDKauF0qAG/5EzL+uM1ZFazY=;
 b=lLRJOmiQaPOFejorwFRPgZAvFiv84YGq3X+nEgFrruZ3o9C7PKooGaI3rfBEp6mDaD
 7dcmCpb1OXWtF99020qKNJNjeMm2sr+4T+6inxjLN/OhaeJr9LkgOVmyzpZrf3rStzdv
 W92D1B8hTC77VtfWfmGXJszbWzk1qaKV+4a/vR9TsoKacj/zsymvq+udHv210QaWYncz
 Gfl8GX7qUhb8NhDNYXuWOn+ZaE0uDmp74VuWWbbFD2GfLuBn3/1C2LtztrHRhniutADe
 pu/V80OsgeMaTwoRWMdNMmTvneJwmWw26oA96EehHV1OfadE1ly0Q881B1ghZSdet5JV
 4wPw==
X-Gm-Message-State: AOAM531JC5k3WyJ3+GfhNolf8PzA9A8ddoX/7m9yzaRU8IDCkjzm/p1/
 oAw3qcPsq7Q4RTdzgnZSTuoZzyfuETjOuSy9tWQtTvh458Urg0jouuK2sxGh+TAjqw3y9ZL80Ax
 qwg6RF7P9+ZqOfqo=
X-Received: by 2002:adf:f207:: with SMTP id p7mr3290364wro.275.1623305883817; 
 Wed, 09 Jun 2021 23:18:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrkaGCvJLNCW75FaEZaoTFAHBTItvWtyOlkImWYWvDz+gcrW+TtCNJSQvfpJEfgFEp/RnUzg==
X-Received: by 2002:adf:f207:: with SMTP id p7mr3290337wro.275.1623305883599; 
 Wed, 09 Jun 2021 23:18:03 -0700 (PDT)
Received: from thuth.remote.csb (pd9e839fb.dip0.t-ipconnect.de.
 [217.232.57.251])
 by smtp.gmail.com with ESMTPSA id x3sm8163514wmj.30.2021.06.09.23.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 23:18:03 -0700 (PDT)
Subject: Re: [PATCH v6 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-5-crosa@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <971d069b-9ba1-073d-34aa-15beb1d1a751@redhat.com>
Date: Thu, 10 Jun 2021 08:18:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210608031425.833536-5-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
> The QEMU project has two machines (aarch64 and s390x) that can be used
> for jobs that do build and run tests.  This introduces those jobs,
> which are a mapping of custom scripts used for the same purpose.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   .gitlab-ci.d/custom-runners.yml | 208 ++++++++++++++++++++++++++++++++
>   1 file changed, 208 insertions(+)
> 
> diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
> index a07b27384c..061d3cdfed 100644
> --- a/.gitlab-ci.d/custom-runners.yml
> +++ b/.gitlab-ci.d/custom-runners.yml
> @@ -12,3 +12,211 @@
>   # guarantees a fresh repository on each job run.
>   variables:
>     GIT_STRATEGY: clone
> +
> +# All ubuntu-18.04 jobs should run successfully in an environment
> +# setup by the scripts/ci/setup/build-environment.yml task
> +# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> +ubuntu-18.04-s390x-all-linux-static:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_18.04
> + - s390x
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'

I don't think this will work very well... sub-maintainers might want to push 
to a "staging" branch in their forked repositories, and without the s390x 
runner, the pipeline gets stuck now:

  https://gitlab.com/thuth/qemu/-/pipelines/317812558

We had the same issue in the kvm-unit-test CI, and we solved it there by 
rather making it depend on an environment variable that has to be set if the 
runner is available:

  only:
    variables:
     - $S390X_RUNNER_AVAILABLE

I think that's also nicer in case someone brings their own s390x runner and 
want to use the CI tests on other branches than staging.

Could you please change your patch accordingly?

  Thanks,
   Thomas


