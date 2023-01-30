Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B003681E35
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 23:38:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMcmY-0005NF-2O; Mon, 30 Jan 2023 17:37:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMcmW-0005Md-0R
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:37:44 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMcmU-0006tm-FP
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:37:43 -0500
Received: by mail-wm1-x334.google.com with SMTP id o36so3073511wms.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 14:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3D6be75JC80ezOXQG0PEbJnJqL7wcZeI5cX9SAOrmy8=;
 b=WGNNKCAtwSH7F5nAJYOVR/6QK85xHfVpQnMZAAk5HhzkY9hq4ZSwdTsTe4VTDYelSI
 MgYXyG4+OP37K3je2bwPpBwbzEES4zsM+PxL7/ICVr85VaqRjeur6Jcw6ADwNL55qNug
 hcUtGkFxagFPXVyEGzU2SOsNvBgNzSooD/GxusVgGEQU57eGSy3eifRw8fL8c7P1g9Fi
 kIKdH+jL6xfrKGr1eVaCab5ivo01t1lkUUqvNynspbJfUV9sVxMJ1G3CLrFHXIXdX+SP
 0YAwFjRGuU2QSf38Q5jmirXmhP23Tvu60JMzBdSxhwBAXUE3unb1z932U8mSc3AUnGIw
 F/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3D6be75JC80ezOXQG0PEbJnJqL7wcZeI5cX9SAOrmy8=;
 b=4CHS45CnQ8Mm4k1Vc02ONBZpHafKYOGiVHdglvs0kt7ZoqyX804tF1XKQgEx3bLOCd
 ynI1UlQgKGkXqQ2dxaw+rWnB/v8VM5SrrW/ckF1exdPRz49A02uyCnSPcsjKeK0tYxkn
 KpxhfMqZjsNcCCWfcKwPKedjhIn15yNdpFQrK2lpzMWOI8rsX/T7knhGu3f5aT7vhebP
 4GRyfg57sRimRHuoAb0rAZ5Uzp4Le5UEOr2s812kvRh3vH3W6OZtXSVAdDvBNqhe/2Cf
 Ly0ZED5R5jpnw440YBWX/tUWoOi0ktg1sGxJ7yPyLoF9wjvJWm10Vw39b3F5CeBig9/J
 bJLw==
X-Gm-Message-State: AFqh2krsd1dHemeoFvAZ+8/vbLaMPsaHZdyuh+FQod+1nUv4EO4157K5
 lyimM6tfW7wiUco1Z9sfSBiPcw==
X-Google-Smtp-Source: AMrXdXs2Zw+MpwfwYv1WhufRYIt4oB81GogDQN6Jlyj5iLjuoxedgTSNcFyu7lEd40E54ibrIJ97Lg==
X-Received: by 2002:a05:600c:1d8e:b0:3d1:fcb4:4074 with SMTP id
 p14-20020a05600c1d8e00b003d1fcb44074mr52704352wms.22.1675118259941; 
 Mon, 30 Jan 2023 14:37:39 -0800 (PST)
Received: from [192.168.0.115] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 h1-20020adfe981000000b002bfb02153d1sm15215583wrm.45.2023.01.30.14.37.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 14:37:39 -0800 (PST)
Message-ID: <768bac97-c104-443e-488c-e73008c2760f@linaro.org>
Date: Mon, 30 Jan 2023 23:37:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/6] gitlab-ci.d/buildtest: Remove ppc-softmmu from the
 clang-system job
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "open list:PReP" <qemu-ppc@nongnu.org>
References: <20230130104446.1286773-1-thuth@redhat.com>
 <20230130104446.1286773-2-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130104446.1286773-2-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 30/1/23 11:44, Thomas Huth wrote:
> We are also compile-testing ppc64-softmmu with clang in the "tsan-build"
> job, and ppc64-softmmu covers pretty much the same code as ppc-softmmu,
> so we should not lose much test coverage here by removing ppc-softmmu
> from the "clang-system" job.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.d/buildtest.yml | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index f09a898c3e..406608e5fc 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -316,8 +316,7 @@ clang-system:
>       IMAGE: fedora
>       CONFIGURE_ARGS: --cc=clang --cxx=clang++
>         --extra-cflags=-fsanitize=undefined --extra-cflags=-fno-sanitize-recover=undefined
> -    TARGETS: alpha-softmmu arm-softmmu m68k-softmmu mips64-softmmu
> -      ppc-softmmu s390x-softmmu
> +    TARGETS: alpha-softmmu arm-softmmu m68k-softmmu mips64-softmmu s390x-softmmu
>       MAKE_CHECK_ARGS: check-qtest check-tcg

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



