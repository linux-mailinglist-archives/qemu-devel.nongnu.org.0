Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D63791DC474
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 03:08:34 +0200 (CEST)
Received: from localhost ([::1]:36066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbZhJ-0000KW-VB
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 21:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jbZgQ-0008MN-B2; Wed, 20 May 2020 21:07:38 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:34165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jbZgP-0005Ld-I0; Wed, 20 May 2020 21:07:38 -0400
Received: by mail-yb1-xb42.google.com with SMTP id l17so1960565ybk.1;
 Wed, 20 May 2020 18:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QwypUE2kECPAB1ixKyymtGwskJppvPP9NHbCxjJMCGk=;
 b=Jka0tkLcOuYNTUAMSRb32azRhW4b1ooLMJctl2m9Qx6sjBMQm9EY/LNIMq4OwIN67p
 Tnrf7e1qIRY9Efeq5XQQYQ0dg9ulUg7xkSWpx7FybqXc6M01bjbZ7/sFUfxBBiSki2vO
 DavjGgeY0LL+NsI8jltTtBvAl1kdN4dj0XHB7WueN4CpM9uLWeu9XZil35b4inFpmEPd
 /V3QW6mFftE7XQljjY2kJ62U0ouwioH7i2luwnzsggPzFzdAod6PHRRZ1F04Tv62nXor
 kI3b8PVd9u4yl08PMARW1JlaEentEHj8sjJb743uevbvOut7T0nfTSaMIY3jH2qKH2My
 GhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QwypUE2kECPAB1ixKyymtGwskJppvPP9NHbCxjJMCGk=;
 b=C8+231PyiJV76zmqIBbzSZGVMErXOk3wW0yT/Ey009JuSacrO3qh6V4ErIQVS4FlYP
 R08rFHqtH5qCxuvebJEQhtAR6zlpAFEsEbcxUn37/wE4Z/7xZeIgoHf/jmnriQFIM8eE
 +Hpga3xFsTZLGJJdLM39MDqhiFLiWhAfEsYYlIeBDZB0dNv9Gqp4oy4AlKcS/RfUQ7IY
 E7yIAG2DhtiqkOVs4F72IB4Hcen8SDNpbYsn1k5b8xj72qzA8U+yldDAzPoxHXv58ejr
 atYF/UjRVaPmLPxjAa6S+nQzyyV7nuajiT4IX0BtreWi1fv2IYx4Q9eHIWmvD+0rx6wd
 oAJA==
X-Gm-Message-State: AOAM531h0yaGUKItgcqcK1n6QnHFHr/rxud6SbEvTy9IaFNaKc0euLN/
 wDzFo5uQP/jLaqLmA2tCoCtN1X/z0O/S+mgkm4E2T0+E
X-Google-Smtp-Source: ABdhPJwBvA8IukGFjysc5++w35U4wNU+IfSDNAJC+pU7GoNhZ6jM0NEtziCixapDjC/8ZdUw1vcWQCEkvl0Z/yrQC5M=
X-Received: by 2002:a25:6006:: with SMTP id u6mr2845224ybb.387.1590023256493; 
 Wed, 20 May 2020 18:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588878640.git.alistair.francis@wdc.com>
 <7316f5f5fef7314dfef662862eba93cdbed4ddb9.1588878640.git.alistair.francis@wdc.com>
In-Reply-To: <7316f5f5fef7314dfef662862eba93cdbed4ddb9.1588878640.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 May 2020 09:07:24 +0800
Message-ID: <CAEUhbmWGFZs9=-Cv_v3eTiMt0SiErLyhZ+UmYHCkjwduX8EF=A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] target/riscv: Remove the deprecated CPUs
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 8, 2020 at 3:19 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c              | 28 ----------------------------
>  target/riscv/cpu.h              |  7 -------
>  tests/qtest/machine-none-test.c |  4 ++--
>  3 files changed, 2 insertions(+), 37 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>

