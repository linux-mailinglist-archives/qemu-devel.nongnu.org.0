Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D213F9822
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 12:31:47 +0200 (CEST)
Received: from localhost ([::1]:52434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJZ9G-0006Qs-87
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 06:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mJZ7g-0005Sl-T7
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 06:30:08 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mJZ7e-0005KX-9B
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 06:30:08 -0400
Received: by mail-wr1-x429.google.com with SMTP id b6so9617269wrh.10
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 03:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y44c6hcAC18URVEAtmPZAYiKRKGkHIAsc5iJ9C+0yXQ=;
 b=WnI3kHOKyr5S9fSDTknfkekHYuJwT/0/YHsCiVAvqSRaDAiVKghSA4OX8GX1W+z8qE
 FshZnPqGaXo4cQM/1MY1D8F/9E97CYoWEaVZ2+GSob/Vm017Q0zUBsecKzJcDz+5fwju
 DcvSVU42quBEVbhJ+EeK/1oS9EPV/gDdYYTWxIgURFnAuheHYQ7sGRRF/pAY9ROjs9Kn
 2E0r6alMbn2pdTa3D3SmwxNv8ctINvNHYt04fYfK3Rrai3eteiPd0f+CiyquCqOc5m53
 yj2Aqz7ZbKg9kRM9uFwVC72pp+W7XTR+ocg/VsotrOzqCNoZKCo6N1F5fixAtl8Cyqpt
 G8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y44c6hcAC18URVEAtmPZAYiKRKGkHIAsc5iJ9C+0yXQ=;
 b=UYC63Xb8bVLi6cOFaL/ww240gOcsQEi477cajjD2kcgLwfzKyeCsh42jW2GX3DAH/r
 BrNdP4oinhMsA4ZFi6Ce7iQuVj0E7YiuFO/eaWzTDaLZIqgZe0iFi4rNaHqgxp1gu9tc
 3iG30JymiFGptxkhli1HufuBn4mjQbp/VNINJ/cfdJ0XH9QML48bgKUMfmsPmFcS/Nwq
 E60NQAoLfaO3uXLtX/UnFqSb4z58h7HXY7snfFJvQdx+cDDVHhKYAqK79fzNhltuPFBt
 h5HCjwf9E40zaOueOLeUxzcWFFw1DsmX7zhfx813/mFgWTZSKbR9+3F7ZJKf1w2qAG/F
 34tw==
X-Gm-Message-State: AOAM531jr/+6Gxm9/NAOL871rxu19V8+vs3Fi1ch/l41wx0NbV3k2h8b
 tYuDE4icMYfyIPOzId0Xb5txciIs9AVnDTQGZOIijQ==
X-Google-Smtp-Source: ABdhPJyowO7qGEy3ddsSQk8lcMBLYFPKXNhxEgjvXpYoL0iGhurnjTkwo17BNICJj5WGnY3SUpWWIa1irlDu1v4qkLw=
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr9585563wrw.390.1630060204524; 
 Fri, 27 Aug 2021 03:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210724122407.2486558-1-anup.patel@wdc.com>
 <20210724122407.2486558-5-anup.patel@wdc.com>
 <CAEUhbmUMkGtsC0V7kz22_0h4Ku2xStankcfhEVS5ywnuRpFtBQ@mail.gmail.com>
In-Reply-To: <CAEUhbmUMkGtsC0V7kz22_0h4Ku2xStankcfhEVS5ywnuRpFtBQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Aug 2021 15:59:53 +0530
Message-ID: <CAAhSdy2m9CJhs2zE-1o6DdCpj2EqsNfbR9KfRfNcJNwXJkunpw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] hw/riscv: virt: Add optional ACLINT support to
 virt machine
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::429;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 6, 2021 at 8:00 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sat, Jul 24, 2021 at 8:27 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > We extend virt machine to emulate ACLINT devices only when "aclint=on"
> > parameter is passed along with machine name in QEMU command-line.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  hw/riscv/virt.c         | 113 +++++++++++++++++++++++++++++++++++++++-
> >  include/hw/riscv/virt.h |   2 +
> >  2 files changed, 114 insertions(+), 1 deletion(-)
> >
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>
> Please add a "Machine-specific options" in the Virt documentation.
>
> See sifive_u example @
> https://qemu.readthedocs.io/en/latest/system/riscv/sifive_u.html#machine-specific-options

Okay, I will update the documentation in the next revision.

Regards,
Anup

>
> Regards,
> Bin

