Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA0762483E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 18:21:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otBDX-00005H-1R; Thu, 10 Nov 2022 12:19:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1otBDV-0008VE-1b
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 12:19:53 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1otBDT-0005CQ-1c
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 12:19:52 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 v4-20020a17090a088400b00212cb0ed97eso2142324pjc.5
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 09:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YCfnkQXm4Y3T6Oa0/8s0s2VLJruSLvpqi4pAAQcleS0=;
 b=kbk6sdKIA+BhRNrAtfrM2Liaoq7mmcQjfgI7xDt6TIT8MHIFLrZZWI57HLI/hW66va
 caJlwuBsYEa2BaRn3cGcqHpFA0uSISXmgJhs8jrbgvU/EJBMUVtVNitpkad5g2MxQjIQ
 Yos+ibO9vPKbrICJ6weKu4ai92bOjJT909vqQhyQrXFdcmDtHA6v663mJf59ITGTQtha
 9BiSt+3qhHyIq9l5Ms2/o0U7NiCFneoEA69s4AGzrZ4qLZRkApKCFLZa7w5Q61KAPQ5I
 pmfCl+lvScKjLDVS9SrjvvlNvHM/1tg2QgqCnQrULqCDqZ5l+84gzA2jqnazmjZM//ai
 PmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YCfnkQXm4Y3T6Oa0/8s0s2VLJruSLvpqi4pAAQcleS0=;
 b=YoM5P6XGwJKfKLvGNQloDaMZ0ZHG0YUGfBwLhZOapfXzOSgzf/TTpUUZ8Hy6A92Kom
 CQ1MZxyVYG2VYiHYGJKTgMxEQtmVOaLPo43jk/bja5/CWWKGvoTVC0bY2ZpAJk55Waro
 vUla4GtieMZbvfEB/WS9LuMwkaAwpRuthpLdq+NuLhnJSur+GAOq5g2jVaoz+AbvYN5z
 lG3e0fuA1daPCfuK3jb3/fqvmx8NP4er9mAQTcS2A8g2oHamW58mx3hVNgvyAiPkZFWL
 2NNUC+OEXnUZLWD/L+NJddhuCsRzDJwGOH5tYTyJopi7AL1/D6gxQtLiO58VXZjxXvIN
 PGeA==
X-Gm-Message-State: ACrzQf0Jd4UP4CZRb/D00TosFklTYcX79/S8eHdQxh87ZqCEWP4/oLB3
 xqW6xalAaSXwwE70xkeiWOghVq4wnG0LO9w0Ps3Kyg==
X-Google-Smtp-Source: AMsMyM4JGRfu3WMID0lGKYA6MRsSPjiFZzHilzZXIXQIhdWbcr5KqK/VnT8GZyeJ28TYlq/FH8RCvR5vNI70JqegUlA=
X-Received: by 2002:a17:90b:f06:b0:212:cb07:fb82 with SMTP id
 br6-20020a17090b0f0600b00212cb07fb82mr82103302pjb.221.1668100789513; Thu, 10
 Nov 2022 09:19:49 -0800 (PST)
MIME-Version: 1.0
References: <20221108023542.17557-1-schspa@gmail.com>
 <87fsetg5xh.fsf@linaro.org>
 <CAMA88Tqt-7rCTC38OhZGmCZyO4rFz+HHBNtDjaVCbhna01yScQ@mail.gmail.com>
 <CAFEAcA8J2Tx4gW5Y2q6qtkJ0BPpM4iWkt3nz0uezV+kiz6m_Ag@mail.gmail.com>
 <CAFEAcA8KnNE90tHQjRNEVny=s7YLD5Wmff9R8ZyLxxz47bwRGA@mail.gmail.com>
 <875yfpbg38.fsf@gmail.com>
In-Reply-To: <875yfpbg38.fsf@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Nov 2022 17:19:38 +0000
Message-ID: <CAFEAcA_5_78qUNFdgpYGnS0tS3QWD4cJokJCzMC6Tq270bYbJg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
To: Schspa Shi <schspa@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 8 Nov 2022 at 15:50, Schspa Shi <schspa@gmail.com> wrote:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 8 Nov 2022 at 13:54, Peter Maydell <peter.maydell@linaro.org> wrote:
> >>
> >> On Tue, 8 Nov 2022 at 12:52, Schspa Shi <schspa@gmail.com> wrote:
> >> > I think this lowmem does not mean below 4GB. and it is to make sure
> >> > the initrd_start > memblock_start_of_DRAM for Linux address range check.
> >>
> >> The wording of this comment pre-dates 64-bit CPU support: it
> >> is talking about the requirement in the 32-bit booting doc
> >> https://www.kernel.org/doc/Documentation/arm/Booting
> >> that says
> >> "If an initramfs is in use then, as with the dtb, it must be placed in
> >> a region of memory where the kernel decompressor will not overwrite it
> >> while also with the region which will be covered by the kernel's
> >> low-memory mapping."
> >>
> >> So it does mean "below 4GB", because you can't boot a 32-bit kernel
> >> if you don't put the kernel, initrd, etc below 4GB.
> >
> > A kernel person corrects me on the meaning of "lowmem" here -- the
> > kernel means by it "within the first 768MB of RAM". There is also
> > an implicit requirement that everything be within the bottom 32-bits
> > of the physical address space.
> >
>
> Thanks for your comment.
>
> In this view, initrd shouldn't be placed higher than 4GB ? But it
> seems the Linux kernel can boot when there is no memory below 4GB.

A *32 bit* kernel cannot -- it is completely unable to access
anything above the 4GB mark when the MMU is off, as it is on
initial boot. This QEMU code handles both 32 bit and 64 bit
kernel boot. These days of course there is 64-bit only hardware,
and that might choose to put its RAM above the 4GB mark,
because it isn't ever going to boot a 32-bit kernel anyway.

thanks
-- PMM

