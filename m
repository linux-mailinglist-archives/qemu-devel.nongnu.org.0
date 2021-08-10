Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EFB3E7BAA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 17:04:41 +0200 (CEST)
Received: from localhost ([::1]:58874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDTJ2-00018m-8l
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 11:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDTHl-0008Dg-Vm
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:03:22 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:37641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDTHi-0006vK-SU
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:03:21 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 cp15-20020a17090afb8fb029017891959dcbso4763567pjb.2
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 08:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W5ZZDO23ryMPsPmlEXubjS/Z6YT11fWyrF4NkPdgkfc=;
 b=A5B6BsFGw+FPwttl8vDzn0duJdvcM7IV5lzCalNYgFFxXwTARaKHffVJybaj70TSF0
 hGZAFT6vwxnBaREgdm2gEhN8xwUatIXBivj5C7z6BR7Jfr2pShTvQmc1IKk7zHH/7jtv
 bUmQJqBKHnmKMvn0bWWIe1xr8aC1bLVmUpQ5z3wIyqpxsaYKeF1ycPgU8UkqCa0TPg2w
 DXJcpqQGnf13BJ5PrM4mqGLi+q5OWxc7xi3nYLgb0YtdXjrrF5udus4CV4JbSx8+w2zT
 j9A9w1TYkz8Tfw3nGRr0K7ZBb6k+vbkk9nJU5XPy99H+3AoQRxgQU1bPcc3WIg+rhTmr
 1FOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W5ZZDO23ryMPsPmlEXubjS/Z6YT11fWyrF4NkPdgkfc=;
 b=D1jhaM/1I1dtv0Ehu45sQeWnPzVf5hJfsMiASs/5x5i/zSxRgMhCNCNImWIpYUgT+o
 0h+yfmN63l8Jc7Dt0xVqJ2H8OSE8ZSivbPfi7C+rgdA7ZeqylA8tYIIj75XGvhJNl+co
 t1D+ZksX7gUrfoJul0vM2VOzL36trzBUzAUoEZ8oSowe/M/Ef7VkeMxNJt7OJrO7Wacd
 MuMNJBYziSwyC/ee7od+yZS1rHi9adyK/WY7eIo7Yb0oQmbPcfo3Fjj8VYikSGVAHbRA
 zUkPOb4Ue3pWJFnsYSkB+MVSWA92sxZi+LhYmsY8Lox0W39eQ5JS+fWGoJr8Al8vQL76
 UyrA==
X-Gm-Message-State: AOAM5318aQXzHimY3UJ8dsI/uipdBjwDWTArc5Zu+uLsd62p+u/Bbban
 PW/dVMj0oSA1XE2nFPn/SW1EmA==
X-Google-Smtp-Source: ABdhPJyFiHgeAwg81HW3tMaZV3NdRcg4Qvef29NCcuj4+LRT3TjBBCPV9kTpGvItLvUk5on5KlCzng==
X-Received: by 2002:a05:6a00:bc4:b029:3c6:ba0e:b1c with SMTP id
 x4-20020a056a000bc4b02903c6ba0e0b1cmr28026119pfu.55.1628607797230; 
 Tue, 10 Aug 2021 08:03:17 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id j22sm27338870pgb.62.2021.08.10.08.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 08:03:08 -0700 (PDT)
Subject: Re: [PATCH for 6.2 34/49] bsd-user: Fix initializtion of task state
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-35-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3ef92fcb-aa6c-9366-9b9a-4fbf30793427@linaro.org>
Date: Tue, 10 Aug 2021 05:02:53 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-35-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Kyle Evans <kevans@FreeBSD.org>, Warner Losh <imp@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> @@ -459,21 +435,11 @@ int main(int argc, char **argv)
>           qemu_log("entry       0x" TARGET_ABI_FMT_lx "\n", info->entry);
>       }
>   
> -    target_set_brk(info->brk);
> -    syscall_init();
> -    signal_init();
> -
> -    /*
> -     * Now that we've loaded the binary, GUEST_BASE is fixed.  Delay
> -     * generating the prologue until now so that the prologue can take
> -     * the real value of GUEST_BASE into account.
> -     */
> -    tcg_prologue_init(tcg_ctx);
> -
>       /* build Task State */
> -    memset(ts, 0, sizeof(TaskState));
> +    ts = g_new0(TaskState, 1);
>       init_task_state(ts);
>       ts->info = info;
> +    ts->bprm = &bprm;
>       cpu->opaque = ts;
>   
>       target_set_brk(info->brk);

It looks like some of this damage occurs in patch 22
("bsd-user: Move per-cpu code into target_arch_cpu.h")
and could reasonably be squashed back.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

