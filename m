Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE173F5186
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 21:47:45 +0200 (CEST)
Received: from localhost ([::1]:38392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIFv6-0002l5-Uz
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 15:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mindentropy@gmail.com>)
 id 1mIFts-00023V-Mh
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:46:28 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933]:41762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mindentropy@gmail.com>)
 id 1mIFtr-00054t-7n
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:46:28 -0400
Received: by mail-ua1-x933.google.com with SMTP id 75so8544920uav.8
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 12:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tnLUlSna3SyURZPY7K+i/k6KxfeTRDcttRvwJNSSAKw=;
 b=bW3mAYFMWP7MrBD03S5t/xfJIrmzhLDdGtlRprTRSwaWdJs2h8QrIHVj1IMMn6vrox
 kzXUs/wL0BktzMm0+hZsxuL01x9KiV9dYH0v1IihmY/gzJqAjuVPANqbDIj34JTvbZiI
 DJrcdpZeAzjyoVI2TWEIQe52XPAuQW9Vd3vQEN/WJDYkXU4G9hX5QRHxXZg7HGuZyPF9
 y2xHR+M9sJEl/Xr2s2BBx9pvDZwp4AhJJk/WjwNMEyTCH1vyN973KoYffUxM1GJPH1xW
 x5cV/KncTmLq9TxvDRtd27O+tV9wX20J647tR6FkXvBhF9fCm5hZ+eZNTz+wbgA2GQgS
 ZCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tnLUlSna3SyURZPY7K+i/k6KxfeTRDcttRvwJNSSAKw=;
 b=l91T1onHJDtiiLVtnOrSDdc/pvkG6ouJdwhX+GNEumTyVpOi5MhrwyOVEYJ31Dbj+V
 7EmV5b5YBqle98chAgKkuG07/C2BXELBg7sykvb7jvyNjwoqy/hsBdWnrr6SCfkugLWA
 8eCrKcH+dXxX9wqI7MmsdFGXNaZahyxmd0MAD3pbADAi7Qo4wsHQBrPSr+cNJsIrfZ/F
 3n0+CmMfUaVTArr00vga8GA06e8bKCChb61sLJh3AxPCCjOiLCE2auJ9J9isYUNJA/84
 p7jgZxORs0QGbSPcRRjZrTOarBF7SzQfNs8waqwOXAzOxO3uoG/zMstjt+wSpOguD49t
 AMKw==
X-Gm-Message-State: AOAM530cfJrP+sP7d1Fpgs2S7rGOR7aM9tVjvTMvTbo4ndCTS1ik3sw1
 m5olcJi4zWpej3BRUT2HTrSA47gwqwQ4sVkOW3I=
X-Google-Smtp-Source: ABdhPJz3JMNTP0ltOLaq04b75ZmoNkxdTKrcbv0E8s2H81mQ/3NJ3Uyfyjgd6xSGplsNPpQFduucq0UTDfh5oThp1E0=
X-Received: by 2002:a05:6102:819:: with SMTP id
 g25mr14460320vsb.23.1629747985539; 
 Mon, 23 Aug 2021 12:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAM2a4uwQ0M=TmFdWaaO-E_2J06fpH1ghXhYJJKBP6s5j90ASLg@mail.gmail.com>
 <CAFEAcA9SeTTcU_p+-KwGJPyYG7pKzSJGGb287tXYOvN13E6-iQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9SeTTcU_p+-KwGJPyYG7pKzSJGGb287tXYOvN13E6-iQ@mail.gmail.com>
From: Gautam Bhat <mindentropy@gmail.com>
Date: Tue, 24 Aug 2021 01:16:14 +0530
Message-ID: <CAM2a4uxO=DaspSeT0LPHTvKuH6crzzQC4_syAf=J+FOE_C_sbw@mail.gmail.com>
Subject: Re: Testing a microcontroller emulation by loading the binary on
 incomplete Flash emulation
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=mindentropy@gmail.com; helo=mail-ua1-x933.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Aug 22, 2021 at 10:18 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 22 Aug 2021 at 15:37, Gautam Bhat <mindentropy@gmail.com> wrote:
> >
> > Hi,
> >
> > I am to implement a very simple microcontroller for my understanding
> > of Qemu development. This microcontroller runs its code from
> > programmable flash which is bit-, byte- and word addressable. To do
> > some initial tests of my nascent microcontroller implementation I
> > would like to load a very simple program binary. Is there a way to
> > load this binary and start execution without emulating Flash
> > controller and memory?
>
> Just create a plain old RAM memory region, and then load the
> guest binary into it with the 'generic loader' (which can
> take an ELF file or a raw binary).
>
> -- PMM

Thanks. I will check it out.

