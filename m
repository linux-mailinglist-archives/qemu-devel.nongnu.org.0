Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC77471D3C
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 22:18:50 +0100 (CET)
Received: from localhost ([::1]:54780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwWF7-0004Xe-9r
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 16:18:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwWCj-0002Oi-Q6; Sun, 12 Dec 2021 16:16:24 -0500
Received: from [2a00:1450:4864:20::42e] (port=40454
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwWCi-0007m6-4h; Sun, 12 Dec 2021 16:16:21 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t9so24009777wrx.7;
 Sun, 12 Dec 2021 13:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u5V+xl3rRiYbYhCE6/BKFg3utZ/fs9CXoUJDJFaojCk=;
 b=mRbIcLy3zVB3kfSgxGt4VuE9j6YgejZk4PJxCxQutO8P6eNjfAi6LzafHIXCr3p/6V
 G8v+zP3U3PJpUB6VNnf0wZbrwPJTcrnVWy0A3v3xB8C3HwGNdxy1VzHZEkSEVVvcvVad
 nZbvxNqrmAXwDcQ2n+vm7URYgKzYgqWi9V9bT73nz5GkmdrSfhUehh35NrYJfOg02N2o
 bM/QoZUYb1NK8PO9IVms82753lFAc3UOBTjYbMzkPCW/JhFwYl6ZY8T1vYYsyGylnqUP
 CWWz7yKzzrSW3sZPC0rUkKsBMOJOuxZY+vuhSBTRvlScQlt6dF7Q4cBp1IEtdGTjbhs8
 3gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u5V+xl3rRiYbYhCE6/BKFg3utZ/fs9CXoUJDJFaojCk=;
 b=STjDzlgEMl/KYo1rI//Zqjo3ZFg4mkHbb0HHR9QrsgRlD9Iq+6O2SUvYegC/9tdFnh
 ec/e01Urn/t+OrhC8IVG53+B+Vvc15+d3jSRnB2DSWW/BzWcLNPZX45rz7NG0Mw4riPw
 yudI8Kl2/UwzlJj3b9s60unfnXplAXxIsoJkNsYuY/b1VJcVMGUaSj5Iz4gpYAFuC/US
 LWQkXMbUBhzPdYucWOQxx1NXCaIiKtPNMM2x6c2HcEX/cxxCMyQHyfFb5o/bcL0VlKAQ
 BvVD7JAQbTSXl87AciOqmV8p0HYv0c6TdOTJdhdBTvG3+KNbTpZC9c5p0BTLzGMtnhKw
 n4gg==
X-Gm-Message-State: AOAM530Cxm3EkApzS5ZUvAorMAQ6JHjLDvG9j76x2BQgvxtdMMbzVHiy
 VV/+e3YoyW5LAIQFzgR0VXE=
X-Google-Smtp-Source: ABdhPJx+BmEHUtYAxkbzGllg1QGQ2y+ZFAOdT4tLRqgmQZWRHgrp7Qxe/gDs6m/k+uDEPRXB8WR0gQ==
X-Received: by 2002:a5d:4bcf:: with SMTP id l15mr12158562wrt.618.1639343777834; 
 Sun, 12 Dec 2021 13:16:17 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id n14sm9876620wrf.69.2021.12.12.13.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 13:16:17 -0800 (PST)
Message-ID: <35ff2726-ab52-695a-466a-c7b55fdb31c2@amsat.org>
Date: Sun, 12 Dec 2021 22:16:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 10/26] hw/intc/arm_gicv3_its: Use FIELD macros for DTEs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-11-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211211191135.1764649-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 20:11, Peter Maydell wrote:
> Currently the ITS code that reads and writes DTEs uses open-coded
> shift-and-mask to assemble the various fields into the 64-bit DTE
> word.  The names of the macros used for mask and shift values are
> also somewhat inconsistent, and don't follow our usual convention
> that a MASK macro should specify the bits in their place in the word.
> Replace all these with use of the FIELD macro.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/gicv3_internal.h |  7 ++++---
>  hw/intc/arm_gicv3_its.c  | 20 +++++++++-----------
>  2 files changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index 5a63e9ed5ce..6a3b145f377 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -393,9 +393,10 @@ FIELD(ITE_H, VPEID, 16, 16)
>   * Valid = 1 bit,ITTAddr = 44 bits,Size = 5 bits
>   */
>  #define GITS_DTE_SIZE                 (0x8ULL)
> -#define GITS_DTE_ITTADDR_SHIFT           6
> -#define GITS_DTE_ITTADDR_MASK         MAKE_64BIT_MASK(GITS_DTE_ITTADDR_SHIFT, \
> -                                                      ITTADDR_LENGTH)

Side note, both ITTADDR_LENGTH & ITTADDR_MASK definitions are now unused.

