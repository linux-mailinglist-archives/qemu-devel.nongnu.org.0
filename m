Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D910230784C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:40:06 +0100 (CET)
Received: from localhost ([::1]:39914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58Sr-0006hd-UD
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:40:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58Qv-0005IN-IH; Thu, 28 Jan 2021 09:38:05 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:40412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58Qu-00064x-0L; Thu, 28 Jan 2021 09:38:05 -0500
Received: by mail-ed1-x52a.google.com with SMTP id a14so6868323edu.7;
 Thu, 28 Jan 2021 06:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lF2vPROpu68BvMMqC28J9bhWvzYOp/ajmcWm3VHx9HI=;
 b=V2fMQSfQGMzB8Iz10EwmwrZinzAXLuHjxX8g9POhiAR0pxlLWn3FLH874KUPje4fGw
 FBRhTuZSHeuZegm1/CZTE8Lxt3fYXj467EMKeCR9QZw8YvDXTJgj/gMpG+AIiETaDc3G
 /eZ4NkfJDGllQyL84MSuMlXuY5QhwPFjVeKEGKpE6fQipsw/KOmJE0GLRHCMUEfXwKnz
 d2MSQmsn3jSMVQoL+2oMPKaNpuSqgcfp+9Wv2Y4cDgyJevR9avW8x9hPqDZqakri4qNS
 3ULYyuj6rAMYlxbOUnmLS5hiIT9IoCVm4yFtvYK494Q6erOhB9Zil5tKf0Jlo3qzg3FW
 Zfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lF2vPROpu68BvMMqC28J9bhWvzYOp/ajmcWm3VHx9HI=;
 b=R1bKaTxQmRjKXtPxEfyK9VfuKq0Row8/QAQq4ax5xnAcD6FIl5U+YM4vkGggFyneoJ
 3MXt3GvKJiSWoJLQ7Q7k3xkUR6OThJIAiG3hji4QWU3P4Tahdwd/dFsjBWR+uRgxUg5J
 b8DvqoHI2YuG37BFppiKmS5cn1C4dpnQy2OuWlT9I/SV1jqrTcVcidCVSsDPjI8LqXjM
 P9PQgJRbzr39plHiA9qdn4PtQQDXJyt2UZ2foBm6lZM8loYa6clWx7HzZ6IJn7Y6IZR7
 6Y1D37aw4nCW6yz0o6M9PJZuUO+IXJmSYaW+r/OeHWmG+ckK+2rSYQ49P7fbe++sQ93W
 Ejdw==
X-Gm-Message-State: AOAM531w8Xo1FMf32yWSKrfMGHKP3hcBu0FL1KKx9Io529ku6fj7Tl/2
 QYKDhx0/XmJ72Q4r4Df0C7Q=
X-Google-Smtp-Source: ABdhPJz/gW27ctiOk7Eg/yKe96DnnevwE3211ewniFas5J3YBVrbo81pYVt5JUUV0niUqFEcTTjaWA==
X-Received: by 2002:a50:fd12:: with SMTP id i18mr14593650eds.220.1611844682421; 
 Thu, 28 Jan 2021 06:38:02 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id x17sm3027984edd.76.2021.01.28.06.38.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 06:38:01 -0800 (PST)
Subject: Re: [PATCH v2 01/25] ptimer: Add new ptimer_set_period_from_clock()
 function
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210128114145.20536-1-peter.maydell@linaro.org>
 <20210128114145.20536-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8d5fbbc7-56fe-9a08-c891-3021f17e32f9@amsat.org>
Date: Thu, 28 Jan 2021 15:38:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128114145.20536-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Luc Michel <luc@lmichel.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 12:41 PM, Peter Maydell wrote:
> The ptimer API currently provides two methods for setting the period:
> ptimer_set_period(), which takes a period in nanoseconds, and
> ptimer_set_freq(), which takes a frequency in Hz.  Neither of these
> lines up nicely with the Clock API, because although both the Clock
> and the ptimer track the frequency using a representation of whole
> and fractional nanoseconds, conversion via either period-in-ns or
> frequency-in-Hz will introduce a rounding error.
> 
> Add a new function ptimer_set_period_from_clock() which takes the
> Clock object directly to avoid the rounding issues.  This includes a
> facility for the user to specify that there is a frequency divider
> between the Clock proper and the timer, as some timer devices like
> the CMSDK APB dualtimer need this.
> 
> To avoid having to drag in clock.h from ptimer.h we add the Clock
> type to typedefs.h.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Luc Michel <luc@lmichel.fr>
> Message-id: 20210121190622.22000-2-peter.maydell@linaro.org
> ---
>  include/hw/ptimer.h     | 22 ++++++++++++++++++++++
>  include/qemu/typedefs.h |  1 +
>  hw/core/ptimer.c        | 34 ++++++++++++++++++++++++++++++++++
>  3 files changed, 57 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

