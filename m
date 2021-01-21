Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E507B2FE403
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 08:33:59 +0100 (CET)
Received: from localhost ([::1]:58076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2UTe-0002nt-OO
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 02:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2USC-0002Do-F6
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 02:32:28 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:43504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2USA-00087m-Pm
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 02:32:28 -0500
Received: by mail-ed1-x52a.google.com with SMTP id n6so1237541edt.10
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 23:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KbhKMqvip2Tj/v9+f1+GLax4Pv7uiqw8BlqNLSA6CCg=;
 b=DseNLM3s6pSMhB38M9sOimjIPvg2m9wu1zVLyfsxZqH7Mv70DsdZt04OXss3nxLUB/
 olA9Ks7V5Nq//9FmopTRIYVhS/xAIiJFgOH0hlwimaxOeaWSnAkIbXlj+jhn2Iehmg08
 itOsE3yDnL9c/qt0LyI9AewyN2E/lgXSDsj3W49Sd7ARcqr3/82mnIZEzMc35VluFXkk
 7GPGMTZFQfzRITvdQtVDGQjyRxFUfUdPWDUM0RKuv5RJkXbQzL1+K5WcBLa9K96NuMIc
 COinO1CAYittMMF6HepJuW9pA0fx2bTxDHe57nMIF2srM74GBiKeFgxOSnoeBqFtgCEr
 ie/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KbhKMqvip2Tj/v9+f1+GLax4Pv7uiqw8BlqNLSA6CCg=;
 b=Tmvn7wwgfuu2UD2llQWh7Vpm9iSDv+1rgsToyLFbnQJY9Rlj/AFehrUAaJSnlOAgq3
 MBTR9cMfDvEllJd6D9e7Dr3FsR1+A3JZ3UpvNZiN/yK/92e4eZ4TafKC2iuJbElGU1xf
 NA85UnIxoEF8rPge35f/UdizZLg+xg37YUA1qio6A7zfg2WyJBKDEYNXYJkEAK/rRKVW
 skwrJQo9SDHEEJpjbzhYK0woXeLXPhuktkQbx5puwgloEEiFCKO6K7KvLruYEBXXL4yl
 AswdDno264PlM1NXw4zy/x/1dGI0RKMsVERkFbG9NG0UhWq9GDSkwESWR+vsTgytq2MN
 hNgw==
X-Gm-Message-State: AOAM530pqmiTNIA8T1VbXZr2e81oqeY+7I0WJ/NiF4xLbpMxHl1x+H+j
 WtXGQ56QQGPlvn1wWNdm9Gw=
X-Google-Smtp-Source: ABdhPJyWmlOcgmI6TLXKEu2qSo++kFwHs8w4dIu+JfY+kOqTVfv+M2M93FMTFGpeb0LVPWkr4dkMWw==
X-Received: by 2002:a05:6402:3122:: with SMTP id
 dd2mr9958142edb.262.1611214345050; 
 Wed, 20 Jan 2021 23:32:25 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id h12sm2223522edb.16.2021.01.20.23.32.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 23:32:24 -0800 (PST)
Subject: Re: [PATCH] tcg: Increase the static number of temporaries
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210121025439.1120405-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <77379350-56c0-c2c3-6d09-4827ca509c02@amsat.org>
Date: Thu, 21 Jan 2021 08:32:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121025439.1120405-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.094,
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
Cc: lvivier@redhat.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 3:54 AM, Richard Henderson wrote:
> This isn't a total or permanent solution to the problem of running
> out of temporaries, but it puts off the issue for a bit.
> 
> Make the assert in tcg_temp_alloc unconditional.  If we do run out
> of temps, this can fail much later as a weird SIGSEGV, due to the
> buffer overrun of the temp array.
> 
> Remove the inlines from tcg_temp_alloc and tcg_global_alloc.
> 
> Buglink: https://bugs.launchpad.net/bugs/1912065
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> There are more bugs that need fixing in order to actually make
> the dynamic allocation scheme work.  Rather than keep this bug
> pending longer, hack around it and make the SEGV an ABRT.
> 
> r~
> 
> ---
>  include/tcg/tcg.h | 2 +-
>  tcg/tcg.c         | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

