Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8538F44485C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 19:37:07 +0100 (CET)
Received: from localhost ([::1]:59496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miL8E-0001ut-76
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 14:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miL0z-0004Rt-Pw
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 14:29:39 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miL0y-0004VW-9M
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 14:29:37 -0400
Received: by mail-wr1-x429.google.com with SMTP id t30so4934204wra.10
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 11:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C2QSvd7docAzWRlwrqa2YNv9mthYc+XTcMOeXp5HL6k=;
 b=ARmoh6ZD1+Uc7RSVtVkDBjgjDrxRU6dya6eE2yXXifKsdMfEHWrtc6kLRId00s4SD2
 sec3WxiGBABZuBuh9p7IIKjeFDiJ9qjnUhCo1Fi0sAiMFZXdVROv0UmEr+vSoC8KqVN3
 /qVLRO4ZflvMcCGayGYjdj8wSMRqT2dlcL/D+f1eoa5rDKTPTfcQtNonJH88frTT4e7C
 c3iYuuIdym94+xSGxwJ7QaVv2+j+hslsRYCRtDUbNMx2j33TXDyQ9+GUPVTHE5gUuhLF
 ytN9djBbo2OzwNhieJgPMhRtwln0kWtcEiXn0wvdsIwHk0Qmjyc0HjNUHRcavvNn+QAb
 tBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C2QSvd7docAzWRlwrqa2YNv9mthYc+XTcMOeXp5HL6k=;
 b=eUaqu1J45oIC9mOWbfIX+qXm5C2zHEjMw1vE/obiTqGWLMAHcY9bTZfnjRHaQKLNrL
 tfPuL+g15Go+ySFV+BlsOHlCbr3yJWosKUMtzpd0QoBOean8dzX3h0RixJCCXD7SUC5T
 NyfifQgNFfULQDsQeG0XTmw6Dhqlf6snPrnWEFjTGuR5zpAFqEQOoHyncBpUPIus3trB
 FS205ffPVWw2PcUWQQMrrQtqBUHir82uvamtLycwuQNlKEdhIfvIOVHCGh6EbSz97lKm
 rlMlvqKj8+5A2jQdZHqJKGSGXHhOpihbLDjGM5BKrwiVEJB/GLtLLib+5ATi1mlrsAjY
 OHxA==
X-Gm-Message-State: AOAM532+e+jX699M1NIVbXw34Sibge5dTGn/iom6rl/2CDFcqxE32G5q
 PaDExlBfztVreXj0KLqvV9k=
X-Google-Smtp-Source: ABdhPJxLNEc22MEAF1yzG4OlkFEodtQZv3vJy+d1dBeuutfSDq8zm8ZriGJbdPCX7hfpt/H0ruX0xg==
X-Received: by 2002:adf:cd04:: with SMTP id w4mr48912142wrm.406.1635964174745; 
 Wed, 03 Nov 2021 11:29:34 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id s13sm6251917wmc.47.2021.11.03.11.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 11:29:34 -0700 (PDT)
Message-ID: <122de229-1451-71a2-0c0b-fd8c85c8666d@amsat.org>
Date: Wed, 3 Nov 2021 19:29:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH] tests/docker: force NOUSER=1 for base images
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211103171339.721910-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211103171339.721910-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.528,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 richard.henderson@linaro.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 18:13, Alex Bennée wrote:
> As base images are often used to build further images like toolchains
> ensure we don't add the local user by accident. The local user should
> only exist on local images and not anything that gets pushed up to the
> public registry.
> 
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/Makefile.include | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 5bbbaceed1..462a3758d7 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -150,6 +150,10 @@ docker-image-debian-sparc64-cross: docker-image-debian10
>  # The native build should never use the registry
>  docker-image-debian-native: DOCKER_REGISTRY=
>  
> +# base images should not add a local user
> +docker-image-debian10: NOUSER=1
> +docker-image-debian11: NOUSER=1

What about covering all DOCKER_PARTIAL_IMAGES:

-- >8 --
@@ -188,6 +188,9 @@ DOCKER_PARTIAL_IMAGES += debian-tricore-cross
 DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
 DOCKER_PARTIAL_IMAGES += fedora-cris-cross

+# base images should not add a local user
+$(foreach image,$(DOCKER_PARTIAL_IMAGES),docker-image-$(image)): NOUSER=1
+
 # Rules for building linux-user powered images
 #
 # These are slower than using native cross compiler setups but can
---

