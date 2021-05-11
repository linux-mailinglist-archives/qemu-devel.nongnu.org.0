Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB8737A842
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 15:56:46 +0200 (CEST)
Received: from localhost ([::1]:43110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgSsP-0003d9-Qy
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 09:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgSqN-0002AH-5s
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:54:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgSqI-0000DL-8p
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:54:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620741271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FTGQE5ae8EYjI74yDVFhckpdqvqO7Kt2PSpvQ/beph4=;
 b=XxNCeecD+DKB5w0e3JNQcpODHw8zPrRSRNsCk6ZybRmIJnaO7j0tdiXjvPm8Coa3rMrHQP
 1qge59TF4fbzhnbBXTCde+JSycVn+/lljhODDlL+buejD/ytDZJrlnaUjkkUo5NqyDTKI+
 TwPReFSB3b84fRbI2+6D6AiQhBaC7qs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-TdzL72KeNcGdg-3TQejlpQ-1; Tue, 11 May 2021 09:54:29 -0400
X-MC-Unique: TdzL72KeNcGdg-3TQejlpQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 u5-20020adf9e050000b029010df603f280so8784654wre.18
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 06:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FTGQE5ae8EYjI74yDVFhckpdqvqO7Kt2PSpvQ/beph4=;
 b=Qt6wS/q6wFE+iIm/pY7mYdqgCUrmEh+S6LxEBY//ajc3Rp0nUc6U6XkUug6zEB95aD
 UQPZCwJ5kLBB5zCs2p9T6ZFUcUoofN3fdcwNsPxdm4PmHUq/Ayj1oxqU+iP/aOilP0fv
 PEFbk31Ok30F9XoY0Wrz62GrhiwXpEa1oDQeHxv4ndPO/Nfp42T1mblOdp1uJnPSybBj
 z622s7XMCxfL2gBdmXAmba/xAHC0q0b3M/SooGc/eHTRxm0+nYejfkMAk3b6rY/8zu1E
 vU2KRGwVG3Bv24wvhkIbsPetJ+em1S0anmGH21kzniRK9KcJP+onzWUN2Rwo6qprMc1Q
 ZOuA==
X-Gm-Message-State: AOAM530ek7mxp870Xg2+gJ4HqjJCFyvP1YCUjNTXVsCCRXQ9u3+HvLAl
 fpDN6Y0cK1rVTvCKjBsNuxKkPXMFwMWdTL7CXa1dWpaix8JYeNOhd35OaYhHqhz4cqpewrfx+O1
 AzOddXm9wclxSoQI=
X-Received: by 2002:adf:ed45:: with SMTP id u5mr38308569wro.199.1620741268303; 
 Tue, 11 May 2021 06:54:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQVLaUMoW7ugNO/ew4HY03M2oKqVCfvZ3kJftOitEdfM8RmlSvmtWHUopBbyw6ghsh7wRshQ==
X-Received: by 2002:adf:ed45:: with SMTP id u5mr38308539wro.199.1620741268138; 
 Tue, 11 May 2021 06:54:28 -0700 (PDT)
Received: from thuth.remote.csb (pd9e835ac.dip0.t-ipconnect.de.
 [217.232.53.172])
 by smtp.gmail.com with ESMTPSA id a15sm26714177wrr.53.2021.05.11.06.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 06:54:27 -0700 (PDT)
Subject: Re: [PATCH 01/12] gitlab: move linux user build job from CentOS 7 to
 CentOS 8
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-2-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4f6620fd-bfed-7c35-4711-79d1625f9c7c@redhat.com>
Date: Tue, 11 May 2021 15:54:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210511132641.1022161-2-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: Willian Rampazzo <willianr@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/05/2021 15.26, Daniel P. Berrangé wrote:
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.yml                          | 6 +++---
>   tests/docker/dockerfiles/centos8.docker | 1 +
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index dcb6317aac..23917d6d73 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -441,12 +441,12 @@ build-user-plugins:
>       MAKE_CHECK_ARGS: check-tcg
>     timeout: 1h 30m
>   
> -build-user-centos7:
> +build-user-centos8:
>     <<: *native_build_job_definition
>     needs:
> -    job: amd64-centos7-container
> +    job: amd64-centos8-container
>     variables:
> -    IMAGE: centos7
> +    IMAGE: centos8

We urgently should decrease our huge amount of jobs ... What about removing 
this job completely? We already have the "build-user" job that tests the 
compilation on Debian, which is likely at a similar library level as 
centos8, so I doubt that we get much additional test coverage from this job 
here when it's running on Centos 8.

  Thomas



