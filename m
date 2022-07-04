Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70507565223
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 12:24:58 +0200 (CEST)
Received: from localhost ([::1]:58756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8JGC-0002ar-8C
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 06:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8JE0-0000ll-6t
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:22:41 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8JDy-00049e-OE
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:22:39 -0400
Received: by mail-pj1-x1036.google.com with SMTP id a15so2164713pjs.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 03:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=x1FQ4SD+T/q9LbUaiwrESLF9Dnc5gxA2nv+MxAUCQoU=;
 b=R3Pq/9xxOOVXbQiskSsSs0MPhtGP2cIX6vnHnmer3WePqEv8U2S9VIMJp4TDDU5TyP
 bjfWOnrLwn2XxDnYybLTozstgM3Wy5l7iwKTQz9qG5PojL/Y3REPf5dR1ZlXM3LwmOUM
 W0EuhhzD2MHkruJkiQCHDWCcsCTin8G0LLiKYSjfgoTNqiF4ExgfVEfzHUtyg6O/7Agj
 oPA09x9F8M6EWRJGmxqzg02RxiHscI0KHWzxgx5CFGUoWdBT9jz4wzYP7wfkNFZmEoYF
 LKdPam/yGvjSTcQRNhOU2QtxQLMmdHV8Z3DJ07t0PgXT+cIeAW+bSIRsIBX2g5QENtxc
 M8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x1FQ4SD+T/q9LbUaiwrESLF9Dnc5gxA2nv+MxAUCQoU=;
 b=YY3oXtY+5kUlCPOYOxR5WucLAbaGvqwvrf73wcqhyEujGFyuYtjNbs0UpBPcd2y2CJ
 gPLAvDchI3SPiT/xBu0AqoI6P5bVu/1XIBqIfyiS9PVlkTc6sQJFR74MG0oNEK1ud9Gm
 AQEBMPlqc2XkVxnTt/c68qBBjodjtzzscg7e02bm9FaC4VRdkPY8ZPiVntHqaId/+y9B
 sA+c4H2qQut8Mufwitc0h8RVIPAKYkej4HX6N/Fv3lUzDbdk15cyLXNbk0Y2TEClWKxJ
 z/igocp/XGS9w/72EQ3b2fKBcliAv1ZcKY+7t1BAlMTlESCwJI6kEuVwEITJS8a7J4uy
 sAQw==
X-Gm-Message-State: AJIora+ICGPKPNTEyPd95oZRqxnUK/PQsrBnWy2WAhoVq6UOqZDpX1xN
 8anK4raMae6+ygQXy/QQwVuDZk7djH0ksvw7
X-Google-Smtp-Source: AGRyM1vLsZDAaBBhO8tU+9cILnG4oDD0A62oKFn7i7fr67E9/mM2qmKXjrh9/bKzz6++2kqdNskFOQ==
X-Received: by 2002:a17:902:c792:b0:16b:e8d4:e13c with SMTP id
 w18-20020a170902c79200b0016be8d4e13cmr1912194pla.150.1656930157521; 
 Mon, 04 Jul 2022 03:22:37 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a656048000000b003db7de758besm20203117pgp.5.2022.07.04.03.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 03:22:37 -0700 (PDT)
Message-ID: <884cb096-dade-c11a-ff18-62935ef63d56@linaro.org>
Date: Mon, 4 Jul 2022 15:52:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 10/11] hw/openrisc: virt: pass random seed to fdt
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20220703212823.10067-1-shorne@gmail.com>
 <20220703212823.10067-11-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220703212823.10067-11-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 7/4/22 02:58, Stafford Horne wrote:
> From: "Jason A. Donenfeld" <Jason@zx2c4.com>
> 
> If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
> initialize early. Set this using the usual guest random number
> generation function. This is confirmed to successfully initialize the
> RNG on Linux 5.19-rc2.
> 
> Cc: Stafford Horne <shorne@gmail.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> Signed-off-by: Stafford Horne <shorne@gmail.com>

You could remove yourself from cc now that you've signed it.  :-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

