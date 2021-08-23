Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18D63F4EEC
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:02:57 +0200 (CEST)
Received: from localhost ([::1]:51646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDLc-00039k-Qk
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDHW-0008HC-Fj
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:58:42 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:45743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDHU-0000jE-S6
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:58:42 -0400
Received: by mail-pl1-x629.google.com with SMTP id d17so10493348plr.12
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 09:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VBEIkpsXsLTkrrfofTRgSouEFNUEqeV63mXGydfXlT4=;
 b=RSluZuFjZ5qWkxLX6/Plk3REKC64g2O9YryLmv43p91R4TWps5puvRgCfIyDZriOb7
 ey7x9sIeEbqRxuO2EJ5RFmiTRE/egY3yQ/97HIu8QSC7YTOqbgeFxrnfftWGmxLgrp31
 iWQducCcEwy8/csDWvH377o0UdGaGE7yxY8ln45RjKJtILBH8+7FFaxzYbPZDWk6pYwt
 WrqU4aHN9CuTMnBXzt5PX21j+rjjXUv0LnSvUd9IFvoVO0aZoYsox5RMJep4falPwobE
 htbcHxMn4VGh2howYaHoG3i41CHusQoi1xGnv92OYaqv1EkbLecaeBuqYl53AqgzKYvk
 2wFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VBEIkpsXsLTkrrfofTRgSouEFNUEqeV63mXGydfXlT4=;
 b=Uj2j8KG9aoSSx/NEaWsD5dc0l5664qOBJ3RtkI6Et30r38hqQPWaq8KTTCx7GTsx7y
 k2EPKewUa+7TYj1LyoFzQat6YsFU0jqsbiDDxcmnF4CXVn73XkcaKyf9WtKrapQbj9Yc
 vHHyn0VVa1g07wF8oIrqpxpPy717fUL+Xd1M1nqo+bNRBjYncR4tQEN+2s3/yWufbFch
 t2GNX4uc7z2kZqRBeBoPCBVhMxRjPuhK+TsopLaORY81fzAo1H0Mb6vPiweVS/y5ZMyl
 g0zVeq0PRocXNLA4ghXO6+2OJpH0YDYVO9M8TeMrS0XqPWS4/UCWRJjPozNfwlSdjtFw
 m+0g==
X-Gm-Message-State: AOAM531ZzA5/jpWo0wmoSKDkFiS6r4kM7Ukila80Ji9HsThQocP6T5jE
 d6mHdg1N7m2amyWoqqynBNWvpw==
X-Google-Smtp-Source: ABdhPJzer9d9CK5nUey9sFSjSl16dU3T7RLpLvJIVVfe0NMmRxuDJ3UhE0iU24wuvQxPtnRFLwnJgw==
X-Received: by 2002:a17:90a:6c97:: with SMTP id
 y23mr20782496pjj.117.1629737918446; 
 Mon, 23 Aug 2021 09:58:38 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b17sm18652879pgl.61.2021.08.23.09.58.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 09:58:38 -0700 (PDT)
Subject: Re: [PATCH v3 01/15] target/riscv: Add x-zba, x-zbb, x-zbc and x-zbs
 properties
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
 <20210823164038.2195113-2-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2de18301-63fb-fd98-4239-adad0d6589c0@linaro.org>
Date: Mon, 23 Aug 2021 09:58:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823164038.2195113-2-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 9:40 AM, Philipp Tomsich wrote:
> The bitmanipulation ISA extensions will be ratified as individual
> small extension packages instead of a large B-extension.  The first
> new instructions through the door (these have completed public review)
> are Zb[abcs].
> 
> This adds new 'x-zba', 'x-zbb', 'x-zbc' and 'x-zbs' properties for
> these in target/riscv/cpu.[ch].
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> ---
> 
> Changes in v3:
> - Split off removal of 'x-b' property and 'ext_b' field into a separate
>    patch to ensure bisectability.
> 
>   target/riscv/cpu.c | 4 ++++
>   target/riscv/cpu.h | 4 ++++
>   2 files changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

