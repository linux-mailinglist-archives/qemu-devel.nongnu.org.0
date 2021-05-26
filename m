Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EE7391FD4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:59:19 +0200 (CEST)
Received: from localhost ([::1]:38706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llykQ-0000xm-8b
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llyXF-0005Kx-Aj
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:45:42 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llyXB-0006tD-Vn
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:45:40 -0400
Received: by mail-pg1-x52a.google.com with SMTP id q15so1684558pgg.12
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 11:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CWBR1jr1j8GsZ14BSO1mB5UUKzmzWlVzrMsgLFg6KdI=;
 b=iOGgZp8p6bdT46boBKrnkR5Cwx1gzwftFX3TMPZi7jXplWc2tUZgv2Jtf+L/qFRKf0
 p/tz3Q8bgPXoqT4AXN8Sp0GDDD9Nk+3+hJ1hP97mYejjuep5rHqFJwNiQuXL2kKajWOT
 WgeZRx04w/kVIJSuD0zrMmC44hBMNpA5HDzFoCNmVy7wFduQQw/G+EThHUC2iRmrbXs/
 tfc4KSPci1uaYHCeXe+fboFZdwdqY1EEp/ufSvnaX3X/q9EHGZizc/PzkNWhJzsIYm9L
 lCypz8e7mM+Q4njnzJjlv35QA9HAZABI9DlRojz6IuCNXdn8VqQ2vd8fUxunr6rlS+a1
 UYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CWBR1jr1j8GsZ14BSO1mB5UUKzmzWlVzrMsgLFg6KdI=;
 b=UD8iZfKc/ULnADXl1QCvVTgDMB8de/l5nBulEUtwiP+E8pehnQ8okFggM7F7KuDqsP
 vuTSj6cnLY0z5RjKkYemBrD2tfUrx7LGeFPvdXyHmA/U6KXRfPrirFqi/vLX75yItR5r
 qf9OuBDFDYi1KQZ44hxv1zLGPsCRIXVoFQw1YGQuTJZvG5pON4Emht9OBZZz9yPA+vvg
 CqAJ5pZHHxstyuddLqEsFczvqi16SUc4g2OrnUWrNIiTgORLziqbVc+ddr4HQh4y04DG
 HxtsnSmObXCxjG+yPNRd2o37gFrMQdSDrEpvcqX9R1L26EDhtaagmGq+oq4kUEQr/gbY
 4sIQ==
X-Gm-Message-State: AOAM533OtipwS2pVz865zlI0PCwWcCE8MkeB2XKjFKwYulS2hNSfobLk
 81Lsb8FsRYLMp6UsszGFRqT4ZQ==
X-Google-Smtp-Source: ABdhPJwyaunPydAXErBpIeAZSefN84j77wC8usWiNrO2E8oS2ooTFxpdD8UMNeOiAvWLFIMNH2Cw5Q==
X-Received: by 2002:a62:ab14:0:b029:2db:b3d9:1709 with SMTP id
 p20-20020a62ab140000b02902dbb3d91709mr36325094pff.80.1622054735238; 
 Wed, 26 May 2021 11:45:35 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 r13sm16375888pfl.191.2021.05.26.11.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 11:45:34 -0700 (PDT)
Subject: Re: [RFC PATCH 02/15] accel/whpx: Simplify #ifdef'ry
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517115525.1088693-1-f4bug@amsat.org>
 <20210517115525.1088693-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f353037a-404d-730f-8424-70708943d55b@linaro.org>
Date: Wed, 26 May 2021 11:45:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517115525.1088693-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 4:55 AM, Philippe Mathieu-Daudé wrote:
> whpx_apic_in_platform() is called from:
> 
> - pic_irq_request() in hw/i386/x86.c
> - cpu_thread_is_idle() softmmu/cpus.c
> - apic_get_class() in target/i386/cpu-sysemu.c
> 
> whpx_enabled() is called from:
> 
> - cpu_report_tpr_access() in target/i386/helper.c
> 
> By converting macros to a function, we can remove the
> NEED_CPU_H dependency and build softmmu/cpus.c once
> for all targets.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/sysemu/whpx.h       | 15 +--------------
>   accel/stubs/whpx-stub.c     | 21 +++++++++++++++++++++
>   target/i386/whpx/whpx-all.c |  2 +-
>   MAINTAINERS                 |  1 +
>   accel/stubs/meson.build     |  1 +
>   5 files changed, 25 insertions(+), 15 deletions(-)
>   create mode 100644 accel/stubs/whpx-stub.c
> 
> diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h
> index 2889fa2278b..b32f46f9ebf 100644
> --- a/include/sysemu/whpx.h
> +++ b/include/sysemu/whpx.h
> @@ -13,20 +13,7 @@
>   #ifndef QEMU_WHPX_H
>   #define QEMU_WHPX_H
>   
> -#ifdef NEED_CPU_H
> -
> -#ifdef CONFIG_WHPX
> -
> -int whpx_enabled(void);
> +bool whpx_enabled(void);
>   bool whpx_apic_in_platform(void);
>   
> -#else /* CONFIG_WHPX */
> -
> -#define whpx_enabled() (0)
> -#define whpx_apic_in_platform() (0)

I think the loss of whpx_enabled as false is unfortunate. I'd like to see this 
file mirror sysemu/kvm.h with CONFIG_WHPX_IS_POSSIBLE.

As I mentioned vs patch 1, whpx_apic_in_platform would be handled via 
AccelOpsClass with whatever hook we come up with for cpu_thread_is_idle.


r~

