Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9985E631EFD
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 12:03:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox4ZW-0001Dr-8m; Mon, 21 Nov 2022 06:02:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4ZT-0001DT-7R
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:02:39 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4ZQ-000722-HD
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:02:38 -0500
Received: by mail-wr1-x433.google.com with SMTP id s5so2076202wru.1
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 03:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Ip2tIWGiAmSyKdAjF2OOaLwg0+kg0d9K1aLNWtuhv0=;
 b=WftbfoYqQasxyjzBKUFJbHk11G9yFqNhJ3T58/Jp9m97vVOVQhNc4GFye5AYcEohcQ
 atnrq34yjc/bLNvC+RMOYCu6VRq8yGk2t176m5wm/pWDAXKt4bf5VjW9w6GV8hCD1jJl
 A/FtL1H13VRU+O5Mj0fiAgckpxRckYzI1Aba5bbffurL7CMcFpFM3DLKMlCqiAVZcMvF
 FWvpBVY/O2OBhYfsm4DnzIAzUY3eKyspqcOClNLBLeqTw59GUh49wEle0lt6wafu0Uyz
 s8pU2iTf++wErWH4A5L6YjgZYqGHSTiNNATnSPPUvuoZsEL1aDoe7jA7BrzyIk6jiyT+
 9LLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Ip2tIWGiAmSyKdAjF2OOaLwg0+kg0d9K1aLNWtuhv0=;
 b=2/OZP17SzzKvuHBqyvpXnn6+2yUw+t2/iwKILV+RntwOFApygAiRtr2zoEykelQUKB
 OWgGIQ7HK/uvy0nbq2C3AMO2BhAmwFEe3NLjd0WC+IdIO5iLDC63SOstD28Nr/my2hdf
 B/0CHh0DT9NBSTyFqBjz9yMiilt9KBo2rBAL5Z/bdkEkSBD5POKMt50xwCXu5X1IyLK7
 3b26eUI3u1AAoWQOWKz3UYlmKkZv9A1XDeiN+FxzOzx7/PRXM5yt+yWUsvBIYc+lSboj
 U4trA3GAJrgqO3xQGd0WXRnY8ajA2PIWRStfudlvaLrccjhZhiUbhPhJmk/TttgVrP7f
 5QnQ==
X-Gm-Message-State: ANoB5pkOZSnvQB6asikOjVsy09O/v1pDL/iA0qFoSYVDSdoHAaRo6AuX
 7pU16k8GpYltQBdhu98zwq0xQg==
X-Google-Smtp-Source: AA0mqf4ohGtTTkj9h2uGNZRmbIMCNeCDKGrorn0II6PoPFZWKZhU7RBPFigXGJsPEMro1Kh1My7yvw==
X-Received: by 2002:adf:edd1:0:b0:241:7d0a:65ef with SMTP id
 v17-20020adfedd1000000b002417d0a65efmr3697457wro.491.1669028555004; 
 Mon, 21 Nov 2022 03:02:35 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 4-20020a05600c020400b003b492753826sm12964753wmi.43.2022.11.21.03.02.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 03:02:34 -0800 (PST)
Message-ID: <82521e65-ef79-650d-6fe9-402e2fa35edb@linaro.org>
Date: Mon, 21 Nov 2022 12:02:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 7/7] accel/tcg: Use QEMU_IOTHREAD_LOCK_GUARD in
 io_readx/io_writex
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221118091858.242569-1-richard.henderson@linaro.org>
 <20221118091858.242569-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118091858.242569-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 18/11/22 10:18, Richard Henderson wrote:
> Narrow the scope of the lock to the actual read/write,
> moving the cpu_transation_failed call outside the lock.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/cputlb.c | 25 ++++++++-----------------
>   1 file changed, 8 insertions(+), 17 deletions(-)

> @@ -1367,11 +1366,11 @@ static uint64_t io_readx(CPUArchState *env, CPUTLBEntryFull *full,
>           cpu_io_recompile(cpu, retaddr);
>       }
>   
> -    if (!qemu_mutex_iothread_locked()) {
> -        qemu_mutex_lock_iothread();
> -        locked = true;
> +    {
> +        QEMU_IOTHREAD_LOCK_GUARD();
> +        r = memory_region_dispatch_read(mr, mr_offset, &val, op, full->attrs);
>       }
> -    r = memory_region_dispatch_read(mr, mr_offset, &val, op, full->attrs);
> +

Example of clearer WITH_QEMU_IOTHREAD_LOCK_GUARD() macro
use suggested earlier:

         WITH_QEMU_IOTHREAD_LOCK_GUARD() {
             r = memory_region_dispatch_read(mr, mr_offset, &val,
                                             op, full->attrs);
         }

>       if (r != MEMTX_OK) {
>           hwaddr physaddr = mr_offset +
>               section->offset_within_address_space -
> @@ -1380,10 +1379,6 @@ static uint64_t io_readx(CPUArchState *env, CPUTLBEntryFull *full,
>           cpu_transaction_failed(cpu, physaddr, addr, memop_size(op), access_type,
>                                  mmu_idx, full->attrs, r, retaddr);
>       }
> -    if (locked) {
> -        qemu_mutex_unlock_iothread();
> -    }
> -
>       return val;
>   }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


