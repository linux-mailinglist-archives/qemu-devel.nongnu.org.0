Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ACF288669
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 11:55:06 +0200 (CEST)
Received: from localhost ([::1]:44664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQp7B-0001MM-HB
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 05:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kQp5e-0000W1-24; Fri, 09 Oct 2020 05:53:30 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:38121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kQp5c-0006vQ-FE; Fri, 09 Oct 2020 05:53:29 -0400
Received: by mail-yb1-xb43.google.com with SMTP id b138so4491095yba.5;
 Fri, 09 Oct 2020 02:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b0E/WK1vMmXZmROGbiNd4mcOr4Ugxgo4UbBiD55Y3Bc=;
 b=RHrjJQLcNtC/0ngMMi+0PIFlatLgFvSL0DK7Zk+FCPF9cVGmcbALjVtxAHUXbGA2wB
 BSTitmO5GJIwIDiiEtAY6gQfXAqQLcEBHFi22sCQc4ZUJWSI9nD6gmmfmZVIOk7VTm37
 NvojjWTw2qPKItJzhp3CjwPq1OtxEGbRcNCqMEFzP/Gs5dS92ES7kUF0MGURRdlJi0Ec
 0QGJQJdiNNkMGV++OEvn0BeOIBvsHDZcigCMZ1vWEIT1ueicDpXvpqyICENBxIIREd9v
 7sHMyEqaVQytKr1YhWP5WLiKyFkerBxUWFC7HPRj8QjoKF9b1I7t0s0lWe29Uyf236a+
 onxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b0E/WK1vMmXZmROGbiNd4mcOr4Ugxgo4UbBiD55Y3Bc=;
 b=iBmRKP169otg7bfUhLoq75PDWRTw4AyX8z9NdwVzrhN9H4uwNJ5MN2sqJkbxdq5LIr
 yXQbwPDvbatb6tENfjwIqs4Y1Hn8wJLOHe5VicAOQXqR31MUNGPTZru50TUuuVvbaH6Z
 +oRMzgDblmda7FMWkdOYN29KX/F7pi86Yy2Z5W5HLxnhVrzg0dNqEZm/qKyoDxQyBdAU
 QS6HyF4zVp5Q+YU7ZGGfSuIvxpVIldnbW9JftVRxzzmiWlJZuuZPajQi+FMBL0GTook/
 tnYZvZuAdq327Pu2s9cpJrPDR3VoM8JRYuz1PCu0ydR+AIucM+f6oyXX0JkPqMGWVEM0
 yUzA==
X-Gm-Message-State: AOAM532QQFYOsPkyMpo2uRKG6VskGaFKUULp9vEBiEA6/jd+fucrl3jl
 Uh7fhate2iYLD8sonMzZjDY8aiK9g1RhLoUSLv4=
X-Google-Smtp-Source: ABdhPJxdSvAGp+8+RDp6YyZDmH3xz8MHlVVq6ZoAoL7EOwIDuzj3UzFtRwoBp/zp1ieNzuoJH5g8ipccDva3DLw7vp0=
X-Received: by 2002:a25:2ac8:: with SMTP id
 q191mr16582156ybq.306.1602237207070; 
 Fri, 09 Oct 2020 02:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1601652616.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1601652616.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 9 Oct 2020 17:53:15 +0800
Message-ID: <CAEUhbmXhFv8m3uFQ8z7XeEcXnTCJLCVokWp5ZQ-C3PDHdXJn1Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Allow loading a no MMU kernel
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b43;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alistair,

On Fri, Oct 2, 2020 at 11:50 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> This series allows loading a noMMU kernel using the -kernel option.
> Currently if using -kernel QEMU assumes you also have firmware and loads
> the kernel at a hardcoded offset. This series changes that so we only
> load the kernel at an offset if a firmware (-bios) was loaded.
>
> This series also adds a function to check if the CPU is 32-bit. This is
> a step towards running 32-bit and 64-bit CPUs on the 64-bit RISC-V build
> by using run time checks instead of compile time checks. We also allow
> the user to sepcify a CPU for the sifive_u machine.

Could you please provide test scenarios for this series? I want to
have a try. Thanks.

>
> Alistair Francis (4):
>   hw/riscv: sifive_u: Allow specifying the CPU
>   hw/riscv: Return the end address of the loaded firmware
>   hw/riscv: Add a riscv_is_32_bit() function
>   hw/riscv: Load the kernel after the firmware
>
>  include/hw/riscv/boot.h     | 11 +++++----
>  include/hw/riscv/sifive_u.h |  1 +
>  hw/riscv/boot.c             | 47 ++++++++++++++++++++++++-------------
>  hw/riscv/opentitan.c        |  3 ++-
>  hw/riscv/sifive_e.c         |  3 ++-
>  hw/riscv/sifive_u.c         | 31 ++++++++++++++++++------
>  hw/riscv/spike.c            | 14 ++++++++---
>  hw/riscv/virt.c             | 14 ++++++++---
>  8 files changed, 89 insertions(+), 35 deletions(-)

Regards,
Bin

