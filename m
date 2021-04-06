Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D49355F1F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 00:55:07 +0200 (CEST)
Received: from localhost ([::1]:36946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTubC-0004It-OW
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 18:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTuaF-0003sS-A0
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 18:54:07 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:35497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTuaD-0001ox-F9
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 18:54:06 -0400
Received: by mail-pl1-x629.google.com with SMTP id j7so3668141plx.2
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 15:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C2rtbH+6CTlGkr9BTpkwNG1pV5GQRpOPA7DppJb5mpE=;
 b=kSvPxPseZ34hCN3neY7SU3+w0/w5VK33PEQ5Ho2hI1A4iuDwo6p7SWa96rgW3m8OYy
 04ojONx9QWTjj406pbbGd89+LefxgtTeJFyAxOYVoyOzy/73iHz2wp/RbMItPBAT/RNw
 6wT08cPGRUyn7hL5/QZ6Ca6gj18SobpqcOIkTszYHwKXIdUVKwurWzoAXM9ejK2T9CVR
 1qPs0Kza/Z5ovthxPkNjtXMXYMXhzYteDubwQlLMOo6deTjaeMHThUw6CwX/i0+V/g6Y
 aIybjUmTVXdxgq8brMJ+AM7pCmsfizEIgt4KjyHdTdC2CxvQvdQLuiQ22ftzRPBZqQSQ
 l26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C2rtbH+6CTlGkr9BTpkwNG1pV5GQRpOPA7DppJb5mpE=;
 b=UW2Nqe/atxuO0wwoceJ+J1BVlpySokcKzaxb9fejP9Mn86HkTgJTXkbKAsUf9gagFW
 tekHqqXAAoa2ha5RJLM2LyyFnegjD/yP8hyo5bPSa9CQSm8G/49mF/sJb9LVLOlXPg14
 8cTxUn2CSis2sti5GJyiweHJuuG6xg3j18ljB6d4JmQBEjH+OJYQ+jM8ha0wLQ/8o9JY
 Y+0SlWs4gdKs9XDaWuDrrqVCVYTrC/Efv9KwLnwZfwRaDivZaGVL8aD/n6CVG5HFL721
 1RcFh0THScCbvsnb5n9vrjoFgC6hhfpjrJ/1cf3RGJONuyrF5uRFWZ95CzB3zBFS+QCh
 uCcQ==
X-Gm-Message-State: AOAM530PwrbWTDtNoWIGgwGr3LMjHZpCu7x4cwHOLQ3aP31+cD5iTV2F
 UoTOp0MvJ4lhcopH5i724maA6g==
X-Google-Smtp-Source: ABdhPJwE4CvCzL73Tg4iiRRnLX1OGcEUJ/nhaQHQjPLoJlGlXGAQmeNITErTy1HHhFnjWACVcK/KjA==
X-Received: by 2002:a17:90a:8914:: with SMTP id
 u20mr410584pjn.90.1617749643839; 
 Tue, 06 Apr 2021 15:54:03 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id x69sm19842169pfd.161.2021.04.06.15.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 15:54:03 -0700 (PDT)
Subject: Re: [PATCH v2 21/21] Hexagon (target/hexagon) CABAC decode bin
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-22-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cbde7697-69d4-ed7a-1b45-18d2bc4d2335@linaro.org>
Date: Tue, 6 Apr 2021 15:54:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617249213-22667-22-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 8:53 PM, Taylor Simpson wrote:
> The following instruction is added
>      S2_cabacdecbin            Rdd32=decbin(Rss32,Rtt32)
> 
> Test cases added to tests/tcg/hexagon/misc.c
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/arch.c                 | 91 +++++++++++++++++++++++++++++++++++
>   target/hexagon/arch.h                 |  4 ++
>   target/hexagon/imported/encode_pp.def |  1 +
>   target/hexagon/imported/macros.def    | 15 ++++++
>   target/hexagon/imported/shift.idef    | 47 ++++++++++++++++++
>   target/hexagon/macros.h               |  7 +++
>   tests/tcg/hexagon/misc.c              | 28 +++++++++++
>   7 files changed, 193 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

