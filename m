Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4061B347A55
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:12:25 +0100 (CET)
Received: from localhost ([::1]:45170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4F8-0002cU-P9
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP4CY-00012y-1J
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:09:38 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:41679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP4CW-00039p-9N
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:09:37 -0400
Received: by mail-oi1-x235.google.com with SMTP id z15so20909112oic.8
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=qYZV7/8JUqrGiB/Rlj9i6t6mfquj9JnZ9sXjtNrd9/E=;
 b=SnFf9wFmOH6LrDpfuJvYTDi3rcgPowJmA/GFqjxL2DxoEFWZ85L49YiNfFVWuyYGsN
 pbwhleIUIoJwS4s9KLtf+oSs/hvHmGLGasmHVn7cQpUo5RbBwL7iY8iYqNiMJALsVqJC
 p0OsiVo2rgTHkXzg+/4HLQ/nrcdufoT6lnX4jF8itxkocwRqZoKepwXJgKzcQJ6MN9YH
 x+3tHXR0uPKM7DWVoplJ3yQ+yrUyjzVha9oHKkHWtseYfRC3TPbGyUF7xrEd0RuvrXuV
 axp6aIRjlUzEF5Lr32FgAnvEwWqEBseNWgYghGAXTrmRmB5i9HojQ6O63er4sjv/WPWc
 rL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qYZV7/8JUqrGiB/Rlj9i6t6mfquj9JnZ9sXjtNrd9/E=;
 b=GKhaydmsgtEBMbZi3EgV5of+7rd1v7U6/6v1TuuKrQpNg1yCwvZBcpqxlJIgRNeDou
 HomHjEqpkRtd9ODaFm06Ln4qoi9m0wplOFosSeOZuu5GE7BAnAZjGZUFd3N9NiqAN6j+
 60XSJmKEu1MZSHVbr29I2WAt1BLCYXsa62oJIonS+4F7nluN1pzQvdJXG5q7SGvUx886
 GAbjh45NYpMFYCBm91cIRx1C8YPHK6Y+k/10HibmYcvcx7yDMgo8zF1zf2tpfmptYegS
 YS+NRxB7+lvbJ2HPvzSjorAwoxn62O7NH6zClsBYhkfUDy6xlonEnxUl4ytOevZdS09W
 ikHw==
X-Gm-Message-State: AOAM530bMXYULvGJoUzfzC9QmbxC13BUbo3QzEnobohX5rCF0aV4mTA4
 FDQx+qJfvLXRUN3pk+wDS0vBHX3WKSKSMQ0N
X-Google-Smtp-Source: ABdhPJwKj57XDALFiT09El3bnO586GzsXQ3lipG8+z9NXCW8odqM36uti4iIUR3vadY3RXM8ATFnEg==
X-Received: by 2002:aca:4c0c:: with SMTP id z12mr2615349oia.109.1616594975011; 
 Wed, 24 Mar 2021 07:09:35 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id y11sm524458ots.80.2021.03.24.07.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 07:09:34 -0700 (PDT)
Subject: Re: [PATCH v2 09/22] tests/tcg: add HeapInfo checking to semihosting
 test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210323165308.15244-1-alex.bennee@linaro.org>
 <20210323165308.15244-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <544c272e-f132-4684-40ef-b138307b5bd9@linaro.org>
Date: Wed, 24 Mar 2021 08:09:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323165308.15244-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 10:52 AM, Alex Bennée wrote:
> Query the SYS_HEAPINFO semicall and do some basic verification of the
> information via libc calls.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20210320133706.21475-10-alex.bennee@linaro.org>
> 
> ---
> v2
>    - expand test as suggested by Richard
> ---
>   .../multiarch/arm-compat-semi/semihosting.c   | 55 ++++++++++++++++++-
>   1 file changed, 54 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

