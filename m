Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9730A484B35
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 00:33:14 +0100 (CET)
Received: from localhost ([::1]:46340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4tIn-0006Ij-ON
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 18:33:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4tG7-0003yp-51
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 18:30:30 -0500
Received: from [2607:f8b0:4864:20::52a] (port=38851
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4tG4-0005WJ-67
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 18:30:26 -0500
Received: by mail-pg1-x52a.google.com with SMTP id s1so32450683pga.5
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 15:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2zz9JpojlO/mC46XIrbuc5H7vdt4uyxRPevybAibDSw=;
 b=KZULgzd418ev4gTz1ekUWkxXr76Sf70IiA+iezEzX1jx5+0M6jsNjmuh+vLGejwbdf
 F1etTWPUEfFb/yWGQCPK3VVM6+jBi3iHH4XlF5+GGEMtwliA1bK2D6oTqZn/PY7TjeZA
 Nx2tl/mrzH7jtaUEuavbpVMjaj08Mt7KZYMyhk4576uEmyjpfjd36XDkM2RHgfdMX+tA
 6wclFkVQhRKjtFsUxp52Ae5N5TgOt7rM6hSeCjn7+4Wg7tvt3zxApCkNGh5BbMv0sQtW
 GbFlx3NohCy4eDgsEUukqV8mlkaae8RgUgQvtp2tiCw1YI0FQ3AsflghmeCddcuuWRNL
 vBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2zz9JpojlO/mC46XIrbuc5H7vdt4uyxRPevybAibDSw=;
 b=FVW0f1QBEV+W5e7VE4zHLWh403y7EwH52waXG3JQkFJ1S6ysoQEH4uSz5QdiWd+Smp
 lxeY1DoDbF6x7sxHcbjp62f9H+cBGjGe9fCKtk/X200/b8EDLMhkoN7UkLf69BA9a0FD
 rXxnXF8LTpefay4Ky1uNP/RwR34MKpzew9C4yQ6YWEohIKNm6oU10mBfaY/RXpISoUig
 51Zbgj9H6TBT8HMCG3ZYWVvnp6J1g/RL0e7rTKbLzKt9BAghJdkwesOCYByClKwWeQZI
 dml7wbFAlQ65/hMYRv21EVLUpebuPlqTh9WzveOgrvCH9p0v2IvS3WdHd/RqrC82+wWk
 Ks8Q==
X-Gm-Message-State: AOAM530b9nrLlT3A3NPd07EQiYhmh+7pIJiSdwqIPtiMdh+JgWnkx1vJ
 lMK/DYOaeGQyVYyQwnb+MixIGw==
X-Google-Smtp-Source: ABdhPJw1CnBfg5VirXudnRJ3T/okWJwOu47vnI1He9ihqidMizuobaIW2Kota+RNjHalrOrolTqnBQ==
X-Received: by 2002:a65:5c87:: with SMTP id a7mr46520743pgt.600.1641339021725; 
 Tue, 04 Jan 2022 15:30:21 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id x33sm45522570pfh.212.2022.01.04.15.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 15:30:21 -0800 (PST)
Subject: Re: [PATCH v2] linux-user: Fix trivial build error on loongarch64
 hosts
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220104215027.2180972-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <487c5acb-e44f-13f7-1146-032904d9e7f6@linaro.org>
Date: Tue, 4 Jan 2022 15:30:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220104215027.2180972-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, WANG Xuerui <git@xen0n.name>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 1:50 PM, Philippe Mathieu-Daudé wrote:
> When building using GCC 8.3.0 on loongarch64 (Loongnix) we get:
> 
>    In file included from ../linux-user/signal.c:33:
>    ../linux-user/host/loongarch64/host-signal.h: In function ‘host_signal_write’:
>    ../linux-user/host/loongarch64/host-signal.h:57:9: error: a label can only be part of a statement and a declaration is not a statement
>           uint32_t sel = (insn >> 15) & 0b11111111111;
>           ^~~~~~~~
> 
> We don't use the 'sel' variable more than once, so drop it.
> 
> Meson output for the record:
> 
>    Host machine cpu family: loongarch64
>    Host machine cpu: loongarch64
>    C compiler for the host machine: cc (gcc 8.3.0 "cc (Loongnix 8.3.0-6.lnd.vec.27) 8.3.0")
>    C linker for the host machine: cc ld.bfd 2.31.1-system
> 
> Fixes: ad812c3bd65 ("linux-user: Implement CPU-specific signal handler for loongarch64 hosts")
> Reported-by: Song Gao <gaosong@loongson.cn>
> Suggested-by: Song Gao <gaosong@loongson.cn>
> Reviewed-by: WANG Xuerui <git@xen0n.name>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

As a build fix, I'll pop this into tcg-next.


r~

