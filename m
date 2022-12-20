Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A05756529C6
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 00:22:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7lwF-0000c7-5h; Tue, 20 Dec 2022 18:22:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7lwC-0000bq-PR
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 18:22:20 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7lwB-0002Bh-0D
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 18:22:20 -0500
Received: by mail-pl1-x62d.google.com with SMTP id d3so13795884plr.10
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 15:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hbenFuht+pm0Es/1NYhc/RDdZpfMYKMfRxxQHdwW6D0=;
 b=Z7WUnyEOg/6/6HRup8juew4rwpXJpXSCrfqiJQ+oSByo0Yq3X7/khIWFGuau3xdNoa
 UpxHZlXHYXH6ypFbY6tUflA5eA2iwzZONhHOKamAQEavfeirHOzA7SeZPz7vL+nwUJaj
 B05XL/gxgb8JAQki8IilcZIHI0RIO4iR29GtS/LA0ixZxj2iYYTk+KxK/83Hh9LnZplw
 nMIClbb02mUlAIB7X9JqL279yHXDsJ2+8CGHEZHDJX09JW0e1QVLbigBXCA8yiiY0Zr3
 yGtxgCCvH33bpU/z/2A6EeV1MNf/pmo7ZWlMs28QbRlyGrwDayvHTMF2s0ahgQ9TlpaB
 8L0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hbenFuht+pm0Es/1NYhc/RDdZpfMYKMfRxxQHdwW6D0=;
 b=htgZ3IXrZ3MfETueE5Z/gz0sT3yO+3cIHzhG7Ihc6tZZGI7M4M8MOXtbrHA4DrrFKC
 PA/4FRBK2Qh9LS6Lax/i2bYn/ebMbvq0X97mk2ruZfbaF/6rQ2gDAFrAyqUs3h2FReZd
 dmBpmSFuOMlqULIkM6Lmuf4211qG7GJ7DWP0cH9JffE51KrWAjjD8tF9/JEcCNh65PbN
 jigQZJnc00or2LDd7dXXd9m+nmtmb87ZYjbV4TDSojKeYaqTMHxb1gTaRJnW6JgOxqAZ
 y6+hS06E1rHuUrFi9eWN2QS/fYhU4MBJEufkyeFWmqC3mQQLbyp1n1hnmoYTPL8PFggr
 v1ZQ==
X-Gm-Message-State: ANoB5pnCil7TubqYVH7P69ajnGv9Vg7QMx5S/3cJbQxQwcTK3QkmrFhb
 2bQh9PKEWwG3EkRMYU6A8Wxaiw==
X-Google-Smtp-Source: AA0mqf6L5oixl+XRDkxfA0MRh22g8iy6Gn/kxUM02KbLbFXT2JeKAGHtXtd8/kU3QVS2dQLM9M3msQ==
X-Received: by 2002:a17:902:ccc1:b0:189:3580:48dd with SMTP id
 z1-20020a170902ccc100b00189358048ddmr55688969ple.37.1671578536966; 
 Tue, 20 Dec 2022 15:22:16 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3efa:624c:5fb:32c0?
 ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170902da8e00b001887e30b9ddsm9912422plx.257.2022.12.20.15.22.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 15:22:16 -0800 (PST)
Message-ID: <0e52d0aa-74b6-6eb6-4e41-f904f51969ea@linaro.org>
Date: Tue, 20 Dec 2022 15:22:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] accel/tcg: Drop PAGE_RESERVED for CONFIG_BSD
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20221217184823.3606676-1-richard.henderson@linaro.org>
 <CANCZdfpVabse8tnRaAE7f=E62e07ErqvuneDpg5V9UKDYOdoLQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CANCZdfpVabse8tnRaAE7f=E62e07ErqvuneDpg5V9UKDYOdoLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 12/20/22 14:09, Warner Losh wrote:
> 
> 
> On Sat, Dec 17, 2022 at 11:48 AM Richard Henderson <richard.henderson@linaro.org 
> <mailto:richard.henderson@linaro.org>> wrote:
> 
>     Make bsd-user match linux-user in not marking host pages
>     as reserved.  This isn't especially effective anyway, as
>     it doesn't take into account any heap memory that qemu
>     may allocate after startup.
> 
>     Cc: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
>     Signed-off-by: Richard Henderson <richard.henderson@linaro.org
>     <mailto:richard.henderson@linaro.org>>
>     ---
> 
>     I started to simply fix up this code to match my user-only interval-tree
>     patch set, as L1_MAP_ADDR_SPACE_BITS gets removed from translate-all.c,
>     but then I decided to remove it all.
> 
> 
> I think this is fine. We already do a translation for addresses so marking this as 'reserved'
> doesn't help that much. We need to map memory into a contiguous guess-address-space,
> but the underlying host memory needn't be contiguous at all.
> 
> I've not yet tested this, but would like to. What's your timeline on getting this done?

ASAP.  I want to remove...

>     -                    if (h2g_valid(endaddr)) {
>     -                        endaddr = h2g(endaddr);
>     -                        page_set_flags(startaddr, endaddr, PAGE_RESERVED);
>     -                    } else {
>     -#if TARGET_ABI_BITS <= L1_MAP_ADDR_SPACE_BITS

L1_MAP_ADDR_SPACE_BITS.


r~

