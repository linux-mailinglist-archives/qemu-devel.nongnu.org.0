Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D6438097A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:26:35 +0200 (CEST)
Received: from localhost ([::1]:58854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhWtm-0006Y0-B5
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWmE-0004YC-A8
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:18:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWmB-0006QA-Je
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:18:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620994720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kbLH85LcTs4n0AAuXXBJVuE4zZ+zW/ehuDxBglQQgoU=;
 b=UREy//SBWpLMlH52c6ThIuOUjowzDei/sWAayyA7cIw9G3ooemCDYCtGHCotVxZjOJ5qxa
 OApegK9cF5OsldZe6RYkJZs+dOanOs/7Jk0djzVVHiKNbx9qBDgq3iRu1ywwqpDPv8lPUC
 v6pRdN0W+dKcPzmmkH3fJ/9UqI+RO18=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-wJuGFw9YOKCUAuDtSFvDqA-1; Fri, 14 May 2021 08:18:38 -0400
X-MC-Unique: wJuGFw9YOKCUAuDtSFvDqA-1
Received: by mail-wm1-f70.google.com with SMTP id
 u203-20020a1cddd40000b029016dbb86d796so1045713wmg.0
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 05:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kbLH85LcTs4n0AAuXXBJVuE4zZ+zW/ehuDxBglQQgoU=;
 b=J8bOBvt0f1s0cC1FllJ73iSxnnCYoXq/oo9VFC/c38ImkZFJHI1xtcXremAawGxgyn
 tABVQvvoqpYUFPxccbEIQIBelpS0WCzi/lVCQA8Swgz/Sf4MIWLOnyQ7SMUrUDL67n8e
 1Jhm2w+Lbhu3jMGHcY75kIW1vyl/JmMs6RlCTHBZivXQXcUHDgUvu54kO3kiSfRh8J0x
 b2/3w4b5A0wzJhczmLrn2J5hD2L90O7vL9AyyIuQblea+dDYoQv3rdr77mBG2aAJZWJi
 gGcLd9+JgOV+xZZIm6LFy59ycBFoCvx4ZvNX9dg3Xm7NFNviPNIyy8z0u0NP2xu9p7cR
 jnhA==
X-Gm-Message-State: AOAM530Xe258+i453hlvPswjT2rpWAMbpE2X9XWB3HoiW9S0AVDj/mB1
 piTo7LZN37Yr1IUAFrVg1QVHrUSR0dO+XaQkdi+rDAmqxxkhqnizbMnUPIMiglSHcwcv4e2XDj5
 s4xsrZoj1A4NljrU=
X-Received: by 2002:a5d:6551:: with SMTP id z17mr57186377wrv.372.1620994717606; 
 Fri, 14 May 2021 05:18:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWoqS2OBsjNm2kRQrb1ASioWKIkrM+7xSxMQy4oGilJssDQDjS24Jr2bAKlpaomdXaTbpW+w==
X-Received: by 2002:a5d:6551:: with SMTP id z17mr57186348wrv.372.1620994717368; 
 Fri, 14 May 2021 05:18:37 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83cd9.dip0.t-ipconnect.de.
 [217.232.60.217])
 by smtp.gmail.com with ESMTPSA id p1sm6560420wrs.50.2021.05.14.05.18.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 05:18:37 -0700 (PDT)
Subject: Re: [PATCH v2 02/12] patchew: move quick build job from CentOS 7 to
 CentOS 8 container
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210514120415.1368922-1-berrange@redhat.com>
 <20210514120415.1368922-3-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a81e608c-d98d-a0a1-19de-3ac4b7f3e89f@redhat.com>
Date: Fri, 14 May 2021 14:18:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210514120415.1368922-3-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: "fam@euphon.net" <fam@euphon.net>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/2021 14.04, Daniel P. Berrangé wrote:
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .patchew.yml | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/.patchew.yml b/.patchew.yml
> index 988c29261f..2638b7f564 100644
> --- a/.patchew.yml
> +++ b/.patchew.yml
> @@ -88,7 +88,7 @@ email:
>           more information:
>   
>           {{ logtext }}
> -        {% elif test == "docker-mingw@fedora" or test == "docker-quick@centos7" or test == "asan" %}
> +        {% elif test == "docker-mingw@fedora" or test == "docker-quick@centos8" or test == "asan" %}
>           Hi,
>   
>           This series failed the {{ test }} build test. Please find the testing commands and
> @@ -124,13 +124,13 @@ testing:
>         script: |
>           #!/bin/bash
>           time make docker-test-debug@fedora TARGET_LIST=x86_64-softmmu J=14 NETWORK=1
> -    docker-quick@centos7:
> +    docker-quick@centos8:
>         enabled: false
>         requirements: docker,x86_64
>         timeout: 3600
>         script: |
>           #!/bin/bash
> -        time make docker-test-quick@centos7 SHOW_ENV=1 J=14 NETWORK=1
> +        time make docker-test-quick@centos8 SHOW_ENV=1 J=14 NETWORK=1
>       checkpatch:
>         enabled: true
>         requirements: ''
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


