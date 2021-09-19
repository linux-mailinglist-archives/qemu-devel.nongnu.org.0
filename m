Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8A9410CCA
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:09:47 +0200 (CEST)
Received: from localhost ([::1]:51816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1G6-0006KH-CQ
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS1EC-0004DO-FV
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:07:48 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:46735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS1EA-00027G-W4
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:07:48 -0400
Received: by mail-pf1-x436.google.com with SMTP id 203so6246049pfy.13
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8RBB+bmnZ5l2hG0R9rBtFbzodSOrrt6PK9tkxHUFS/A=;
 b=oGVGhB90thsAKWlrdDwuGMjcxFZ9pvTF4usd2rAkbM9AJDqLnELmMe4/5Ffay5ndTc
 zQfx3YTdRqHzXsOcP0QCXFLqiawCHZqPTOzDAbT0bs25JEYUQIhk6BcbNNCgupK9tq07
 uMB/q6jzW5ln78q6cGGbNDptoU8MvROOUOu9H4cZhftdSggGelsHE0pttCYeiF22YEkO
 gVmKXUkaJQUQUYDmFO0tuLktU+N2KrMX7LiXsjn0MbzCaQzMvxnaJg8XZqt87lTN4+ai
 jICWzLvwD7MFSfYDuKMOMvuoMjO//UcXPrpaSs+YR5ApdTLCqJabvIrZrJ8A/i78sdka
 U1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8RBB+bmnZ5l2hG0R9rBtFbzodSOrrt6PK9tkxHUFS/A=;
 b=H/Z0btyEY3uo3kixHTI/nTslF8q7SQJoZBtCulGPA3O0I+PIbqQ+tDYcb9m6GZuh9k
 DeHbXaCYxexAZU391obIpA27Kq3XX7Pe/tzmoIMiY1Dawj+C7Eo9YPFjo2YongIzgCsw
 eYuLHBNWMrcV7isTeZqMPPZq4/Z3WtWqOKf6PMc0RYvJci+F26q8nMrt8/TmwVZwZ8C2
 REEbhsGFuPeqJO4ZJdjST8cC8iiRox0+DswvMU6M7xVp5cKqv0KGQCkhWxYJPkZkA8/o
 WETCTkF9Z5d2+eQzp4boOMXZ585f5/BYj+uN9JTBLVhTZ4MTT25+rZQgH+ASzJnqaXoN
 GaSw==
X-Gm-Message-State: AOAM530XWrq11Kgr3DCb3qRgvySUTnfKmC/nmfv48ldUGErZjIhqDQ0o
 1szGlSlbcUKNJssSez9WBAGh0A==
X-Google-Smtp-Source: ABdhPJxb8SZHtmr8cge/1BigHSale02Im671S2qTEtu59xdaH0rG6S3aihWuUN2l7npqSRIsWAylvQ==
X-Received: by 2002:a63:1f45:: with SMTP id q5mr19662589pgm.385.1632074865262; 
 Sun, 19 Sep 2021 11:07:45 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id a1sm1001193pjg.0.2021.09.19.11.07.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:07:42 -0700 (PDT)
Subject: Re: [PATCH v2 09/41] linux-user/host/alpha: Populate host_signal.h
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-10-richard.henderson@linaro.org>
 <cdfcbb18-a3b6-3986-4b0c-97dd40ced27f@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8df420cb-0b3e-443a-35a1-fadd06c24b3c@linaro.org>
Date: Sun, 19 Sep 2021 11:07:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <cdfcbb18-a3b6-3986-4b0c-97dd40ced27f@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/19/21 11:03 AM, Philippe Mathieu-Daudé wrote:
> On 9/18/21 20:44, Richard Henderson wrote:
>> Split host_signal_pc and host_signal_write out of user-exec.c.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/host/alpha/host-signal.h | 41 +++++++++++++++++++++++++++++
>>   accel/tcg/user-exec.c               | 31 +---------------------
>>   2 files changed, 42 insertions(+), 30 deletions(-)
>>   create mode 100644 linux-user/host/alpha/host-signal.h
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 

Amusingly, this is one bit that we might want to simply drop.  The remaining required 
entries in linux-user/host/arch/ are missing, so one can't actually build with alpha host 
at the moment.

Similarly, linux-user/host/ia64/ is also unusable, because we would have hit the #error in 
accel/tcg/user-exec.c, missing the host signal handling.


r~

