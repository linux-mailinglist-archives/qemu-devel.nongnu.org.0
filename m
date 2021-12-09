Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 183BA46E377
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 08:45:52 +0100 (CET)
Received: from localhost ([::1]:40690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvE7i-0008NU-Mq
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 02:45:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mvE5r-0007hg-Ac
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 02:43:55 -0500
Received: from [2a00:1450:4864:20::42f] (port=35503
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mvE5T-00036h-OG
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 02:43:55 -0500
Received: by mail-wr1-x42f.google.com with SMTP id i5so8151053wrb.2
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 23:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Zcq0y83wTDzV0jHTk/gK+bLS5fviAee7zGR57onXPRs=;
 b=etIJZWJ+h/VK6TEgbkmHlmZbBz1S1KZJXxDG4Mh803P4NU0cT3bO15XGWEQVMjaIAP
 XBG6qiKHYmIudB6mWqbMlw9aT7pfFmqugEv6X3kBGL8rb80MiN6eY8P/KiMHH5swmFCr
 COsqckTOWgk0jZjUiuJd7I1p46lYCEW4ntQuhYwSRUk31mejCSQv6DJEgnLcD+s6pVv0
 PPxCNwHGu5fcRYqSZt2gR3oP4AvWPTgWZaQIvYDdVkuz1Cthy2lbmV+7O6ffktwSj8jc
 XvSB1qnhXrbASO71hHJiC9nVaHkdROr/2ABV85x3oIk5Yd1Xe0ieq+0V69UQeNzgKRZ/
 3xNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Zcq0y83wTDzV0jHTk/gK+bLS5fviAee7zGR57onXPRs=;
 b=P+5p7Lyf9MQvHyJvLKwFUxU3d2JT6c9v+u2HplH/4KeQ9+3WeNTst65g8Wq9OgyqHh
 emDzCbsc4IY4H8HpGSOY/EjXFwzreG5yGpVB8ezlJ2lx6kayYcTzUdqir+TX3tF7XEkk
 1FYdTk9CV9VmVXpmE7d7jRnrmC45OMkPkKE5saT268ni2GoGIxrtOp3Thw5bkTpghFOI
 0ZJA8/QVG0PSzQvJJfLVumZb2uxjwwN2MkZ6BzDlWAxcSV1RrUlnQm8gm487t6C1L4vb
 mcvuqNIDNVzbqxOR46nEStQJr+pccheDa8yqZkrkd1Z4ETnszr+635aExaTyvUevuEqH
 MoDw==
X-Gm-Message-State: AOAM533NcDnVMdDSqz9Fo4+WPuyiRKVRQmBhUj7TQNHurNA0WDDXNKze
 GKuzszRFHKZRgNb4WA2oBflhNFrDjKo=
X-Google-Smtp-Source: ABdhPJzHJ1n1yY+EFdTn47zYsDZ9ejaFFv8D41wdwUtXZTcCNcCzziCYa89/7dbmsBd9WjMFatcw8A==
X-Received: by 2002:adf:f947:: with SMTP id q7mr4565551wrr.260.1639035810319; 
 Wed, 08 Dec 2021 23:43:30 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id g18sm9958133wmq.4.2021.12.08.23.43.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 23:43:29 -0800 (PST)
Message-ID: <f2dc5267-e30c-9f02-6c0c-c0c40448a1bc@amsat.org>
Date: Thu, 9 Dec 2021 08:43:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/6] target/arm: Honor TCR_ELx.{I}PS
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211208231154.392029-1-richard.henderson@linaro.org>
 <20211208231154.392029-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211208231154.392029-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.803,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 12/9/21 00:11, Richard Henderson wrote:
> This field controls the output (intermediate) physical address size
> of the translation process.  V8 requires to raise an AddressSize
> fault if the page tables are programmed incorrectly, such that any
> intermediate descriptor address, or the final translated address,
> is out of range.
> 

I'd split this patch as:

> Add an outputsize field to ARMVAParameters,
^ 1

> and fill it in during
> aa64_va_parameters.
^2

> Pass the value to check_s2_mmu_setup to use
> instead of the raw PAMax value.
^1

> Test the descaddr as extracted
> from TTBR and from page table entries.
^2

> Restrict descaddrmask so that we won't raise the fault for v7.
^ could be in 1 (simpler) or 2 if you think it makes sense.

This way #1 is a preliminary refactor/cleanup,
and #2 is only the ps field and V8 addition.

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h |  1 +
>  target/arm/helper.c    | 92 +++++++++++++++++++++++++++++-------------
>  2 files changed, 65 insertions(+), 28 deletions(-)

