Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFEA35E14A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 16:22:14 +0200 (CEST)
Received: from localhost ([::1]:43928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWJvh-0004BN-AP
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 10:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWJuJ-0003Pz-Mu
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 10:20:47 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:34553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWJuA-00030f-Js
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 10:20:46 -0400
Received: by mail-pf1-x433.google.com with SMTP id 10so2645116pfl.1
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 07:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7TvC7UIjc9yMtFWbeIFUCwc58/r0U3kIU3a08voiT84=;
 b=tLnjxTcGB/Fu/DhIFXhWLnyXo+M7bJUssdXqgg/cYfB+dJWjzvgK0NBxjQLMynJ3Fr
 OsHsAIl5+ngxiucwr0H8G94jpJvco9c4JW2vsI+FSziBrpYv5NoMzzUx3DlbVEP9qLt4
 5PJIFIjiOQN+2xsiFVsyVRZVbdnnZ1mB30F1brHuV4MlU/9Z2e4c3kguxGS7TODeZjF3
 wXgFhdQghp3dAC8yE9vw+DUKOv/oEKLKU/ZDc/X02sp/HdY5o09dzUJetkyegqOTf4if
 fOgTFNSwDOGCatEifJNYS8Iahz3Q879b/H75ySfZAnWbUFPnf4J9hbScdRfzGASc8WsJ
 Z+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7TvC7UIjc9yMtFWbeIFUCwc58/r0U3kIU3a08voiT84=;
 b=cod8h6DKkukKEzIi6iX75S/GByUwY/WBvyRM4SSiIThQfQ7OR3878LPmNUY4Jwff//
 7nYjZWMv/8345xwAqRYBmEwuaXtqm76H3DE1cA5O4mEgfkob/ygLRQnDzveHbKJsG0PT
 PnN3sYAfeCEoQUfS78PANjmLPBbs9LlsclRp0PcXZHAhyFXI3CqyJyJOOTHS7N1v0pSR
 gFUURQGkOra/BfEQE7LuJwSr0mT+l8t6DapcG82LOMI1SUcf9MbizFXoacv/UaMaZNz+
 CKIldA6k5hEFkvk43h1q/3dAuJk+6Cd4+qPJSw/ucGvj8aHm2kWOnWHg2A6KxcKDQzOO
 tV6w==
X-Gm-Message-State: AOAM532PwumT+IpXjqa9gSTyn9Pc3gPg/6mAefbPmGmw92LdjPXNhbDp
 fdjPl36x1rePLCUSkhRqGNzcJQ==
X-Google-Smtp-Source: ABdhPJzaPib6c6djg9i77zfRXdGxtSf4uIzN4pYNkpJcqupmFIjkvIeLoMMcnvYfDHcPwz+LDFpbYQ==
X-Received: by 2002:a63:5458:: with SMTP id e24mr32222469pgm.170.1618323635875; 
 Tue, 13 Apr 2021 07:20:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id q1sm14582853pgf.20.2021.04.13.07.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 07:20:35 -0700 (PDT)
Subject: Re: [PATCH-for-6.1] exec: Remove accel/tcg/ from include paths
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210413081008.3409459-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d9ca13c3-f924-970b-2a84-949f6b03ac5f@linaro.org>
Date: Tue, 13 Apr 2021 07:20:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413081008.3409459-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 1:10 AM, Philippe Mathieu-Daudé wrote:
> When TCG is enabled, the accel/tcg/ include path is added to the
> project global include search list. This accel/tcg/ directory
> contains a header named "internal.h" which, while intented to
> be internal to accel/tcg/, is accessible by all files compiled
> when TCG is enabled. This might lead to problem with other
> directories using the same "internal.h" header name:
> 
>    $ git ls-files | fgrep /internal.h
>    accel/tcg/internal.h
>    include/hw/ide/internal.h
>    target/hexagon/internal.h
>    target/mips/internal.h
>    target/ppc/internal.h
>    target/s390x/internal.h
> 
> As we don't need to expose accel/tcg/ internals to the rest of
> the code base, simplify by removing it from the include search
> list, and include the accel/tcg/ public headers relative to the
> project root search path (which is already in the generic include
> search path).
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Queued on tcg-next, thanks.


r~

