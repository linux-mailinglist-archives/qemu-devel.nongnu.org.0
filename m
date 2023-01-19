Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DEC673E5A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 17:15:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIXYH-0006MW-St; Thu, 19 Jan 2023 11:14:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIXYF-0006KU-Pr
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 11:14:07 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIXYD-0002Q4-31
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 11:14:07 -0500
Received: by mail-wm1-x334.google.com with SMTP id q8so1927567wmo.5
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 08:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q1MSM7ZtQbaef2XsxiKC4Gik8tnSr6KmkvCbO4U/GLg=;
 b=B1NSaw57yXSQDN/w8jooFhTRvKmJtFd+TIN2fsPDk9dkUemquiz3fH4ek84+R+oI+x
 z8f6yJOj35pao4bSUTrW1MTbt55kmVunFPaJld+QeXikpcekK/JleL/CCLaePZW/Kv3J
 PaLccHHV9LxyFlvCzR6Bm/ugyf9g56zmdlWT94Up9+GzqTB3xyfvMftPGzI07zN9jSw0
 Mw/40X4Xz5LdHDO0iE3u3MJQ5dLgySXSSfNc4v7OmVIhEFGJpThB/rG1oZQCbfd7HnlS
 rbK64joADy//KWHcMj4C+kssVGJg/EkXTTO3QlxeNPm7TO3imSxYhz+mNlaKOY+LstJp
 zw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q1MSM7ZtQbaef2XsxiKC4Gik8tnSr6KmkvCbO4U/GLg=;
 b=PDILAI7oFZIahHqh0wwpFe/UW8bixZGllaQYJXzNXvSrzoQiDsr9tIRjtepXrAnxPt
 HeBB57MTxPRtoZ79QW8LaSkCTwS82DQKdWOQO+lSD12Hb2DiN+CAe5GsjFAragBsVJyY
 swuAmEZFfK32a5HAiK/pM2uzUiGyy0b9FwtXChbfUnznQqZ9DdV6z9H7MtvhMyDL6NQG
 /axYpsGFj3FSnnjTGQ5lPz2wdmzOtYtzzPczzO2BUL4sv5XIhIBj/EPNrFCaIGh7nhzR
 1iaODsxACvd77RNrHO+d51sJPD1nUuOL+3eFrAXXxSE1DVlnuJ/xsQ6nD5KOBHIfUWge
 KNCg==
X-Gm-Message-State: AFqh2kqISlOtDxZcprWbHwSQDhqV98XP0yfPBc08Ad9OHp23lXCDU4Hy
 ua6uQM+2M/zSavO3l7Itu4fVTQ7MOO5Qv0ku
X-Google-Smtp-Source: AMrXdXuD0x3uYYc4FXDX50QFbEfLk11hdu11vkHw/689KT/Mx2XQvAlo7WK+W994UBqKjl2a9CGlZg==
X-Received: by 2002:a05:600c:b54:b0:3c6:e60f:3f6f with SMTP id
 k20-20020a05600c0b5400b003c6e60f3f6fmr10806821wmr.38.1674144843275; 
 Thu, 19 Jan 2023 08:14:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05600011cf00b00294176c2c01sm33658036wrx.86.2023.01.19.08.14.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 08:14:02 -0800 (PST)
Message-ID: <1c54e0ce-31ef-ada7-269b-9d3ee09a7b6a@linaro.org>
Date: Thu, 19 Jan 2023 17:14:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] gitlab-ci: Check building KVM-only aarch64 target
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-arm@nongnu.org
References: <20230119155646.50503-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119155646.50503-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 19/1/23 16:56, Philippe Mathieu-Daudé wrote:
> gitlab-ci: Add KVM-only aarch64 cross-build job
> 
> Add a new job to cross-build the aarch64 target with
> only the KVM accelerator enabled (in particular, no TCG).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Based-on: <20230118193518.26433-1-farosas@suse.de>
>            target/arm: CONFIG_TCG=n part 1
> 
> Successful job:
>    https://gitlab.com/philmd/qemu/-/jobs/3630178191
>    Duration: 15 minutes 25 seconds

Alternatively we could move it to the custom aarch64 runner
in the qemu-project namespace...

> ---
>   .gitlab-ci.d/crossbuilds.yml | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 8dbbb8f881..fc78d36b31 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -210,3 +210,12 @@ cross-arm64-xen-only:
>       IMAGE: debian-arm64-cross
>       ACCEL: xen
>       EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
> +
> +cross-arm64-kvm-only:
> +  extends: .cross_accel_build_job
> +  needs:
> +    job: arm64-debian-cross-container
> +  variables:
> +    IMAGE: debian-arm64-cross
> +    ACCEL: kvm
> +    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-xen --without-default-devices


