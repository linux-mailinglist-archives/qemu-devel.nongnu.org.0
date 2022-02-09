Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E22EF4B00AC
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 23:52:37 +0100 (CET)
Received: from localhost ([::1]:50252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHvpE-00014A-NT
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 17:52:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHvln-0008Ba-3K
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 17:49:03 -0500
Received: from [2607:f8b0:4864:20::432] (port=46792
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHvll-0007bw-B2
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 17:49:02 -0500
Received: by mail-pf1-x432.google.com with SMTP id i21so5457138pfd.13
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 14:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/T6Tba8ZFWTk/bj4KI4FdFud5XzaJCUIVUupi/cNsMU=;
 b=T/LiUYQGgqqdbiYkr6esRXCYoB+fH7akWUHra26OeSK9nhhcAU5exi8JK0dDN+IC5e
 bHVwN5RmgZamGkhKPIQvPE8Pc86GChb70hdOIZjM5ldFgWvkb/ciNxxZE3zowfy9dKzJ
 5Ztw1wSe6kZ+HFQgomhaKjxZPD6ANAGV2ZkQ2UXzHsPaopVfI5AUxvI+Tnh2W9JKmqmM
 /ccQ4MlXn+VvEw3ZhE9hYA3/u5+oVEybuCnzt09JXjx6jQvAVu3Y3p/QLG7z/2XEiT0g
 3EGzU8wjHrSbApRd/egFVTuqdn5iAotyikueXn/mYm989SNfaAImX7VYVl8Kk/Plo+xS
 Fs/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/T6Tba8ZFWTk/bj4KI4FdFud5XzaJCUIVUupi/cNsMU=;
 b=qnukCsjwYat3x0qsnwBVR9zELtMid1jdVRvusHDb8s/foRCU6wi3VPnXU6jjIunTJ7
 RWwM3Qx5fVrh5tMahyD3A7MxFyuLOxAA51H5Y5H75DuSG+OIdg7aNeYqXAZ4xnwTj24g
 dZrluTJGEXSbybCbOR9yhTVWb4ERe66Gb8E2O/rELt8BlbrJouz/QB03x5VEsxSIH7ZE
 mMFuhVjh3B/pftTvAo/YwxVFAQiHNGJLjZxolvdoIJ0wT64N0MqJS5Oil54lHPao1x11
 NZkzhaKM1uxWAw3kTyOvRIUUTSn8Qm6D7ZIm2ZER1tls2R5Zys0ug5q3EELEnkAM5LNi
 n0UQ==
X-Gm-Message-State: AOAM532IvtD+YfkK6sc/W9obJJipkmS1UaraEgaQLpS/OCxEjekTY99a
 qeoNd/K+MUbNeHEcDq3flEXJjA==
X-Google-Smtp-Source: ABdhPJxBOKN1fDV8WubYblI0i4khVuoTB1tJLemvo/ujjx7quRxnYUlGxukgjfAVEHhilriNIjcGHw==
X-Received: by 2002:a62:e508:: with SMTP id n8mr4484967pff.83.1644446939959;
 Wed, 09 Feb 2022 14:48:59 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id x7sm14404673pgr.87.2022.02.09.14.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 14:48:59 -0800 (PST)
Message-ID: <521abecd-64fa-81b8-c75d-d125d088723b@linaro.org>
Date: Thu, 10 Feb 2022 09:48:54 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 11/15] target: Use ArchCPU as interface to target CPU
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220209215446.58402-1-f4bug@amsat.org>
 <20220209215446.58402-12-f4bug@amsat.org>
 <2f53c9a2-5716-5b92-a4f7-0b8495e24403@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <2f53c9a2-5716-5b92-a4f7-0b8495e24403@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 09:33, Philippe Mathieu-Daudé wrote:
> -struct ArchCPU {
> +typedef struct ArchCPU {
>       /*< private >*/
>       CPUState parent_obj;
>       /*< public >*/
> @@ -188,7 +188,7 @@ struct ArchCPU {
>       uint32_t reset_addr;
>       uint32_t exception_addr;
>       uint32_t fast_tlb_miss_addr;
> -};
> +} Nios2CPU;

I think keeping the typedef separate, as you have done for the other targets, is easier to 
read.


r~

