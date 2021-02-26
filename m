Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDF73264B4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 16:26:59 +0100 (CET)
Received: from localhost ([::1]:44032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFf18-0002JP-HB
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 10:26:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFezo-0001aZ-Lr
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 10:25:36 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:39605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFezk-00044v-VW
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 10:25:36 -0500
Received: by mail-pj1-x102f.google.com with SMTP id d2so6287692pjs.4
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 07:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3HUUv76m6hpoHChkX9g0dhePRJTqWSwGqQDIdcIpO7Y=;
 b=JO8mUX6+ki4tPkUne2hnXiN1cpUt0lTadbllpQC2fdjodyxeTJJIML/DHLG55XDDdF
 j5Ehv3nub1VO6wiX0og/x3XvMp6THPReQek3pnmyPMugm6vD9kBIQBIUzY2qy8hAiGBw
 Ky/2UhcZ4dvPUumPGQiPQHn5F7RzoRqPYON86UHXm5U4vf8a8ho6RD2Gnx438+8EL5ZI
 0n+GpoWX4hLLB1sFvbG+OI4PO3gXsVMMUbAUlXEEEAyuLmkEEi5QX/8yvZUztWhzl4dA
 hIMM6T6XbR0iWq2mH4oIn2Y1y019jr8wy9whQD4qzq/iI2gpevdznZHX+F3IivS1XRzA
 Kqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3HUUv76m6hpoHChkX9g0dhePRJTqWSwGqQDIdcIpO7Y=;
 b=C9JS6YKj2zkYgLcFnRVsS1Ei58uvHT/7VpRBizge+V1FE5cs5EasGIxfFDN991LmCr
 76RYcEcpU8XFrsGbcQL5aQbNoH7xC/2soqCtJutMpupHCSw5/cNVnq9Tv5/en0vjQGCJ
 yrr8R0LLfEICWNHUj6QUizq0nSk6fKkfT/HInik+0w6kyMItWhm+PmeXrg+CwBk/zMwM
 ePfX8ipD+TJ5mvWRTmq7O8zXpZtPU2Q4eHFnsBfwGQKzViqg/mgLu0FJSPdInuXB1km2
 Zb/Of6me0HL4KkgqZazrm9L3XCHXhId49yBQ8t6N15kileFC2c8yPRAbweYYYKsW9Dp8
 HnHg==
X-Gm-Message-State: AOAM531s92GMTXpxssj6nxINg5yU8T9CLKn5/G8RZZsAkTv2eulZjxBN
 jkmjdTlLLirZtMFrXNISZMnWThLK3EGT7w==
X-Google-Smtp-Source: ABdhPJxkxDE+TXUjxXgNmZMM5uMCZZSS5uNeXOiseW12Fldw0CjrXeHqTCifc5rM+F9mN8KuqC79sA==
X-Received: by 2002:a17:90b:438a:: with SMTP id
 in10mr849264pjb.165.1614353131398; 
 Fri, 26 Feb 2021 07:25:31 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id a16sm3225372pfg.9.2021.02.26.07.25.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 07:25:30 -0800 (PST)
Subject: Re: [PATCH v24 11/18] i386: split misc helper user stubs and sysemu
 part
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210226094939.11087-1-cfontana@suse.de>
 <20210226094939.11087-12-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <affdf247-a026-2f6c-5645-5fe24fe9431c@linaro.org>
Date: Fri, 26 Feb 2021 07:25:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210226094939.11087-12-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.349,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 1:49 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/i386/tcg/misc_helper.c        | 463 ---------------------------
>  target/i386/tcg/sysemu/misc_helper.c | 438 +++++++++++++++++++++++++
>  target/i386/tcg/user/misc_stubs.c    |  75 +++++
>  target/i386/tcg/sysemu/meson.build   |   1 +
>  target/i386/tcg/user/meson.build     |   1 +
>  5 files changed, 515 insertions(+), 463 deletions(-)
>  create mode 100644 target/i386/tcg/sysemu/misc_helper.c
>  create mode 100644 target/i386/tcg/user/misc_stubs.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

