Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9746E5CAC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 10:57:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poh9F-0003R7-9T; Tue, 18 Apr 2023 04:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1poh9C-0003QU-Cp
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:57:10 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1poh9A-0004E0-9s
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:57:10 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f0a0c4e505so14061465e9.0
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 01:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681808226; x=1684400226; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2c12FoyLzFklFoPkfNrKN98f5kjg5kMD21GviAn+x+A=;
 b=saKl3YcE+6iKUEOiGacW9EPU2NBLnflnbUkMDBbO8AYRkgTmCYZh7Tc1L/mPHYDhUO
 FhfZoXfKf7MZ0KX1IBfQq8LMcBJZQank61oMAVVNy2bq+rSZysYJhTXY8kplo9kUStNC
 xpUvQUH1Q6LYoXpUs+/SysxLCxG4z7XjMFIPLRpr25xSeXcIG50Sn2uh97cGvt4k4DjK
 8dRd2Zcs6LPTJeQJQ0C797GGTHYzriO3zBrMoty0XDCPzlXdCekAswxqFIjUzE/kC5T8
 hZpb4nThTbPL84n1puM9IT8tsP3drkEwMbs+i8NoQdb6+4n9pvwGbW7S4CzvKF+dzUw/
 V9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681808226; x=1684400226;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2c12FoyLzFklFoPkfNrKN98f5kjg5kMD21GviAn+x+A=;
 b=KOzO7bpwWhZyZgad46UppDxliPVKl1XtUJAZxXzSVNvfd08C0sLdavVfZ9Tf77b7Pj
 7OjxOwGiv4PtDqJvqB5Ic/w4/j2NHgi64YyYZSCYv5o2lY/W9RBWg+7emEt8QdVNPlmf
 bLx99h7g6PSFbEY9ofD3WhdJeANGuDLc8oDlV6wX/nLXzwR6C6WjagyNz9rOXMhY+MrB
 q4Qz7iG7drl8EByIrT9NS6gX4lK5HfnRe/SNhD30AA+e9F4ZK1vgJwIdFfQmLKT/W9np
 VxqNZKfpmxZnhgRIDoHJrJwv0AZCIsiSky5imnfvwBmDY0jDiDChYxrYDjL+slDej9nj
 tBLg==
X-Gm-Message-State: AAQBX9cJVOkEdSMpIM6OwVJIYPq9s1mK7jQEOkbtATgZDBqWkLeS52X9
 hv9OY5YboUSB8MPT6PdfZSKOLDgdvo4SEDIHcEecnQ==
X-Google-Smtp-Source: AKy350b6wYNb67rSQ0/Ogq9OXwGOvtQfjMw/1jL+054Hf4pjOkxQrcAXerBh9MxkJMlwATeEaZuAnu154zocDFI1pUE=
X-Received: by 2002:a5d:4742:0:b0:2f4:55c3:8452 with SMTP id
 o2-20020a5d4742000000b002f455c38452mr1301331wrs.22.1681808226075; Tue, 18 Apr
 2023 01:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230412091716.126601-1-alexghiti@rivosinc.com>
 <CAKmqyKNkyakGCFG0DqX02GpqhAPEq=tkt-EVctas5m2XjRuXJg@mail.gmail.com>
 <ZD0jos2r4uZocw/5@andrea>
 <CAKmqyKNVf4tba=mpqZrwtaFC5Pn6-787cQy9Hnf3u=Xodcx09g@mail.gmail.com>
In-Reply-To: <CAKmqyKNVf4tba=mpqZrwtaFC5Pn6-787cQy9Hnf3u=Xodcx09g@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 18 Apr 2023 10:56:55 +0200
Message-ID: <CAHVXubiUW3aMpr5VmSm2LYb0UByOND-kNVw6-BDTCjgQk_EPzg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Raise an exception if pte reserved bits are not
 cleared
To: Alistair Francis <alistair23@gmail.com>
Cc: Andrea Parri <andrea@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Alistair,

Sorry for the late reply, I was on PTO.

On Tue, Apr 18, 2023 at 4:22=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> On Mon, Apr 17, 2023 at 8:47=E2=80=AFPM Andrea Parri <andrea@rivosinc.com=
> wrote:
> >
> > Hi Alistair,
> >
> > > > @@ -936,6 +936,11 @@ restart:
> > > >              return TRANSLATE_FAIL;
> > > >          }
> > > >
> > > > +        /* PTE reserved bits must be cleared otherwise an exceptio=
n is raised */
> > > > +        if (riscv_cpu_mxl(env) =3D=3D MXL_RV64 && (pte & PTE_RESER=
VED)) {
> > > > +            return TRANSLATE_FAIL;
> > > > +        }
> > >
> > > Isn't this caught by our existing check?
> > >
> > >             if ((pte & ~(target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT)=
 {
> > >                 return TRANSLATE_FAIL;
> > >             }
> >
> > Thanks for checking this out.  AFAICS, the existing check/code doesn't
> > work if either svnapot or svpbmt are active.
>
> svpbmt uses some of the reserved fields right?

No, pbmt uses bits 61-62 and napot uses bit 63, this patchset deals
with bits 54-60.

>
> I'm not sure why svnapot excludes the check. The correct fix should be
> to change this check as required (instead of adding a new check).

napot and pbmt exclude the check because PTE_PPN_MASK only deals with
PPN bits, and then ~PTE_PPN_MASK is too large as it tests the
PBMT/NAPOT bits AND the reserved bits.
But you made me notice that the pbmt/napot check isn't right either,
as the napot bit could be set if !napot and then an exception would
not be triggered (the same for pbmt).

Let me check this completely and come back with a proper fix for that too.

Thanks!

Alex

>
> Alistair
>
> >
> > Please let me know if you need other information.
> >
> >   Andrea

