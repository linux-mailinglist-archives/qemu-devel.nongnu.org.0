Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3A8E3605
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 16:54:57 +0200 (CEST)
Received: from localhost ([::1]:44748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNeVs-0002M2-C7
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 10:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56663)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iNd5j-0006Jk-36
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 09:23:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iNd5h-0006DR-Ly
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 09:23:50 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:35691)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iNd5h-0006Cl-CN
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 09:23:49 -0400
Received: by mail-oi1-x244.google.com with SMTP id x3so20598196oig.2
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 06:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WPooH9e56nUP3fQYMc9LZIHEV2Orw7XoLKLkOxq68DE=;
 b=GiBkPS7kcX+X9TwT/9y2g8Zda25S/HdUZSj6gepim/wAhyN11ZdXJA/U9ccCiHWVRt
 0nOg4mJ60KYf10tBTdoXGdPDQfSso6NF4YJ3peVdMGltzZrn3ftIr6LRCWOsVcCK2SQv
 R7mwb3yLUU6Sdfi85d6tu9yNgbo5zKOAGF10qSjkcAK3IJmwapLu8eLSo+X5ACxCHILt
 RmzHTgCourE5C7nGvVajPDmn/fbzqzEdXjfUOt0CNG9XzHGh7dtNegWJvwC8Q0FsepiV
 lIQg41tKY6nQBnDlj+C62gfN39lne6FOGryvQY98Ajf4wfkuuTHPT4tYgn//q0CIFzPI
 bdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WPooH9e56nUP3fQYMc9LZIHEV2Orw7XoLKLkOxq68DE=;
 b=APyMpocRNLiUUddBpMV67LdgqDj5VOMZymx8+VDxku8VL/lCqOq5TzG8IbTFBMZnsY
 fvUaOcRzHzpSSZvYQMglaAbrVXppUASx/VvlexczaLaKedtvKpJaLHN1/fQJoxt0j+zk
 M8XJQ6lHa38BYo9H/RXjtVDa7qxllHlkAzgUmZirx5SEqVAWAIOZD5VIRq68sZgyeUCr
 cTMjfudWTcr09b6U3sXwIfvmgHnuajhWann47f4rBwh5jAzbrpfCr4BsCgnb/MeinK/T
 w7jta29ApvmhUQJGvFV72JmvyyfZDEqfnYcW8AALICTcLeWYgNsC2ZfOGb3LYASrfXDn
 DNPQ==
X-Gm-Message-State: APjAAAWm0vGSeqJVBMMyGjK6zsqnC8eT/A2qqgbqfO4tBRCtUUKFm2WC
 YJTyGMaHrJmAht5/9FYmBnjpfbhUS9IDjwyBI8s/Dw==
X-Google-Smtp-Source: APXvYqxJqTuBdpjrMk3AJnspkoMGZ1GlFudrEdx6BZysHL4fDILoUUNJRku1i4DWu6Gz/8qYaBYxzJZSyrdgTLD41cg=
X-Received: by 2002:a05:6808:9:: with SMTP id u9mr4707985oic.98.1571923427960; 
 Thu, 24 Oct 2019 06:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191019234715.25750-1-f4bug@amsat.org>
 <20191019234715.25750-12-f4bug@amsat.org>
In-Reply-To: <20191019234715.25750-12-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Oct 2019 14:23:36 +0100
Message-ID: <CAFEAcA_w1zW4ewY-ts=yJbKFNRVhOjXuAtj9_0rt4EvD3qkm3Q@mail.gmail.com>
Subject: Re: [PATCH v3 11/16] hw/arm/raspi: Use -smp cores=<N> option to
 restrict enabled cores
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Rob Herring <robh@kernel.org>, Matthias Brugger <mbrugger@suse.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, "Emilio G . Cota" <cota@braap.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 qemu-arm <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Pete Batard <pete@akeo.ie>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 20 Oct 2019 at 00:47, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The abstract TYPE_BCM283X device provides a 'enabled-cpus' property
> to restrict the number of cores powered on reset. This because on
> real hardware the GPU is responsible of starting the cores and keep
> them spinning until the Linux kernel is ready to use them.
> When using the -kernel paramenter, QEMU does this by installing the
> 'raspi_smpboot' code when arm_boot_info::write_board_setup() is
> called. This is a special feature to help the Linux kernel, and can
> only be used with a Linux kernel.
>
> Even if loaded with the -kernel option, U-boot is not Linux, thus
> is not recognized as it and the raspi_smpboot code is not installed.
>
> Upon introduction of this machine in commit 1df7d1f9303, the -smp <N>
> option allowd to limit the number of cores powered on reset.
> Unfortunately later commit 72649619341 added a check which made this
> feature unusable:
>
>   $ qemu-system-aarch64 -M raspi3 -smp 1
>   qemu-system-aarch64: Invalid SMP CPUs 1. The min CPUs supported by mach=
ine 'raspi3' is 4
>
> Fortunately, the -smp option allow various kind of CPU topology:
>
>   -smp [cpus=3D]n[,maxcpus=3Dcpus][,cores=3Dcores][,threads=3Dthreads][,d=
ies=3Ddies][,sockets=3Dsockets]
>            set the number of CPUs to 'n' [default=3D1]
>            maxcpus=3D maximum number of total cpus, including
>            offline CPUs for hotplug, etc
>            cores=3D number of CPU cores on one socket (for PC, it's on on=
e die)
>            threads=3D number of threads on one CPU core
>            dies=3D number of CPU dies on one socket (for PC only)
>            sockets=3D number of discrete sockets in the system
>
> Let's use the 'cores' argument to specify the number of cores powered
> at reset to restore this feature, and allow to boot U-boot.

From the help message quoted, 'cores' is about NUMA topology,
it's nothing to do with "how many cores do we have powerd on
on reset". We should definitely not be borrowing it for
an unrelated purpose.

> We can now run U-boot using:
>
>   $ qemu-system-aarch64 -M raspi3 -smp 4,cores=3D1 ...

Either:
 (a) we need to support "act like the firmware/GPU" for
booting guest binaries on this board, in the same way that our PSCI
support is effectively emulating firmware-level facilities
 (b) the u-boot binary should be provided to QEMU in the
right image format to use the kernel boot ABI
 (c) u-boot could be wrapped in a small guest binary that
deals with handling all the secondary cores

I'm not really a huge fan of (a) because we already have a
huge pile of random weird ways of loading guest images
that are undocumented, behave differently from board to
board or architecture to architecture, etc. I'm not too
keen on making that swamp worse, even though there's an
argument that the right UI for a raspi board model is to
provide the same "load an ELF file" handling that the real
hardware does for ELF files via the GPU/firmware combo.

thanks
-- PMM

