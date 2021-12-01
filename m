Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9F3464E59
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 13:59:54 +0100 (CET)
Received: from localhost ([::1]:56408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msPDE-00066K-PS
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 07:59:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msPBn-000547-Bj
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 07:58:23 -0500
Received: from [2a00:1450:4864:20::335] (port=51958
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msPBk-0003Pk-Po
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 07:58:23 -0500
Received: by mail-wm1-x335.google.com with SMTP id 137so20305382wma.1
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 04:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/IRv3jMnKHAgX0lPkESU6a6d/5iAFiBTH6ZidMF+Qgs=;
 b=BJGPWzuFsCAefoeR3zdqOao8bC9rt8Tbq1XuWJpxTK8qxIuYxnlCe6wIksLZlXiVx2
 /u4hdANH/BabN3jHyaoWT0YA1z3J6IG+laLUhb1g7VWu9qZgbW1cG/ZPKGBwZtjYaBYl
 wTKiMT41N5zIpcO8mjP2NanVc53OmazGZxfLJJHtXo1m6tlWUypOYCcivOWBiCDI7TmK
 IDvexS9vcThdHmT3aDIBH+n28INHscYhKb/VHDXaIurcatbjUAiYG+oe51wkwkcJJO0i
 pfzEtiMBg/8Iyr4b1UNXg9RIFpHKa1pi49OGv/S9kCeI9FiN25vesj8VXvRqrVmO1g9l
 yqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/IRv3jMnKHAgX0lPkESU6a6d/5iAFiBTH6ZidMF+Qgs=;
 b=RalYvYE0iGNbbMHMqqIIqruDrIIZW6W06zpzcMLNA0DkxfoBDm9hZtYk8LbwdO0atE
 V/9a66zaLzqVLyF5kCRxMb/YSUkkmiFN5ukAf+krNwLnqXxVMK1eEoDwqnMwZuoprkmg
 9wbLujehqGpbojrWQKZxrsbRUgs8HHnMWBpU4d2fUKi7B2/Oq0jAUmbszmYXGW1xtLpT
 8FetR3EgWRSuemetekRaXn0IN5dz1e3Qt3i62T+9/TMEN6ZUjVt6Vd4QNZGWjmy8Hd2d
 JbcjFwzjmCKFYW6UIKEpzYxqT6CuSBAbSChMHveT3Oe7i6jlSt9s2cXke9QDHNuSH8gT
 VSMw==
X-Gm-Message-State: AOAM531SLUVdPHZ7pPoRzlF9JxVJHmkpqZ53P1TgVOfGjhDJZC1LqCLE
 NE0r4SIFnSIR8yL/Ko8yhLA=
X-Google-Smtp-Source: ABdhPJzrYLBLvUXSMA6SE9+Fw/asOUQpfvAEjKiKbPP4mBZwsBPiLxVBJyhUqRnLw+osHy5o1dKkEw==
X-Received: by 2002:a05:600c:4f87:: with SMTP id
 n7mr6614643wmq.168.1638363499372; 
 Wed, 01 Dec 2021 04:58:19 -0800 (PST)
Received: from [192.168.1.12] (abayonne-654-1-79-213.w86-222.abo.wanadoo.fr.
 [86.222.222.213])
 by smtp.gmail.com with ESMTPSA id i17sm1150549wmq.48.2021.12.01.04.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 04:58:18 -0800 (PST)
Message-ID: <3a8ce71d-b66f-f6a7-7cc3-4740efae0145@amsat.org>
Date: Wed, 1 Dec 2021 13:58:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-7.0] rtc: Move RTC function prototypes to their own
 header
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20211129205505.1235070-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211129205505.1235070-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.211,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/29/21 21:55, Peter Maydell wrote:
> softmmu/rtc.c defines two public functions: qemu_get_timedate() and
> qemu_timedate_diff().  Currently we keep the prototypes for these in
> qemu-common.h, but most files don't need them.  Move them to their
> own header, a new include/sysemu/rtc.h.
> 
> Since the C files using these two functions did not need to include
> qemu-common.h for any other reason, we can remove those include lines
> when we add the include of the new rtc.h.
> 
> The license for the .h file follows that of the softmmu/rtc.c
> where both the functions are defined.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I have added documentation comments for the two functions, but
> since my understanding of them and their purpose is little shaky
> review would be welcome.
> ---
>  include/qemu-common.h    |  3 ---
>  include/sysemu/rtc.h     | 58 ++++++++++++++++++++++++++++++++++++++++
>  hw/arm/omap1.c           |  2 +-
>  hw/arm/pxa2xx.c          |  2 +-
>  hw/arm/strongarm.c       |  2 +-
>  hw/misc/mac_via.c        |  2 +-
>  hw/misc/macio/cuda.c     |  2 +-
>  hw/misc/macio/pmu.c      |  2 +-
>  hw/ppc/spapr_rtc.c       |  2 +-
>  hw/rtc/allwinner-rtc.c   |  2 +-
>  hw/rtc/aspeed_rtc.c      |  2 +-
>  hw/rtc/ds1338.c          |  2 +-
>  hw/rtc/exynos4210_rtc.c  |  2 +-
>  hw/rtc/goldfish_rtc.c    |  2 +-
>  hw/rtc/m41t80.c          |  2 +-
>  hw/rtc/m48t59.c          |  2 +-
>  hw/rtc/mc146818rtc.c     |  2 +-
>  hw/rtc/pl031.c           |  2 +-
>  hw/rtc/twl92230.c        |  2 +-
>  hw/rtc/xlnx-zynqmp-rtc.c |  2 +-
>  hw/s390x/tod-tcg.c       |  2 +-
>  hw/scsi/megasas.c        |  2 +-
>  net/dump.c               |  2 +-
>  softmmu/rtc.c            |  2 +-
>  24 files changed, 80 insertions(+), 25 deletions(-)
>  create mode 100644 include/sysemu/rtc.h
> 
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index 73bcf763ed8..bed0b06a3d2 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -26,9 +26,6 @@
>  int qemu_main(int argc, char **argv, char **envp);
>  #endif
>  
> -void qemu_get_timedate(struct tm *tm, int offset);
> -int qemu_timedate_diff(struct tm *tm);
> -
>  void *qemu_oom_check(void *ptr);
>  
>  ssize_t qemu_write_full(int fd, const void *buf, size_t count)
> diff --git a/include/sysemu/rtc.h b/include/sysemu/rtc.h
> new file mode 100644
> index 00000000000..159702b45b5
> --- /dev/null
> +++ b/include/sysemu/rtc.h
> @@ -0,0 +1,58 @@
> +/*
> + * RTC configuration and clock read
> + *
> + * Copyright (c) 2003-2021 QEMU contributors
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#ifndef SYSEMU_RTC_H
> +#define SYSEMU_RTC_H
> +
> +/**
> + * qemu_get_timedate: Get the current RTC time
> + * @tm: struct tm to fill in with RTC time
> + * @offset: offset in seconds to adjust the RTC time by before
> + *          converting to struct tm format.
> + *
> + * This function fills in @tm with the current RTC time, as adjusted
> + * by @offset (for example, if @offset is 3600 then the returned time/date
> + * will be one hour further ahead than the current RTC time).
> + *
> + * The usual use is by RTC device models, which should call this function
> + * to find the time/date value that they should return to the guest
> + * when it reads the RTC registers.
> + *
> + * The behaviour of the clock whose value this function returns will
> + * depend on the -rtc command line option passed by the user.
> + */
> +void qemu_get_timedate(struct tm *tm, int offset);
> +
> +/**
> + * qemu_timedate_diff: Return difference between a struct tm and the RTC
> + * @tm: struct tm containing the date/time to compare against
> + *
> + * Returns the difference in seconds between the RTC clock time
> + * and the date/time specified in @tm. For example, if @tm specifies
> + * a timestamp one hour further ahead than the current RTC time
> + * then this function will return 3600.
> + */
> +int qemu_timedate_diff(struct tm *tm);

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

