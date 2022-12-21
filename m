Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648F0652E20
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 09:56:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7utK-0004DC-Or; Wed, 21 Dec 2022 03:55:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7utE-00049n-EK
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 03:55:53 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7utC-0007Os-6H
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 03:55:52 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 r126-20020a1c4484000000b003d6b8e8e07fso793164wma.0
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 00:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r0OsUMLbwVMAvX2i2SdgWPPjXDEg7v17f7Tfm7Wrfao=;
 b=EUWSMmZz4GSO6rfXXbKSFLT0QFG68USNGLhx46i3bdanHIxKM3Klp7YrkfYoEgR0/L
 ZlNZR548+90a4ICIUrgOW8q3fvz5oE7GIiofa0rBA3kgH3bJVbFeHA5igsK/WmRHO2aU
 KgJL2hNnlsAKN2JNTWediELZ0pk8hYSzSxQNv5/0tnmDX+aS41SrRj+CS+AozKIHEZ+3
 Oj9PrgSn9q7InS265za9Aupo/ITSe3ENsGu1jXgIySvhg7INN6q667mvyHuc/LrD46CG
 6QTiAyxFUs4umeZ8qVnIHEFznBrQmqUodmlxZbdZ3j5LfetloI4p9lM4EGBIcSzH3nly
 HDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r0OsUMLbwVMAvX2i2SdgWPPjXDEg7v17f7Tfm7Wrfao=;
 b=c7U/F8UDn/BpmuBXPT/nl+MSFI6nZIA+k0FAhqLZvFUulqQph63SaCxRYDlw2CmEeW
 r5Kr7Y+Gx95qnGpolbnOSEP8AyFXb19XBAyRyvvGprvRZHOLIr2btgJehY+LMTvn4eWb
 lI/JhJ+3ponciQ0SjbnPpE4WCqFQw+hc47SRF17CkQ8revWAcmesGlyRZoabE7+tMPCK
 XOwGxw8yXMIn1GuD30bhXF96fGe/Pp4O6kgqW9bwDZqZEecFc/tqD2uIwgusd3iR7Sm+
 OhvxEZlMZIQo7Qo7qr+Kgo5hY+6LghVREtUto1BurbGd9y4P0XMpvIk5rL01X2J+kF1u
 hKIQ==
X-Gm-Message-State: AFqh2kowSPOdKtRdWCjGYT7ABd/TYW+IF81cYl9ux5qah9Yfv6SHDcYz
 zL9FYG1hXYCUsZNAhO0U4dSpJg==
X-Google-Smtp-Source: AMrXdXvmrtKPWQshoFsYHOxohve8AZnbZ4+w6heMJ1QUwy9LIufJOGaqvqKdWa8rQxUyOstybOv3/A==
X-Received: by 2002:a05:600c:6020:b0:3d1:f0b4:8827 with SMTP id
 az32-20020a05600c602000b003d1f0b48827mr961961wmb.25.1671612947702; 
 Wed, 21 Dec 2022 00:55:47 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c4fcf00b003c6f3f6675bsm1598048wmq.26.2022.12.21.00.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 00:55:47 -0800 (PST)
Message-ID: <219477b0-c932-c203-e03e-f0835453d397@linaro.org>
Date: Wed, 21 Dec 2022 09:55:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [[PATCH]--edit 5/6] tests/docker: use prebuilt toolchain for
 debian-hexagon-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
References: <20221221074252.1962896-1-alex.bennee@linaro.org>
 <20221221074252.1962896-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221074252.1962896-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/12/22 08:42, Alex Bennée wrote:
> From: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
> 
> The current docker image for cross compiling hexagon guests
> is manually built since it takes >2 hours to build from source.
> 
> This patch:
>   1. Solves the above issue by using the prebuilt clang
>      toolchain hosted on CodeLinaro [1] and maintained by QUIC [2].
>   2. The dockerfile is also switched from multi-stage to single stage
>      build to allow the CI docker engine to reuse the layer cache.
>   3. Re-enables the hexagon-cross-container job to be always run in
>      CI and makes it a non-optional dependency for the
>      build-user-hexagon job.
> 
> The changes for 1 & 2 together bring down the build time to
> ~3 minutes in GitLab CI when cache is reused and ~9 minutes
> when cache cannot be reused.
> 
> [1]: https://github.com/CodeLinaro/hexagon-builder
> [2]: https://github.com/quic/toolchain_for_hexagon/releases/
> 
> Based-on: <20221215095820.13374-1-quic._5Fmthiyaga@quicinc.com>
>   tests/tcg/multiarch: remove unused variable in linux-test

^ Please remove this tag

> Signed-off-by: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
> [AJB: also tweak MAINTAINERS]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20221219144354.11659-1-quic_mthiyaga@quicinc.com>
> ---
>   .gitlab-ci.d/buildtest.yml                    |   4 -
>   .gitlab-ci.d/container-cross.yml              |  19 +--
>   MAINTAINERS                                   |   1 -
>   tests/docker/Makefile.include                 |   4 -
>   .../debian-hexagon-cross.d/build-toolchain.sh | 141 ------------------
>   .../dockerfiles/debian-hexagon-cross.docker   |  53 +++----
>   6 files changed, 20 insertions(+), 202 deletions(-)
>   delete mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.d/build-toolchain.sh


