Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C256615BE82
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 13:36:10 +0100 (CET)
Received: from localhost ([::1]:51516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2Diz-0006mC-SF
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 07:36:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40621)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1j2Ddl-0006sM-98
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 07:30:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1j2Ddj-0006od-SW
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 07:30:45 -0500
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44]:36915)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1j2Ddj-0006nK-NK; Thu, 13 Feb 2020 07:30:43 -0500
Received: by mail-yw1-xc44.google.com with SMTP id l5so2502873ywd.4;
 Thu, 13 Feb 2020 04:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fpTaUf8q+PPxyFmXzrg+tjSsNXG8nNZhHyqmFn4KNbw=;
 b=c7YEMxro7WI9INakdYK0VP44w6y0MZ3LJ2TlpO3bWenRKdAOPmbPggZL96TjoIQqHs
 oBIBuBtONXaER9HfiY9rSUrPWvSyre5cNIo0E6ITXDI5zjYckxHIW2RvNKb7+MtRvMnn
 yiX+JP43roE+R22Nd52USLZ7Xu2WO2w0Fb9XY4LwgCcgbF/PjrFR4znzBHC8+czUOusv
 AFTHBGoWEIq481yGDKluLi8kiCM/MSXpafJNV8E3OG4zosCT0Bzjc4zgT3xOAsmVXvKy
 gpDNM71lzl0iCxaUVB93MvCswXxiI5tovcrNttnDvm5x2iHvNIMrIN4XcNmnry77J8Fa
 w0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fpTaUf8q+PPxyFmXzrg+tjSsNXG8nNZhHyqmFn4KNbw=;
 b=lKCvtkkV4Roko3hXBxrP5xf+5T9j5x8t1nAUF/bDq9Z7SMTvB8VT9O0qqfgOSSkuZ6
 Gi3eZ4mfE4uF6waJ9qPmMsIEsKUc0kC0hYv1OZa4RKqoL4TDANYqjciVW1uq02ygEFzQ
 hzvxLFkt3ZP0q7Xa3r6WKs5cC4oDbvK/CllddCrn7Xz7gmfmrOcn3LAi2Ab/+LhbCQZB
 jgis/U5oKLmPhYWvYu6AyruG/wtsCPTmtcGQ7X5FP6/bR4LiXOQQugcEmiJ0h3feseHc
 CEf0Gxem9Ffl9aZ3FZ64SCpsK5S7Xt4OrDknTyBLGpllaKzCUD6pEH6fF1x/eMFBBKuF
 V21Q==
X-Gm-Message-State: APjAAAV+7/v7mUWhpYQp50R0Kx6Spvu9iKw2xCvi7FdkmOK5153CA3EW
 cjPkH7h5IBqJMqJd1V79PEw5hUj9mZZTL/ah9DU=
X-Google-Smtp-Source: APXvYqyBycb4QemjbfWjCs8fItbMDPnlVSpEelaax7mOX0mrlamaciPsdYmMNCtQssUmdBmJqQ/8e6ysxaXYc0KZYyM=
X-Received: by 2002:a0d:eb0d:: with SMTP id u13mr2898570ywe.257.1581597042884; 
 Thu, 13 Feb 2020 04:30:42 -0800 (PST)
MIME-Version: 1.0
References: <20200212172921.36796-1-palmerdabbelt@google.com>
In-Reply-To: <20200212172921.36796-1-palmerdabbelt@google.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 13 Feb 2020 20:30:32 +0800
Message-ID: <CAEUhbmVBJvHGhQBVX5=TjMtL-+KKE=4L7LVS5GnFotLh85uBcg@mail.gmail.com>
Subject: Re: [PULL] RISC-V Patches for the 5.0 Soft Freeze, Part 2
To: Palmer Dabbelt <palmerdabbelt@google.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c44
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Palmer,

On Thu, Feb 13, 2020 at 1:30 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> The following changes since commit 81a23caf47956778c5a5056ad656d1ef92bf9659:
>
>   Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging (2020-02-10 17:08:51 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:palmer-dabbelt/qemu.git tags/riscv-for-master-5.0-sf2
>
> for you to fetch changes up to 9c8fdcece53e05590441785ab22d91a22da36e29:
>
>   MAINTAINERS: Add maintainer entry for Goldfish RTC (2020-02-10 12:01:39 -0800)
>
> ----------------------------------------------------------------
> RISC-V Patches for the 5.0 Soft Freeze, Part 2
>
> This is a fairly light-weight pull request, but I wanted to send it out to
> avoid the Goldfish stuff getting buried as the next PR should contain the H
> extension implementation.
>
> As far as this PR goes, it contains:
>
> * The addition of syscon device tree nodes for reboot and poweroff, which
>   allows Linux to control QEMU without an additional driver.  The existing
>   device was already compatible with the syscon interface.
> * A fix to our GDB stub to avoid confusing XLEN and FLEN, specifically useful
>   for rv32id-based systems.
> * A device emulation for the Goldfish RTC device, a simple memory-mapped RTC.
> * The addition of the Goldfish RTC device to the RISC-V virt board.
>
> This passes "make check" and boots buildroot for me.
>

This PR is still missing: http://patchwork.ozlabs.org/patch/1199516/

> ----------------------------------------------------------------
>
> Peter: I'm sending hw/rtc code because it was suggested that the Goldfish
> implementation gets handled via the RISC-V tree as our virt board is the only
> user.  I'm happy to do things differently in the future (maybe send
> goldfish-specific PRs?) if that's better for you.  Just LMK what makes sense, I
> anticipate that this'll be a pretty low traffic device so I'm fine with pretty
> much anything.
>

Regards,
Bin

