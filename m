Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8A4363768
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 21:54:34 +0200 (CEST)
Received: from localhost ([::1]:37272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYDV3-0001B0-Ph
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 15:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYDTg-0000LQ-Aw
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:53:08 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:46711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYDTc-0000vR-SN
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:53:07 -0400
Received: by mail-qk1-x72f.google.com with SMTP id v7so5898989qkj.13
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 12:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/Ga4FPIjrGQ7Ez8XZ+Eve+MsVH9tg7Co2JQmdp5bIlE=;
 b=GzTLVxGVehhxBvVrQE8YOkxEiJ95vLyaB7A8etzwZgy/94kHlwfLyxOlLEOHCS6Yfy
 f8EEYeEUJ+Wemx2PW4Hrjd7QFgmUAuu9qQB/H2ml7Cz0YkEj9s/8a3AVS9nvr5E6oQl8
 yn/GR+dtFEX7co/iql9l7gnmgFtPUFEBCaMza9BVB3frfwOl5PTAftovOy5W5gytsy/1
 6wRG2ISx4qRyTrgqwXSD3s7CSx4DKDG/0yOjBBYMmQ5sregx15OAhyYuaN/t/QtWzV3G
 UIIFViHqpalK+DyIte6m7RN22p7TmdORr+jDa42gyhb+64nd3J5tZCNh3wr5MdiuRoqa
 DBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Ga4FPIjrGQ7Ez8XZ+Eve+MsVH9tg7Co2JQmdp5bIlE=;
 b=keTOZ66EZWhJ2JFyrhy08wyFZ1b8G6vuuQqBO3zuNcY3LYO8Ty4HP6ioO3whiQaQDU
 22PrIrqsWo2HqGEcEVdtXoIgfSSLfjivIMkQ+zEi+Vfk13a+4ATSojnO8M+EjPXsTD5f
 1xsrEUcevV6DYkmswz/mZU0kXeYNmFFSkxqth28jIfJ+Z0rVY8we9xgyJiRE5PEm9Y7Z
 D1y5ASAap87UxJR9oHrk2dhCIQgpOFWmNGk0NaVGBSCMKrEfxPokqD/wKT9eIpOYQsZn
 4ochRQv4kRx/3SIk9JLAnsbnOFWniJiwSiu7mTZyJ2fX1e85glIvMEZt3odJXpmxQ88u
 APgQ==
X-Gm-Message-State: AOAM532H/x9Pj4PRlxtAQZNtxHVzaUSp/YB2nRq0S54xHyIhmSYtG+7E
 DR4h+GUlh9I+qVk7rD2i8N9rjA==
X-Google-Smtp-Source: ABdhPJyZMMntkhf6ue/Y5nGIjf9Brv9TIgcG0kveVqc8re2knIupLkMNWATwc9QD2DsPq4EVJA8k8A==
X-Received: by 2002:a05:620a:16a1:: with SMTP id
 s1mr8883336qkj.109.1618775583361; 
 Sun, 18 Apr 2021 12:53:03 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id u21sm7791894qtq.11.2021.04.18.12.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 12:53:03 -0700 (PDT)
Subject: Re: [PATCH 19/26] target/mips: Move helper_cache() to
 tcg/sysemu/special_helper.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-20-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9ac752b7-8cab-2324-7086-41f1dfe17c85@linaro.org>
Date: Sun, 18 Apr 2021 12:52:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-20-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> Move helper_cache() to tcg/sysemu/special_helper.c.
> 
> The CACHE opcode is privileged and is not accessible in user
> emulation. However we get a link failure when restricting the
> symbol to sysemu. For now, add a stub to satisfy linking, which
> abort if ever called.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/op_helper.c                 | 35 -------------------------
>   target/mips/tcg/sysemu/special_helper.c | 33 +++++++++++++++++++++++
>   target/mips/tcg/user/stubs.c            | 29 ++++++++++++++++++++
>   target/mips/tcg/user/meson.build        |  1 +
>   4 files changed, 63 insertions(+), 35 deletions(-)
>   create mode 100644 target/mips/tcg/user/stubs.c

You could add a different stub to translate.c instead.  See

https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg08595.html


r~

