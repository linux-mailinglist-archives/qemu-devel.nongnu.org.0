Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C303D33F5
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 07:14:57 +0200 (CEST)
Received: from localhost ([::1]:35044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6nWS-00005e-IK
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 01:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m6nV6-0006YH-TA
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 01:13:32 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:46035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m6nV5-0005dz-8c
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 01:13:32 -0400
Received: by mail-io1-xd2e.google.com with SMTP id l126so1080616ioa.12
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 22:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ODLscsVz3K/04SxjEinY/EQOuk/llEQ9IB6Jru5phiQ=;
 b=HhDc4210nYVmmevU7KjHZ2KcvtsNEcWjo8vbNFL72As/o/Xmi2qfqGZEFxBl1KGK1Y
 8FgVpLDjxcbbYPRNM+tXVQa2kYqfAEqb5vVPBPaf7qD4wZnMOcU4CPgt7FfZJmiKvyie
 7UBgyPWQ6pP7OHpTXeMi0u7QrSx0NIe/xNF3ZuKVSKLu7JMimHuR/X5klc8xE347eHxU
 rutqXvZ8wRZnA7px06nLh0q+Y9kXg3FDH3gLp6ML57/14HQGEfP5ZIVo9jlLM0HYY4wG
 rr1s6dw+t5WqUoPUgNoD2dNzTQhUQqQWSBsAbxt+qNwZo/vY2R++slzLaPxFlxiqPB2O
 ZA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ODLscsVz3K/04SxjEinY/EQOuk/llEQ9IB6Jru5phiQ=;
 b=Cr4km++6mxO4gjC8E1bOEVUID2pXrCHtCnOitMQXk9InzP938/iqIjOUJtflt/xCSb
 A3DgqvY1F9DbVZQCkKYmeMhEO5JuoZLGRiobR3qoLzA8+d6ZYYAaRJcPFUk/2aFSR7gU
 SVx7yoTUdTSmTzQwiYuuUUVDUYqhtWWAT+h9oEppclq+Te5D5H9aneCx8ylexN6hzfhW
 ClB1qwqn5rDuIuilhlCJYCg+U0Xsbl0aIxAC0ukxKuSD8qHNmUraxBTvgvHUGJEYbs7q
 RVFUOUUmmkyd2SUCQnt+1NT7mdwf928BiNiJK6x8rzVL2vtSAqrGHnLWnFJZdIIBEZdj
 FPgQ==
X-Gm-Message-State: AOAM530YCk84AgfhaOD+KX1iMcSHFd8ixwBROtHmgsYYT1TP78Txn85/
 S4V0YCBG2+Jh4EC6yexlulxoZtCmvi4HRwfTc0c=
X-Google-Smtp-Source: ABdhPJwV3bd35xd9jhTqPERQ4vKLtOkvS28nGhgbEn1prtmspHqbEP2p6Vc7bxdyv+1NEFUkOjSTeVrqvnDLg/HU1Qw=
X-Received: by 2002:a6b:7905:: with SMTP id i5mr2629119iop.175.1627017210111; 
 Thu, 22 Jul 2021 22:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <1626805903-162860-1-git-send-email-joe.komlodi@xilinx.com>
In-Reply-To: <1626805903-162860-1-git-send-email-joe.komlodi@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Jul 2021 15:13:04 +1000
Message-ID: <CAKmqyKMzKC84wF+xx31rTHiUs=QhKt3aDZq2VCEkyyNHS9zChw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add more 64-bit utilities
To: Joe Komlodi <joe.komlodi@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 21, 2021 at 4:31 AM Joe Komlodi <joe.komlodi@xilinx.com> wrote:
>
> Changelog:
> v2 -> v3
>  - 1/2: register block init should also be uint64_t
> v1 -> v2
>  - 2/2: Use uint64_t for 64-bit value
>
> Hi all,
>
> This adds more utilities for 64-bit registers.
> As part of it, it also fixes FIELD_DP64 to work with bit fields wider than
> 32-bits.
>
> Thanks!
> Joe
>
> Joe Komlodi (2):
>   hw/core/register: Add more 64-bit utilities
>   hw/registerfields: Use 64-bit bitfield for FIELD_DP64

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/core/register.c          | 12 ++++++++++++
>  include/hw/register.h       |  8 ++++++++
>  include/hw/registerfields.h | 10 +++++++++-
>  3 files changed, 29 insertions(+), 1 deletion(-)
>
> --
> 2.7.4
>

