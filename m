Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E775D2D6E37
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 03:48:22 +0100 (CET)
Received: from localhost ([::1]:38064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knYTl-0003m2-Hd
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 21:48:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1knYSd-00034S-S6
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 21:47:12 -0500
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:42250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1knYSZ-0001al-Hl
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 21:47:11 -0500
Received: by mail-il1-x142.google.com with SMTP id 2so7398264ilg.9
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 18:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+cH6NhrNCymGCFQefWZaTuhQOjdQkzFTug/Zw1PJ2LE=;
 b=maJZgRgqrlHrNqjbd0QOZYCP9DnzOWBWsBvON2HOdGWEDLXeL0zpYpO/mKaXIjJoxh
 akZZfL2pOZN04SY3/kQZjc+eyXHqnVt2aHd+PODVFW9WJ5YRoxMfv4SPZSCSPcy6vCwW
 1+oo8yfl8wprzXEb2Tn7r60/X8iVzQtU+uJm/rTzpfEJ5ukaaf6hFvFXBq/8sahAenHr
 1FyYU3FlKVMchG5M0FVDwdujNkzxWoaM4gHPGL0LBx6mRIG4vxwhi1gTDWfuSC9mTLVb
 +37eq85mvmUT5iEym33hGJVWMerMdlKF/MB5moSE7YjqBi3HWNYP6iqjqIxXC6AnFLhJ
 6d0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+cH6NhrNCymGCFQefWZaTuhQOjdQkzFTug/Zw1PJ2LE=;
 b=B4TWFTEPAvEaXpYJv7HBioImT09m3Sx9ovU8ideq0vV0/ThwnYe3/iRfgmll8r4UWQ
 b8zaKLOqY7NYdc4xifeyo4eyqdO7oPwun7QeRYsm9WaFEb2leOqz0DRlJGIPukdKQfjJ
 B2y4P/g8k+WXfdj5ZwLnm7hICe9GRP8Lo6aEdHbdbm7WKPIYn7DihuLTC1J3YHdRrsMX
 VPfojdqaMxRz9EnE/XsPF3/eKDO0LiHImSbhKjEofmak8rhAgX2e/pg31iS1zO8Kd0Vk
 Bxx7WAF2/R3AGN8lPq4DJVVRQmZW27I6e71n5AiSSEZDgYsAPEQTWuomejE+kDqPUbDB
 Je8A==
X-Gm-Message-State: AOAM533+gz3ukc4gyzNnqwzj3uj6StCMS5QIRuZ7Zv1vt1BZJ22gmC+T
 j+DplTdEPIDcH6KYGCVlfHk5lBZCGFDupunHYTE=
X-Google-Smtp-Source: ABdhPJyqwmVI3KLeOFbtTtuRtIjiOZQ+1v2SPSHCo1+gSf7plJyACwC3oqTYC57kuMQsOWSSMLvOihL/sz+ycpqF5Ls=
X-Received: by 2002:a05:6e02:f88:: with SMTP id
 v8mr12854316ilo.270.1607654825668; 
 Thu, 10 Dec 2020 18:47:05 -0800 (PST)
MIME-Version: 1.0
References: <1604636510-8347-1-git-send-email-chenhc@lemote.com>
 <1604636510-8347-5-git-send-email-chenhc@lemote.com>
 <e85cc640-e5f4-bec1-2e3a-b5a57abe21c7@amsat.org>
 <CAAhV-H7ALVV=3Gj4iq4TVqL+czm3kK+F_uKvxGTJB-wonpGRHw@mail.gmail.com>
 <215f01d5-3fad-1dc6-bb1b-e8face969e23@amsat.org>
In-Reply-To: <215f01d5-3fad-1dc6-bb1b-e8face969e23@amsat.org>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Fri, 11 Dec 2020 10:46:54 +0800
Message-ID: <CAAhV-H6d1gDGKha=D+TNg-vwTL_5+9ON+x9GCE0QsrQktby01A@mail.gmail.com>
Subject: Re: [PATCH V17 4/6] hw/mips: Add Loongson-3 boot parameter helpers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=chenhuacai@gmail.com; helo=mail-il1-x142.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <zltjiangshi@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Rechard and Peter,

On Wed, Dec 2, 2020 at 5:32 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 12/2/20 2:14 AM, Huacai Chen wrote:
> > Hi, Phillippe,
> >
> > On Tue, Nov 24, 2020 at 6:25 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
> >>
> >> On 11/6/20 5:21 AM, Huacai Chen wrote:
> >>> Preparing to add Loongson-3 machine support, add Loongson-3's LEFI (a
> >>> UEFI-like interface for BIOS-Kernel boot parameters) helpers first.
> >>>
> >>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> >>> Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >>> ---
> >>>  hw/mips/loongson3_bootp.c | 165 +++++++++++++++++++++++++++++++
> >>>  hw/mips/loongson3_bootp.h | 241 ++++++++++++++++++++++++++++++++++++=
++++++++++
> >>>  hw/mips/meson.build       |   1 +
> >>>  3 files changed, 407 insertions(+)
> >>>  create mode 100644 hw/mips/loongson3_bootp.c
> >>>  create mode 100644 hw/mips/loongson3_bootp.h
> >>>
> >>> diff --git a/hw/mips/loongson3_bootp.c b/hw/mips/loongson3_bootp.c
> >>> new file mode 100644
> >>> index 0000000..3a16081
> >>> --- /dev/null
> >>> +++ b/hw/mips/loongson3_bootp.c
> >>> @@ -0,0 +1,165 @@
> >>> +/*
> >>> + * LEFI (a UEFI-like interface for BIOS-Kernel boot parameters) help=
ers
> >>> + *
> >>> + * Copyright (c) 2018-2020 Huacai Chen (chenhc@lemote.com)
> >>> + * Copyright (c) 2018-2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
> >>> + *
> >>> + * This program is free software: you can redistribute it and/or mod=
ify
> >>> + * it under the terms of the GNU General Public License as published=
 by
> >>> + * the Free Software Foundation, either version 2 of the License, or
> >>> + * (at your option) any later version.
> >>> + *
> >>> + * This program is distributed in the hope that it will be useful,
> >>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> >>> + * GNU General Public License for more details.
> >>> + *
> >>> + * You should have received a copy of the GNU General Public License
> >>> + * along with this program. If not, see <https://www.gnu.org/license=
s/>.
> >>> + */
> >>> +
> >>> +#include "qemu/osdep.h"
> >>> +#include "qemu/units.h"
> >>> +#include "qemu/cutils.h"
> >>> +#include "cpu.h"
> >>> +#include "hw/boards.h"
> >>> +#include "hw/mips/loongson3_bootp.h"
> >>> +
> >>> +#define LOONGSON3_CORE_PER_NODE 4
> >>> +
> >>> +static struct efi_cpuinfo_loongson *init_cpu_info(void *g_cpuinfo, u=
int64_t cpu_freq)
> >>> +{
> >>> +    struct efi_cpuinfo_loongson *c =3D g_cpuinfo;
> >>> +
> >>> +    stl_le_p(&c->cputype, Loongson_3A);
> >>> +    stl_le_p(&c->processor_id, MIPS_CPU(first_cpu)->env.CP0_PRid);
> >>
> >> Build failing with Clang:
> >>
> >> FAILED: libqemu-mips64el-softmmu.fa.p/hw_mips_loongson3_bootp.c.o
> >> hw/mips/loongson3_bootp.c:35:15: error: taking address of packed membe=
r
> >> 'processor_id' of class or structure 'efi_cpuinfo_loongson' may result
> >> in an unaligned pointer value [-Werror,-Waddress-of-packed-member]
> >>     stl_le_p(&c->processor_id, MIPS_CPU(first_cpu)->env.CP0_PRid);
> >>               ^~~~~~~~~~~~~~~
> >> 1 error generated.
> > We cannot reproduce it on X86/MIPS with clang...
>
> You can reproduce running the Clang job on Gitlab-CI:
>
> https://wiki.qemu.org/Testing/CI/GitLabCI
>
> > And I found that
> > stl_le_p() will be __builtin_memcpy(), I don't think memcpy() will
> > cause unaligned access. So, any suggestions?
>
> I'll defer this question to Richard/Peter who have deeper understanding.
Any sugguestions? Other patches are updated, except this one.

Huacai
>
> >
> > Huacai

