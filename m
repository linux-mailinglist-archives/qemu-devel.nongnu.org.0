Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B7C44C5B3
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 18:04:53 +0100 (CET)
Received: from localhost ([::1]:37908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkr1n-0004lS-Ur
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 12:04:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkqy2-0006vv-Am
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 12:00:58 -0500
Received: from [2a00:1450:4864:20::32b] (port=56271
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkqxz-0001Jz-MA
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 12:00:57 -0500
Received: by mail-wm1-x32b.google.com with SMTP id v127so2818757wme.5
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 09:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ccuz2sRpLuvdscyeIRX2BJsRSNQocUEBEyD4Oal5+1c=;
 b=JvveQgWKgVtBjrR5tSiENerEwqfxH+ccGm45Be0oB4QV0Ecqg+NXgug1D9rnKB5FMJ
 InE4rBxrk+icn41UnZ1MbhRyiaUVH7gC6KzAVNJmCrzaM0V6w6qiT9Y+NgFPNMNumqCg
 5BxraHNmqGYl9jS5S7uZv2j4rUccIacKa7Mt/AV5Gi4mZY0AlatENToEaR82dhMZwcOL
 ps6orTOtETIQScYvKzXtHcIN4+voQSmUQ8S7BWau6zv2pZhApEaDZV8OpOdVkqJCLKlD
 ru37yE3H2fFWHueP3GMHAKMt5MwPpRGsNAuYslm/dhz5y6xQ8G44sqRhgbt9scJO0dtz
 K1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ccuz2sRpLuvdscyeIRX2BJsRSNQocUEBEyD4Oal5+1c=;
 b=0HSqZD6wMwiMAL4I9ouy395G6wdAmyk+8a7h+ziPJg2T38bP885Zza8EbBQwyJ3Jo5
 yCHLjWc++Whw8QZzefs7PyJAhIFLDUDKrNO2GrFCjQ7eseHLJStpgR/3Ulk8HObB4bJZ
 Sa2Lfyl+IFiKXpNvOlgdPhcuNdXLeeNkEBlxLW1D3q+rbsrUgD6vCQWQ93z82Fv6j2cY
 HoBHKAyZ1wnKVBdCQMzTwgaFCJUdZ5TF6ld9X9mnA2V4a0xwjpYas0BFkxJqRoCiSCyO
 kndoXr3eTt9V/I+docr0QHtUr9Nm0NxNzZ7usbrlyaPldvfkx8Bf+zKHdbWqRhAluotp
 89bw==
X-Gm-Message-State: AOAM533LuaKNJLiaBmpVoHpRymGQF40aBqiSyfUqOpWRzaFv+X5+wvNA
 FJhZfmO+WI/BpLRkq/3thR2zVUkZzdsr7Vkh
X-Google-Smtp-Source: ABdhPJwgJupKczLGcHLJNt5IGDynjVAffCDJ3sud47V8iFnz22Wwe0ArRrZHpJ4PQFAb3P5J356gSg==
X-Received: by 2002:a1c:4d15:: with SMTP id o21mr17861830wmh.171.1636563653949; 
 Wed, 10 Nov 2021 09:00:53 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id j38sm6741549wms.29.2021.11.10.09.00.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 09:00:53 -0800 (PST)
Subject: Re: [RFC v2 5/6] common-user/host/mips: create, though mips hosts
 likely don't work reliably
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211110163133.76357-1-imp@bsdimp.com>
 <20211110163133.76357-6-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c0bba3a4-093b-6441-22c6-76047461d8e6@linaro.org>
Date: Wed, 10 Nov 2021 18:00:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110163133.76357-6-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 5:31 PM, Warner Losh wrote:
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   common-user/host/mips/safe-syscall.inc.S | 1 +
>   1 file changed, 1 insertion(+)
>   create mode 100644 common-user/host/mips/safe-syscall.inc.S
> 
> diff --git a/common-user/host/mips/safe-syscall.inc.S b/common-user/host/mips/safe-syscall.inc.S
> new file mode 100644
> index 0000000000..72d9064acb
> --- /dev/null
> +++ b/common-user/host/mips/safe-syscall.inc.S
> @@ -0,0 +1 @@
> +	.asciiz	"This file is not compiled and mips hosts are likely broken"
> 

Let's not include this.  I have created

   https://gitlab.com/qemu-project/qemu/-/issues/713

for tracking.


r~

