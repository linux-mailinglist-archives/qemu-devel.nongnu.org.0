Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10825356EB6
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 16:32:22 +0200 (CEST)
Received: from localhost ([::1]:45182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU9EC-0003uF-UQ
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 10:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lU9Ap-0008M2-9R; Wed, 07 Apr 2021 10:28:51 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:47049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lU9An-0002RW-Lh; Wed, 07 Apr 2021 10:28:51 -0400
Received: by mail-yb1-xb30.google.com with SMTP id e188so9312045ybb.13;
 Wed, 07 Apr 2021 07:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A5gq1KarSEEjtENXmg7PhY3Q7GrZP69PDr4s1mP7YRU=;
 b=sygNk2gwH2KxcW8vS/MaRRghkzGCXku65nwZNtkcpv/DM8m1mOz1SOINvzssHFFIWR
 l7zu5HHOiA7Fsm4+I/gaP8B4eic85i0Y8hwOUugmD4EzGn1c++6TOOBu2Sn6swmgqX+N
 dXyrzdebufojlTsN11mY/+umkUIS82Dq11r3sWTPZobFiUguaC1tRvjoy/TN4frKFDVA
 +bzSvqqZqsI6CPYyDX/w6/SDBRWfGJeIJgxMso4vAEhDdAfZdYCW0q1cDc8935E2X0mY
 adu3wz3bkJf8uuqnW37ZPLmK87rZ9kcBvDAVpbkY0kBSNPPPJV3xByv50sDqN+KSm+5E
 u5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A5gq1KarSEEjtENXmg7PhY3Q7GrZP69PDr4s1mP7YRU=;
 b=cKOZq9ykmbqvvGjEBoSvlcoaWSvVO6XAo1mNgfnT5+s19qaH2893+24htkXu1zZBdm
 QUxccjYfSJRVtg17yfmjsA2G++q9VPsQ/ujgPk/oV2DWOyXDpXOThQ9h0HuWlrCLruIh
 IiG2ppENr2c2H/Bh6bIK7PLZYP/mFIKnnzZ6CGN3hExRKGZykPxH1+dAXV2l9YSE2fW7
 KgXVVBjHxbject0/+zBYvBJj0VkkIFqPZ+iEEL5YERo/FzM/NepDucCX8JreQD4w0hPH
 b8PiNvKI2kU+ENri04IgVmbU26UNUbVFuv27WYbkXo4w/4M1aDDVxjkofUKBos3hApKJ
 yNpQ==
X-Gm-Message-State: AOAM5306/RNvqNLFOvuHeEet8F7Ivf7qpXT4iyMIU6hX4fZUtMiNcQc1
 kktZn8uTlxoYb13sgxzvttTZbQY0SmzJHFtltyY=
X-Google-Smtp-Source: ABdhPJyZiFG7ozyyFfyxUNRRD8wj0IuWmp6F/jVmGoWuyMPbJCFAVcNomhfnEl7qA/eyHWr+g4Sg3wDRIXKBns6I+IU=
X-Received: by 2002:a25:5146:: with SMTP id f67mr4611323ybb.332.1617805728441; 
 Wed, 07 Apr 2021 07:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617367533.git.alistair.francis@wdc.com>
 <59a0c0d7237109dee9dea28023f953d2ae3523b8.1617367533.git.alistair.francis@wdc.com>
In-Reply-To: <59a0c0d7237109dee9dea28023f953d2ae3523b8.1617367533.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 7 Apr 2021 22:28:37 +0800
Message-ID: <CAEUhbmVT4zuN2+yMhbn4iqGcHUejpUHFbtbVmG=+T=oXmyDbDw@mail.gmail.com>
Subject: Re: [PATCH v1 7/8] target/riscv/pmp: Remove outdated comment
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: weiying_hou@outlook.com, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Ethan.Lee.QNL@gmail.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>,
 camiyoru@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 2, 2021 at 8:50 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/pmp.c | 4 ----
>  1 file changed, 4 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

