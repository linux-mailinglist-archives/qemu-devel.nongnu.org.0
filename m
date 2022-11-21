Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B9F631EDE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 11:57:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox4Tk-00056g-KX; Mon, 21 Nov 2022 05:56:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4Tg-00055d-Tl
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:56:40 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4Tf-0005Cf-Cv
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:56:40 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so8726664wmg.2
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 02:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PrhP+8BdzJ+r7HsFFtF+iiGmMetkUrkfwrd1uq/fOD0=;
 b=kjokjABnQMTbf0l9Hjlx62ELbq9EPaP+X+atmZcbLNDOyZk7x2ZCeFzWycqkPGDe/F
 j7k7LCEioH7gWzDAPL1T5UrD6BNlOvNL5R/LLOzSNv7VOg/jLFV0i389dW2tKBK8uNZc
 j05X92e2xx7PwMwrw/+fiF6NuXDGATsrljb+qerqwC3TY7yMA8EyFN4aFT2AY22jNZOF
 4MKUJcKrZ6V1aepzAREz4O1mlkmMMsDb19lQlW5v9l2h8Iraw2HwG0hwYjw/PVmzywG5
 +jLda71KSQ1WxBAdVNtDQyhKz6nchDsEjNhICaq92pz0x/ZvGhJK0YrZFttp6+LBv5ii
 X/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PrhP+8BdzJ+r7HsFFtF+iiGmMetkUrkfwrd1uq/fOD0=;
 b=hdCU2hJLmQjsxj7zGmAe5tGSN0Ksv2oCsduprhPeUaUkd06U+dXLED668s4T8uAG32
 IImwzItZex/DM/mqO3xJtjzKsRe2HLdkJzcOjbyfDOkvsHZAlVNQoDnxBdfNnIzvlUlG
 3wCstNw7gJErHgChlZV6rCoXkg98Vkfr3I644Tyf9uiqb0O/qnVybmZtI6/k/X5P/Pcl
 GdDaVWArHgE8PiDQlbBsh4ivU3Y0lQNuLtVg172Y7o4lP3Pqj4qfh8NHPfr0Ik4Dzbnx
 8wS2jjBc8mV+SMKBl1v/a2akY9FZL9zA/KQYBIfDRopQB/OVrcfd0ft1ya4cmJCX+Q9g
 cbDg==
X-Gm-Message-State: ANoB5plbPWlC46ixSks50qda4rGdgnShAymZAaybJMT1oPqdYtD0lKYj
 xkXuHqTfRIPia0WgE6EytCVWDmtWcZyXNw==
X-Google-Smtp-Source: AA0mqf5Ab7xBoA71bmvL3eg9rOT+IXZXTIzvpJhqC2y1nK312pGGeg3wmqY0fDe010Y1yKZU1TIpbw==
X-Received: by 2002:a05:600c:3b8f:b0:3d0:2485:c06a with SMTP id
 n15-20020a05600c3b8f00b003d02485c06amr1433485wms.26.1669028198078; 
 Mon, 21 Nov 2022 02:56:38 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w4-20020adfec44000000b002415dd45320sm10888592wrn.112.2022.11.21.02.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 02:56:37 -0800 (PST)
Message-ID: <66ba1285-04d9-10dc-2504-5462f5687057@linaro.org>
Date: Mon, 21 Nov 2022 11:56:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 5/7] target/riscv: Use QEMU_IOTHREAD_LOCK_GUARD in
 riscv_cpu_update_mip
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
References: <20221118091858.242569-1-richard.henderson@linaro.org>
 <20221118091858.242569-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118091858.242569-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: qemu-riscv@nongnu.org
> ---
>   target/riscv/cpu_helper.c | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

