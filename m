Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E84574106
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 03:47:54 +0200 (CEST)
Received: from localhost ([::1]:54426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBnxI-0008QV-Un
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 21:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBnvA-0006lV-Ao
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 21:45:40 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBnv8-00084U-Nr
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 21:45:40 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 x18-20020a17090a8a9200b001ef83b332f5so6725102pjn.0
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 18:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=erDxdwMLJ2BhWGwI1qM72w5Ei3PNgTf47+LYQ+OlIX0=;
 b=xSSEFmLxZMYainTfwLYhVG0TeouuTsrdbl8IghX3itVZ1FuZEdnxTGgv0Ao5WJfaxU
 TcRrjdrmdrumra+YL56mXi+FyfXJD+9ij/CMxvosPy3pMQ14HoY7PQCi3pHBuk98xCIK
 VsTksHN7vAUtFbtzj17pvzJmBCk8zEHuXgKQFNXNWuYmnKK04WrIoPRWzZwyHNqeQmYj
 HRc4YcpwSiPNFM/n4SaP/QvCWZ57KcjjOkAvIRHLk6rofjyMgJUrupmuEfxKe1AFLcGh
 Tc0nTWoMf7ejZ+PmzV+NTG+5+JDpqBRgyRgCGNxFgF7GXVYqLvp+FM72YZg10vzV+kcv
 BcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=erDxdwMLJ2BhWGwI1qM72w5Ei3PNgTf47+LYQ+OlIX0=;
 b=EsBK79zOuZzYAQKQL7GfzlQLSgYwrE4zkK0SD8Qbv5bOW4fArflBdgCNeAH9v8tGI9
 fNt2MH3elQXyW7iVgp2qim11QpWRhUyNHh0XfqErFFfENoccv/SqJUh5u79isFxPmihC
 IMYTnePqdifsNIuNlslWU5NoXvvaU2Fsmqgpn13OMcWDHVyFg1D2XfB9D3O2lIe0kgBB
 xGA5XsVMbe0IIDwr9ycGmDtnTk2j7Y2yPFV8YKF9GQNgB9SFAshm/duB0/Z5pZO+n3fM
 bHgWXxAX5pYNjUhhDPtxJdRGsTL4j+RXHtvyXg3jRk4YKRsoW7CxvUQT5IzduZoSnHWZ
 c6Pg==
X-Gm-Message-State: AJIora95jvyW2/JezlkBk/Mn/sxVkwIfGGxXUNn/ZbRfwBYbCfjHCQNi
 mTATZL8hLPFfYwBjtFSiyveKXQ==
X-Google-Smtp-Source: AGRyM1s4f7DO1+CGgqYZvJn6UWeHXwjBXjfDMWTyyaf8D2YORzWcAKLwLKTjxq9X8vapXTH7hMyZKQ==
X-Received: by 2002:a17:90b:4a83:b0:1ef:de4c:65f0 with SMTP id
 lp3-20020a17090b4a8300b001efde4c65f0mr13452296pjb.149.1657763136905; 
 Wed, 13 Jul 2022 18:45:36 -0700 (PDT)
Received: from [192.168.138.227] ([202.124.167.115])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a1709029a0600b0016b953872a7sm81431plp.201.2022.07.13.18.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jul 2022 18:45:36 -0700 (PDT)
Message-ID: <f5fe7acf-39f6-13b8-6c6b-f8378f93e8a3@linaro.org>
Date: Thu, 14 Jul 2022 07:15:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] qtest/machine-none: Add LoongArch support
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn
References: <20220713020258.601424-1-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220713020258.601424-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/13/22 07:32, Song Gao wrote:
> Update the cpu_maps[] to support the LoongArch target.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   tests/qtest/machine-none-test.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

