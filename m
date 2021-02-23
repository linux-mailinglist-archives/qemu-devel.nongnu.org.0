Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB11E322DA7
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:36:56 +0100 (CET)
Received: from localhost ([::1]:50750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZk7-0008Gf-7w
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEZj9-0007qn-00
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:35:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEZj5-0006xs-12
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:35:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614094548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mLPlyUYpsXa7xCWU2r78pGP6Mx5HFPKhcIQyztwnRks=;
 b=AsuTOikPT1f4TKtZg8hUyD9vLmeGU65GO9wBdQUC3K0rZ4xDqtrs2xVyg2uvGxUcVT5VZA
 FRCxdDcK88G53Ha2NwmN5tBSow8KmUmLQWGKAeyKcrGnXEVTXbr2SOBsDM9nhm+gWB0fkg
 C4+Y7MFpESH+KL3L+g7JzkkpgAV5eYg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-N00kY-wpM0iGj5BipDzL-A-1; Tue, 23 Feb 2021 10:35:45 -0500
X-MC-Unique: N00kY-wpM0iGj5BipDzL-A-1
Received: by mail-ed1-f72.google.com with SMTP id c7so1776349ede.17
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 07:35:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mLPlyUYpsXa7xCWU2r78pGP6Mx5HFPKhcIQyztwnRks=;
 b=ZFMJPMvzVYRUQh39E37BsUkpjK6QTqREdyOBitkITdIz+SHeBoABb82WJw6rkUCgg4
 D2LiTwEieTv7Xa0mmHosB6m6ZTtjfGLhejDM9lxDTIMw9grCOmfw1guwjL/5E9fWTujN
 oJh5T2PkNfGKFDy2B+BiV89qBKMIQvaTVjdBSQRG2EXpSTgEn3+ufvj/q1r3o3OWT/Go
 FlM59qwZbLPTKLvDMbGzEteP3RN6wcpj/DPXM9QkGwLdO6C4hE8Ep++NcX0crtwEJRpT
 1evIXPkQpqwMl+qnY4ISHGgOmDFZitVGvOB2S/rJpzRMfGIAVEs1MZG7rGHZTpQrCMza
 X/hQ==
X-Gm-Message-State: AOAM533ldnGTlVgnmz/t5K3GZsY1HBbeX4NnTKRgB9iDVPsvmDyfIWXs
 UNCv1+Bq4FY1/1LhurUVyC8SKPR4SawkNRu5sEtkDGsX4WfXpLwqymlkWW7j9UkqKKncvH7XvjD
 Yu5gBbmNfXn2rQfY=
X-Received: by 2002:a17:906:f10c:: with SMTP id
 gv12mr16655279ejb.407.1614094543511; 
 Tue, 23 Feb 2021 07:35:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySyLSMh03D5G2s+lE5Iv8bEEfyj/wC/dGjKBHlQT1rFZuTln6OvSkPOzSbiWGlBTYJxopvsw==
X-Received: by 2002:a17:906:f10c:: with SMTP id
 gv12mr16655249ejb.407.1614094543366; 
 Tue, 23 Feb 2021 07:35:43 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n2sm13878159ejl.1.2021.02.23.07.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 07:35:42 -0800 (PST)
Subject: Re: [PATCH v5 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-5-crosa@redhat.com>
 <1fc95a8d-e1f6-ef77-99c6-6b6876af0637@redhat.com>
Message-ID: <6377685f-046c-8802-2e2e-c489b9785c1b@redhat.com>
Date: Tue, 23 Feb 2021 16:35:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1fc95a8d-e1f6-ef77-99c6-6b6876af0637@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 4:27 PM, Philippe Mathieu-Daudé wrote:
> On 2/19/21 10:58 PM, Cleber Rosa wrote:
>> The QEMU project has two machines (aarch64 and s390x) that can be used
>> for jobs that do build and run tests.  This introduces those jobs,
>> which are a mapping of custom scripts used for the same purpose.
>>
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>  .gitlab-ci.d/custom-runners.yml | 204 ++++++++++++++++++++++++++++++++
>>  1 file changed, 204 insertions(+)
>>
>> diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
>> index 3004da2bda..a9166c82a2 100644
>> --- a/.gitlab-ci.d/custom-runners.yml
>> +++ b/.gitlab-ci.d/custom-runners.yml
>> @@ -12,3 +12,207 @@
>>  # strategy.
>>  variables:
>>    GIT_SUBMODULE_STRATEGY: recursive
>> +
>> +# All ubuntu-18.04 jobs should run successfully in an environment
>> +# setup by the scripts/ci/setup/build-environment.yml task
>> +# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
>> +ubuntu-18.04-s390x-all-linux-static:
>> + allow_failure: true
>> + needs: []
>> + stage: build
>> + tags:
>> + - ubuntu_18.04
>> + - s390x
>> + rules:
>> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> 
> Maybe this is too restrictive, we might want to test /master too.

Also now all fork pipelines are stuck...

  This job is stuck because you don't have any active runners online
  or available with any of these tags assigned to them: s390x
  ubuntu_18.04
  Go to project CI settings

https://gitlab.com/philmd/qemu/-/jobs/1050123478

What about using as starter:

  rules:
    if: '$CI_PROJECT_PATH == 'qemu-project/qemu'

> 
>> + script:
>> + # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
>> + # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
>> + - mkdir build
>> + - cd build
>> + - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
>> + - make --output-sync -j`nproc`
>> + - make --output-sync -j`nproc` check V=1
>> + - make --output-sync -j`nproc` check-tcg V=1


