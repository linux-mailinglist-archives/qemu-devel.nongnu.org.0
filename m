Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10AD391F1B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:29:30 +0200 (CEST)
Received: from localhost ([::1]:54258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyHZ-0004ev-Rk
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lly3x-0004eL-5b
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:15:26 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:45980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lly3u-0007lT-0e
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:15:24 -0400
Received: by mail-pf1-x42f.google.com with SMTP id d16so1548339pfn.12
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 11:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IZT2u0DYS10fXkQgmFUzU8ndiElgKcHB5ML+mAqNLtY=;
 b=AOhkHJIlkSDuty+z/8HJUgUT3jkSZMtIkI3yRY+4wfUPi/RgYhQuHAC1gIoXifsZLh
 e4bn+fD+HTuQl9OukA3T8QQjBiSBj4fv8T3TrC/8jFTzWTX6HjQNHQrWD1u7FQL1nvAd
 S1S0etFLlBxjP6kKreNpWk7WZUCKm8XlIsz3b2qoiR2738Ysf7/StntlsRS8kLfFPyVt
 dJbvCNIVLQA9Bl5Edy9A9Wtd1Tu0gH2k/E28ocdXzfbFQNG0v4/IwQ8oCSHUFfUN3SyM
 cjJn6FVolAhSdlTi+lcUgI/HlUCjg5WNfQU6s+mXTatXto++4duM+r34k0kumPPENZYt
 A7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IZT2u0DYS10fXkQgmFUzU8ndiElgKcHB5ML+mAqNLtY=;
 b=LBFR74PZ+Fyb1pCRsRfLiCOV7974YKYXLlMPv406vGuXTry9sYD4Ypq2Qd8ab3GW9l
 VQNQpyWMH1Pm+GsofQFeS3PEuCipM50cyjiGas+Kf2suYMNJFBbXf2VfjaJmpy8PDz91
 rTtpuatGj09bOPmXmdCLw/0dOve3VW8sV554H2VRrXxLu09fLG0OpiRVxphmmO25Z3MA
 3tVPrvDDvRJNYLpu/cWUOTyUab3RaiYnhx9kltQ/unBV26zks2WeMkZKNNmPq2j2NhMV
 44uNA25AJ05hXp+ogTGiv5nqquQ1puNbS1Tm0GuGKSmXzD5KROIaW9+5Gm4uylIc5htx
 ndQg==
X-Gm-Message-State: AOAM532pZekywlPx9YLkRS5j+QunMIdzN1GH7406/MI24MG42VvqHnUP
 NW9Y/fpesrUwL7bMZsXKU1BYSw==
X-Google-Smtp-Source: ABdhPJzG9r50MrIH/2mApj36rSjyKQmN+Kul4CWa0KhofHJLo1blbhgPUj7tDmoDXZh+rWQzxsplMg==
X-Received: by 2002:a05:6a00:b51:b029:2d5:874a:6bd7 with SMTP id
 p17-20020a056a000b51b02902d5874a6bd7mr37090565pfo.6.1622052920133; 
 Wed, 26 May 2021 11:15:20 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 f17sm51872pgi.26.2021.05.26.11.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 11:15:19 -0700 (PDT)
Subject: Re: [PATCH 02/11] exec: Restrict hwaddr.h to sysemu/
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517111111.1068153-1-f4bug@amsat.org>
 <20210517111111.1068153-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <13fbfb3f-0d42-19a6-de11-4df9c5884b5b@linaro.org>
Date: Wed, 26 May 2021 11:15:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517111111.1068153-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 4:11 AM, Philippe Mathieu-Daudé wrote:
> --- a/include/exec/hwaddr.h
> +++ b/include/exec/sysemu/hwaddr.h
> @@ -1,8 +1,9 @@
>   /* Define hwaddr if it exists.  */
>   
> -#ifndef HWADDR_H
> -#define HWADDR_H
> +#ifndef EXEC_SYSEMU_HWADDR_H
> +#define EXEC_SYSEMU_HWADDR_H
>   
> +#ifndef CONFIG_USER_ONLY
>   
>   #define HWADDR_BITS 64
>   /* hwaddr is the type of a physical address (its size can
> @@ -23,4 +24,6 @@ typedef struct MemMapEntry {
>       hwaddr size;
>   } MemMapEntry;
>   
> +#endif /* !CONFIG_USER_ONLY */
> +
>   #endif

Why no #error on this one, unlike the next patch.


r~

