Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 147BE67356C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:24:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIS5w-00060q-RV; Thu, 19 Jan 2023 05:24:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIS5t-0005ny-35
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:24:29 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIS5q-0000gL-Fn
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:24:27 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso875332wmq.5
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nNZmGPx9gHaeeq1ZYg6nybSOX/fGtj1PlB0bPPjkHbE=;
 b=CvMJbxvj/n8d21NELxPEKEV6CGWUw6On3ar1WXLvVnZ+IkrTA08Oo79Qi5cgotAf15
 ngXUR+rzRNhChgQogY4MAvmmZhkRC2iq+0jRmK0ZlwFWUD7WWSdktgItNKC6vEWEBb5n
 ZgBmh67y7RB1qNbEovaGxx5jro6cuGJPdBtGZgu7XgtoqTn1dAybhzIVmear5qf7htXA
 9Oqm3weAMs/AEAuYPjYfAf6JwAA+psa41dGSwo5qX9e0/VJuAau0Sua61dpDpfri39QV
 lZF5rBHOfaQIKQiS52mKMxtCs5p+xGyF8GtDzqN3/bzWh2dq35Ii18HH2gQjLEFKbojk
 F95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nNZmGPx9gHaeeq1ZYg6nybSOX/fGtj1PlB0bPPjkHbE=;
 b=ONBHcZFsIB7DFlRvL4SviC10zkA4IfrCHqb+6lSDBP/2xyknGV/+eTUYEGwPZFQXd+
 OP5IHTFk9tZJdtKPH70RtqKwXBYR86GO8+immtHH07uSnM5SCgwyGlXXyBz82hZUc0aQ
 ubgO7eITc25mR+a133KhXozFQSvdcnh0lhyb4Uitkr79ywbDVhShB+HutQ4RHp3qYmFt
 SvDROpfQHYEj3cuQ5wNkrEEDngkmBDbIjRe+20QoxjCaxz5NrC0paVFA3+0qrVH6WLq/
 xwD1SscvnTZvFXB9KqZW1Eeuy0kgV35L8KKP9JR76vGfTJj8CpDNqGDmkchsXu/eiiTT
 3/+g==
X-Gm-Message-State: AFqh2kqYQEGPDVB1AFUPB2C2GZPDWa+bvsZIkz4ZV2G+7sxw4EZlRMr1
 9HZ6szXe8/jzluMfhpBTz/FPmQ==
X-Google-Smtp-Source: AMrXdXvxXYFhg81zgSBYFQmRLUkzag3Yp55pkOfR02c1w+LdPw2Xg3t8Rtx7G2T2THcSMYtvOcINfw==
X-Received: by 2002:a05:600c:4395:b0:3da:2829:2935 with SMTP id
 e21-20020a05600c439500b003da28292935mr9883412wmn.11.1674123864308; 
 Thu, 19 Jan 2023 02:24:24 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c474a00b003db00747fdesm4472140wmo.15.2023.01.19.02.24.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 02:24:23 -0800 (PST)
Message-ID: <b0b5759b-db68-204c-fe41-48ad02de0a61@linaro.org>
Date: Thu, 19 Jan 2023 11:24:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] MAINTAINERS: Cover include/sysemu/accel-blocker.h
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com
References: <20230119091545.3116376-1-armbru@redhat.com>
 <20230119091545.3116376-3-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119091545.3116376-3-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 19/1/23 10:15, Markus Armbruster wrote:
> Commit bd688fc931 "accel: introduce accelerator blocker API" aded
> include/sysemu/accel-blocker.h and accel/accel-blocker.c.  MAINTAINERS
> covers the latter in section "Guest CPU Cores (other accelerators) /
> Overall", but not the former.  Fix that.

Doesn't this belong to "Read, Copy, Update (RCU)" or "Main loop"
sections?

> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0dfdf71d48..c888ccaf7a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -437,7 +437,7 @@ M: Richard Henderson <richard.henderson@linaro.org>
>   R: Paolo Bonzini <pbonzini@redhat.com>
>   S: Maintained
>   F: include/qemu/accel.h
> -F: include/sysemu/accel-ops.h
> +F: include/sysemu/accel-*.h
>   F: include/hw/core/accel-cpu.h
>   F: accel/accel-*.c
>   F: accel/Makefile.objs


