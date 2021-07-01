Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AABA03B9426
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 17:41:21 +0200 (CEST)
Received: from localhost ([::1]:47674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyyoa-0007v7-Kg
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 11:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyynd-0006xW-4k
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:40:21 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:40794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyynZ-0000cM-ON
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:40:20 -0400
Received: by mail-pl1-x631.google.com with SMTP id n9so1435821plf.7
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 08:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RTBY0oRYv5d5dlm6Bb30oUxO4naJXBkpjjIo/wrX0PM=;
 b=ENR3spBIU9qUH8fHH32H3vB19IjdTP92r3MopvnLsSN6ACIATDuPxifYWm3wJFPNWl
 ZsqI9StcS92GVFHZ5gXuQmLw+LT4N5dvNqfNC9rr+PSQnN+tzy6bMfe4jIfUIjrMMZ6b
 Ah4VmFNyfjWkeLvFEepQMtRnPNUqf8HatwsgO/CII4/mR5zGun9c/qw0wm9yDlykfS8Q
 Bxq/45i/WpjzompR7us7MUVieuorjqJ+DqOJ+/j4W5okvmoyNrdgeXgzmWdMVb7k3rzE
 iY+U20/yCcpTXrC45BECSDZ+IOX9gXzi6fAoAjkLFVmD5ciP30hUMKWqQ7kzDTbpwN58
 7GUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RTBY0oRYv5d5dlm6Bb30oUxO4naJXBkpjjIo/wrX0PM=;
 b=XEGA5DJ4KlIxAr5ZtSXzlAdjW6o8IdX1EjOteqcrv0oXRCS4o97EOh7pCoeCi/bgRr
 yFocGd3C2wwAEJe/XV/ymKIY4kEVPMKx2DcgaZhlhFB43RFe7Li9vLZcgA4YPeKgVVjT
 jRtNHmGy1tHcqo9T4GvVL1+/5UAyv+RwAUJNSeSmbAYJBKF1ZlBfmatd4HcE2iwUMzgv
 6Wx7DvoPNaxTRG0BeF1p7C+QYnDKVSuPdu2Ivn8UqR2chbuXnidxqfkex9KyysYwXfkq
 Gv4e15XEQd7lzliNwL7NkhgZw3vjCnA9xoYPOJ7jZWGYqEJdiV4iHoxcsewQCoYoM0pd
 z4+g==
X-Gm-Message-State: AOAM5332zh80RJgb2U0EUShuXh5WryCR7vEEjs7+NPl0nmeAfjoMRZ8l
 zNGfmxzVLrIY7WMC9YXXX7ceTQ==
X-Google-Smtp-Source: ABdhPJxA648YAPFSVF28NQ7sPYsoxgwMZpaQEmP4V4Kw75pI0bLQFbPZUhuVpuiLGxl9TIsGplCfSw==
X-Received: by 2002:a17:90a:9205:: with SMTP id
 m5mr10685893pjo.172.1625154015909; 
 Thu, 01 Jul 2021 08:40:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u2sm94191pja.20.2021.07.01.08.40.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 08:40:15 -0700 (PDT)
Subject: Re: [RFC v6 01/13] target/s390x: meson: add target_user_arch
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-2-acho@suse.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a9ef28b0-d6fa-cb57-a432-8ec01eba1e4a@linaro.org>
Date: Thu, 1 Jul 2021 08:40:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629141931.4489-2-acho@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: cfontana@suse.com, Cornelia Huck <cohuck@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/21 7:19 AM, Cho, Yu-Chen wrote:
> the lack of target_user_arch makes it hard to fully leverage the
> build system in order to separate user code from sysemu code.
> 
> Provide it, so that we can avoid the proliferation of #ifdef
> in target code.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen<acho@suse.com>
> Acked-by: Cornelia Huck<cohuck@redhat.com>
> ---
>   target/s390x/meson.build | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

