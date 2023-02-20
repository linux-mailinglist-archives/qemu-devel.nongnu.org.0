Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B5A69D260
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 18:51:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUAIy-0006Fc-Un; Mon, 20 Feb 2023 12:50:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUAIv-00064g-1I
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:50:21 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUAIt-0002uU-8v
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:50:20 -0500
Received: by mail-pj1-x1030.google.com with SMTP id u10so2103154pjc.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 09:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=edILQjqYpiHJMxSihmyLntk3qhe7l4e4yCtz/mDPFz4=;
 b=Ell3HVCDc+IPwa9J2BUosi/XfeiE+7A3vuAjYoYVivYWN9bUUsMmSGXo4kpemfu3ah
 oyIXAQgX4HpStTGnczjxhi+6EPaQK4NA8Pa7YJEA2rffjZQq28cdbfYASs+jRr5KkbP8
 KTJV5l4uTXNtAdN9niNy1g9zb81hlT8MMGmrSYgpy7bVYLJBo7IZmH3m8pdWC80dsnLY
 3Rt+usWRzRGEMZUi+lkC1YB+1JwMEuANausP4DVwi2avZ8C54iLDfRdhO00tX6VLgwG7
 Tf3F6ZNdiB8qxUNGm0kFQ06c7ept5a9Vy9tx6poYjVpSpyZERJvlbIRXH3Sk9BWDyY1n
 tacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=edILQjqYpiHJMxSihmyLntk3qhe7l4e4yCtz/mDPFz4=;
 b=iyH0MHeu5aUHwA3otoBBoTxtxh5loCV96lYTaPeZP9/JseecGmKy6EBF0rjn4al8cj
 RGF01TuWSjxwsqHE2Knk22HBtXlsJh57u3d4OPp4Lf5yYnqp/ZIwjr8RrdfaoH1jeMUs
 DHhNARIJKtSj+pBFyz2NFhALD321xGKvdDKjeWj7uqtqRMfnCktND/3+1uyW/Y3fOfqP
 KpkV4j1bHuGKsmCVF/XoE6ICQEsltVwbYo7X+rbkCgQArNWDUQPMMfMCIhUGhSk+O7Xz
 JEYL8N1VE/4IyphB/jES/kDpjuZ9ow+hDWUcjVhXfpNrpBxxO4fkdL5HCXZNTP12v75c
 cbIQ==
X-Gm-Message-State: AO0yUKXXEZC2DXVVrzIMQmaZvA/TfiIhhOAFrV4l2P4dwhtmB0EiSa4u
 /TX1Jcnfkc9gxdeT3TLsEs8ljQ==
X-Google-Smtp-Source: AK7set+96T0SzUYYiaA0Thx2QTS+Obbt6FayJ2G2ddTTzZoDKZBho0hYfQt6nH0ugIkoaDhMIKcwPg==
X-Received: by 2002:a17:903:192:b0:19a:924f:e509 with SMTP id
 z18-20020a170903019200b0019a924fe509mr4810723plg.57.1676915417348; 
 Mon, 20 Feb 2023 09:50:17 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 t9-20020a170902a5c900b00196896d6d04sm1937271plq.258.2023.02.20.09.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 09:50:16 -0800 (PST)
Message-ID: <b7a7811c-f7d1-d673-db74-4bef97b66f11@linaro.org>
Date: Mon, 20 Feb 2023 07:50:12 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/4] sysemu/os-win32: fix setjmp/longjmp on
 windows-arm64
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 alex.bennee@linaro.org, peter.maydell@linaro.org
References: <20230216134911.6803-1-pierrick.bouvier@linaro.org>
 <20230216134911.6803-3-pierrick.bouvier@linaro.org>
 <9effb233-1dd7-0860-96e2-4f07a41adb5a@linaro.org>
 <0b796528-9646-d4bb-2b61-3ba3a672eab8@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <0b796528-9646-d4bb-2b61-3ba3a672eab8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/19/23 23:53, Pierrick Bouvier wrote:
> Thanks for the idea.
> For the sake of completeness, using RtlInstallFunctionTableCallback could be a better 
> strategy, as it allows to have a callback called only during stack unwinding [1].

Interesting idea.

I suspect that is of more use when the JIT is more complicated than ours.  In particular, 
notice the OutOfProcessCallbackDll member (for use by the debugger). Whereas our unwind 
info is static, and can exist in read-only memory.


r~

