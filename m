Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDD841FC8A
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 16:33:26 +0200 (CEST)
Received: from localhost ([::1]:36996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWg4r-0006dy-H6
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 10:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWg1p-0004QX-I6
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:30:17 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWg1o-0007BQ-2o
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:30:17 -0400
Received: by mail-wr1-x42e.google.com with SMTP id r10so3911949wra.12
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 07:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qXvHZS5WJ3G4gI1K5SeFyayhP0WiU013kl1woOZHFJ8=;
 b=eVBYkrs8HG8oU5zKiApnv1WMZBy8Rmhsj/DBUYzqgLFOMVGkObhb+Y8liFJ0MCZbrI
 Bp0G4ZNvdfoRPv6rLCmo8PYp8wVxh0GN85ZfhK51P+P9WnvENIkxHtLafmDChatAlK3q
 klk0FgtB6E3sQu70N3gRqGenjJ9rPSM2XN5bFgrEdgDs2TWQJ1o5vEXUqTA7NsD03FYN
 ofOIPAXQdOAFgalvow8E8+KzWQ2GsQyEYD8IEUmOmi+374QtpomqlYzxGWCqV8mX+qSB
 Wyr2yHisI3HFf4Z2wZ5fFAMLzdgQxwl944iQt5Hb5F/FTGti3PaEBvaFKOOkX/0UfNRe
 ygZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qXvHZS5WJ3G4gI1K5SeFyayhP0WiU013kl1woOZHFJ8=;
 b=Xad0kAOeosimssaLlo+nENGRxFSwMqVMJssW5D4DHbn18MDKmDY7opId5RgktY7Y1/
 AUDErK3UL76F88ORHxzysuNJWmZ4n3t+kGu2xN/BKBRmvpBprACgznE5WNN6xjk0v3QC
 Vb9lW/9y4jwehK58iUJ4iJqqoDL2aygj6VjlB4TgYpli23tirksbdgWEw1G7hMLZFTjr
 oqwKCMmSYI9tETtjBqVwkn96p3LuDo8ymrE+kGpYoIETY4N2PXo0WJjtiqUkS7rdZQG2
 Mw7Fg3JG4X7rvnKDCDXC1EBsGsQGLQqVFfItYn1ERnQt4UHIHIXVsplxVpPzt/Y3b0Jh
 MDnA==
X-Gm-Message-State: AOAM533jSKGvCGOAA7Sp0FGLEy5uq4J0Cu/JkRKHZe3Ao4RSM+bUJ7vk
 a02vcW77Mbhgtp1hRt6N4xI=
X-Google-Smtp-Source: ABdhPJxdqv5tyP1mXM/hGL8qmvPbpG4hNZRr8HA1R8ObWQrgIEnYlYQRtNdyzuncqufYxU7xKmNC9Q==
X-Received: by 2002:adf:a114:: with SMTP id o20mr2815982wro.95.1633185014771; 
 Sat, 02 Oct 2021 07:30:14 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id x9sm8507198wrv.82.2021.10.02.07.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 07:30:14 -0700 (PDT)
Message-ID: <3211e251-06da-64a0-5152-636a1478cc2b@amsat.org>
Date: Sat, 2 Oct 2021 16:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 41/41] accel/tcg: Restrict TCGCPUOps::tlb_fill() to
 sysemu
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
 <20211001171151.1739472-42-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211001171151.1739472-42-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.413,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/21 19:11, Richard Henderson wrote:
> We have replaced tlb_fill with record_sigsegv for user mod.

Typo "user mode"?

> Move the declaration to restrict it to system emulation.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/tcg-cpu-ops.h | 22 ++++++++++------------
>  linux-user/signal.c           |  3 ---
>  2 files changed, 10 insertions(+), 15 deletions(-)

