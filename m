Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 546DD56621B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 06:05:50 +0200 (CEST)
Received: from localhost ([::1]:48274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Zoq-0003Zc-T9
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 00:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Zn4-0002qU-Tv
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 00:03:58 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:55977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Zn3-0000Sj-Ec
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 00:03:58 -0400
Received: by mail-pj1-x1031.google.com with SMTP id w24so10972114pjg.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 21:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YlBtIHKGgxnUS9oYyI7Uhz0qMzFDZFuCYF/F/reA8aI=;
 b=QeLDIjqAbcUpfyU8SCDFNc5Kg937iSo9Tn1mvd5XH0/sMIEoa2Hrpi6g6q2M3NMdJz
 v8BQmYuw2P/2k21AJarKpLMVz6TJ/VcbNAd47j1HWjg91hjCHaDnDCnA3dsu6bqJ90lk
 SbNmppy59tIGZy5LZX32AJxboP1wnO5D5fobBuojgBfQygiYGs7FI/6em2wyMK8vFhIR
 7PAJiEHlesDIuRs7GO1xk4DzyNSIPDgHSmBjtjmafa+nzeQ1U9xEL5v+r725ZmRxY1+X
 ROWJxvina1TWkqm8j3ehqP4YBtptjjncv/BmVbPNfP9NU936Q9AbzfhnmSwbuyS/cLu4
 5Eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YlBtIHKGgxnUS9oYyI7Uhz0qMzFDZFuCYF/F/reA8aI=;
 b=oM7VYLgnyajXKjxm00MOrYb7iokvs1TfH3AQqVEhUDQ15GGCxPFwSEDLHV+enJC5gD
 7asbCu6iPww2iphsDUztlZFVu3kV3EVv4dIpm6z4XvOoGGAVwrRZ0TxiYxovQEBqV21a
 a37VCXqqq0UF+oQeN0P0pbuyWHrTPH8QgkfIbjyWvI/F/cAIj/Rqi5e/UbsC3y7oqUaB
 PwW67IZr/yRqoIQuTjw0CYoYZZdE1UL/Hi5s0e3mxxWFDxNqJh2WTADb/VBQ7Jmt7LCb
 JeGvaNi7EiqNBjLag7ixNnbb1k82/7sgmy7/Rs3NAVwME5ZYVM8+fYciC4p4AMFM0sGX
 TVyQ==
X-Gm-Message-State: AJIora/2mSwNYw/8Zto/rlgqDyM5crd6e54IPlrGEIstX99rZhNCW2vl
 lyvX2pvkvB/mqaO/g+sy/+NqQA==
X-Google-Smtp-Source: AGRyM1tEyYcMK4teLzsbI7+dCQTXCRHzjxnzmJtqPl8NaDX4CorQrlNDuAVRLjLsmjt4dZh8xP4dlQ==
X-Received: by 2002:a17:902:ea09:b0:16b:a264:381f with SMTP id
 s9-20020a170902ea0900b0016ba264381fmr31250395plg.150.1656993835768; 
 Mon, 04 Jul 2022 21:03:55 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a170902e74c00b0016be9d498d0sm2403504plf.211.2022.07.04.21.03.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 21:03:55 -0700 (PDT)
Message-ID: <d2b6b208-0650-6063-7e79-baad9a9dbfa1@linaro.org>
Date: Tue, 5 Jul 2022 09:33:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] include/qemu/host-utils: Remove unused code in the
 *_overflow wrappers
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20220701025132.303469-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220701025132.303469-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

On 7/1/22 08:21, Thomas Huth wrote:
> According to commit cec07c0b612975 the code in the #else paths was required
> for GCC < 5.0 and Clang < 3.8. We don't support such old compilers
> at all anymore, so we can remove these lines now. We keep the wrapper
> function, though, since they are easier to read and help to make sure that
> the parameters have the right types.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   include/qemu/host-utils.h | 65 ---------------------------------------
>   1 file changed, 65 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

