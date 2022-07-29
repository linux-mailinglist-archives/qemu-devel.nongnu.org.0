Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63263585494
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 19:35:16 +0200 (CEST)
Received: from localhost ([::1]:43770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHTtL-0005S3-04
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 13:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHTol-0001xu-QW
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 13:30:31 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:38902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHToa-0005Xy-0Q
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 13:30:31 -0400
Received: by mail-pf1-x431.google.com with SMTP id o12so5194721pfp.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 10:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=aHWX6ZjzSRWj6GJlez7Vnx8nBOqhBycDwDFCk5C92Ew=;
 b=kNUbfSg422+LbKy2dyRlSYmOGZIc6GTinDDfGYMpELFgAnj1aMeOjpAeSTIYagu16k
 dF26IGdKIgG6DqMdBBlAabtXYI2Xs5y8dbELQkehbbpH2Uq7sWfQiMxqxKsyqjS3dZVn
 43uRlMVEUTbRen+NyBljRDLqVaa3K3+xwjHthDtmI/GV7nhNUSng0KshDOkZOqFs/Wgg
 CJELweTX483hQsG6olZiDmWPsl58RLfr9RWFWscwXR020Wi4IhUzcjU/9T7a8ZIIs2Di
 dM43tANVu7OV+o7YsW1JmCT0zHHiLoRswj5+cVnZ2Ta/jkVKrbiIpHT5RGq0IYdOgIqr
 DZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aHWX6ZjzSRWj6GJlez7Vnx8nBOqhBycDwDFCk5C92Ew=;
 b=wQ59ZdFzdGxpOXSyzAFzSd3JZ8TkUX29mSH0mN6uGfLNReZoc64qfDaoG5ZCBsf8o8
 60zUBtJ7tlX6Su8kBXUVY9Xqu3MLcH9n48bH3eqVlFTf6jENA22CzuEB6fHnAM137Jyt
 mcwzOETAxv+rENy3mzk4ovZBICIGlwR4l5yWc1DF4nZvGrek418amhywFZjYTJNWKJhx
 7V/KJcpuavaNjtwL4wtR3g3TU5TFgytDJ+w8sTBYwLF5+sziVqCyYPOiXq13NxgAOixl
 HqJPO3JF+BBVz+9XhNe5d3tEe4EhQEF0qNgF+gmMGuv2WU0/+HEZWvU7uzNK5N3U8Kpt
 BF8g==
X-Gm-Message-State: AJIora9JdkLrgre0LvjgbcN2iOV8KtQhP96COMi/Q3uH01v66csYhhmy
 sNDuwiZEx3zr086jqimJMCPqBA==
X-Google-Smtp-Source: AGRyM1sE6ViY5q4ppwkkXk0acvaxcwTyKK74kxeQu27IQlDZl6bYHR8SQ/JQLcqhX/Lmqeg4RLVVeQ==
X-Received: by 2002:a63:84c1:0:b0:41b:698e:ad0f with SMTP id
 k184-20020a6384c1000000b0041b698ead0fmr3726786pgd.195.1659115816425; 
 Fri, 29 Jul 2022 10:30:16 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:51c4:5cf0:5954:aeb6?
 ([2602:ae:1549:801:51c4:5cf0:5954:aeb6])
 by smtp.gmail.com with ESMTPSA id
 oo8-20020a17090b1c8800b001f3244768d4sm3273750pjb.13.2022.07.29.10.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 10:30:15 -0700 (PDT)
Message-ID: <77ad2044-797e-72b2-2774-6fb9b24b9338@linaro.org>
Date: Fri, 29 Jul 2022 10:30:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/6] Fixes for QEMU 7.1-rc1
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220729150438.20293-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220729150438.20293-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 7/29/22 08:04, Paolo Bonzini wrote:
> The following changes since commit 7b17a1a841fc2336eba53afade9cadb14bd3dd9a:
> 
>    Update version for v7.1.0-rc0 release (2022-07-26 18:03:16 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to ebc55f523c2f406e30ec8fad77bd3b9aad5d4579:
> 
>    configure: pass correct cflags to container-based cross compilers (2022-07-29 00:22:19 +0200)
> 
> ----------------------------------------------------------------
> * Misc build system bugfixes
> * Fix CGA 2-color graphics

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Claudio Fontana (1):
>        stubs: update replay-tools to match replay.h types
> 
> Cornelia Huck (1):
>        kvm: don't use perror() without useful errno
> 
> Paolo Bonzini (3):
>        ui: dbus-display requires CONFIG_GBM
>        vga: fix incorrect line height in 640x200x2 mode
>        configure: pass correct cflags to container-based cross compilers
> 
> Richard Henderson (1):
>        configure: Fix ppc container_cross_cc substitution
> 
>   accel/kvm/kvm-all.c  | 2 +-
>   configure            | 3 +--
>   hw/display/vga.c     | 3 ++-
>   meson.build          | 4 ++--
>   stubs/replay-tools.c | 9 +++++----
>   target/arm/kvm.c     | 2 +-
>   ui/meson.build       | 2 +-
>   7 files changed, 13 insertions(+), 12 deletions(-)


