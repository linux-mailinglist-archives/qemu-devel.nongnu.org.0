Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798F83AD782
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 05:49:07 +0200 (CEST)
Received: from localhost ([::1]:40556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luRyk-0003nr-En
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 23:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRuS-0003Gv-2N
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:44:40 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:47070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRuQ-0000Gg-9V
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:44:39 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 o10-20020a17090aac0ab029016e92770073so7029795pjq.5
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 20:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=FW2r1JEeS0JmaXXY4qDekY1KJpOr7xlBi+ltBxmSOxU=;
 b=EOGcB2pUP6erk+ONLTVXSxS+K9ItJJygskMOwY5Tx2YFGOE2ypsyXgwM2v2ktDIpkk
 BJeZ25hF79v5U257dEoLC4ApuZYMc+6ShjJFij/Olxd57wBaBawB02wGHOoOPBm6GWim
 4GYGIdDoJoafxUTpebWgFU3Ys5Y4BAoO26sfw4mi5Wn3cRbVh/Jx9ely8tJbc5KeJeD/
 1m6PX8Gqkuped0QJbBErF27s5NvSGPr5gQwm8oMNtKrkH2CIBekYMM/8I9HFLKokkOjT
 0X99A4DAowVZXnT42AwqJISlK7V9OhtjKg+FkOAT2tFsO7Jon4bpRYVUTk7Kt0/gqcIH
 2Bow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FW2r1JEeS0JmaXXY4qDekY1KJpOr7xlBi+ltBxmSOxU=;
 b=SfECX6z9Hgcs9O8/tOWGmOFOuOrqqteOBVNwjU6kf0teHFN7yB/QQSSw1w3WvR4kXS
 WzEKCX4x+Vv2PQwZWWqmSfyfNmcoXhiBiejQVBlC+mqusSDMW9wgBOJGan9n60wX2mf6
 YMrWbuG2SOkRtdwJGEbcokCPqWfJ4IiC5v3/yeJ9BknqXFHwcNXzQVCZof92uMSyFOVi
 AHFLDNF60IjTB6rPojlAiJZX/XKGn3OwvfbJO+s1VEejC0TMS0yRifuIttJlDDNCnLEo
 M0SSJeVDgm3S7X8NyrH03x1+nzSb15CuxGkaNARI6WPk16cn7r5CdYC5YR9GJLasszVo
 ecwg==
X-Gm-Message-State: AOAM530DsVRJHKSuxLU5h6jPH9L5xe4tJWucGi8zHslZSpvcbNRHcz2u
 wzR5QhpAgXc51jQ9rxx7QJhXCr/0EGo/mg==
X-Google-Smtp-Source: ABdhPJxkQwcwCfZj9nD2H3KGsqVfBtSjEwcMp+LzozMk5pSbk3bZexgUNJiUWqKF9VwjJGdDknWzvg==
X-Received: by 2002:a17:90a:6548:: with SMTP id
 f8mr12410386pjs.106.1624074276978; 
 Fri, 18 Jun 2021 20:44:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h9sm3405465pgn.57.2021.06.18.20.44.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 20:44:36 -0700 (PDT)
Subject: Re: [RFC PATCH] tests/tcg: skip the signals test for hppa for now
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210618093253.25074-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8cf3b584-c490-d3a2-8bfb-b49a27f851bf@linaro.org>
Date: Fri, 18 Jun 2021 20:44:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210618093253.25074-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/18/21 2:32 AM, Alex Bennée wrote:
> While Richard has some patches that fix the instability on other
> architectures the hppa signal support still needs vdso support before
> we can make this reliable. So for now skip the test.

Patches for a vdso posted.

r~

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/tcg/hppa/Makefile.target | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/tcg/hppa/Makefile.target b/tests/tcg/hppa/Makefile.target
> index 8bf01966bd..71791235f6 100644
> --- a/tests/tcg/hppa/Makefile.target
> +++ b/tests/tcg/hppa/Makefile.target
> @@ -4,3 +4,7 @@
>   
>   # On parisc Linux supports 4K/16K/64K (but currently only 4k works)
>   EXTRA_RUNS+=run-test-mmap-4096 # run-test-mmap-16384 run-test-mmap-65536
> +
> +# There is a race that causes this to fail about 1% of the time
> +run-signals: signals
> +	$(call skip-test, $<, "BROKEN awaiting vdso support")
> 


