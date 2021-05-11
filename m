Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6D037A0BD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:21:28 +0200 (CEST)
Received: from localhost ([::1]:36916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgMhq-0000qF-SV
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMgI-0007n6-HI
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:19:50 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:43638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMgG-0001QH-8K
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:19:49 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 b19-20020a05600c06d3b029014258a636e8so639779wmn.2
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 00:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E5Ckh6aBciz0pOZNtjabyXj6UNekOuKG6kHRoH2tf/0=;
 b=CJ5D82xLHv5WCeNJyyGIFcPqj0CWxeJXWHwOsscrndeVLbWDwyC3IoOvk1itBKTDGR
 +cLOAF90aoSfedoVb6g5ooXubQZgmGE9pf3xgASSYfmCEkdjfTPt/UlMS/V2A3PVhwMt
 QhcIVBXr2ZQhmi0LT4Vtrco4TB4yZIlxjGL8Tz7mC4LNspcKXgELhLkHLLs6CGhn98Va
 +2K7VEQprxuq3feQ+TnHBhMURFhJDn1BUl9/k5Ofgg981c9ux7OlW/LrfZHRhJoE77Jc
 m8SgJLkc/2+riFy4Yzr9LogkpBe5/9f2n9zk7I41NNK5SRXhVRHBP8IOQnNpSzwDPBg3
 UQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E5Ckh6aBciz0pOZNtjabyXj6UNekOuKG6kHRoH2tf/0=;
 b=amqjNWunI+bo0uYurjpkhGjJ2WLkuZX5akXJNMgmK6vCpGH9dTgLjZTmytZq/xo681
 8GeVa0VgJjzXk2HW/Hvbo4ucmQ+304HZ0jCpbz0f1DS8n19Tn2KIU6l4xUnqD7GzXYp4
 qv48LTKu2ZuuDh525hvTezBQqfEbzhQ9Q876DwzmG8ohHoLXmajW5OXxvSgtoG4G0RDj
 pOEW3zEsFpqF3tfjMQoWIL5p2pkI5AHD8T5y/nm+w+eEspzhzsc6jKw8GrymE54ymk3d
 LIvGKnl6i2KQ2BUcxxm7GR6tkVWEncAlC1S+S1Yc/Lfm2jzV9gMbs+bLdjKfGXxgitEA
 B1nQ==
X-Gm-Message-State: AOAM530UJUX8j6kbW2I0+TiAbzXKO7+nceczELcD3WDffErdn6rKJ4gT
 l9F/2iwSqjGudd1HuRJ6oY4=
X-Google-Smtp-Source: ABdhPJyf/Y6Zo9snP4QyJV+018gK4CPX5lFuGWTJcSpCRp26GRXhFxCUs8IgtzLnv0pfamEiVg7usg==
X-Received: by 2002:a05:600c:1551:: with SMTP id
 f17mr30087490wmg.124.1620717586530; 
 Tue, 11 May 2021 00:19:46 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id m9sm1040742wrq.78.2021.05.11.00.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 00:19:46 -0700 (PDT)
Subject: Re: [PATCH 10/15] gitlab-ci: Extract all default build/test jobs to
 buildtest.yml
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-11-f4bug@amsat.org> <87a6pu9u65.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <70b58436-b153-fa7d-4be8-80cd7c2b4366@amsat.org>
Date: Tue, 11 May 2021 09:19:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87a6pu9u65.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Erik Skultety <eskultet@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 4/19/21 5:11 PM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> Extract the build/test jobs run by default on the mainstream
>> CI into a new file (buildtest.yml) and their templates into
>> (buildtest-template.yml), to be able to reuse the templates
>> without having to run all these mainstream jobs by default.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  .gitlab-ci.d/buildtest-template.yml |  80 +++
>>  .gitlab-ci.d/buildtest.yml          | 744 +++++++++++++++++++++++++
>>  .gitlab-ci.yml                      | 824 +---------------------------
>>  3 files changed, 825 insertions(+), 823 deletions(-)
>>  create mode 100644 .gitlab-ci.d/buildtest-template.yml
>>  create mode 100644 .gitlab-ci.d/buildtest.yml

> I don't know if my suggestion further bellow requires moving the above:
> 
>> +build-system-alpine:
>> +check-system-alpine:
>> +acceptance-system-alpine:
> 
> Maybe these can be moved into buildtest-rolling? Or maybe buildtest-[unsupported|other]?

As I temporarily can't test your suggestions, I'll send v2 without
them, and will try to address them on v3 (I am not ignoring them).

> <snip>
> <snip>
> 
>> +build-disabled:
>> +build-tcg-disabled:
> 
> to buildtest-custom?
> 
> 
>> +build-user-plugins:
>> +build-some-softmmu-plugins:
>> +clang-system:
>> +clang-user:
>> +build-cfi-aarch64:
>> +check-cfi-aarch64:
>> +acceptance-cfi-aarch64:
>> +build-cfi-ppc64-s390x:
>> +check-cfi-ppc64-s390x:
>> +acceptance-cfi-ppc64-s390x:
>> +build-cfi-x86_64:
>> +check-cfi-x86_64:
>> +acceptance-cfi-x86_64:
>> +tsan-build:
> 
> to buildtest-developer? is CFI a dev feature or a distro feature?
> Arguably they could be grouped together.
> 
> <snip>
>> +# These targets are on the way out
>> +build-deprecated:
>> +check-deprecated:
> 
> buildtest-developer or even buildtest-deprecated?
> 
> <snip>
>> +gprof-gcov:
>> +build-oss-fuzz:
> 
> buildtest-developer?
> 
>> +build-tci:
>> +build-coroutine-sigaltstack:
> 
> buildtest-custom?
> 
> <snip>
>> +crypto-old-nettle:
>> +crypto-old-gcrypt:
> 
> buildtest-custom or buildtest-legacy?
> 
>> +crypto-only-gnutls:
>> +build-without-default-devices:
>> +build-without-default-features:
> 
> buildtest-custom.
> 
>> +check-patch:
>> +check-dco:
> 
> buildtest-developer or maybe their own pr-qa?
> 
>> +build-libvhost-user:
>> +  stage: build
>> +  image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
>> +  needs:
>> +    job: amd64-fedora-container
>> +  before_script:
>> +    - dnf install -y meson ninja-build
>> +  script:
>> +    - mkdir subprojects/libvhost-user/build
>> +    - cd subprojects/libvhost-user/build
>> +    - meson
>> +    - ninja
> 
> I dunno, buildtest-misc?
> 
>> +# No targets are built here, just tools, docs, and unit tests. This
>> +# also feeds into the eventual documentation deployment steps later
>> +build-tools-and-docs-debian:
>> +pages:
> 
> Seems these could be under their own documentation section?
> 

