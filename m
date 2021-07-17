Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 432263CC445
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 17:47:32 +0200 (CEST)
Received: from localhost ([::1]:41452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4mXL-00020k-4j
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 11:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4mW7-0001LX-5H
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 11:46:15 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:39631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4mW5-0001XA-Nq
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 11:46:14 -0400
Received: by mail-pg1-x535.google.com with SMTP id o4so8734760pgs.6
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 08:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=No06WI0z0Xkdyt5kJf170nw75nuu1vQWKTs4APUU79k=;
 b=I6DRv7WTCAOLH8cIe0mbWXhdgiX5rBKMkzQRK6JREnB1xqeBLPlC8Zja6c1cEWy5XI
 bN4WLnzWxblpth3n+qzZXC6C2XMWdJrc/uPoOX7aBe8OQIDYv5tQMf5WZycdtT9pRMN4
 FXovaq22dalGGMaSHnJSzFzA/B9HCh6o/xAlUWOXbcIm7iSvy8UlvnEAIMAJYnUcM7vh
 QjfTl6+9lzhYvIA2XE7XLN1FlaGhdjydMgjsq3IhWcVRO1NwNwW50hfkt0Y8kEADd+Vu
 2uV3McXq2ZgkL8J5348jXpbfCwfh8fk1ZLP24zCE1c3RNdXoyxs/pbj2U34AcJnumVTV
 tbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=No06WI0z0Xkdyt5kJf170nw75nuu1vQWKTs4APUU79k=;
 b=kBynqqFkUPXwHoHmlfAdTvr9mGg6HDNAEv81npq9xm9Z8WuKZcX5D/P5jOtcF58H/s
 RfnOYHZWkpk5k4bT5TKajKb5I6v0ik51vgtfZcd5bTpeZXjQHHwD/D7wjE+lzDyt27/K
 1CXbqF9XuA3u55QEbezdkkuZr6BRtz1LlbMBbOXyzNK+74NEM1aYdR9LOct5cYOE1+u3
 mmF/xnlUsOJWN1HE8mp471gimEOoCetrD51f//Wg1LxWipfcicc049w9dckKr+XiEhFZ
 YprSDaeogxNwlwneieduIczjiHJiHyQuQcq6wutWib5PkxzNUFMzr5qhYtULZeaBVxGI
 NF1A==
X-Gm-Message-State: AOAM532Z8+i+rsvGKDSHlLGLy2RcrUaYyZVeV+L3bwQCYDCvqIpBufy2
 uPMerg8qzI1FlunmhTE8xWCPSw==
X-Google-Smtp-Source: ABdhPJzOIBADJ2QH+6hahKHj/YaT3GrlZCaBa6/Xtnpxpqd6LKpTZG58KNBUiVWOHsHxCfln6p/0AQ==
X-Received: by 2002:aa7:8148:0:b029:31b:10b4:f391 with SMTP id
 d8-20020aa781480000b029031b10b4f391mr15873298pfn.69.1626536771796; 
 Sat, 17 Jul 2021 08:46:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id r29sm14245919pfq.102.2021.07.17.08.46.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 08:46:11 -0700 (PDT)
Subject: Re: [PATCH] target/hexagon: Drop include of qemu.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210717103017.20491-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ca86bb31-6ced-58a5-5394-96c2085f7953@linaro.org>
Date: Sat, 17 Jul 2021 08:46:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717103017.20491-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/17/21 3:30 AM, Peter Maydell wrote:
> The qemu.h file is a CONFIG_USER_ONLY header; it doesn't appear on
> the include path for softmmu builds.  Currently we include it
> unconditionally in target/hexagon/op_helper.c.  We used to need it
> for the put_user_*() and get_user_*() functions, but now that we have
> removed the uses of those from op_helper.c, the only reason it's
> still there is that we're implicitly relying on it pulling in some
> other headers.
> 
> Explicitly include the headers we need for other functions, and drop
> the include of qemu.h.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Based-on:1626384156-6248-1-git-send-email-tsimpson@quicinc.com
> ("[PATCH v3 0/2] SIGSEGV fixes")

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

