Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA44A70195
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 15:46:27 +0200 (CEST)
Received: from localhost ([::1]:33822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpYe2-0002JK-Pa
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 09:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55972)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mrolnik@gmail.com>) id 1hpYdp-0001oI-Fi
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:46:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1hpYdo-0001HX-GH
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:46:13 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:33985)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1hpYdo-0001HH-Bp
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:46:12 -0400
Received: by mail-qt1-x842.google.com with SMTP id k10so38595884qtq.1
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2019 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ntX9Z4ck9PtCHNv3BAaz0ojT2HHPMVkDQ2rY5jaCaBw=;
 b=gbyNh8SmxrKsW1bPkyQBZOB1ht1h3sR5nTBU0u0XZ4k9+9h1vPIUwbsTeDuS11ezv5
 f3RdTTAE/0v/YbDlWAUhUDAKfgj+mXsyKJAYE7q8AyYlcil8cRJJKKKmkO28VwQPfxaj
 ITtLI+f9vhThUe25LAkjUSuSqAlrR07uCgnGjfo1tk7Qc4tVl4EdRdh88o+P1gDiVKtn
 ZY+//2N1TdCihvMnh8pSWCColvVkO6V9JhUVKwKJOP0xPHeNakPw8T2GGuZoknDoknd9
 VaCPGZQohZ/fLJMcenhjFrI3DiYMjgbbLFlytJ9AuvCnV/mOD9NFCjIpt0cgTQkUt9ED
 1jIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ntX9Z4ck9PtCHNv3BAaz0ojT2HHPMVkDQ2rY5jaCaBw=;
 b=iB1KIuqVm/iBpM8Mhx659hAGjVhjEiJTzBimLYO10aEKCGYK8LGxxQQRAZZmYCDkF+
 GLjVApfJqSC/EZoMxLZNEofPdYtnfTj06ZMuVHKIm75mh1ba1OSTmFXIsJ3bJJSAG6RW
 dVTxyyUmsyQ/ZIl3qlDHCsHU+E7K4efDcEX43I50CmZknhN221fX0c1c0c/WtLFjjpwP
 fTUIP1/9Kt4bZRnchPJ81FaGxP4DLrnpP3v5g4RRCxwqAlxx5rSSfb+Vmwyc541z62Hn
 LztkkCjLxdNF/vdFZPlrXlctcPHo4mj3d3ked3r3r+RFS0jDHmAK+JyOi1eWRf19Q1va
 3iPw==
X-Gm-Message-State: APjAAAVTeaBepMmZLCIqhEDLy4UrfWatIZzEIIyfU9YAVsB1n0jlaYxC
 UkuHSEWFj+7xArDiDsl7/PFANRMUC0Vtb6Esgok=
X-Google-Smtp-Source: APXvYqzTLlnq1wl7DIDOvxMUz+upkI1JbRWpVLkJ/EB/knP5zDDPh97bNiELNii+YsNw0Umn87glJ9Kljl0zYUsmczE=
X-Received: by 2002:ac8:5315:: with SMTP id t21mr50018652qtn.229.1563803171574; 
 Mon, 22 Jul 2019 06:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190719082647.18113-1-mrolnik@gmail.com>
 <20190719082647.18113-9-mrolnik@gmail.com>
 <da64fd46-c0f0-b6b6-3b8f-d3da9041605d@redhat.com>
 <aa9f5be1-3451-7f58-a868-bd31bf2af236@redhat.com>
 <CAK4993ggAtRYDHUe3KpdC8UfSmofNuoeT346inD7_AG45xFMDw@mail.gmail.com>
 <0a74e963-8465-e45e-b5af-6c543c2c7454@redhat.com>
 <CAK4993i6uGJahzxRFGHyBqSzNrfb3Q=kUbQkjcLmTQSVem63dA@mail.gmail.com>
 <CAFEAcA_duMOwnWd+941zLDVEAMTWgz=Ojo5FSfSiLCxUnOZXdA@mail.gmail.com>
In-Reply-To: <CAFEAcA_duMOwnWd+941zLDVEAMTWgz=Ojo5FSfSiLCxUnOZXdA@mail.gmail.com>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Mon, 22 Jul 2019 16:45:35 +0300
Message-ID: <CAK4993gi9sEM-VG8kwbZ203_mpbcB5esuZkytBmRQjTq5okgsg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::842
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH v27 8/8] target/avr: Add tests
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

got it.

On Mon, Jul 22, 2019 at 3:40 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 22 Jul 2019 at 13:33, Michael Rolnik <mrolnik@gmail.com> wrote:
> > I changed it to info_report.
> > raw binaries are totally fine, however if a user supplies a damaged elf
> he
> > will never know if no warning/info is reported.
>
> I find a good rule of thumb for architecture specific/board specific
> code is that if other boards/architectures don't do a particular thing,
> it's usually better to be consistent with the rest of QEMU, rather
> than introducing an innovation.
>
> "Try to load as an ELF file; if that didn't work fall back
> to loading as a raw image" is what other parts of QEMU do,
> and they don't complain about doing it. Otherwise, every
> user of raw images gets a spurious complaint that their
> raw image isn't an ELF file...
>
> thanks
> -- PMM
>


-- 
Best Regards,
Michael Rolnik
