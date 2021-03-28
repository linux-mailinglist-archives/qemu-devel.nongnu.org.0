Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F8334BE54
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 20:48:30 +0200 (CEST)
Received: from localhost ([::1]:53948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQaSb-0003ct-9G
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 14:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQaPx-00021l-BI
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:45:48 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:42884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQaPv-00012M-FC
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:45:44 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 31-20020a9d00220000b02901b64b9b50b1so10199308ota.9
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 11:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XZSY7i944GIic+VkXt91VemU6xhjWG+Rx4FdteUuS1o=;
 b=Lf18UqE59TXL98rfMGifwb7cOtVXaW3mdYVhIJLwHY1Xt+rOxCe0qOzZJtlYBg9eXY
 YBjQ1r7/R8yJvWvaIJg9KpcqrGP2LKEeHuXPbKBiH8+1ODTz3p3TOhvSoiWYaG1V/lQn
 TsRUf72c/8irmvc8P7+QWoTKR0KdK7sGGXo7epFuUZ8SqX7Gt6CYE7tjydq5b72+Y9BW
 WLGtAWB+9OwXmAT/X15R53GYcXB+kVyX85xqoWJTF8gckCo6YE0L/aF6rcG/KzLw6boX
 zLT0LA+gV2t6BoAF4hcjOAT3WKD0WRcezBnBL9rTttQRUlU4RSNTJtaPTWOHqCkDpoh4
 tlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XZSY7i944GIic+VkXt91VemU6xhjWG+Rx4FdteUuS1o=;
 b=QCr/YBrvZ9j/i9t7Cut2AFF8iPXITQEfPWRt/MBGio4ZlpFSuNddtB5McfgcOtMHwZ
 EVsIl5BNwC3diSW62voil7fmpJVjXTDvAxa7TR8KUFOggGF3p9nTPsLG70tSis0TaI57
 KGdtxcSTtv/wPCHoIKFSlgvX4PowWy/TSD+k+2ZZkKVPLgpu48oyDxh4qRHwOlYT4lGp
 ID9BCJuZX6GVKd0YpUOwwQODTsXw2/VUWeIYKWknB9gBO+wqgde3SfL+VTgZ4M9z8xAp
 BYCfc9TAm7fxEX20tgsMDFpu96SeKBuAgaxh9mxk5S5YMUkx9iPF1851LuXh83b3EV3S
 CIrg==
X-Gm-Message-State: AOAM532MLFgumHV5JjAx81qf0m93XnX8spo8qVqY2kcWZUDCZmgVMAhL
 c3Mfp+5mEP2dcaETsAmx7Qn/FQ==
X-Google-Smtp-Source: ABdhPJwgZVDTLoqFcUMzm1YzTslQZzHq8qQZ2nQItqJwblfV5JQltorcHRY12rbfPukxdt/Lk+3GGg==
X-Received: by 2002:a9d:66c8:: with SMTP id t8mr15509567otm.173.1616957141657; 
 Sun, 28 Mar 2021 11:45:41 -0700 (PDT)
Received: from [192.168.44.35] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id w23sm3388161oow.25.2021.03.28.11.45.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 11:45:41 -0700 (PDT)
Subject: Re: [RFC v12 55/65] target/arm: cpu-exceptions: new module
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-56-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <14c8e2aa-a49a-2b0e-cdb4-815a58cf504b@linaro.org>
Date: Sun, 28 Mar 2021 12:40:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-56-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> extract the exception handling code from cpu-sysemu,
> and split it into general arm code and an AArch64-specific part.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu-exceptions-aa64.h |  32 +
>   target/arm/cpu.h                 |   4 -
>   target/arm/arch_dump.c           |   1 +
>   target/arm/cpu-exceptions-aa64.c | 553 ++++++++++++++++++
>   target/arm/cpu-exceptions.c      | 481 +++++++++++++++
>   target/arm/cpu-sysemu.c          | 975 -------------------------------
>   target/arm/cpu-user.c            |   1 +
>   target/arm/cpu64.c               |   1 +
>   target/arm/kvm/kvm64.c           |   1 +
>   target/arm/tcg/helper-a64.c      |   1 +
>   target/arm/tcg/helper.c          |   1 +
>   target/arm/meson.build           |   5 +
>   12 files changed, 1077 insertions(+), 979 deletions(-)
>   create mode 100644 target/arm/cpu-exceptions-aa64.h
>   create mode 100644 target/arm/cpu-exceptions-aa64.c
>   create mode 100644 target/arm/cpu-exceptions.c

This is the second move for all of this code.
Not a fan of that.  Come up with a plan and move it once.

I think the sve_exception_el move is a mistake, since as you have pointed out 
it is used far beyond exception handling.


r~

