Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D4930D13E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:08:33 +0100 (CET)
Received: from localhost ([::1]:50348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l77ap-0006A4-TV
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:08:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77Zz-0005he-5N
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:07:39 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:33957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77Zx-0006W8-O1
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:07:38 -0500
Received: by mail-pg1-x531.google.com with SMTP id o7so16232396pgl.1
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JF1IIBxlGxtaUpmlCJzAC9NqV5dfkmVX+CtQ0/ucOVo=;
 b=r8RAO5EcE9fj0RK0rYuOLxHl5cZBKYfInQialXKUEc/oAFZNiSAdnMGkKgkgi3mFHV
 wxDWe31qWyKh73EvOGMs1DtU/HYmIgrJX+0IgPay6TdXn1lIo7arAqKXmjXaPD8ndjoL
 28BDqHwLeE9SjDzh4SHzlAz+vZ05zi/K1fQz/ol4sj5W9X3bEAKY9VJP422kgyydY+JH
 VYN5m2AUuEBEJTFta+YONKM9xL/t3Df9zeZcg2NuLptiFXhaliUZB1FS7q9Y2Rv8BjHt
 DcKmOyDZ173agrx9iLaBuSxYpZiRQBqb4ydq61/GhjJS59vHHOBkvO/s823LBkz5Mwr4
 eTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JF1IIBxlGxtaUpmlCJzAC9NqV5dfkmVX+CtQ0/ucOVo=;
 b=ea7YgvbPn4ajeoFvgsb880fXBHFZUbZGCGnDRcp7jvyVywke33FB6LgnkF4Kpj8fQf
 fvUTyt7a63BUfjVfR3XGEpPmQOst3m7Zqukze1Zs9RgsVIpexq61d5TGahRQkWlbxP/7
 3pWj9+8a7uOdp1QGHHEl0Y0+Q4q6DoOGuS1tmw+q5I51XjlkkkO4fzzL0vivDjxTCq9B
 WzXYuEdQTHFl/wPRXNjuhLNLMfuumo6GuTGjhOJAMscl6QyLWATjpJQWu0U1/1tyV1YE
 7ECiJ/mw3KZQYJ5ZQzIS1HbJj0GOyKU1uVGMKl8NLFCxuKmqxBScx2DVM8k2uSIZRVFu
 9hKw==
X-Gm-Message-State: AOAM532kzYk0jJVYcsWQCWRU1O50MKMk8nnAsrbNc1ahw+nzs9dOLswg
 0FYArEb9T4m3KDk/6K0OOEIbmg==
X-Google-Smtp-Source: ABdhPJx6GHLOEwMppAqEmROgOW2LVk4KpmJb7gnqc37EViv2VBxzckDnltB1LXy0V6OI4ak+2rQn+A==
X-Received: by 2002:a63:5c0a:: with SMTP id q10mr1077374pgb.277.1612318055861; 
 Tue, 02 Feb 2021 18:07:35 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id 21sm255416pfh.56.2021.02.02.18.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 18:07:35 -0800 (PST)
Subject: Re: [PATCH] target/avr/cpu: Use device_class_set_parent_realize()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210201080348.438095-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <be4a4389-c5ee-73d3-9326-ef3f0a1dda52@linaro.org>
Date: Tue, 2 Feb 2021 16:07:31 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210201080348.438095-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.155,
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
Cc: qemu-trivial@nongnu.org, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/21 10:03 PM, Philippe Mathieu-Daudé wrote:
> Change generated automatically using the Coccinelle
> patch included in commit bf853881690 ("qdev: use
> device_class_set_parent_realize/unrealize/reset()")
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/avr/cpu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

