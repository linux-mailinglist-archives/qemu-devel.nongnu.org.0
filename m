Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9CC53D5FB
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 09:44:08 +0200 (CEST)
Received: from localhost ([::1]:33544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxOS7-0006vK-0i
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 03:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nxOQu-0006Gs-2D
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 03:42:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nxOQq-0004sD-E4
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 03:42:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654328566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=69NhCMSDSKIaWOun7EgBa+WASdIud7wWRME/w1VJke8=;
 b=Fe2E6ctjyX33XPE6tXSk+BMUaXL2RmA1qIJpjTkWy4TxghPS308lAiEx8KWG05l74RO8pV
 UUV2s/cPIybxSKHITDGQN2IIDw0HCGvkn6yWcNTBYpIZS2VzG1B0Fzk9NN8TpM/U7tSnHU
 9K/GekY9d1IypVMuVZSapP7QzrbMR7E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-NRp-iLPyOySNp6KHyWBJgA-1; Sat, 04 Jun 2022 03:42:45 -0400
X-MC-Unique: NRp-iLPyOySNp6KHyWBJgA-1
Received: by mail-ej1-f72.google.com with SMTP id
 rs21-20020a170907037500b0070c40030f0aso2731659ejb.20
 for <qemu-devel@nongnu.org>; Sat, 04 Jun 2022 00:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=69NhCMSDSKIaWOun7EgBa+WASdIud7wWRME/w1VJke8=;
 b=nH7KZxkjl8uzI3P+cBM3j+mCUaVMHZdniozgvXxFPB6anI3EBCggLYQMuGvGIfQmCv
 jI6heDU1jWvOWCnXwBncpOF+I9Szlbph4JJcai7WaJGPBKg9ZU93Sn94ISGb/uiuhMlj
 wHCyyODpuKQcw01+m5tbQIDYBNnLJPL60IRbq3TAe5Y4mHYbve3iKDsx8Rau1Sx0pF+p
 FNDC0mcMnkJ4YUCHr8jc8Eoh2xd9TK1+ZSzQHWcEoeQe00EIJgBj+r8nhuFRLHBWtjJi
 oLEe9lQcVur5IiQNvPw32Wel0f2wFUCJf4FupmGa5coXIsDRgSp1GeWk5HH5Uew45/IA
 jIPA==
X-Gm-Message-State: AOAM531cuq0ULoZiTRoG3uaSJ/+oiNeeYvFM2kpawrD8KSG+l8GE9o8Z
 E/G1DYUoZPWcf6hLXl+M0rWhj5qdm8sGgabN21jjOeAAczYwzqdmc20/RiSjTNMvszKhCmaa8Ci
 ltBA7m/R7qKIGKlg=
X-Received: by 2002:a17:907:2cc3:b0:6f8:5a21:4d62 with SMTP id
 hg3-20020a1709072cc300b006f85a214d62mr12525192ejc.256.1654328564201; 
 Sat, 04 Jun 2022 00:42:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvz/9G56BEK8n6aIV4bv4Sj6fwnX5w58jQmCp1Q0NXo9ceyrQsjN/nxkVShhOZvVSQ8X4xIQ==
X-Received: by 2002:a17:907:2cc3:b0:6f8:5a21:4d62 with SMTP id
 hg3-20020a1709072cc300b006f85a214d62mr12525177ejc.256.1654328563938; 
 Sat, 04 Jun 2022 00:42:43 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-213.customers.d1-online.com.
 [80.187.98.213]) by smtp.gmail.com with ESMTPSA id
 u15-20020a05640207cf00b0042dd60352d1sm5121162edy.35.2022.06.04.00.42.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jun 2022 00:42:43 -0700 (PDT)
Message-ID: <ceca01d7-f06f-6161-0e05-86c16f98a066@redhat.com>
Date: Sat, 4 Jun 2022 09:42:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] test/tcg/arm: Use -mfloat-abi=soft for test-armv6m-undef
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20220604032713.174976-1-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220604032713.174976-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On 04/06/2022 05.27, Richard Henderson wrote:
> GCC11 from crossbuild-essential-armhf from ubuntu 22.04 errors:
> cc1: error: ‘-mfloat-abi=hard’: selected architecture lacks an FPU
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/tcg/arm/Makefile.softmmu-target | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/tcg/arm/Makefile.softmmu-target b/tests/tcg/arm/Makefile.softmmu-target
> index 3fe237ba39..7df88ddea8 100644
> --- a/tests/tcg/arm/Makefile.softmmu-target
> +++ b/tests/tcg/arm/Makefile.softmmu-target
> @@ -20,7 +20,7 @@ LDFLAGS+=-nostdlib -N -static
>   
>   # Specific Test Rules
>   
> -test-armv6m-undef: EXTRA_CFLAGS+=-mcpu=cortex-m0
> +test-armv6m-undef: EXTRA_CFLAGS+=-mcpu=cortex-m0 -mfloat-abi=soft
>   
>   run-test-armv6m-undef: QEMU_OPTS+=-semihosting -M microbit -kernel
>   run-plugin-test-armv6m-undef-%: QEMU_OPTS+=-semihosting -M microbit -kernel

Reviewed-by: Thomas Huth <thuth@redhat.com>


