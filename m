Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20474D025A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 22:47:29 +0200 (CEST)
Received: from localhost ([::1]:37128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHwOG-0005Vb-55
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 16:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42907)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iHwNE-00053o-Gd
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 16:46:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iHwND-0005Re-Gc
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 16:46:24 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:36370)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iHwND-0005R8-6c
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 16:46:23 -0400
Received: by mail-lf1-x142.google.com with SMTP id x80so13029209lff.3
 for <qemu-devel@nongnu.org>; Tue, 08 Oct 2019 13:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sVF4+pvV4UFG/LUyrQsd4XlKxirNPbCNHT9rDa4zs1k=;
 b=Rs4edbTP7QmIPSNZipay6RiwsfBtce1La21LGKQs9jm5C3SAOvjMmQ/koyh7g1fGum
 kc7T396e91V6jPuQB3ekC8FpSrYEYHnK8cBUhNFVu6yF5G26Nl7dyzLxV6BbCEb+r63S
 9Jscy1Y0VUHR5eAA3tlifY/A/9PC1dtdn3rLWuH7p5PURY0lyqf2z6TUL4xGKCRuafU1
 RvHX9iHgzKbX96ZlDgNk0G1JgIFZQa7bOXJcsb+Gsa+l6SGZMReUQ3vG+DPIyInnP6Rj
 hXDG8YnjccpyifmjXu35kKUbXJduxelfgUY1XJI/DwRigZeGUH8ZhA55l4oqFObi3ejf
 LrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sVF4+pvV4UFG/LUyrQsd4XlKxirNPbCNHT9rDa4zs1k=;
 b=JHHMVEkLvkU5EbJD7uW5lpOjBrs/tcA+9luMR/4xsL5csHgex68nuY66oWBWNal4G/
 50aABQMSnmXPo20MVCQm8AOivIsM5yALjlakweN33j1ef52kognF/lkv1T4uFZ+z19z8
 GcroHM+ufqeGFi17j8M0EAv95h7P4gE9hsVr7zze2r54FePH5vOGaDUcMIGD9231N/R2
 zW/1yF2g5VWj/dl2ZhlaUwhCZsRfr8whLR0es93SSsiwXfZ2T43txFkz24GGII3B4W17
 eRGFDqS6pM6fEHoH+07MrhMupw5yg9pBw1b2QPYBThTQxDkicji0V/sjE0HQvnk2tSC/
 oCFA==
X-Gm-Message-State: APjAAAUK0TtRd3ex7Eu6+KkynP+RLk+oQ6mLDeIjDbetu6JdKNdatvmP
 r9qNLVTdeP8ckN+8Ec0ZghRTrNlMUVAh1by9mjI=
X-Google-Smtp-Source: APXvYqwHXa/xhphLSWcznxmnFV3zB1v4Qz+DSb1kLxvP68wGUxqE+Uj+JhBCimyx+s5sxOCvd1gfSL1YlMpLVDrhOUU=
X-Received: by 2002:a19:f11c:: with SMTP id p28mr605317lfh.44.1570567581850;
 Tue, 08 Oct 2019 13:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA-O6b5zc=Qp-49Fc9_tQ+a+Stk6DfnwwzDON+RZfSDSfA@mail.gmail.com>
 <mhng-86e6be44-c5dd-4ecb-bdcb-1f490db0f2cf@palmer-si-x1e>
In-Reply-To: <mhng-86e6be44-c5dd-4ecb-bdcb-1f490db0f2cf@palmer-si-x1e>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 8 Oct 2019 13:41:22 -0700
Message-ID: <CAKmqyKN6byATOyb9MatRsh6LUZ5LXb5yf_wCa+0EQZYa53FuHQ@mail.gmail.com>
Subject: Re: [PATCH] memory: Replace DEBUG_UNASSIGNED printf calls by trace
 events
To: Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::142
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Laurent Desnogues <laurent.desnogues@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 8, 2019 at 1:41 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Fri, 20 Sep 2019 07:20:34 PDT (-0700), Peter Maydell wrote:
> > On Fri, 20 Sep 2019 at 15:17, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >> I think it's simplest if all series (RISC-V, remove unassigned_access,
> >> this one) go through the RISC-V tree.
> >
> > I don't inherently object but IME the risc-v tree tends to move
> > comparatively slowly. The initial risc-v conversion patchset
> > should definitely go via the risc-v tree, anyway.
>
> We still don't have the riscv_cpu_unassigned_access() removal patches in, which
> IIRC got blocked on review but I can no longer dig out of my inbox.  IIRC the
> patches Alistair sent were still "From: Palmer", which means I can't review
> them.

The patches are reviewed by Richard and Philippe, they should be ready to merge.

Alistair

>
> I'm fine taking this on top of those, but it looks like there's still some
> debate about the patch itself.  I don't see a v2.
>

