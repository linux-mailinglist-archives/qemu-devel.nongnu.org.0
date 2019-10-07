Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FED0CE4D3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 16:13:33 +0200 (CEST)
Received: from localhost ([::1]:45288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHTlT-0003mu-Uq
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 10:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38004)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iHTkO-0003GD-Jk
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 10:12:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iHTkN-0003F8-Ei
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 10:12:24 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:45347)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iHTkN-0003Er-8D
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 10:12:23 -0400
Received: by mail-yb1-xb41.google.com with SMTP id q143so3443353ybg.12
 for <qemu-devel@nongnu.org>; Mon, 07 Oct 2019 07:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9O7QyR4sroz5pD6I+kX3EyvJIXvX9Ibf1lzBnsgKDlE=;
 b=adsrto1cvTaMOiitHUl+ZwAdwSFhlxiAf8QMxRkDFKF+i7IQGPrZD3zTj2te5mTMJG
 Ad1JL+O7fWo98OEd+71lWibyaME0DNs7lExsI17Tc/Sj23V4YLrwy51dFbFd8mX7h94+
 qob6ltwPB/mXi5xFULah8xwMcFC/U2K1tL7Belj6e9BxC562Y8sKAOKGBpcch9H0QWmy
 6oPSkeAbZexRWnxJPLmXZIlSekLw9TkPToAGR+f4YlkckahsNcCDJkNBo3LOtYHbMjlV
 ZNdrWgkXANeuQhhjEEI9PevhL601Fxd9YLiN6CDNRtRcPzo+fgVH+UqtsrRU6S/uueaP
 tYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9O7QyR4sroz5pD6I+kX3EyvJIXvX9Ibf1lzBnsgKDlE=;
 b=Xr3hvzHH0J1cdm16eF3XV4MisH+2ALiGxn3r8iRjTjj41BFwEAd5/hEjLyo7xIlOO9
 HYkoi7Wq45N9Ts3+e3ZcihG79lrupGcVhqEzk4eymsIgm83+9pSyS0xQEIr/iueF427Y
 DN7vxltyIU29+DGLUj8zfZGp3wF0npF6wcRbj9uN/Cqw+nkp4JidE4ZEKP0tOGgcS4Ei
 ewansGwF4UWS8VYPjD0xzqe15xIWe5V0v4ukbjwsYx+/+KyvahvP7gCmiNW3Yv8J9C/D
 Eb9a0M2Eo/IGynbJqKTb5UtMeqqy7VfJNhBv9YMp85TdxblX3nFyrQCUC5bu7RWFiOzj
 gO+w==
X-Gm-Message-State: APjAAAVMBrfJHnRNeZeIQq0y0WClb7FfQ43s60y2oSZxj0kRN5Yq6zNH
 9Gy2WXcfZ7MM97FMQByaXiA7+w==
X-Google-Smtp-Source: APXvYqzHyt/lzZ7DHGZYr6Z0bAPIgo67Tae487Sc8Er8gDosr1Uo3s6KmdJImFaY196u5qJKZUoPRQ==
X-Received: by 2002:a25:3046:: with SMTP id w67mr10914412ybw.4.1570457542289; 
 Mon, 07 Oct 2019 07:12:22 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id 207sm3905897ywu.106.2019.10.07.07.12.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2019 07:12:21 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 05/15] target/arm/arm-semi: Restrict use
 of TaskState*
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <70f8f360-def7-5216-32dd-310a48ff1456@linaro.org>
Date: Mon, 7 Oct 2019 10:12:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916141544.17540-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b41
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/19 7:15 AM, Peter Maydell wrote:
> The semihosting code needs accuss to the linux-user only
> TaskState pointer so it can set the semihosting errno per-thread
> for linux-user mode. At the moment we do this by having some
> ifdefs so that we define a 'ts' local in do_arm_semihosting()
> which is either a real TaskState * or just a CPUARMState *,
> depending on which mode we're compiling for.
> 
> This is awkward if we want to refactor do_arm_semihosting()
> into other functions which might need to be passed the TaskState.
> Restrict usage of the TaskState local by:
>  * making set_swi_errno() always take the CPUARMState pointer
>    and (for the linux-user version) get TaskState from that
>  * creating a new get_swi_errno() which reads the errno
>  * having the two semihosting calls which need the TaskState
>    for other purposes (SYS_GET_CMDLINE and SYS_HEAPINFO)
>    define a variable with scope restricted to just that code
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> We use 'CPUARMState *', aka 'env', rather than the other
> options of passing the ARMCPU* or the CPUState *, purely
> because it means that the later refactoring of each SYS_*
> can pass just the CPUARMState * and incidentally avoid
> an ugly ifdef caused by the implicit use of env in the
> softmmu lock_user().
> ---
>  target/arm/arm-semi.c | 111 ++++++++++++++++++++++++------------------
>  1 file changed, 63 insertions(+), 48 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


