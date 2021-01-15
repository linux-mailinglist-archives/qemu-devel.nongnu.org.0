Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73E72F6FF5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 02:25:02 +0100 (CET)
Received: from localhost ([::1]:34406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0DrJ-000439-FX
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 20:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0Dnw-0003Nb-Q6
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 20:21:33 -0500
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:46134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0Dnq-0008Km-MU
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 20:21:31 -0500
Received: by mail-io1-xd2f.google.com with SMTP id q2so13531564iow.13
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 17:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ehN0aVDLHZMI0mbOibsH1VJJIgb7jT0JtgVEhwMqP2I=;
 b=ATEKHQJjh13ynJSVyXl4NegOFqm/qtLUWHC7Op8DdjOG24/qA71RfgZe/8zWwP8eO3
 i8fSSjbGcrHGEUrM7CbN0NShSxD61WhPvF1ORqtwpOjvsiG4e2w6DBpZsFazVYIP9wT2
 mOt69dmZ906+Jop5DLVXjAfRgTe0g8AMb4zkIATZXQkrDcV5LH8J7dnI+5pLYKNWDnxv
 HvV92lzQ5eXxRa+6nU6GvrhEBsd+dKKW0Hwf9fnH3Dy/pehoJ7k1XUXnv+nNIRsW4AfT
 fgT5oj0EVv8602IE8jFQaYkJTvWIVrGZ7V009oHs8VgvO7CoWF5A+5V1HtsOYVn2KtKS
 lePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ehN0aVDLHZMI0mbOibsH1VJJIgb7jT0JtgVEhwMqP2I=;
 b=qNY9T6yPN3BYATIZ6s2+98ugybn9ljsPWEvcC1EctG9WqHqxkCdTtLBUeYQ4r2hB+v
 BidSX3pS0pCDTzdgtJHkX0TWwk1LiKlxc0NsmU8z6lQPFkmW8HBFG486l/q+XQHLkl/Q
 /Oh/O5Q/5PkJePl20FeDYidFFc1wGfOZ/FdNKKNEVfILsgOySd9L8PvJSLuBVpMjhwzH
 umcvpwk221Bs4oWRG2WT0dmYh/5+/1iktUYdkeQaF8eriQxaDOUuf1JrZn2Ukipqd7nh
 PlEpq/jqgN4ZfjnvVIp3g+Osvtpb7BxCuHC02g3Btm8h4pCf4KS+PrwcLxLpfjBDOPYE
 Uh5A==
X-Gm-Message-State: AOAM531n6msLLZiqanNXXZEogJcVI3ahWqeNNnTYKqZp0VPsSdrJAN/e
 niworS/Op3goWRRN/1ZOKOAU3TkCqeAK8+y2jeY=
X-Google-Smtp-Source: ABdhPJwjgk3iAaECq7RCGfBgRpHeoLIHKCB/ULOiEHTIFBRyYGDzHt+KZBl2bdpBboAV+K6/iiobgSft6ouMROIhS38=
X-Received: by 2002:a92:cda1:: with SMTP id g1mr9063636ild.267.1610673682020; 
 Thu, 14 Jan 2021 17:21:22 -0800 (PST)
MIME-Version: 1.0
References: <20201218060114.3591217-1-alistair.francis@wdc.com>
 <20201218060114.3591217-23-alistair.francis@wdc.com>
 <CAFEAcA-FF0SC-LSWUxwDdQ_vutYEB=1UMB1nua2BEQm+_E8SdA@mail.gmail.com>
In-Reply-To: <CAFEAcA-FF0SC-LSWUxwDdQ_vutYEB=1UMB1nua2BEQm+_E8SdA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 14 Jan 2021 17:20:55 -0800
Message-ID: <CAKmqyKOAGcobcPzkTrNN5GS9VhJpfmCnuwsA8hAcazhQA2VhkA@mail.gmail.com>
Subject: Re: [PULL 22/23] hw/riscv: Use the CPU to determine if 32-bit
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 10, 2021 at 11:55 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 18 Dec 2020 at 06:01, Alistair Francis <alistair.francis@wdc.com> wrote:
> >
> > Instead of using string compares to determine if a RISC-V machine is
> > using 32-bit or 64-bit CPUs we can use the initalised CPUs. This avoids
> > us having to maintain a list of CPU names to compare against.
> >
> > This commit also fixes the name of the function to match the
> > riscv_cpu_is_32bit() function.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Message-id: 8ab7614e5df93ab5267788b73dcd75f9f5615e82.1608142916.git.alistair.francis@wdc.com
>
> Hi; coverity points out a probably-unintentional inefficiency here
> (CID 1438099, CID 1438100, CID 1438101):
>
> > --- a/hw/riscv/boot.c
> > +++ b/hw/riscv/boot.c
> > @@ -33,28 +33,16 @@
> >
> >  #include <libfdt.h>
> >
> > -bool riscv_is_32_bit(MachineState *machine)
> > +bool riscv_is_32bit(RISCVHartArrayState harts)
>
> The RISCVHartArrayState type is 824 bytes long. That's a very
> big type to be passing by value. You probably wanted to pass a
> pointer to it instead. Similarly for the arguments to
> riscv_calc_kernel_start_addr() and riscv_setup_rom_reset_vec().

Thanks Peter, I'll send a patch.

Alistair

>
> thanks
> -- PMM

