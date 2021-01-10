Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFD22F08E1
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 18:52:46 +0100 (CET)
Received: from localhost ([::1]:36864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyetR-0003Ho-N5
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 12:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kyesU-0002Ky-Gl
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 12:51:46 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:45060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kyesS-00006T-PE
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 12:51:46 -0500
Received: by mail-pl1-x62a.google.com with SMTP id e2so8264878plt.12
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 09:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8J504vPB5FLt0xpkBxLB5tshEGiSRO5ivqJT195cn2U=;
 b=JCPh0Mazrlsf9KGf/fpXxyZG9qXXKofSPo2fCUzsSgcHAqymJ8Ran+TD8w21V54tZ4
 6pYj6rHwzhrcEpCdzjn0iQ31HZU1kIuuDovtz8NasMkHOvpT3lvsOuABGFmlZ3SFsgwy
 pJ8Rz0J3LflLeGQSQSoLMWz4qBtUYT3YTlxYjgTDarj4CJwmW2NZs1Hit0MSICQlfHFK
 BLwHhoXCG5CzrIHWh4UT7vJwV4FpEvRaEYZA6PJWGYVaKyyhYiG2zCCzSMO3FTC9rEXF
 7ZTA7jFB57puXrZb5/zM5qsaHIKa42xgdlroC5SqGwT+lPjRuhcHvHYagQieQtXPvc5K
 YeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8J504vPB5FLt0xpkBxLB5tshEGiSRO5ivqJT195cn2U=;
 b=KpM/mXOvfHAEerJf4nYgCWCzM5UNrsIG+yctrGHUkm47wFP4dgXY2BDSQiyQhKhWmQ
 WYw818jhHwU409FLu9uaWoBGttT7N5uyKmpVJv1IJvxcySGMkbAHYtWdPwCAgK6rgCci
 fYam1Vdg5RIQNudxmgsnzC4XR1rYlrtwKsgDPC0zrbEyUBH/V4ndFFM68XFqoPni+gKU
 fYBL0u1ww6W+6iy3VzXx5LCa0g1qJU66bIa9QkxonHTifao+zuhlxK8n8rUMEHlny5Fo
 yvBcdvtZb9RzTXAp5i1SqIHQfUnwVkBGK5HwZIMgpeCg5/OtNyKXz1DuQ4tH1Ps6FphO
 oGbg==
X-Gm-Message-State: AOAM533SWzjAem+41r9c2sspoMpF44b/YL50uXd11QxS0zvtDU5BX5HM
 FkH8YmoSCLp7EjdEr2g+5faMRA==
X-Google-Smtp-Source: ABdhPJweaVZTJ1e1aEBTtpaSmioZ1+FNXsUBLEIlWC7HEplvTD1q7T/VBoMyuYD0eMAq8Fb8GyTW2w==
X-Received: by 2002:a17:90a:f0ce:: with SMTP id
 fa14mr13960464pjb.156.1610301102640; 
 Sun, 10 Jan 2021 09:51:42 -0800 (PST)
Received: from [10.25.18.117] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id e4sm16240163pfh.206.2021.01.10.09.51.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jan 2021 09:51:41 -0800 (PST)
Subject: Re: [PATCH 1/2] tcg: Mark more tcg_out*() functions with attribute
 'unused'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210110162739.858087-1-f4bug@amsat.org>
 <20210110162739.858087-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6aa1a388-6493-259f-a3d2-817c30d29655@linaro.org>
Date: Sun, 10 Jan 2021 07:51:37 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210110162739.858087-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.012,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Wataru Ashihara <wataash@wataash.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/21 6:27 AM, Philippe Mathieu-Daudé wrote:
> The tcg_out* functions are utility routines that may or
> may not be used by a particular backend. Similarly to commit
> 4196dca63b8, mark them with the 'unused' attribute to suppress
> spurious warnings if they aren't used.
> 
> This fixes the build with --enable-tcg-interpreter:
> 
>   [98/151] Compiling C object libqemu-arm-softmmu.fa.p/tcg_tcg.c.o
>   FAILED: libqemu-arm-softmmu.fa.p/tcg_tcg.c.o
>   clang [...] -o libqemu-arm-softmmu.fa.p/tcg_tcg.c.o -c ../tcg/tcg.c
>   ../tcg/tcg.c:136:20: error: unused function 'tcg_out_dupi_vec' [-Werror,-Wunused-function]
> 
> Reported-by: Wataru Ashihara <wataash@wataash.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tcg/tcg.c | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)


This does too much to fix that Werror, as all of the other functions are
unconditionally used.

Alternately, I'll re-test and merge my tcg constant branch, which will make
tcg_out_dupi_vec also unconditionally used.  Then we don't need
__attribute__((unused)) at all.


r~

