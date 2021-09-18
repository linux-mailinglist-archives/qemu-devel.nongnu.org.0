Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547CA41055F
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 11:21:44 +0200 (CEST)
Received: from localhost ([::1]:60834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRWXW-0003MY-Sr
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 05:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRWVe-0002Ze-UB; Sat, 18 Sep 2021 05:19:47 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRWVd-0001hV-Ce; Sat, 18 Sep 2021 05:19:46 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t8so12145160wri.1;
 Sat, 18 Sep 2021 02:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9ZYQoPS3hRnIZhGJE1UoBlup91/dLu7whMtlZDc5Ga0=;
 b=c75VxutUjxDo9w9YqiTNVeFTpP7AJT0Mk8EKkSNV59CDYt7k/NSmdN3bVF4vsjB/HG
 8nmjfUK5RDZNkuL9nUxf9gCTwQqFJ6Rtue/SH36MKgZEWKds0ddy7/ZnGW8tnYYMavDg
 3JGvIarbbKIWewQ1VlQeqEPZPr0+UNj40D9WsZuA8CoQSgvGklC3ajd5+TJjpC1b1wJL
 kSDoh8ayZh5e22MWPpqMtAi/uXYySC4ZAnzTo1pVFkA3y9bSLSISpxXP6TqVIW+8a/1A
 G6CB+2T/z4+FrSCkpRJw2fc1APTFtLBsPYlzJC0BRQirQ8j5eGAkR8LlHwuQiEYMGpfV
 HsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9ZYQoPS3hRnIZhGJE1UoBlup91/dLu7whMtlZDc5Ga0=;
 b=mqn9UGL6vTZyXDzHV/tZFP1JdcC/xTDJ3Fv7VuG5rJ8Vtg6s3WAtu1OU2fPe4eXq4p
 xsg4owakABm6v98JCaL/lrxL/Mp0M0WVdWGTa8LMAnlYbDVGh6wWEjuZIE3JmFvTYuMu
 wwyjZadSyUgAYX7I/f9DU2tqlXT663vrhut2Ad8kzzeT2gLqAMhYkHQKOPErdIpFl5rG
 m6nDZxHImeXqyOt7xeuN29TUgDB9cKxcsPxcLtfbafldYr3zJozsFYJUv7xLdVFytSFc
 BaZLzG4vcZe1VVuiP6gDE6VZgAEbpJBhGsAP6BnvXHx/14WUNJHBG2Lwrd1tD0mq54bH
 DRNQ==
X-Gm-Message-State: AOAM531rckPh1zxlcn58xLBzsGjhlZnKOS8AyLcxX04VxeeLvkMNIHcD
 p3ZBL9kkDPN8vW/0rhlLU6k5lfexJMQ=
X-Google-Smtp-Source: ABdhPJxESnhMW0xxnnNEVlGJFis9rDUU+jw95IZ0V/HehGwUQVhkyAfRDhMzbzyYE3AEEGJQHyTvHg==
X-Received: by 2002:a05:6000:1b8d:: with SMTP id
 r13mr17262570wru.230.1631956783239; 
 Sat, 18 Sep 2021 02:19:43 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id 129sm8840382wmz.26.2021.09.18.02.19.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Sep 2021 02:19:42 -0700 (PDT)
Message-ID: <a99e29c5-0aed-2a7c-cbdd-ebaecc99a448@amsat.org>
Date: Sat, 18 Sep 2021 11:19:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH-for-6.2 0/2] disas/nios2: Simplify endianess conversion
Content-Language: en-US
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210807110939.95853-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210807110939.95853-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.488,
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
Cc: Marek Vasut <marex@denx.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-trivial@ (series fully reviewed).

On 8/7/21 13:09, Philippe Mathieu-Daudé wrote:
> After chatting with Richard Henderson and Paolo Bonzini, we
> concluded the load/store API is mature enough to have target
> code endianess-agnostic.
> Thus we could remove the TARGET_WORDS_BIGENDIAN definition from
> target-specific code (restricting it to the binary format loaders).
> 
> While experimenting, I noticed the Nios2 disassembler is an easy
> win. MIPS will follow shortly.
> 
> Philippe Mathieu-Daudé (2):
>   disas/nios2: Fix style in print_insn_nios2()
>   disas/nios2: Simplify endianess conversion
> 
>  include/disas/dis-asm.h |  3 +-
>  disas/nios2.c           | 71 ++++++++++++++++-------------------------
>  target/nios2/cpu.c      |  6 +---
>  3 files changed, 29 insertions(+), 51 deletions(-)
> 

