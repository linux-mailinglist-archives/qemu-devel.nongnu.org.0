Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAB55A34E9
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 07:46:56 +0200 (CEST)
Received: from localhost ([::1]:57972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRoek-000335-Tw
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 01:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRoZk-0000MJ-Of
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 01:41:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRoZi-00041o-TA
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 01:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661578902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JqUQKGPoCo6YNFwg99xlHuZi91O2N3EbAXPwhEXJEcA=;
 b=LzIkOxiL3dkRGjGECutEI987OWU++KJkeAuEJuWK56/nuMFI4KrZ2PCGmvxqneEf16NIht
 2x2GYUW6Jx5E7WgnKTwXJIo3U2vJVp9cziuEinSVyzkVR16j1WQwvR6O45qNPApsQsLhvo
 uCgJ47tRtlOqrV7oQZMiyRhtBmesVGs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-264-thDra4rzPDOJnXgUAlADsw-1; Sat, 27 Aug 2022 01:41:39 -0400
X-MC-Unique: thDra4rzPDOJnXgUAlADsw-1
Received: by mail-wm1-f69.google.com with SMTP id
 i7-20020a1c3b07000000b003a534ec2570so5065221wma.7
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 22:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=JqUQKGPoCo6YNFwg99xlHuZi91O2N3EbAXPwhEXJEcA=;
 b=PSDEjpSVVQfZ0dRJKOh/suTvV8TBixTS6/6l7aCiY6yAfGPMbkIVF/9tPPZPK7+nn4
 Aebv/R212QwJNkQRJTbRFeDW4RfalyPHjCGFhPU9CNGanKrS1a2WK9a2BtFFOEgK0X3E
 p9GAQCJdiTX5e8eFawJ6WJ+GVmltgO5kxYozxrA5PhSAYmghAEiEea+9wY0bL6D3wOTz
 v96gGhZgQRR8kKo2UlCg7veFgDl9gMSqDag/oTZ+P45ghmYR3Zcr40XdXyqWrnrta7zt
 iMOpzhmo3iRck3eeMJ8XZcFrdRQdHL98msjNjPM/WkaVTox4tveD6w3eFT8Ud7hpuZwS
 +ksg==
X-Gm-Message-State: ACgBeo1cJopq1bV8bCk1kd525GgtUEmNEqbovwE8yt/PyXvLCJhDO0Vc
 D4f0ZT5TNn84gzvuojMPFhkApmWbcdFFYWLHXIOSNRco85bl3z3dAIjhyYC+8kyriljAysnUTXW
 SCGM/99NOYy+4chM=
X-Received: by 2002:a7b:cd0f:0:b0:3a5:ec59:daf0 with SMTP id
 f15-20020a7bcd0f000000b003a5ec59daf0mr1368347wmj.13.1661578898059; 
 Fri, 26 Aug 2022 22:41:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6+DoARTUdfZLbkBO81NGXo9wdCDG4L+e786FxNqQqiM58flIKGSBzpPsOSGqab2iz8DZNiHQ==
X-Received: by 2002:a7b:cd0f:0:b0:3a5:ec59:daf0 with SMTP id
 f15-20020a7bcd0f000000b003a5ec59daf0mr1368332wmj.13.1661578897803; 
 Fri, 26 Aug 2022 22:41:37 -0700 (PDT)
Received: from [192.168.8.101] (tmo-097-69.customers.d1-online.com.
 [80.187.97.69]) by smtp.gmail.com with ESMTPSA id
 o14-20020adfcf0e000000b0022063e5228bsm1412367wrj.93.2022.08.26.22.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 22:41:37 -0700 (PDT)
Message-ID: <151c741b-7504-fcf2-7b09-999c8df5ee60@redhat.com>
Date: Sat, 27 Aug 2022 07:41:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 20/25] tests/docker: update and flatten
 debian-loongarch-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-21-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220826172128.353798-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 26/08/2022 19.21, Alex Bennée wrote:
> Update to the latest stable Debian. While we are at it flatten into a
> single dockerfile. We really don't need the rest of the stuff from the
> QEMU base image just to compile test images. In this case it is a
> binary distribution of the toolchain anyway.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include                          | 1 -
>   tests/docker/dockerfiles/debian-loongarch-cross.docker | 5 ++++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index a0f5109628..1d5a6f1fb4 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -128,7 +128,6 @@ docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
>   	$(call debian-toolchain, $@)
>   
>   # Specialist build images, sometimes very limited tools
> -docker-image-debian-loongarch-cross: docker-image-debian11
>   docker-image-debian-microblaze-cross: docker-image-debian10
>   docker-image-debian-nios2-cross: docker-image-debian10
>   
> diff --git a/tests/docker/dockerfiles/debian-loongarch-cross.docker b/tests/docker/dockerfiles/debian-loongarch-cross.docker
> index ca2469d2a8..48fe64c51b 100644
> --- a/tests/docker/dockerfiles/debian-loongarch-cross.docker
> +++ b/tests/docker/dockerfiles/debian-loongarch-cross.docker
> @@ -5,7 +5,10 @@
>   # using a prebuilt toolchains for LoongArch64 from:
>   # https://github.com/loongson/build-tools/releases
>   #
> -FROM qemu/debian11
> +FROM docker.io/library/debian:bullseye-slim

In previous patches you were using "debian:11-slim", now it's 
"bullseye-slim" ? ... doesn't matter much, but it's a little bit 
inconsistent. Anyway:

Reviewed-by: Thomas Huth <thuth@redhat.com>


