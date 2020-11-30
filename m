Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4D82C8F88
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 21:59:24 +0100 (CET)
Received: from localhost ([::1]:49266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjqGZ-0006bH-LE
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 15:59:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lfy@google.com>) id 1kjqDd-0005DT-FI
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 15:56:21 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:34323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lfy@google.com>) id 1kjqDT-00058y-4F
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 15:56:20 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id e81so12736244ybc.1
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 12:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1i73u0pd1ncpEhNV73Cw+54UqqxfR4kasZ9KJ3bPdr4=;
 b=Ukmb3IroeFEX4yxY3NH6s9DlrL710btxvMV1zYTbo4Ss66b1QTGKHfxPnJ6/GAN/QH
 /jMj9FN6plFpFdNJJUzXCPLQO9VTvKCbSGWCN7anorwriRILDj9Q+Cbr0JE5iNh6SLjM
 DnBqJZxf/l4mCqW897MY6ju7fS3Aiqoiush4hdjF46xynfbEscjKMF5RHk87BGw/NoEc
 a3OLt+/9n+Zj7RbTkYTcx8+ifZQHmWawmP0gLU/0v2re4MNDlh4JEoFQz4ihGoLojYa6
 xayhrZVlGKcNFL4xcbDXMnkBCdo7TwuRrIU5CVbGMuLeJ05sfrYd4sXdG2eosxzzBXLq
 W51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1i73u0pd1ncpEhNV73Cw+54UqqxfR4kasZ9KJ3bPdr4=;
 b=JjjBzohJHZkZIvnjN9uBXBJiTe2FLtDlK0Vz5zHpHAbLe/FynRrr7TZpaJX2t8GsPX
 9ax30pNImO441xbfXWO6JRXDupdYYrm5/WSs6rDU+r3ZJgFCgOJrrLBxU9IuehVM0sm9
 xN/llCyz4ap67KIExLBiELSSe1BLw6qu5FTFn1qXnQPoLej65mZTOSLhAE8siXg4k1TN
 ECoj7fz6A9IfaKcjg/WZC60TciYlRnrqlcKhlZyrSZJELv+22kt7Ip4QmMPzSxH/uCbO
 oi10QdPDoYVtz/YmR0iVMZI/xFvzV9l+XEldv8GjVnvaYajPhEJcilJyw/w7g6+8cfp8
 ItaA==
X-Gm-Message-State: AOAM532UpBwmS8wi8eVd0kKNddxV2mk8OFZunw+R56ggyogkZYc8sOs+
 Z+Cxcpd1n0dv/55xKUbZPYcvdUDYu42JApybrahZGw==
X-Google-Smtp-Source: ABdhPJz/LKxbPBBTZMyLKCGzDsd4uGqDExrkyZe8aByrKeUA1knxxS1JHR6VgFlRyj7VCHJNZzRAXJCNI+JxztIzWIA=
X-Received: by 2002:a25:c6d5:: with SMTP id
 k204mr18403480ybf.363.1606769769392; 
 Mon, 30 Nov 2020 12:56:09 -0800 (PST)
MIME-Version: 1.0
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-3-agraf@csgraf.de>
 <20201127200054.GC56950@SPB-NB-133.local>
 <392c2465-157e-e15a-0a2c-2e3faa166d22@csgraf.de>
 <CAEkmjvUArgL+Mcvy6nUhfJrdX3OaF=U8UdWia7ZDo9GWk0VF=g@mail.gmail.com>
 <CAEkmjvVJ5zup4NR2+DStt_NvV2cV7+7dj2=fJ3DQBkth8pAfcw@mail.gmail.com>
 <cecd20d0-278b-0a4b-ba9c-0207504c99d7@csgraf.de>
In-Reply-To: <cecd20d0-278b-0a4b-ba9c-0207504c99d7@csgraf.de>
From: Frank Yang <lfy@google.com>
Date: Mon, 30 Nov 2020 12:55:57 -0800
Message-ID: <CAEkmjvVOAYP6wJyVpAtZE3d=iNOOWGZeHptQ9xJDGcTi4qQ0hQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] hvf: Move common code out
To: Alexander Graf <agraf@csgraf.de>
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, 
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Collingbourne <pcc@google.com>
Content-Type: multipart/alternative; boundary="000000000000579c1d05b5593d8e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=lfy@google.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000579c1d05b5593d8e
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 30, 2020 at 12:34 PM Alexander Graf <agraf@csgraf.de> wrote:

> Hi Frank,
>
> Thanks for the update :). Your previous email nudged me into the right
> direction. I previously had implemented WFI through the internal timer
> framework which performed way worse.
>
Cool, glad it's helping. Also, Peter found out that the main thing keeping
us from just using cntpct_el0 on the host directly and compare with cval is
that if we sleep, cval is going to be much < cntpct_el0 by the sleep time.
If we can get either the architecture or macos to read out the sleep time
then we might be able to not have to use a poll interval either!

> Along the way, I stumbled over a few issues though. For starters, the
> signal mask for SIG_IPI was not set correctly, so while pselect() would
> exit, the signal would never get delivered to the thread! For a fix, check
> out
>
>
> https://patchew.org/QEMU/20201130030723.78326-1-agraf@csgraf.de/20201130030723.78326-4-agraf@csgraf.de/
>
>
Thanks, we'll take a look :)


> Please also have a look at my latest stab at WFI emulation. It doesn't
> handle WFE (that's only relevant in overcommitted scenarios). But it does
> handle WFI and even does something similar to hlt polling, albeit not with
> an adaptive threshold.
>
> Also, is there a particular reason you're working on this super
> interesting and useful code in a random downstream fork of QEMU? Wouldn't
> it be more helpful to contribute to the upstream code base instead?
>
We'd actually like to contribute upstream too :) We do want to maintain our
own downstream though; Android Emulator codebase needs to work solidly on
macos and windows which has made keeping up with upstream difficult, and
staying on a previous version (2.12) with known quirks easier. (theres also
some android related customization relating to Qt Ui + different set of
virtual devices and snapshot support (incl. snapshots of graphics devices
with OpenGLES state tracking), which we hope to separate into other
libraries/processes, but its not insignificant)

>
> Alex
>
> On 30.11.20 21:15, Frank Yang wrote:
>
> Update: We're not quite sure how to compare the CNTV_CVAL and CNTVCT. But
> the high CPU usage seems to be mitigated by having a poll interval (like
> KVM does) in handling WFI:
>
> https://android-review.googlesource.com/c/platform/external/qemu/+/1512501
>
> This is loosely inspired by
> https://elixir.bootlin.com/linux/v5.10-rc6/source/virt/kvm/kvm_main.c#L2766
> which does seem to specify a poll interval.
>
> It would be cool if we could have a lightweight way to enter sleep and
> restart the vcpus precisely when CVAL passes, though.
>
> Frank
>
>
> On Fri, Nov 27, 2020 at 3:30 PM Frank Yang <lfy@google.com> wrote:
>
>> Hi all,
>>
>> +Peter Collingbourne <pcc@google.com>
>>
>> I'm a developer on the Android Emulator, which is in a fork of QEMU.
>>
>> Peter and I have been working on an HVF Apple Silicon backend with an eye
>> toward Android guests.
>>
>> We have gotten things to basically switch to Android userspace already
>> (logcat/shell and graphics available at least)
>>
>> Our strategy so far has been to import logic from the KVM implementation
>> and hook into QEMU's software devices that previously assumed to only work
>> with TCG, or have KVM-specific paths.
>>
>> Thanks to Alexander for the tip on the 36-bit address space limitation
>> btw; our way of addressing this is to still allow highmem but not put pci
>> high mmio so high.
>>
>> Also, note we have a sleep/signal based mechanism to deal with WFx, which
>> might be worth looking into in Alexander's implementation as well:
>>
>> https://android-review.googlesource.com/c/platform/external/qemu/+/1512551
>>
>> Patches so far, FYI:
>>
>>
>> https://android-review.googlesource.com/c/platform/external/qemu/+/1513429/1
>>
>> https://android-review.googlesource.com/c/platform/external/qemu/+/1512554/3
>>
>> https://android-review.googlesource.com/c/platform/external/qemu/+/1512553/3
>>
>> https://android-review.googlesource.com/c/platform/external/qemu/+/1512552/3
>>
>> https://android-review.googlesource.com/c/platform/external/qemu/+/1512551/3
>>
>>
>> https://android.googlesource.com/platform/external/qemu/+/c17eb6a3ffd50047e9646aff6640b710cb8ff48a
>>
>> https://android.googlesource.com/platform/external/qemu/+/74bed16de1afb41b7a7ab8da1d1861226c9db63b
>>
>> https://android.googlesource.com/platform/external/qemu/+/eccd9e47ab2ccb9003455e3bb721f57f9ebc3c01
>>
>> https://android.googlesource.com/platform/external/qemu/+/54fe3d67ed4698e85826537a4f49b2b9074b2228
>>
>> https://android.googlesource.com/platform/external/qemu/+/82ef91a6fede1d1000f36be037ad4d58fbe0d102
>>
>> https://android.googlesource.com/platform/external/qemu/+/c28147aa7c74d98b858e99623d2fe46e74a379f6
>>
>> Peter's also noticed that there are extra steps needed for M1's to allow
>> TCG to work, as it involves JIT:
>>
>>
>> https://android.googlesource.com/platform/external/qemu/+/740e3fe47f88926c6bda9abb22ee6eae1bc254a9
>>
>> We'd appreciate any feedback/comments :)
>>
>> Best,
>>
>> Frank
>>
>> On Fri, Nov 27, 2020 at 1:57 PM Alexander Graf <agraf@csgraf.de> wrote:
>>
>>>
>>> On 27.11.20 21:00, Roman Bolshakov wrote:
>>> > On Thu, Nov 26, 2020 at 10:50:11PM +0100, Alexander Graf wrote:
>>> >> Until now, Hypervisor.framework has only been available on x86_64
>>> systems.
>>> >> With Apple Silicon shipping now, it extends its reach to aarch64. To
>>> >> prepare for support for multiple architectures, let's move common
>>> code out
>>> >> into its own accel directory.
>>> >>
>>> >> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>> >> ---
>>> >>   MAINTAINERS                 |   9 +-
>>> >>   accel/hvf/hvf-all.c         |  56 +++++
>>> >>   accel/hvf/hvf-cpus.c        | 468
>>> ++++++++++++++++++++++++++++++++++++
>>> >>   accel/hvf/meson.build       |   7 +
>>> >>   accel/meson.build           |   1 +
>>> >>   include/sysemu/hvf_int.h    |  69 ++++++
>>> >>   target/i386/hvf/hvf-cpus.c  | 131 ----------
>>> >>   target/i386/hvf/hvf-cpus.h  |  25 --
>>> >>   target/i386/hvf/hvf-i386.h  |  48 +---
>>> >>   target/i386/hvf/hvf.c       | 360 +--------------------------
>>> >>   target/i386/hvf/meson.build |   1 -
>>> >>   target/i386/hvf/x86hvf.c    |  11 +-
>>> >>   target/i386/hvf/x86hvf.h    |   2 -
>>> >>   13 files changed, 619 insertions(+), 569 deletions(-)
>>> >>   create mode 100644 accel/hvf/hvf-all.c
>>> >>   create mode 100644 accel/hvf/hvf-cpus.c
>>> >>   create mode 100644 accel/hvf/meson.build
>>> >>   create mode 100644 include/sysemu/hvf_int.h
>>> >>   delete mode 100644 target/i386/hvf/hvf-cpus.c
>>> >>   delete mode 100644 target/i386/hvf/hvf-cpus.h
>>> >>
>>> >> diff --git a/MAINTAINERS b/MAINTAINERS
>>> >> index 68bc160f41..ca4b6d9279 100644
>>> >> --- a/MAINTAINERS
>>> >> +++ b/MAINTAINERS
>>> >> @@ -444,9 +444,16 @@ M: Cameron Esfahani <dirty@apple.com>
>>> >>   M: Roman Bolshakov <r.bolshakov@yadro.com>
>>> >>   W: https://wiki.qemu.org/Features/HVF
>>> >>   S: Maintained
>>> >> -F: accel/stubs/hvf-stub.c
>>> > There was a patch for that in the RFC series from Claudio.
>>>
>>>
>>> Yeah, I'm not worried about this hunk :).
>>>
>>>
>>> >
>>> >>   F: target/i386/hvf/
>>> >> +
>>> >> +HVF
>>> >> +M: Cameron Esfahani <dirty@apple.com>
>>> >> +M: Roman Bolshakov <r.bolshakov@yadro.com>
>>> >> +W: https://wiki.qemu.org/Features/HVF
>>> >> +S: Maintained
>>> >> +F: accel/hvf/
>>> >>   F: include/sysemu/hvf.h
>>> >> +F: include/sysemu/hvf_int.h
>>> >>
>>> >>   WHPX CPUs
>>> >>   M: Sunil Muthuswamy <sunilmut@microsoft.com>
>>> >> diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
>>> >> new file mode 100644
>>> >> index 0000000000..47d77a472a
>>> >> --- /dev/null
>>> >> +++ b/accel/hvf/hvf-all.c
>>> >> @@ -0,0 +1,56 @@
>>> >> +/*
>>> >> + * QEMU Hypervisor.framework support
>>> >> + *
>>> >> + * This work is licensed under the terms of the GNU GPL, version 2.
>>> See
>>> >> + * the COPYING file in the top-level directory.
>>> >> + *
>>> >> + * Contributions after 2012-01-13 are licensed under the terms of the
>>> >> + * GNU GPL, version 2 or (at your option) any later version.
>>> >> + */
>>> >> +
>>> >> +#include "qemu/osdep.h"
>>> >> +#include "qemu-common.h"
>>> >> +#include "qemu/error-report.h"
>>> >> +#include "sysemu/hvf.h"
>>> >> +#include "sysemu/hvf_int.h"
>>> >> +#include "sysemu/runstate.h"
>>> >> +
>>> >> +#include "qemu/main-loop.h"
>>> >> +#include "sysemu/accel.h"
>>> >> +
>>> >> +#include <Hypervisor/Hypervisor.h>
>>> >> +
>>> >> +bool hvf_allowed;
>>> >> +HVFState *hvf_state;
>>> >> +
>>> >> +void assert_hvf_ok(hv_return_t ret)
>>> >> +{
>>> >> +    if (ret == HV_SUCCESS) {
>>> >> +        return;
>>> >> +    }
>>> >> +
>>> >> +    switch (ret) {
>>> >> +    case HV_ERROR:
>>> >> +        error_report("Error: HV_ERROR");
>>> >> +        break;
>>> >> +    case HV_BUSY:
>>> >> +        error_report("Error: HV_BUSY");
>>> >> +        break;
>>> >> +    case HV_BAD_ARGUMENT:
>>> >> +        error_report("Error: HV_BAD_ARGUMENT");
>>> >> +        break;
>>> >> +    case HV_NO_RESOURCES:
>>> >> +        error_report("Error: HV_NO_RESOURCES");
>>> >> +        break;
>>> >> +    case HV_NO_DEVICE:
>>> >> +        error_report("Error: HV_NO_DEVICE");
>>> >> +        break;
>>> >> +    case HV_UNSUPPORTED:
>>> >> +        error_report("Error: HV_UNSUPPORTED");
>>> >> +        break;
>>> >> +    default:
>>> >> +        error_report("Unknown Error");
>>> >> +    }
>>> >> +
>>> >> +    abort();
>>> >> +}
>>> >> diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
>>> >> new file mode 100644
>>> >> index 0000000000..f9bb5502b7
>>> >> --- /dev/null
>>> >> +++ b/accel/hvf/hvf-cpus.c
>>> >> @@ -0,0 +1,468 @@
>>> >> +/*
>>> >> + * Copyright 2008 IBM Corporation
>>> >> + *           2008 Red Hat, Inc.
>>> >> + * Copyright 2011 Intel Corporation
>>> >> + * Copyright 2016 Veertu, Inc.
>>> >> + * Copyright 2017 The Android Open Source Project
>>> >> + *
>>> >> + * QEMU Hypervisor.framework support
>>> >> + *
>>> >> + * This program is free software; you can redistribute it and/or
>>> >> + * modify it under the terms of version 2 of the GNU General Public
>>> >> + * License as published by the Free Software Foundation.
>>> >> + *
>>> >> + * This program is distributed in the hope that it will be useful,
>>> >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>>> >> + * General Public License for more details.
>>> >> + *
>>> >> + * You should have received a copy of the GNU General Public License
>>> >> + * along with this program; if not, see <
>>> http://www.gnu.org/licenses/>.
>>> >> + *
>>> >> + * This file contain code under public domain from the hvdos project:
>>> >> + * https://github.com/mist64/hvdos
>>> >> + *
>>> >> + * Parts Copyright (c) 2011 NetApp, Inc.
>>> >> + * All rights reserved.
>>> >> + *
>>> >> + * Redistribution and use in source and binary forms, with or without
>>> >> + * modification, are permitted provided that the following conditions
>>> >> + * are met:
>>> >> + * 1. Redistributions of source code must retain the above copyright
>>> >> + *    notice, this list of conditions and the following disclaimer.
>>> >> + * 2. Redistributions in binary form must reproduce the above
>>> copyright
>>> >> + *    notice, this list of conditions and the following disclaimer
>>> in the
>>> >> + *    documentation and/or other materials provided with the
>>> distribution.
>>> >> + *
>>> >> + * THIS SOFTWARE IS PROVIDED BY NETAPP, INC ``AS IS'' AND
>>> >> + * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
>>> THE
>>> >> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
>>> PARTICULAR PURPOSE
>>> >> + * ARE DISCLAIMED.  IN NO EVENT SHALL NETAPP, INC OR CONTRIBUTORS BE
>>> LIABLE
>>> >> + * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
>>> CONSEQUENTIAL
>>> >> + * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
>>> GOODS
>>> >> + * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
>>> INTERRUPTION)
>>> >> + * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
>>> CONTRACT, STRICT
>>> >> + * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
>>> ANY WAY
>>> >> + * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
>>> POSSIBILITY OF
>>> >> + * SUCH DAMAGE.
>>> >> + */
>>> >> +
>>> >> +#include "qemu/osdep.h"
>>> >> +#include "qemu/error-report.h"
>>> >> +#include "qemu/main-loop.h"
>>> >> +#include "exec/address-spaces.h"
>>> >> +#include "exec/exec-all.h"
>>> >> +#include "sysemu/cpus.h"
>>> >> +#include "sysemu/hvf.h"
>>> >> +#include "sysemu/hvf_int.h"
>>> >> +#include "sysemu/runstate.h"
>>> >> +#include "qemu/guest-random.h"
>>> >> +
>>> >> +#include <Hypervisor/Hypervisor.h>
>>> >> +
>>> >> +/* Memory slots */
>>> >> +
>>> >> +struct mac_slot {
>>> >> +    int present;
>>> >> +    uint64_t size;
>>> >> +    uint64_t gpa_start;
>>> >> +    uint64_t gva;
>>> >> +};
>>> >> +
>>> >> +hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
>>> >> +{
>>> >> +    hvf_slot *slot;
>>> >> +    int x;
>>> >> +    for (x = 0; x < hvf_state->num_slots; ++x) {
>>> >> +        slot = &hvf_state->slots[x];
>>> >> +        if (slot->size && start < (slot->start + slot->size) &&
>>> >> +            (start + size) > slot->start) {
>>> >> +            return slot;
>>> >> +        }
>>> >> +    }
>>> >> +    return NULL;
>>> >> +}
>>> >> +
>>> >> +struct mac_slot mac_slots[32];
>>> >> +
>>> >> +static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
>>> >> +{
>>> >> +    struct mac_slot *macslot;
>>> >> +    hv_return_t ret;
>>> >> +
>>> >> +    macslot = &mac_slots[slot->slot_id];
>>> >> +
>>> >> +    if (macslot->present) {
>>> >> +        if (macslot->size != slot->size) {
>>> >> +            macslot->present = 0;
>>> >> +            ret = hv_vm_unmap(macslot->gpa_start, macslot->size);
>>> >> +            assert_hvf_ok(ret);
>>> >> +        }
>>> >> +    }
>>> >> +
>>> >> +    if (!slot->size) {
>>> >> +        return 0;
>>> >> +    }
>>> >> +
>>> >> +    macslot->present = 1;
>>> >> +    macslot->gpa_start = slot->start;
>>> >> +    macslot->size = slot->size;
>>> >> +    ret = hv_vm_map(slot->mem, slot->start, slot->size, flags);
>>> >> +    assert_hvf_ok(ret);
>>> >> +    return 0;
>>> >> +}
>>> >> +
>>> >> +static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
>>> >> +{
>>> >> +    hvf_slot *mem;
>>> >> +    MemoryRegion *area = section->mr;
>>> >> +    bool writeable = !area->readonly && !area->rom_device;
>>> >> +    hv_memory_flags_t flags;
>>> >> +
>>> >> +    if (!memory_region_is_ram(area)) {
>>> >> +        if (writeable) {
>>> >> +            return;
>>> >> +        } else if (!memory_region_is_romd(area)) {
>>> >> +            /*
>>> >> +             * If the memory device is not in romd_mode, then we
>>> actually want
>>> >> +             * to remove the hvf memory slot so all accesses will
>>> trap.
>>> >> +             */
>>> >> +             add = false;
>>> >> +        }
>>> >> +    }
>>> >> +
>>> >> +    mem = hvf_find_overlap_slot(
>>> >> +            section->offset_within_address_space,
>>> >> +            int128_get64(section->size));
>>> >> +
>>> >> +    if (mem && add) {
>>> >> +        if (mem->size == int128_get64(section->size) &&
>>> >> +            mem->start == section->offset_within_address_space &&
>>> >> +            mem->mem == (memory_region_get_ram_ptr(area) +
>>> >> +            section->offset_within_region)) {
>>> >> +            return; /* Same region was attempted to register, go
>>> away. */
>>> >> +        }
>>> >> +    }
>>> >> +
>>> >> +    /* Region needs to be reset. set the size to 0 and remap it. */
>>> >> +    if (mem) {
>>> >> +        mem->size = 0;
>>> >> +        if (do_hvf_set_memory(mem, 0)) {
>>> >> +            error_report("Failed to reset overlapping slot");
>>> >> +            abort();
>>> >> +        }
>>> >> +    }
>>> >> +
>>> >> +    if (!add) {
>>> >> +        return;
>>> >> +    }
>>> >> +
>>> >> +    if (area->readonly ||
>>> >> +        (!memory_region_is_ram(area) &&
>>> memory_region_is_romd(area))) {
>>> >> +        flags = HV_MEMORY_READ | HV_MEMORY_EXEC;
>>> >> +    } else {
>>> >> +        flags = HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC;
>>> >> +    }
>>> >> +
>>> >> +    /* Now make a new slot. */
>>> >> +    int x;
>>> >> +
>>> >> +    for (x = 0; x < hvf_state->num_slots; ++x) {
>>> >> +        mem = &hvf_state->slots[x];
>>> >> +        if (!mem->size) {
>>> >> +            break;
>>> >> +        }
>>> >> +    }
>>> >> +
>>> >> +    if (x == hvf_state->num_slots) {
>>> >> +        error_report("No free slots");
>>> >> +        abort();
>>> >> +    }
>>> >> +
>>> >> +    mem->size = int128_get64(section->size);
>>> >> +    mem->mem = memory_region_get_ram_ptr(area) +
>>> section->offset_within_region;
>>> >> +    mem->start = section->offset_within_address_space;
>>> >> +    mem->region = area;
>>> >> +
>>> >> +    if (do_hvf_set_memory(mem, flags)) {
>>> >> +        error_report("Error registering new memory slot");
>>> >> +        abort();
>>> >> +    }
>>> >> +}
>>> >> +
>>> >> +static void hvf_set_dirty_tracking(MemoryRegionSection *section,
>>> bool on)
>>> >> +{
>>> >> +    hvf_slot *slot;
>>> >> +
>>> >> +    slot = hvf_find_overlap_slot(
>>> >> +            section->offset_within_address_space,
>>> >> +            int128_get64(section->size));
>>> >> +
>>> >> +    /* protect region against writes; begin tracking it */
>>> >> +    if (on) {
>>> >> +        slot->flags |= HVF_SLOT_LOG;
>>> >> +        hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
>>> >> +                      HV_MEMORY_READ);
>>> >> +    /* stop tracking region*/
>>> >> +    } else {
>>> >> +        slot->flags &= ~HVF_SLOT_LOG;
>>> >> +        hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
>>> >> +                      HV_MEMORY_READ | HV_MEMORY_WRITE);
>>> >> +    }
>>> >> +}
>>> >> +
>>> >> +static void hvf_log_start(MemoryListener *listener,
>>> >> +                          MemoryRegionSection *section, int old, int
>>> new)
>>> >> +{
>>> >> +    if (old != 0) {
>>> >> +        return;
>>> >> +    }
>>> >> +
>>> >> +    hvf_set_dirty_tracking(section, 1);
>>> >> +}
>>> >> +
>>> >> +static void hvf_log_stop(MemoryListener *listener,
>>> >> +                         MemoryRegionSection *section, int old, int
>>> new)
>>> >> +{
>>> >> +    if (new != 0) {
>>> >> +        return;
>>> >> +    }
>>> >> +
>>> >> +    hvf_set_dirty_tracking(section, 0);
>>> >> +}
>>> >> +
>>> >> +static void hvf_log_sync(MemoryListener *listener,
>>> >> +                         MemoryRegionSection *section)
>>> >> +{
>>> >> +    /*
>>> >> +     * sync of dirty pages is handled elsewhere; just make sure we
>>> keep
>>> >> +     * tracking the region.
>>> >> +     */
>>> >> +    hvf_set_dirty_tracking(section, 1);
>>> >> +}
>>> >> +
>>> >> +static void hvf_region_add(MemoryListener *listener,
>>> >> +                           MemoryRegionSection *section)
>>> >> +{
>>> >> +    hvf_set_phys_mem(section, true);
>>> >> +}
>>> >> +
>>> >> +static void hvf_region_del(MemoryListener *listener,
>>> >> +                           MemoryRegionSection *section)
>>> >> +{
>>> >> +    hvf_set_phys_mem(section, false);
>>> >> +}
>>> >> +
>>> >> +static MemoryListener hvf_memory_listener = {
>>> >> +    .priority = 10,
>>> >> +    .region_add = hvf_region_add,
>>> >> +    .region_del = hvf_region_del,
>>> >> +    .log_start = hvf_log_start,
>>> >> +    .log_stop = hvf_log_stop,
>>> >> +    .log_sync = hvf_log_sync,
>>> >> +};
>>> >> +
>>> >> +static void do_hvf_cpu_synchronize_state(CPUState *cpu,
>>> run_on_cpu_data arg)
>>> >> +{
>>> >> +    if (!cpu->vcpu_dirty) {
>>> >> +        hvf_get_registers(cpu);
>>> >> +        cpu->vcpu_dirty = true;
>>> >> +    }
>>> >> +}
>>> >> +
>>> >> +static void hvf_cpu_synchronize_state(CPUState *cpu)
>>> >> +{
>>> >> +    if (!cpu->vcpu_dirty) {
>>> >> +        run_on_cpu(cpu, do_hvf_cpu_synchronize_state,
>>> RUN_ON_CPU_NULL);
>>> >> +    }
>>> >> +}
>>> >> +
>>> >> +static void do_hvf_cpu_synchronize_post_reset(CPUState *cpu,
>>> >> +                                              run_on_cpu_data arg)
>>> >> +{
>>> >> +    hvf_put_registers(cpu);
>>> >> +    cpu->vcpu_dirty = false;
>>> >> +}
>>> >> +
>>> >> +static void hvf_cpu_synchronize_post_reset(CPUState *cpu)
>>> >> +{
>>> >> +    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_reset,
>>> RUN_ON_CPU_NULL);
>>> >> +}
>>> >> +
>>> >> +static void do_hvf_cpu_synchronize_post_init(CPUState *cpu,
>>> >> +                                             run_on_cpu_data arg)
>>> >> +{
>>> >> +    hvf_put_registers(cpu);
>>> >> +    cpu->vcpu_dirty = false;
>>> >> +}
>>> >> +
>>> >> +static void hvf_cpu_synchronize_post_init(CPUState *cpu)
>>> >> +{
>>> >> +    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_init,
>>> RUN_ON_CPU_NULL);
>>> >> +}
>>> >> +
>>> >> +static void do_hvf_cpu_synchronize_pre_loadvm(CPUState *cpu,
>>> >> +                                              run_on_cpu_data arg)
>>> >> +{
>>> >> +    cpu->vcpu_dirty = true;
>>> >> +}
>>> >> +
>>> >> +static void hvf_cpu_synchronize_pre_loadvm(CPUState *cpu)
>>> >> +{
>>> >> +    run_on_cpu(cpu, do_hvf_cpu_synchronize_pre_loadvm,
>>> RUN_ON_CPU_NULL);
>>> >> +}
>>> >> +
>>> >> +static void hvf_vcpu_destroy(CPUState *cpu)
>>> >> +{
>>> >> +    hv_return_t ret = hv_vcpu_destroy(cpu->hvf_fd);
>>> >> +    assert_hvf_ok(ret);
>>> >> +
>>> >> +    hvf_arch_vcpu_destroy(cpu);
>>> >> +}
>>> >> +
>>> >> +static void dummy_signal(int sig)
>>> >> +{
>>> >> +}
>>> >> +
>>> >> +static int hvf_init_vcpu(CPUState *cpu)
>>> >> +{
>>> >> +    int r;
>>> >> +
>>> >> +    /* init cpu signals */
>>> >> +    sigset_t set;
>>> >> +    struct sigaction sigact;
>>> >> +
>>> >> +    memset(&sigact, 0, sizeof(sigact));
>>> >> +    sigact.sa_handler = dummy_signal;
>>> >> +    sigaction(SIG_IPI, &sigact, NULL);
>>> >> +
>>> >> +    pthread_sigmask(SIG_BLOCK, NULL, &set);
>>> >> +    sigdelset(&set, SIG_IPI);
>>> >> +
>>> >> +#ifdef __aarch64__
>>> >> +    r = hv_vcpu_create(&cpu->hvf_fd, (hv_vcpu_exit_t
>>> **)&cpu->hvf_exit, NULL);
>>> >> +#else
>>> >> +    r = hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf_fd, HV_VCPU_DEFAULT);
>>> >> +#endif
>>> > I think the first __aarch64__ bit fits better to arm part of the
>>> series.
>>>
>>>
>>> Oops. Thanks for catching it! Yes, absolutely. It should be part of the
>>> ARM enablement.
>>>
>>>
>>> >
>>> >> +    cpu->vcpu_dirty = 1;
>>> >> +    assert_hvf_ok(r);
>>> >> +
>>> >> +    return hvf_arch_init_vcpu(cpu);
>>> >> +}
>>> >> +
>>> >> +/*
>>> >> + * The HVF-specific vCPU thread function. This one should only run
>>> when the host
>>> >> + * CPU supports the VMX "unrestricted guest" feature.
>>> >> + */
>>> >> +static void *hvf_cpu_thread_fn(void *arg)
>>> >> +{
>>> >> +    CPUState *cpu = arg;
>>> >> +
>>> >> +    int r;
>>> >> +
>>> >> +    assert(hvf_enabled());
>>> >> +
>>> >> +    rcu_register_thread();
>>> >> +
>>> >> +    qemu_mutex_lock_iothread();
>>> >> +    qemu_thread_get_self(cpu->thread);
>>> >> +
>>> >> +    cpu->thread_id = qemu_get_thread_id();
>>> >> +    cpu->can_do_io = 1;
>>> >> +    current_cpu = cpu;
>>> >> +
>>> >> +    hvf_init_vcpu(cpu);
>>> >> +
>>> >> +    /* signal CPU creation */
>>> >> +    cpu_thread_signal_created(cpu);
>>> >> +    qemu_guest_random_seed_thread_part2(cpu->random_seed);
>>> >> +
>>> >> +    do {
>>> >> +        if (cpu_can_run(cpu)) {
>>> >> +            r = hvf_vcpu_exec(cpu);
>>> >> +            if (r == EXCP_DEBUG) {
>>> >> +                cpu_handle_guest_debug(cpu);
>>> >> +            }
>>> >> +        }
>>> >> +        qemu_wait_io_event(cpu);
>>> >> +    } while (!cpu->unplug || cpu_can_run(cpu));
>>> >> +
>>> >> +    hvf_vcpu_destroy(cpu);
>>> >> +    cpu_thread_signal_destroyed(cpu);
>>> >> +    qemu_mutex_unlock_iothread();
>>> >> +    rcu_unregister_thread();
>>> >> +    return NULL;
>>> >> +}
>>> >> +
>>> >> +static void hvf_start_vcpu_thread(CPUState *cpu)
>>> >> +{
>>> >> +    char thread_name[VCPU_THREAD_NAME_SIZE];
>>> >> +
>>> >> +    /*
>>> >> +     * HVF currently does not support TCG, and only runs in
>>> >> +     * unrestricted-guest mode.
>>> >> +     */
>>> >> +    assert(hvf_enabled());
>>> >> +
>>> >> +    cpu->thread = g_malloc0(sizeof(QemuThread));
>>> >> +    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
>>> >> +    qemu_cond_init(cpu->halt_cond);
>>> >> +
>>> >> +    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/HVF",
>>> >> +             cpu->cpu_index);
>>> >> +    qemu_thread_create(cpu->thread, thread_name, hvf_cpu_thread_fn,
>>> >> +                       cpu, QEMU_THREAD_JOINABLE);
>>> >> +}
>>> >> +
>>> >> +static const CpusAccel hvf_cpus = {
>>> >> +    .create_vcpu_thread = hvf_start_vcpu_thread,
>>> >> +
>>> >> +    .synchronize_post_reset = hvf_cpu_synchronize_post_reset,
>>> >> +    .synchronize_post_init = hvf_cpu_synchronize_post_init,
>>> >> +    .synchronize_state = hvf_cpu_synchronize_state,
>>> >> +    .synchronize_pre_loadvm = hvf_cpu_synchronize_pre_loadvm,
>>> >> +};
>>> >> +
>>> >> +static int hvf_accel_init(MachineState *ms)
>>> >> +{
>>> >> +    int x;
>>> >> +    hv_return_t ret;
>>> >> +    HVFState *s;
>>> >> +
>>> >> +    ret = hv_vm_create(HV_VM_DEFAULT);
>>> >> +    assert_hvf_ok(ret);
>>> >> +
>>> >> +    s = g_new0(HVFState, 1);
>>> >> +
>>> >> +    s->num_slots = 32;
>>> >> +    for (x = 0; x < s->num_slots; ++x) {
>>> >> +        s->slots[x].size = 0;
>>> >> +        s->slots[x].slot_id = x;
>>> >> +    }
>>> >> +
>>> >> +    hvf_state = s;
>>> >> +    memory_listener_register(&hvf_memory_listener,
>>> &address_space_memory);
>>> >> +    cpus_register_accel(&hvf_cpus);
>>> >> +    return 0;
>>> >> +}
>>> >> +
>>> >> +static void hvf_accel_class_init(ObjectClass *oc, void *data)
>>> >> +{
>>> >> +    AccelClass *ac = ACCEL_CLASS(oc);
>>> >> +    ac->name = "HVF";
>>> >> +    ac->init_machine = hvf_accel_init;
>>> >> +    ac->allowed = &hvf_allowed;
>>> >> +}
>>> >> +
>>> >> +static const TypeInfo hvf_accel_type = {
>>> >> +    .name = TYPE_HVF_ACCEL,
>>> >> +    .parent = TYPE_ACCEL,
>>> >> +    .class_init = hvf_accel_class_init,
>>> >> +};
>>> >> +
>>> >> +static void hvf_type_init(void)
>>> >> +{
>>> >> +    type_register_static(&hvf_accel_type);
>>> >> +}
>>> >> +
>>> >> +type_init(hvf_type_init);
>>> >> diff --git a/accel/hvf/meson.build b/accel/hvf/meson.build
>>> >> new file mode 100644
>>> >> index 0000000000..dfd6b68dc7
>>> >> --- /dev/null
>>> >> +++ b/accel/hvf/meson.build
>>> >> @@ -0,0 +1,7 @@
>>> >> +hvf_ss = ss.source_set()
>>> >> +hvf_ss.add(files(
>>> >> +  'hvf-all.c',
>>> >> +  'hvf-cpus.c',
>>> >> +))
>>> >> +
>>> >> +specific_ss.add_all(when: 'CONFIG_HVF', if_true: hvf_ss)
>>> >> diff --git a/accel/meson.build b/accel/meson.build
>>> >> index b26cca227a..6de12ce5d5 100644
>>> >> --- a/accel/meson.build
>>> >> +++ b/accel/meson.build
>>> >> @@ -1,5 +1,6 @@
>>> >>   softmmu_ss.add(files('accel.c'))
>>> >>
>>> >> +subdir('hvf')
>>> >>   subdir('qtest')
>>> >>   subdir('kvm')
>>> >>   subdir('tcg')
>>> >> diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
>>> >> new file mode 100644
>>> >> index 0000000000..de9bad23a8
>>> >> --- /dev/null
>>> >> +++ b/include/sysemu/hvf_int.h
>>> >> @@ -0,0 +1,69 @@
>>> >> +/*
>>> >> + * QEMU Hypervisor.framework (HVF) support
>>> >> + *
>>> >> + * This work is licensed under the terms of the GNU GPL, version 2
>>> or later.
>>> >> + * See the COPYING file in the top-level directory.
>>> >> + *
>>> >> + */
>>> >> +
>>> >> +/* header to be included in HVF-specific code */
>>> >> +
>>> >> +#ifndef HVF_INT_H
>>> >> +#define HVF_INT_H
>>> >> +
>>> >> +#include <Hypervisor/Hypervisor.h>
>>> >> +
>>> >> +#define HVF_MAX_VCPU 0x10
>>> >> +
>>> >> +extern struct hvf_state hvf_global;
>>> >> +
>>> >> +struct hvf_vm {
>>> >> +    int id;
>>> >> +    struct hvf_vcpu_state *vcpus[HVF_MAX_VCPU];
>>> >> +};
>>> >> +
>>> >> +struct hvf_state {
>>> >> +    uint32_t version;
>>> >> +    struct hvf_vm *vm;
>>> >> +    uint64_t mem_quota;
>>> >> +};
>>> >> +
>>> >> +/* hvf_slot flags */
>>> >> +#define HVF_SLOT_LOG (1 << 0)
>>> >> +
>>> >> +typedef struct hvf_slot {
>>> >> +    uint64_t start;
>>> >> +    uint64_t size;
>>> >> +    uint8_t *mem;
>>> >> +    int slot_id;
>>> >> +    uint32_t flags;
>>> >> +    MemoryRegion *region;
>>> >> +} hvf_slot;
>>> >> +
>>> >> +typedef struct hvf_vcpu_caps {
>>> >> +    uint64_t vmx_cap_pinbased;
>>> >> +    uint64_t vmx_cap_procbased;
>>> >> +    uint64_t vmx_cap_procbased2;
>>> >> +    uint64_t vmx_cap_entry;
>>> >> +    uint64_t vmx_cap_exit;
>>> >> +    uint64_t vmx_cap_preemption_timer;
>>> >> +} hvf_vcpu_caps;
>>> >> +
>>> >> +struct HVFState {
>>> >> +    AccelState parent;
>>> >> +    hvf_slot slots[32];
>>> >> +    int num_slots;
>>> >> +
>>> >> +    hvf_vcpu_caps *hvf_caps;
>>> >> +};
>>> >> +extern HVFState *hvf_state;
>>> >> +
>>> >> +void assert_hvf_ok(hv_return_t ret);
>>> >> +int hvf_get_registers(CPUState *cpu);
>>> >> +int hvf_put_registers(CPUState *cpu);
>>> >> +int hvf_arch_init_vcpu(CPUState *cpu);
>>> >> +void hvf_arch_vcpu_destroy(CPUState *cpu);
>>> >> +int hvf_vcpu_exec(CPUState *cpu);
>>> >> +hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
>>> >> +
>>> >> +#endif
>>> >> diff --git a/target/i386/hvf/hvf-cpus.c b/target/i386/hvf/hvf-cpus.c
>>> >> deleted file mode 100644
>>> >> index 817b3d7452..0000000000
>>> >> --- a/target/i386/hvf/hvf-cpus.c
>>> >> +++ /dev/null
>>> >> @@ -1,131 +0,0 @@
>>> >> -/*
>>> >> - * Copyright 2008 IBM Corporation
>>> >> - *           2008 Red Hat, Inc.
>>> >> - * Copyright 2011 Intel Corporation
>>> >> - * Copyright 2016 Veertu, Inc.
>>> >> - * Copyright 2017 The Android Open Source Project
>>> >> - *
>>> >> - * QEMU Hypervisor.framework support
>>> >> - *
>>> >> - * This program is free software; you can redistribute it and/or
>>> >> - * modify it under the terms of version 2 of the GNU General Public
>>> >> - * License as published by the Free Software Foundation.
>>> >> - *
>>> >> - * This program is distributed in the hope that it will be useful,
>>> >> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> >> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>>> >> - * General Public License for more details.
>>> >> - *
>>> >> - * You should have received a copy of the GNU General Public License
>>> >> - * along with this program; if not, see <
>>> http://www.gnu.org/licenses/>.
>>> >> - *
>>> >> - * This file contain code under public domain from the hvdos project:
>>> >> - * https://github.com/mist64/hvdos
>>> >> - *
>>> >> - * Parts Copyright (c) 2011 NetApp, Inc.
>>> >> - * All rights reserved.
>>> >> - *
>>> >> - * Redistribution and use in source and binary forms, with or without
>>> >> - * modification, are permitted provided that the following conditions
>>> >> - * are met:
>>> >> - * 1. Redistributions of source code must retain the above copyright
>>> >> - *    notice, this list of conditions and the following disclaimer.
>>> >> - * 2. Redistributions in binary form must reproduce the above
>>> copyright
>>> >> - *    notice, this list of conditions and the following disclaimer
>>> in the
>>> >> - *    documentation and/or other materials provided with the
>>> distribution.
>>> >> - *
>>> >> - * THIS SOFTWARE IS PROVIDED BY NETAPP, INC ``AS IS'' AND
>>> >> - * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
>>> THE
>>> >> - * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
>>> PARTICULAR PURPOSE
>>> >> - * ARE DISCLAIMED.  IN NO EVENT SHALL NETAPP, INC OR CONTRIBUTORS BE
>>> LIABLE
>>> >> - * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
>>> CONSEQUENTIAL
>>> >> - * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
>>> GOODS
>>> >> - * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
>>> INTERRUPTION)
>>> >> - * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
>>> CONTRACT, STRICT
>>> >> - * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
>>> ANY WAY
>>> >> - * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
>>> POSSIBILITY OF
>>> >> - * SUCH DAMAGE.
>>> >> - */
>>> >> -
>>> >> -#include "qemu/osdep.h"
>>> >> -#include "qemu/error-report.h"
>>> >> -#include "qemu/main-loop.h"
>>> >> -#include "sysemu/hvf.h"
>>> >> -#include "sysemu/runstate.h"
>>> >> -#include "target/i386/cpu.h"
>>> >> -#include "qemu/guest-random.h"
>>> >> -
>>> >> -#include "hvf-cpus.h"
>>> >> -
>>> >> -/*
>>> >> - * The HVF-specific vCPU thread function. This one should only run
>>> when the host
>>> >> - * CPU supports the VMX "unrestricted guest" feature.
>>> >> - */
>>> >> -static void *hvf_cpu_thread_fn(void *arg)
>>> >> -{
>>> >> -    CPUState *cpu = arg;
>>> >> -
>>> >> -    int r;
>>> >> -
>>> >> -    assert(hvf_enabled());
>>> >> -
>>> >> -    rcu_register_thread();
>>> >> -
>>> >> -    qemu_mutex_lock_iothread();
>>> >> -    qemu_thread_get_self(cpu->thread);
>>> >> -
>>> >> -    cpu->thread_id = qemu_get_thread_id();
>>> >> -    cpu->can_do_io = 1;
>>> >> -    current_cpu = cpu;
>>> >> -
>>> >> -    hvf_init_vcpu(cpu);
>>> >> -
>>> >> -    /* signal CPU creation */
>>> >> -    cpu_thread_signal_created(cpu);
>>> >> -    qemu_guest_random_seed_thread_part2(cpu->random_seed);
>>> >> -
>>> >> -    do {
>>> >> -        if (cpu_can_run(cpu)) {
>>> >> -            r = hvf_vcpu_exec(cpu);
>>> >> -            if (r == EXCP_DEBUG) {
>>> >> -                cpu_handle_guest_debug(cpu);
>>> >> -            }
>>> >> -        }
>>> >> -        qemu_wait_io_event(cpu);
>>> >> -    } while (!cpu->unplug || cpu_can_run(cpu));
>>> >> -
>>> >> -    hvf_vcpu_destroy(cpu);
>>> >> -    cpu_thread_signal_destroyed(cpu);
>>> >> -    qemu_mutex_unlock_iothread();
>>> >> -    rcu_unregister_thread();
>>> >> -    return NULL;
>>> >> -}
>>> >> -
>>> >> -static void hvf_start_vcpu_thread(CPUState *cpu)
>>> >> -{
>>> >> -    char thread_name[VCPU_THREAD_NAME_SIZE];
>>> >> -
>>> >> -    /*
>>> >> -     * HVF currently does not support TCG, and only runs in
>>> >> -     * unrestricted-guest mode.
>>> >> -     */
>>> >> -    assert(hvf_enabled());
>>> >> -
>>> >> -    cpu->thread = g_malloc0(sizeof(QemuThread));
>>> >> -    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
>>> >> -    qemu_cond_init(cpu->halt_cond);
>>> >> -
>>> >> -    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/HVF",
>>> >> -             cpu->cpu_index);
>>> >> -    qemu_thread_create(cpu->thread, thread_name, hvf_cpu_thread_fn,
>>> >> -                       cpu, QEMU_THREAD_JOINABLE);
>>> >> -}
>>> >> -
>>> >> -const CpusAccel hvf_cpus = {
>>> >> -    .create_vcpu_thread = hvf_start_vcpu_thread,
>>> >> -
>>> >> -    .synchronize_post_reset = hvf_cpu_synchronize_post_reset,
>>> >> -    .synchronize_post_init = hvf_cpu_synchronize_post_init,
>>> >> -    .synchronize_state = hvf_cpu_synchronize_state,
>>> >> -    .synchronize_pre_loadvm = hvf_cpu_synchronize_pre_loadvm,
>>> >> -};
>>> >> diff --git a/target/i386/hvf/hvf-cpus.h b/target/i386/hvf/hvf-cpus.h
>>> >> deleted file mode 100644
>>> >> index ced31b82c0..0000000000
>>> >> --- a/target/i386/hvf/hvf-cpus.h
>>> >> +++ /dev/null
>>> >> @@ -1,25 +0,0 @@
>>> >> -/*
>>> >> - * Accelerator CPUS Interface
>>> >> - *
>>> >> - * Copyright 2020 SUSE LLC
>>> >> - *
>>> >> - * This work is licensed under the terms of the GNU GPL, version 2
>>> or later.
>>> >> - * See the COPYING file in the top-level directory.
>>> >> - */
>>> >> -
>>> >> -#ifndef HVF_CPUS_H
>>> >> -#define HVF_CPUS_H
>>> >> -
>>> >> -#include "sysemu/cpus.h"
>>> >> -
>>> >> -extern const CpusAccel hvf_cpus;
>>> >> -
>>> >> -int hvf_init_vcpu(CPUState *);
>>> >> -int hvf_vcpu_exec(CPUState *);
>>> >> -void hvf_cpu_synchronize_state(CPUState *);
>>> >> -void hvf_cpu_synchronize_post_reset(CPUState *);
>>> >> -void hvf_cpu_synchronize_post_init(CPUState *);
>>> >> -void hvf_cpu_synchronize_pre_loadvm(CPUState *);
>>> >> -void hvf_vcpu_destroy(CPUState *);
>>> >> -
>>> >> -#endif /* HVF_CPUS_H */
>>> >> diff --git a/target/i386/hvf/hvf-i386.h b/target/i386/hvf/hvf-i386.h
>>> >> index e0edffd077..6d56f8f6bb 100644
>>> >> --- a/target/i386/hvf/hvf-i386.h
>>> >> +++ b/target/i386/hvf/hvf-i386.h
>>> >> @@ -18,57 +18,11 @@
>>> >>
>>> >>   #include "sysemu/accel.h"
>>> >>   #include "sysemu/hvf.h"
>>> >> +#include "sysemu/hvf_int.h"
>>> >>   #include "cpu.h"
>>> >>   #include "x86.h"
>>> >>
>>> >> -#define HVF_MAX_VCPU 0x10
>>> >> -
>>> >> -extern struct hvf_state hvf_global;
>>> >> -
>>> >> -struct hvf_vm {
>>> >> -    int id;
>>> >> -    struct hvf_vcpu_state *vcpus[HVF_MAX_VCPU];
>>> >> -};
>>> >> -
>>> >> -struct hvf_state {
>>> >> -    uint32_t version;
>>> >> -    struct hvf_vm *vm;
>>> >> -    uint64_t mem_quota;
>>> >> -};
>>> >> -
>>> >> -/* hvf_slot flags */
>>> >> -#define HVF_SLOT_LOG (1 << 0)
>>> >> -
>>> >> -typedef struct hvf_slot {
>>> >> -    uint64_t start;
>>> >> -    uint64_t size;
>>> >> -    uint8_t *mem;
>>> >> -    int slot_id;
>>> >> -    uint32_t flags;
>>> >> -    MemoryRegion *region;
>>> >> -} hvf_slot;
>>> >> -
>>> >> -typedef struct hvf_vcpu_caps {
>>> >> -    uint64_t vmx_cap_pinbased;
>>> >> -    uint64_t vmx_cap_procbased;
>>> >> -    uint64_t vmx_cap_procbased2;
>>> >> -    uint64_t vmx_cap_entry;
>>> >> -    uint64_t vmx_cap_exit;
>>> >> -    uint64_t vmx_cap_preemption_timer;
>>> >> -} hvf_vcpu_caps;
>>> >> -
>>> >> -struct HVFState {
>>> >> -    AccelState parent;
>>> >> -    hvf_slot slots[32];
>>> >> -    int num_slots;
>>> >> -
>>> >> -    hvf_vcpu_caps *hvf_caps;
>>> >> -};
>>> >> -extern HVFState *hvf_state;
>>> >> -
>>> >> -void hvf_set_phys_mem(MemoryRegionSection *, bool);
>>> >>   void hvf_handle_io(CPUArchState *, uint16_t, void *, int, int, int);
>>> >> -hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
>>> >>
>>> >>   #ifdef NEED_CPU_H
>>> >>   /* Functions exported to host specific mode */
>>> >> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
>>> >> index ed9356565c..8b96ecd619 100644
>>> >> --- a/target/i386/hvf/hvf.c
>>> >> +++ b/target/i386/hvf/hvf.c
>>> >> @@ -51,6 +51,7 @@
>>> >>   #include "qemu/error-report.h"
>>> >>
>>> >>   #include "sysemu/hvf.h"
>>> >> +#include "sysemu/hvf_int.h"
>>> >>   #include "sysemu/runstate.h"
>>> >>   #include "hvf-i386.h"
>>> >>   #include "vmcs.h"
>>> >> @@ -72,171 +73,6 @@
>>> >>   #include "sysemu/accel.h"
>>> >>   #include "target/i386/cpu.h"
>>> >>
>>> >> -#include "hvf-cpus.h"
>>> >> -
>>> >> -HVFState *hvf_state;
>>> >> -
>>> >> -static void assert_hvf_ok(hv_return_t ret)
>>> >> -{
>>> >> -    if (ret == HV_SUCCESS) {
>>> >> -        return;
>>> >> -    }
>>> >> -
>>> >> -    switch (ret) {
>>> >> -    case HV_ERROR:
>>> >> -        error_report("Error: HV_ERROR");
>>> >> -        break;
>>> >> -    case HV_BUSY:
>>> >> -        error_report("Error: HV_BUSY");
>>> >> -        break;
>>> >> -    case HV_BAD_ARGUMENT:
>>> >> -        error_report("Error: HV_BAD_ARGUMENT");
>>> >> -        break;
>>> >> -    case HV_NO_RESOURCES:
>>> >> -        error_report("Error: HV_NO_RESOURCES");
>>> >> -        break;
>>> >> -    case HV_NO_DEVICE:
>>> >> -        error_report("Error: HV_NO_DEVICE");
>>> >> -        break;
>>> >> -    case HV_UNSUPPORTED:
>>> >> -        error_report("Error: HV_UNSUPPORTED");
>>> >> -        break;
>>> >> -    default:
>>> >> -        error_report("Unknown Error");
>>> >> -    }
>>> >> -
>>> >> -    abort();
>>> >> -}
>>> >> -
>>> >> -/* Memory slots */
>>> >> -hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
>>> >> -{
>>> >> -    hvf_slot *slot;
>>> >> -    int x;
>>> >> -    for (x = 0; x < hvf_state->num_slots; ++x) {
>>> >> -        slot = &hvf_state->slots[x];
>>> >> -        if (slot->size && start < (slot->start + slot->size) &&
>>> >> -            (start + size) > slot->start) {
>>> >> -            return slot;
>>> >> -        }
>>> >> -    }
>>> >> -    return NULL;
>>> >> -}
>>> >> -
>>> >> -struct mac_slot {
>>> >> -    int present;
>>> >> -    uint64_t size;
>>> >> -    uint64_t gpa_start;
>>> >> -    uint64_t gva;
>>> >> -};
>>> >> -
>>> >> -struct mac_slot mac_slots[32];
>>> >> -
>>> >> -static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
>>> >> -{
>>> >> -    struct mac_slot *macslot;
>>> >> -    hv_return_t ret;
>>> >> -
>>> >> -    macslot = &mac_slots[slot->slot_id];
>>> >> -
>>> >> -    if (macslot->present) {
>>> >> -        if (macslot->size != slot->size) {
>>> >> -            macslot->present = 0;
>>> >> -            ret = hv_vm_unmap(macslot->gpa_start, macslot->size);
>>> >> -            assert_hvf_ok(ret);
>>> >> -        }
>>> >> -    }
>>> >> -
>>> >> -    if (!slot->size) {
>>> >> -        return 0;
>>> >> -    }
>>> >> -
>>> >> -    macslot->present = 1;
>>> >> -    macslot->gpa_start = slot->start;
>>> >> -    macslot->size = slot->size;
>>> >> -    ret = hv_vm_map((hv_uvaddr_t)slot->mem, slot->start, slot->size,
>>> flags);
>>> >> -    assert_hvf_ok(ret);
>>> >> -    return 0;
>>> >> -}
>>> >> -
>>> >> -void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
>>> >> -{
>>> >> -    hvf_slot *mem;
>>> >> -    MemoryRegion *area = section->mr;
>>> >> -    bool writeable = !area->readonly && !area->rom_device;
>>> >> -    hv_memory_flags_t flags;
>>> >> -
>>> >> -    if (!memory_region_is_ram(area)) {
>>> >> -        if (writeable) {
>>> >> -            return;
>>> >> -        } else if (!memory_region_is_romd(area)) {
>>> >> -            /*
>>> >> -             * If the memory device is not in romd_mode, then we
>>> actually want
>>> >> -             * to remove the hvf memory slot so all accesses will
>>> trap.
>>> >> -             */
>>> >> -             add = false;
>>> >> -        }
>>> >> -    }
>>> >> -
>>> >> -    mem = hvf_find_overlap_slot(
>>> >> -            section->offset_within_address_space,
>>> >> -            int128_get64(section->size));
>>> >> -
>>> >> -    if (mem && add) {
>>> >> -        if (mem->size == int128_get64(section->size) &&
>>> >> -            mem->start == section->offset_within_address_space &&
>>> >> -            mem->mem == (memory_region_get_ram_ptr(area) +
>>> >> -            section->offset_within_region)) {
>>> >> -            return; /* Same region was attempted to register, go
>>> away. */
>>> >> -        }
>>> >> -    }
>>> >> -
>>> >> -    /* Region needs to be reset. set the size to 0 and remap it. */
>>> >> -    if (mem) {
>>> >> -        mem->size = 0;
>>> >> -        if (do_hvf_set_memory(mem, 0)) {
>>> >> -            error_report("Failed to reset overlapping slot");
>>> >> -            abort();
>>> >> -        }
>>> >> -    }
>>> >> -
>>> >> -    if (!add) {
>>> >> -        return;
>>> >> -    }
>>> >> -
>>> >> -    if (area->readonly ||
>>> >> -        (!memory_region_is_ram(area) &&
>>> memory_region_is_romd(area))) {
>>> >> -        flags = HV_MEMORY_READ | HV_MEMORY_EXEC;
>>> >> -    } else {
>>> >> -        flags = HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC;
>>> >> -    }
>>> >> -
>>> >> -    /* Now make a new slot. */
>>> >> -    int x;
>>> >> -
>>> >> -    for (x = 0; x < hvf_state->num_slots; ++x) {
>>> >> -        mem = &hvf_state->slots[x];
>>> >> -        if (!mem->size) {
>>> >> -            break;
>>> >> -        }
>>> >> -    }
>>> >> -
>>> >> -    if (x == hvf_state->num_slots) {
>>> >> -        error_report("No free slots");
>>> >> -        abort();
>>> >> -    }
>>> >> -
>>> >> -    mem->size = int128_get64(section->size);
>>> >> -    mem->mem = memory_region_get_ram_ptr(area) +
>>> section->offset_within_region;
>>> >> -    mem->start = section->offset_within_address_space;
>>> >> -    mem->region = area;
>>> >> -
>>> >> -    if (do_hvf_set_memory(mem, flags)) {
>>> >> -        error_report("Error registering new memory slot");
>>> >> -        abort();
>>> >> -    }
>>> >> -}
>>> >> -
>>> >>   void vmx_update_tpr(CPUState *cpu)
>>> >>   {
>>> >>       /* TODO: need integrate APIC handling */
>>> >> @@ -276,56 +112,6 @@ void hvf_handle_io(CPUArchState *env, uint16_t
>>> port, void *buffer,
>>> >>       }
>>> >>   }
>>> >>
>>> >> -static void do_hvf_cpu_synchronize_state(CPUState *cpu,
>>> run_on_cpu_data arg)
>>> >> -{
>>> >> -    if (!cpu->vcpu_dirty) {
>>> >> -        hvf_get_registers(cpu);
>>> >> -        cpu->vcpu_dirty = true;
>>> >> -    }
>>> >> -}
>>> >> -
>>> >> -void hvf_cpu_synchronize_state(CPUState *cpu)
>>> >> -{
>>> >> -    if (!cpu->vcpu_dirty) {
>>> >> -        run_on_cpu(cpu, do_hvf_cpu_synchronize_state,
>>> RUN_ON_CPU_NULL);
>>> >> -    }
>>> >> -}
>>> >> -
>>> >> -static void do_hvf_cpu_synchronize_post_reset(CPUState *cpu,
>>> >> -                                              run_on_cpu_data arg)
>>> >> -{
>>> >> -    hvf_put_registers(cpu);
>>> >> -    cpu->vcpu_dirty = false;
>>> >> -}
>>> >> -
>>> >> -void hvf_cpu_synchronize_post_reset(CPUState *cpu)
>>> >> -{
>>> >> -    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_reset,
>>> RUN_ON_CPU_NULL);
>>> >> -}
>>> >> -
>>> >> -static void do_hvf_cpu_synchronize_post_init(CPUState *cpu,
>>> >> -                                             run_on_cpu_data arg)
>>> >> -{
>>> >> -    hvf_put_registers(cpu);
>>> >> -    cpu->vcpu_dirty = false;
>>> >> -}
>>> >> -
>>> >> -void hvf_cpu_synchronize_post_init(CPUState *cpu)
>>> >> -{
>>> >> -    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_init,
>>> RUN_ON_CPU_NULL);
>>> >> -}
>>> >> -
>>> >> -static void do_hvf_cpu_synchronize_pre_loadvm(CPUState *cpu,
>>> >> -                                              run_on_cpu_data arg)
>>> >> -{
>>> >> -    cpu->vcpu_dirty = true;
>>> >> -}
>>> >> -
>>> >> -void hvf_cpu_synchronize_pre_loadvm(CPUState *cpu)
>>> >> -{
>>> >> -    run_on_cpu(cpu, do_hvf_cpu_synchronize_pre_loadvm,
>>> RUN_ON_CPU_NULL);
>>> >> -}
>>> >> -
>>> >>   static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa,
>>> uint64_t ept_qual)
>>> >>   {
>>> >>       int read, write;
>>> >> @@ -370,109 +156,19 @@ static bool ept_emulation_fault(hvf_slot
>>> *slot, uint64_t gpa, uint64_t ept_qual)
>>> >>       return false;
>>> >>   }
>>> >>
>>> >> -static void hvf_set_dirty_tracking(MemoryRegionSection *section,
>>> bool on)
>>> >> -{
>>> >> -    hvf_slot *slot;
>>> >> -
>>> >> -    slot = hvf_find_overlap_slot(
>>> >> -            section->offset_within_address_space,
>>> >> -            int128_get64(section->size));
>>> >> -
>>> >> -    /* protect region against writes; begin tracking it */
>>> >> -    if (on) {
>>> >> -        slot->flags |= HVF_SLOT_LOG;
>>> >> -        hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size,
>>> >> -                      HV_MEMORY_READ);
>>> >> -    /* stop tracking region*/
>>> >> -    } else {
>>> >> -        slot->flags &= ~HVF_SLOT_LOG;
>>> >> -        hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size,
>>> >> -                      HV_MEMORY_READ | HV_MEMORY_WRITE);
>>> >> -    }
>>> >> -}
>>> >> -
>>> >> -static void hvf_log_start(MemoryListener *listener,
>>> >> -                          MemoryRegionSection *section, int old, int
>>> new)
>>> >> -{
>>> >> -    if (old != 0) {
>>> >> -        return;
>>> >> -    }
>>> >> -
>>> >> -    hvf_set_dirty_tracking(section, 1);
>>> >> -}
>>> >> -
>>> >> -static void hvf_log_stop(MemoryListener *listener,
>>> >> -                         MemoryRegionSection *section, int old, int
>>> new)
>>> >> -{
>>> >> -    if (new != 0) {
>>> >> -        return;
>>> >> -    }
>>> >> -
>>> >> -    hvf_set_dirty_tracking(section, 0);
>>> >> -}
>>> >> -
>>> >> -static void hvf_log_sync(MemoryListener *listener,
>>> >> -                         MemoryRegionSection *section)
>>> >> -{
>>> >> -    /*
>>> >> -     * sync of dirty pages is handled elsewhere; just make sure we
>>> keep
>>> >> -     * tracking the region.
>>> >> -     */
>>> >> -    hvf_set_dirty_tracking(section, 1);
>>> >> -}
>>> >> -
>>> >> -static void hvf_region_add(MemoryListener *listener,
>>> >> -                           MemoryRegionSection *section)
>>> >> -{
>>> >> -    hvf_set_phys_mem(section, true);
>>> >> -}
>>> >> -
>>> >> -static void hvf_region_del(MemoryListener *listener,
>>> >> -                           MemoryRegionSection *section)
>>> >> -{
>>> >> -    hvf_set_phys_mem(section, false);
>>> >> -}
>>> >> -
>>> >> -static MemoryListener hvf_memory_listener = {
>>> >> -    .priority = 10,
>>> >> -    .region_add = hvf_region_add,
>>> >> -    .region_del = hvf_region_del,
>>> >> -    .log_start = hvf_log_start,
>>> >> -    .log_stop = hvf_log_stop,
>>> >> -    .log_sync = hvf_log_sync,
>>> >> -};
>>> >> -
>>> >> -void hvf_vcpu_destroy(CPUState *cpu)
>>> >> +void hvf_arch_vcpu_destroy(CPUState *cpu)
>>> >>   {
>>> >>       X86CPU *x86_cpu = X86_CPU(cpu);
>>> >>       CPUX86State *env = &x86_cpu->env;
>>> >>
>>> >> -    hv_return_t ret = hv_vcpu_destroy((hv_vcpuid_t)cpu->hvf_fd);
>>> >>       g_free(env->hvf_mmio_buf);
>>> >> -    assert_hvf_ok(ret);
>>> >> -}
>>> >> -
>>> >> -static void dummy_signal(int sig)
>>> >> -{
>>> >>   }
>>> >>
>>> >> -int hvf_init_vcpu(CPUState *cpu)
>>> >> +int hvf_arch_init_vcpu(CPUState *cpu)
>>> >>   {
>>> >>
>>> >>       X86CPU *x86cpu = X86_CPU(cpu);
>>> >>       CPUX86State *env = &x86cpu->env;
>>> >> -    int r;
>>> >> -
>>> >> -    /* init cpu signals */
>>> >> -    sigset_t set;
>>> >> -    struct sigaction sigact;
>>> >> -
>>> >> -    memset(&sigact, 0, sizeof(sigact));
>>> >> -    sigact.sa_handler = dummy_signal;
>>> >> -    sigaction(SIG_IPI, &sigact, NULL);
>>> >> -
>>> >> -    pthread_sigmask(SIG_BLOCK, NULL, &set);
>>> >> -    sigdelset(&set, SIG_IPI);
>>> >>
>>> >>       init_emu();
>>> >>       init_decoder();
>>> >> @@ -480,10 +176,6 @@ int hvf_init_vcpu(CPUState *cpu)
>>> >>       hvf_state->hvf_caps = g_new0(struct hvf_vcpu_caps, 1);
>>> >>       env->hvf_mmio_buf = g_new(char, 4096);
>>> >>
>>> >> -    r = hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf_fd, HV_VCPU_DEFAULT);
>>> >> -    cpu->vcpu_dirty = 1;
>>> >> -    assert_hvf_ok(r);
>>> >> -
>>> >>       if (hv_vmx_read_capability(HV_VMX_CAP_PINBASED,
>>> >>           &hvf_state->hvf_caps->vmx_cap_pinbased)) {
>>> >>           abort();
>>> >> @@ -865,49 +557,3 @@ int hvf_vcpu_exec(CPUState *cpu)
>>> >>
>>> >>       return ret;
>>> >>   }
>>> >> -
>>> >> -bool hvf_allowed;
>>> >> -
>>> >> -static int hvf_accel_init(MachineState *ms)
>>> >> -{
>>> >> -    int x;
>>> >> -    hv_return_t ret;
>>> >> -    HVFState *s;
>>> >> -
>>> >> -    ret = hv_vm_create(HV_VM_DEFAULT);
>>> >> -    assert_hvf_ok(ret);
>>> >> -
>>> >> -    s = g_new0(HVFState, 1);
>>> >> -
>>> >> -    s->num_slots = 32;
>>> >> -    for (x = 0; x < s->num_slots; ++x) {
>>> >> -        s->slots[x].size = 0;
>>> >> -        s->slots[x].slot_id = x;
>>> >> -    }
>>> >> -
>>> >> -    hvf_state = s;
>>> >> -    memory_listener_register(&hvf_memory_listener,
>>> &address_space_memory);
>>> >> -    cpus_register_accel(&hvf_cpus);
>>> >> -    return 0;
>>> >> -}
>>> >> -
>>> >> -static void hvf_accel_class_init(ObjectClass *oc, void *data)
>>> >> -{
>>> >> -    AccelClass *ac = ACCEL_CLASS(oc);
>>> >> -    ac->name = "HVF";
>>> >> -    ac->init_machine = hvf_accel_init;
>>> >> -    ac->allowed = &hvf_allowed;
>>> >> -}
>>> >> -
>>> >> -static const TypeInfo hvf_accel_type = {
>>> >> -    .name = TYPE_HVF_ACCEL,
>>> >> -    .parent = TYPE_ACCEL,
>>> >> -    .class_init = hvf_accel_class_init,
>>> >> -};
>>> >> -
>>> >> -static void hvf_type_init(void)
>>> >> -{
>>> >> -    type_register_static(&hvf_accel_type);
>>> >> -}
>>> >> -
>>> >> -type_init(hvf_type_init);
>>> >> diff --git a/target/i386/hvf/meson.build b/target/i386/hvf/meson.build
>>> >> index 409c9a3f14..c8a43717ee 100644
>>> >> --- a/target/i386/hvf/meson.build
>>> >> +++ b/target/i386/hvf/meson.build
>>> >> @@ -1,6 +1,5 @@
>>> >>   i386_softmmu_ss.add(when: [hvf, 'CONFIG_HVF'], if_true: files(
>>> >>     'hvf.c',
>>> >> -  'hvf-cpus.c',
>>> >>     'x86.c',
>>> >>     'x86_cpuid.c',
>>> >>     'x86_decode.c',
>>> >> diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
>>> >> index bbec412b6c..89b8e9d87a 100644
>>> >> --- a/target/i386/hvf/x86hvf.c
>>> >> +++ b/target/i386/hvf/x86hvf.c
>>> >> @@ -20,6 +20,9 @@
>>> >>   #include "qemu/osdep.h"
>>> >>
>>> >>   #include "qemu-common.h"
>>> >> +#include "sysemu/hvf.h"
>>> >> +#include "sysemu/hvf_int.h"
>>> >> +#include "sysemu/hw_accel.h"
>>> >>   #include "x86hvf.h"
>>> >>   #include "vmx.h"
>>> >>   #include "vmcs.h"
>>> >> @@ -32,8 +35,6 @@
>>> >>   #include <Hypervisor/hv.h>
>>> >>   #include <Hypervisor/hv_vmx.h>
>>> >>
>>> >> -#include "hvf-cpus.h"
>>> >> -
>>> >>   void hvf_set_segment(struct CPUState *cpu, struct vmx_segment
>>> *vmx_seg,
>>> >>                        SegmentCache *qseg, bool is_tr)
>>> >>   {
>>> >> @@ -437,7 +438,7 @@ int hvf_process_events(CPUState *cpu_state)
>>> >>       env->eflags = rreg(cpu_state->hvf_fd, HV_X86_RFLAGS);
>>> >>
>>> >>       if (cpu_state->interrupt_request & CPU_INTERRUPT_INIT) {
>>> >> -        hvf_cpu_synchronize_state(cpu_state);
>>> >> +        cpu_synchronize_state(cpu_state);
>>> >>           do_cpu_init(cpu);
>>> >>       }
>>> >>
>>> >> @@ -451,12 +452,12 @@ int hvf_process_events(CPUState *cpu_state)
>>> >>           cpu_state->halted = 0;
>>> >>       }
>>> >>       if (cpu_state->interrupt_request & CPU_INTERRUPT_SIPI) {
>>> >> -        hvf_cpu_synchronize_state(cpu_state);
>>> >> +        cpu_synchronize_state(cpu_state);
>>> >>           do_cpu_sipi(cpu);
>>> >>       }
>>> >>       if (cpu_state->interrupt_request & CPU_INTERRUPT_TPR) {
>>> >>           cpu_state->interrupt_request &= ~CPU_INTERRUPT_TPR;
>>> >> -        hvf_cpu_synchronize_state(cpu_state);
>>> >> +        cpu_synchronize_state(cpu_state);
>>> > The changes from hvf_cpu_*() to cpu_*() are cleanup and perhaps should
>>> > be a separate patch. It follows cpu/accel cleanups Claudio was doing
>>> the
>>> > summer.
>>>
>>>
>>> The only reason they're in here is because we no longer have access to
>>> the hvf_ functions from the file. I am perfectly happy to rebase the
>>> patch on top of Claudio's if his goes in first. I'm sure it'll be
>>> trivial for him to rebase on top of this too if my series goes in first.
>>>
>>>
>>> >
>>> > Phillipe raised the idea that the patch might go ahead of ARM-specific
>>> > part (which might involve some discussions) and I agree with that.
>>> >
>>> > Some sync between Claudio series (CC'd him) and the patch might be
>>> need.
>>>
>>>
>>> I would prefer not to hold back because of the sync. Claudio's cleanup
>>> is trivial enough to adjust for if it gets merged ahead of this.
>>>
>>>
>>> Alex
>>>
>>>
>>>
>>>

--000000000000579c1d05b5593d8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 30, 2020 at 12:34 PM Alex=
ander Graf &lt;<a href=3D"mailto:agraf@csgraf.de">agraf@csgraf.de</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p>Hi Frank,<br>
      <br>
      Thanks for the update :). Your previous email nudged me into the
      right direction. I previously had implemented WFI through the
      internal timer framework which performed way worse.<br></p></div></bl=
ockquote><div>Cool, glad it&#39;s helping. Also, Peter found out that the m=
ain thing keeping us from just using cntpct_el0 on the host directly and co=
mpare with cval is that if we sleep, cval is going to be much &lt; cntpct_e=
l0 by the sleep time. If we can get either the architecture or macos to rea=
d out the sleep time then we might be able to not have to use a poll interv=
al either!</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><p>
      Along the way, I stumbled over a few issues though. For starters,
      the signal mask for SIG_IPI was not set correctly, so while
      pselect() would exit, the signal would never get delivered to the
      thread! For a fix, check out<br>
      <br>
      =C2=A0
<a href=3D"https://patchew.org/QEMU/20201130030723.78326-1-agraf@csgraf.de/=
20201130030723.78326-4-agraf@csgraf.de/" target=3D"_blank">https://patchew.=
org/QEMU/20201130030723.78326-1-agraf@csgraf.de/20201130030723.78326-4-agra=
f@csgraf.de/</a><br>
      <br></p></div></blockquote><div><br></div><div>Thanks, we&#39;ll take=
 a look :)</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div><p>
      Please also have a look at my latest stab at WFI emulation. It
      doesn&#39;t handle WFE (that&#39;s only relevant in overcommitted
      scenarios). But it does handle WFI and even does something similar
      to hlt polling, albeit not with an adaptive threshold.<br>
      <br>
      Also, is there a particular reason you&#39;re working on this super
      interesting and useful code in a random downstream fork of QEMU?
      Wouldn&#39;t it be more helpful to contribute to the upstream code
      base instead?<br></p></div></blockquote><div>We&#39;d actually like t=
o contribute upstream too :) We do want to maintain our own downstream thou=
gh; Android Emulator codebase needs to work solidly on macos and windows wh=
ich has made keeping up with upstream difficult, and staying on a previous =
version (2.12) with known quirks easier. (theres=C2=A0also some android rel=
ated customization relating to Qt Ui=C2=A0<a class=3D"gmail_plusreply" id=
=3D"plusReplyChip-0">+</a> different set of virtual devices and snapshot su=
pport (incl. snapshots of graphics devices with OpenGLES state tracking), w=
hich we hope to separate into other libraries/processes, but its not insign=
ificant)</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><p>
      <br>
      Alex<br>
    </p>
    <div><br>
      On 30.11.20 21:15, Frank Yang wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">Update: We&#39;re not quite sure how to compare the
        CNTV_CVAL and CNTVCT. But the high CPU usage seems to be
        mitigated by having a poll interval (like KVM does) in handling
        WFI:
        <div><br>
        </div>
        <div><a href=3D"https://android-review.googlesource.com/c/platform/=
external/qemu/+/1512501" target=3D"_blank">https://android-review.googlesou=
rce.com/c/platform/external/qemu/+/1512501</a><br>
        </div>
        <div><br>
        </div>
        <div>This is loosely inspired by=C2=A0<a href=3D"https://elixir.boo=
tlin.com/linux/v5.10-rc6/source/virt/kvm/kvm_main.c#L2766" target=3D"_blank=
">https://elixir.bootlin.com/linux/v5.10-rc6/source/virt/kvm/kvm_main.c#L27=
66</a>
          which does seem to specify a poll interval.</div>
        <div><br>
        </div>
        <div>It would be cool if we could have a lightweight way to
          enter sleep and restart the vcpus precisely when CVAL passes,
          though.</div>
        <div><br>
        </div>
        <div>Frank</div>
        <div><br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 27, 2020 at 3:30
          PM Frank Yang &lt;<a href=3D"mailto:lfy@google.com" target=3D"_bl=
ank">lfy@google.com</a>&gt; wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div dir=3D"ltr">Hi all,
            <div><br>
            </div>
            <div><a class=3D"gmail_plusreply" id=3D"gmail-m_-65358104934352=
92512gmail-m_-6420587976137368612plusReplyChip-0" href=3D"mailto:pcc@google=
.com" target=3D"_blank">+Peter Collingbourne</a>=C2=A0<br>
            </div>
            <div><br>
            </div>
            <div>I&#39;m a developer on the Android Emulator, which is in a
              fork of QEMU.</div>
            <div><br>
            </div>
            <div>Peter and I have been working on an HVF Apple Silicon
              backend with an eye toward Android guests.</div>
            <div><br>
            </div>
            <div>We have gotten things to basically switch to Android
              userspace already (logcat/shell and graphics available at
              least)</div>
            <div><br>
            </div>
            <div>Our strategy so far has been to import logic from the
              KVM implementation and hook into QEMU&#39;s software devices
              that=C2=A0previously assumed to only=C2=A0work with TCG, or h=
ave
              KVM-specific paths.</div>
            <div><br>
            </div>
            <div>Thanks to Alexander for the tip on the 36-bit address
              space limitation btw; our way of addressing this is to
              still allow highmem but not put pci high mmio so high.</div>
            <div><br>
            </div>
            <div>Also, note we have a sleep/signal based mechanism to
              deal with WFx, which might be worth looking into in
              Alexander&#39;s implementation as well:</div>
            <div><br>
            </div>
            <div><a href=3D"https://android-review.googlesource.com/c/platf=
orm/external/qemu/+/1512551" target=3D"_blank">https://android-review.googl=
esource.com/c/platform/external/qemu/+/1512551</a></div>
            <div><br>
            </div>
            <div>Patches so far, FYI:</div>
            <div><br>
            </div>
            <div><a href=3D"https://android-review.googlesource.com/c/platf=
orm/external/qemu/+/1513429/1" target=3D"_blank">https://android-review.goo=
glesource.com/c/platform/external/qemu/+/1513429/1</a><br>
            </div>
            <div><a href=3D"https://android-review.googlesource.com/c/platf=
orm/external/qemu/+/1512554/3" target=3D"_blank">https://android-review.goo=
glesource.com/c/platform/external/qemu/+/1512554/3</a><br>
            </div>
            <div><a href=3D"https://android-review.googlesource.com/c/platf=
orm/external/qemu/+/1512553/3" target=3D"_blank">https://android-review.goo=
glesource.com/c/platform/external/qemu/+/1512553/3</a><br>
            </div>
            <div><a href=3D"https://android-review.googlesource.com/c/platf=
orm/external/qemu/+/1512552/3" target=3D"_blank">https://android-review.goo=
glesource.com/c/platform/external/qemu/+/1512552/3</a><br>
            </div>
            <div><a href=3D"https://android-review.googlesource.com/c/platf=
orm/external/qemu/+/1512551/3" target=3D"_blank">https://android-review.goo=
glesource.com/c/platform/external/qemu/+/1512551/3</a><br>
            </div>
            <div><br>
            </div>
            <div><a href=3D"https://android.googlesource.com/platform/exter=
nal/qemu/+/c17eb6a3ffd50047e9646aff6640b710cb8ff48a" target=3D"_blank">http=
s://android.googlesource.com/platform/external/qemu/+/c17eb6a3ffd50047e9646=
aff6640b710cb8ff48a</a><br>
            </div>
            <div><a href=3D"https://android.googlesource.com/platform/exter=
nal/qemu/+/74bed16de1afb41b7a7ab8da1d1861226c9db63b" target=3D"_blank">http=
s://android.googlesource.com/platform/external/qemu/+/74bed16de1afb41b7a7ab=
8da1d1861226c9db63b</a><br>
            </div>
            <div><a href=3D"https://android.googlesource.com/platform/exter=
nal/qemu/+/eccd9e47ab2ccb9003455e3bb721f57f9ebc3c01" target=3D"_blank">http=
s://android.googlesource.com/platform/external/qemu/+/eccd9e47ab2ccb9003455=
e3bb721f57f9ebc3c01</a><br>
            </div>
            <div><a href=3D"https://android.googlesource.com/platform/exter=
nal/qemu/+/54fe3d67ed4698e85826537a4f49b2b9074b2228" target=3D"_blank">http=
s://android.googlesource.com/platform/external/qemu/+/54fe3d67ed4698e858265=
37a4f49b2b9074b2228</a><br>
            </div>
            <div><a href=3D"https://android.googlesource.com/platform/exter=
nal/qemu/+/82ef91a6fede1d1000f36be037ad4d58fbe0d102" target=3D"_blank">http=
s://android.googlesource.com/platform/external/qemu/+/82ef91a6fede1d1000f36=
be037ad4d58fbe0d102</a><br>
            </div>
            <div><a href=3D"https://android.googlesource.com/platform/exter=
nal/qemu/+/c28147aa7c74d98b858e99623d2fe46e74a379f6" target=3D"_blank">http=
s://android.googlesource.com/platform/external/qemu/+/c28147aa7c74d98b858e9=
9623d2fe46e74a379f6</a><br>
            </div>
            <div><br>
            </div>
            <div>Peter&#39;s also noticed that there are extra steps needed
              for M1&#39;s to allow TCG to work, as it involves JIT:</div>
            <div><br>
            </div>
            <div><a href=3D"https://android.googlesource.com/platform/exter=
nal/qemu/+/740e3fe47f88926c6bda9abb22ee6eae1bc254a9" target=3D"_blank">http=
s://android.googlesource.com/platform/external/qemu/+/740e3fe47f88926c6bda9=
abb22ee6eae1bc254a9</a><br>
            </div>
            <div><br>
            </div>
            <div>We&#39;d appreciate any feedback/comments :)</div>
            <div><br>
            </div>
            <div>Best,</div>
            <div><br>
            </div>
            <div>Frank</div>
          </div>
          <br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 27, 2020 at
              1:57 PM Alexander Graf &lt;<a href=3D"mailto:agraf@csgraf.de"=
 target=3D"_blank">agraf@csgraf.de</a>&gt; wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
              On 27.11.20 21:00, Roman Bolshakov wrote:<br>
              &gt; On Thu, Nov 26, 2020 at 10:50:11PM +0100, Alexander
              Graf wrote:<br>
              &gt;&gt; Until now, Hypervisor.framework has only been
              available on x86_64 systems.<br>
              &gt;&gt; With Apple Silicon shipping now, it extends its
              reach to aarch64. To<br>
              &gt;&gt; prepare for support for multiple architectures,
              let&#39;s move common code out<br>
              &gt;&gt; into its own accel directory.<br>
              &gt;&gt;<br>
              &gt;&gt; Signed-off-by: Alexander Graf &lt;<a href=3D"mailto:=
agraf@csgraf.de" target=3D"_blank">agraf@csgraf.de</a>&gt;<br>
              &gt;&gt; ---<br>
              &gt;&gt;=C2=A0 =C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09 +-<br>
              &gt;&gt;=C2=A0 =C2=A0accel/hvf/hvf-all.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 56 +++++<br>
              &gt;&gt;=C2=A0 =C2=A0accel/hvf/hvf-cpus.c=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 468
              ++++++++++++++++++++++++++++++++++++<br>
              &gt;&gt;=C2=A0 =C2=A0accel/hvf/meson.build=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A07 +<br>
              &gt;&gt;=C2=A0 =C2=A0accel/meson.build=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
              &gt;&gt;=C2=A0 =C2=A0include/sysemu/hvf_int.h=C2=A0 =C2=A0 |=
=C2=A0 69 ++++++<br>
              &gt;&gt;=C2=A0 =C2=A0target/i386/hvf/hvf-cpus.c=C2=A0 | 131 -=
---------<br>
              &gt;&gt;=C2=A0 =C2=A0target/i386/hvf/hvf-cpus.h=C2=A0 |=C2=A0=
 25 --<br>
              &gt;&gt;=C2=A0 =C2=A0target/i386/hvf/hvf-i386.h=C2=A0 |=C2=A0=
 48 +---<br>
              &gt;&gt;=C2=A0 =C2=A0target/i386/hvf/hvf.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 360
              +--------------------------<br>
              &gt;&gt;=C2=A0 =C2=A0target/i386/hvf/meson.build |=C2=A0 =C2=
=A01 -<br>
              &gt;&gt;=C2=A0 =C2=A0target/i386/hvf/x86hvf.c=C2=A0 =C2=A0 |=
=C2=A0 11 +-<br>
              &gt;&gt;=C2=A0 =C2=A0target/i386/hvf/x86hvf.h=C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 -<br>
              &gt;&gt;=C2=A0 =C2=A013 files changed, 619 insertions(+), 569
              deletions(-)<br>
              &gt;&gt;=C2=A0 =C2=A0create mode 100644 accel/hvf/hvf-all.c<b=
r>
              &gt;&gt;=C2=A0 =C2=A0create mode 100644 accel/hvf/hvf-cpus.c<=
br>
              &gt;&gt;=C2=A0 =C2=A0create mode 100644 accel/hvf/meson.build=
<br>
              &gt;&gt;=C2=A0 =C2=A0create mode 100644 include/sysemu/hvf_in=
t.h<br>
              &gt;&gt;=C2=A0 =C2=A0delete mode 100644 target/i386/hvf/hvf-c=
pus.c<br>
              &gt;&gt;=C2=A0 =C2=A0delete mode 100644 target/i386/hvf/hvf-c=
pus.h<br>
              &gt;&gt;<br>
              &gt;&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
              &gt;&gt; index 68bc160f41..ca4b6d9279 100644<br>
              &gt;&gt; --- a/MAINTAINERS<br>
              &gt;&gt; +++ b/MAINTAINERS<br>
              &gt;&gt; @@ -444,9 +444,16 @@ M: Cameron Esfahani &lt;<a href=
=3D"mailto:dirty@apple.com" target=3D"_blank">dirty@apple.com</a>&gt;<br>
              &gt;&gt;=C2=A0 =C2=A0M: Roman Bolshakov &lt;<a href=3D"mailto=
:r.bolshakov@yadro.com" target=3D"_blank">r.bolshakov@yadro.com</a>&gt;<br>
              &gt;&gt;=C2=A0 =C2=A0W: <a href=3D"https://wiki.qemu.org/Feat=
ures/HVF" rel=3D"noreferrer" target=3D"_blank">https://wiki.qemu.org/Featur=
es/HVF</a><br>
              &gt;&gt;=C2=A0 =C2=A0S: Maintained<br>
              &gt;&gt; -F: accel/stubs/hvf-stub.c<br>
              &gt; There was a patch for that in the RFC series from
              Claudio.<br>
              <br>
              <br>
              Yeah, I&#39;m not worried about this hunk :).<br>
              <br>
              <br>
              &gt;<br>
              &gt;&gt;=C2=A0 =C2=A0F: target/i386/hvf/<br>
              &gt;&gt; +<br>
              &gt;&gt; +HVF<br>
              &gt;&gt; +M: Cameron Esfahani &lt;<a href=3D"mailto:dirty@app=
le.com" target=3D"_blank">dirty@apple.com</a>&gt;<br>
              &gt;&gt; +M: Roman Bolshakov &lt;<a href=3D"mailto:r.bolshako=
v@yadro.com" target=3D"_blank">r.bolshakov@yadro.com</a>&gt;<br>
              &gt;&gt; +W: <a href=3D"https://wiki.qemu.org/Features/HVF" r=
el=3D"noreferrer" target=3D"_blank">https://wiki.qemu.org/Features/HVF</a><=
br>
              &gt;&gt; +S: Maintained<br>
              &gt;&gt; +F: accel/hvf/<br>
              &gt;&gt;=C2=A0 =C2=A0F: include/sysemu/hvf.h<br>
              &gt;&gt; +F: include/sysemu/hvf_int.h<br>
              &gt;&gt;=C2=A0 =C2=A0<br>
              &gt;&gt;=C2=A0 =C2=A0WHPX CPUs<br>
              &gt;&gt;=C2=A0 =C2=A0M: Sunil Muthuswamy &lt;<a href=3D"mailt=
o:sunilmut@microsoft.com" target=3D"_blank">sunilmut@microsoft.com</a>&gt;<=
br>
              &gt;&gt; diff --git a/accel/hvf/hvf-all.c
              b/accel/hvf/hvf-all.c<br>
              &gt;&gt; new file mode 100644<br>
              &gt;&gt; index 0000000000..47d77a472a<br>
              &gt;&gt; --- /dev/null<br>
              &gt;&gt; +++ b/accel/hvf/hvf-all.c<br>
              &gt;&gt; @@ -0,0 +1,56 @@<br>
              &gt;&gt; +/*<br>
              &gt;&gt; + * QEMU Hypervisor.framework support<br>
              &gt;&gt; + *<br>
              &gt;&gt; + * This work is licensed under the terms of the
              GNU GPL, version 2.=C2=A0 See<br>
              &gt;&gt; + * the COPYING file in the top-level directory.<br>
              &gt;&gt; + *<br>
              &gt;&gt; + * Contributions after 2012-01-13 are licensed
              under the terms of the<br>
              &gt;&gt; + * GNU GPL, version 2 or (at your option) any
              later version.<br>
              &gt;&gt; + */<br>
              &gt;&gt; +<br>
              &gt;&gt; +#include &quot;qemu/osdep.h&quot;<br>
              &gt;&gt; +#include &quot;qemu-common.h&quot;<br>
              &gt;&gt; +#include &quot;qemu/error-report.h&quot;<br>
              &gt;&gt; +#include &quot;sysemu/hvf.h&quot;<br>
              &gt;&gt; +#include &quot;sysemu/hvf_int.h&quot;<br>
              &gt;&gt; +#include &quot;sysemu/runstate.h&quot;<br>
              &gt;&gt; +<br>
              &gt;&gt; +#include &quot;qemu/main-loop.h&quot;<br>
              &gt;&gt; +#include &quot;sysemu/accel.h&quot;<br>
              &gt;&gt; +<br>
              &gt;&gt; +#include &lt;Hypervisor/Hypervisor.h&gt;<br>
              &gt;&gt; +<br>
              &gt;&gt; +bool hvf_allowed;<br>
              &gt;&gt; +HVFState *hvf_state;<br>
              &gt;&gt; +<br>
              &gt;&gt; +void assert_hvf_ok(hv_return_t ret)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 if (ret =3D=3D HV_SUCCESS) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
              &gt;&gt; +=C2=A0 =C2=A0 }<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 switch (ret) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 case HV_ERROR:<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Erro=
r: HV_ERROR&quot;);<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
              &gt;&gt; +=C2=A0 =C2=A0 case HV_BUSY:<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Erro=
r: HV_BUSY&quot;);<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
              &gt;&gt; +=C2=A0 =C2=A0 case HV_BAD_ARGUMENT:<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Erro=
r: HV_BAD_ARGUMENT&quot;);<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
              &gt;&gt; +=C2=A0 =C2=A0 case HV_NO_RESOURCES:<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Erro=
r: HV_NO_RESOURCES&quot;);<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
              &gt;&gt; +=C2=A0 =C2=A0 case HV_NO_DEVICE:<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Erro=
r: HV_NO_DEVICE&quot;);<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
              &gt;&gt; +=C2=A0 =C2=A0 case HV_UNSUPPORTED:<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Erro=
r: HV_UNSUPPORTED&quot;);<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
              &gt;&gt; +=C2=A0 =C2=A0 default:<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Unkn=
own Error&quot;);<br>
              &gt;&gt; +=C2=A0 =C2=A0 }<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 abort();<br>
              &gt;&gt; +}<br>
              &gt;&gt; diff --git a/accel/hvf/hvf-cpus.c
              b/accel/hvf/hvf-cpus.c<br>
              &gt;&gt; new file mode 100644<br>
              &gt;&gt; index 0000000000..f9bb5502b7<br>
              &gt;&gt; --- /dev/null<br>
              &gt;&gt; +++ b/accel/hvf/hvf-cpus.c<br>
              &gt;&gt; @@ -0,0 +1,468 @@<br>
              &gt;&gt; +/*<br>
              &gt;&gt; + * Copyright 2008 IBM Corporation<br>
              &gt;&gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02008 Red=
 Hat, Inc.<br>
              &gt;&gt; + * Copyright 2011 Intel Corporation<br>
              &gt;&gt; + * Copyright 2016 Veertu, Inc.<br>
              &gt;&gt; + * Copyright 2017 The Android Open Source
              Project<br>
              &gt;&gt; + *<br>
              &gt;&gt; + * QEMU Hypervisor.framework support<br>
              &gt;&gt; + *<br>
              &gt;&gt; + * This program is free software; you can
              redistribute it and/or<br>
              &gt;&gt; + * modify it under the terms of version 2 of the
              GNU General Public<br>
              &gt;&gt; + * License as published by the Free Software
              Foundation.<br>
              &gt;&gt; + *<br>
              &gt;&gt; + * This program is distributed in the hope that
              it will be useful,<br>
              &gt;&gt; + * but WITHOUT ANY WARRANTY; without even the
              implied warranty of<br>
              &gt;&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR
              PURPOSE.=C2=A0 See the GNU<br>
              &gt;&gt; + * General Public License for more details.<br>
              &gt;&gt; + *<br>
              &gt;&gt; + * You should have received a copy of the GNU
              General Public License<br>
              &gt;&gt; + * along with this program; if not, see &lt;<a href=
=3D"http://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http=
://www.gnu.org/licenses/</a>&gt;.<br>
              &gt;&gt; + *<br>
              &gt;&gt; + * This file contain code under public domain
              from the hvdos project:<br>
              &gt;&gt; + * <a href=3D"https://github.com/mist64/hvdos" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/mist64/hvdos</a><br>
              &gt;&gt; + *<br>
              &gt;&gt; + * Parts Copyright (c) 2011 NetApp, Inc.<br>
              &gt;&gt; + * All rights reserved.<br>
              &gt;&gt; + *<br>
              &gt;&gt; + * Redistribution and use in source and binary
              forms, with or without<br>
              &gt;&gt; + * modification, are permitted provided that the
              following conditions<br>
              &gt;&gt; + * are met:<br>
              &gt;&gt; + * 1. Redistributions of source code must retain
              the above copyright<br>
              &gt;&gt; + *=C2=A0 =C2=A0 notice, this list of conditions and=
 the
              following disclaimer.<br>
              &gt;&gt; + * 2. Redistributions in binary form must
              reproduce the above copyright<br>
              &gt;&gt; + *=C2=A0 =C2=A0 notice, this list of conditions and=
 the
              following disclaimer in the<br>
              &gt;&gt; + *=C2=A0 =C2=A0 documentation and/or other material=
s
              provided with the distribution.<br>
              &gt;&gt; + *<br>
              &gt;&gt; + * THIS SOFTWARE IS PROVIDED BY NETAPP, INC ``AS
              IS&#39;&#39; AND<br>
              &gt;&gt; + * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
              BUT NOT LIMITED TO, THE<br>
              &gt;&gt; + * IMPLIED WARRANTIES OF MERCHANTABILITY AND
              FITNESS FOR A PARTICULAR PURPOSE<br>
              &gt;&gt; + * ARE DISCLAIMED.=C2=A0 IN NO EVENT SHALL NETAPP,
              INC OR CONTRIBUTORS BE LIABLE<br>
              &gt;&gt; + * FOR ANY DIRECT, INDIRECT, INCIDENTAL,
              SPECIAL, EXEMPLARY, OR CONSEQUENTIAL<br>
              &gt;&gt; + * DAMAGES (INCLUDING, BUT NOT LIMITED TO,
              PROCUREMENT OF SUBSTITUTE GOODS<br>
              &gt;&gt; + * OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
              OR BUSINESS INTERRUPTION)<br>
              &gt;&gt; + * HOWEVER CAUSED AND ON ANY THEORY OF
              LIABILITY, WHETHER IN CONTRACT, STRICT<br>
              &gt;&gt; + * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
              OTHERWISE) ARISING IN ANY WAY<br>
              &gt;&gt; + * OUT OF THE USE OF THIS SOFTWARE, EVEN IF
              ADVISED OF THE POSSIBILITY OF<br>
              &gt;&gt; + * SUCH DAMAGE.<br>
              &gt;&gt; + */<br>
              &gt;&gt; +<br>
              &gt;&gt; +#include &quot;qemu/osdep.h&quot;<br>
              &gt;&gt; +#include &quot;qemu/error-report.h&quot;<br>
              &gt;&gt; +#include &quot;qemu/main-loop.h&quot;<br>
              &gt;&gt; +#include &quot;exec/address-spaces.h&quot;<br>
              &gt;&gt; +#include &quot;exec/exec-all.h&quot;<br>
              &gt;&gt; +#include &quot;sysemu/cpus.h&quot;<br>
              &gt;&gt; +#include &quot;sysemu/hvf.h&quot;<br>
              &gt;&gt; +#include &quot;sysemu/hvf_int.h&quot;<br>
              &gt;&gt; +#include &quot;sysemu/runstate.h&quot;<br>
              &gt;&gt; +#include &quot;qemu/guest-random.h&quot;<br>
              &gt;&gt; +<br>
              &gt;&gt; +#include &lt;Hypervisor/Hypervisor.h&gt;<br>
              &gt;&gt; +<br>
              &gt;&gt; +/* Memory slots */<br>
              &gt;&gt; +<br>
              &gt;&gt; +struct mac_slot {<br>
              &gt;&gt; +=C2=A0 =C2=A0 int present;<br>
              &gt;&gt; +=C2=A0 =C2=A0 uint64_t size;<br>
              &gt;&gt; +=C2=A0 =C2=A0 uint64_t gpa_start;<br>
              &gt;&gt; +=C2=A0 =C2=A0 uint64_t gva;<br>
              &gt;&gt; +};<br>
              &gt;&gt; +<br>
              &gt;&gt; +hvf_slot *hvf_find_overlap_slot(uint64_t start,
              uint64_t size)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 hvf_slot *slot;<br>
              &gt;&gt; +=C2=A0 =C2=A0 int x;<br>
              &gt;&gt; +=C2=A0 =C2=A0 for (x =3D 0; x &lt; hvf_state-&gt;nu=
m_slots;
              ++x) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 slot =3D &amp;hvf_state=
-&gt;slots[x];<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (slot-&gt;size &amp;=
&amp; start &lt;
              (slot-&gt;start + slot-&gt;size) &amp;&amp;<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (start + =
size) &gt; slot-&gt;start)
              {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return sl=
ot;<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
              &gt;&gt; +=C2=A0 =C2=A0 }<br>
              &gt;&gt; +=C2=A0 =C2=A0 return NULL;<br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +struct mac_slot mac_slots[32];<br>
              &gt;&gt; +<br>
              &gt;&gt; +static int do_hvf_set_memory(hvf_slot *slot,
              hv_memory_flags_t flags)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 struct mac_slot *macslot;<br>
              &gt;&gt; +=C2=A0 =C2=A0 hv_return_t ret;<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 macslot =3D &amp;mac_slots[slot-&gt;s=
lot_id];<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 if (macslot-&gt;present) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (macslot-&gt;size !=
=3D slot-&gt;size) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 macslot-&=
gt;present =3D 0;<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D
              hv_vm_unmap(macslot-&gt;gpa_start, macslot-&gt;size);<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_hv=
f_ok(ret);<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
              &gt;&gt; +=C2=A0 =C2=A0 }<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 if (!slot-&gt;size) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
              &gt;&gt; +=C2=A0 =C2=A0 }<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 macslot-&gt;present =3D 1;<br>
              &gt;&gt; +=C2=A0 =C2=A0 macslot-&gt;gpa_start =3D slot-&gt;st=
art;<br>
              &gt;&gt; +=C2=A0 =C2=A0 macslot-&gt;size =3D slot-&gt;size;<b=
r>
              &gt;&gt; +=C2=A0 =C2=A0 ret =3D hv_vm_map(slot-&gt;mem,
              slot-&gt;start, slot-&gt;size, flags);<br>
              &gt;&gt; +=C2=A0 =C2=A0 assert_hvf_ok(ret);<br>
              &gt;&gt; +=C2=A0 =C2=A0 return 0;<br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static void hvf_set_phys_mem(MemoryRegionSection
              *section, bool add)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 hvf_slot *mem;<br>
              &gt;&gt; +=C2=A0 =C2=A0 MemoryRegion *area =3D section-&gt;mr=
;<br>
              &gt;&gt; +=C2=A0 =C2=A0 bool writeable =3D !area-&gt;readonly
              &amp;&amp; !area-&gt;rom_device;<br>
              &gt;&gt; +=C2=A0 =C2=A0 hv_memory_flags_t flags;<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 if (!memory_region_is_ram(area)) {<br=
>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (writeable) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<b=
r>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!memory_regi=
on_is_romd(area))
              {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* I=
f the memory device is not in
              romd_mode, then we actually want<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* t=
o remove the hvf memory slot so
              all accesses will trap.<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<=
br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add=
 =3D false;<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
              &gt;&gt; +=C2=A0 =C2=A0 }<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 mem =3D hvf_find_overlap_slot(<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              section-&gt;offset_within_address_space,<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int128_ge=
t64(section-&gt;size));<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 if (mem &amp;&amp; add) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mem-&gt;size =3D=3D
              int128_get64(section-&gt;size) &amp;&amp;<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem-&gt;s=
tart =3D=3D
              section-&gt;offset_within_address_space &amp;&amp;<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem-&gt;m=
em =3D=3D
              (memory_region_get_ram_ptr(area) +<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 section-&=
gt;offset_within_region)) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return; /=
* Same region was attempted
              to register, go away. */<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
              &gt;&gt; +=C2=A0 =C2=A0 }<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 /* Region needs to be reset. set the =
size to
              0 and remap it. */<br>
              &gt;&gt; +=C2=A0 =C2=A0 if (mem) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mem-&gt;size =3D 0;<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (do_hvf_set_memory(m=
em, 0)) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_rep=
ort(&quot;Failed to reset
              overlapping slot&quot;);<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<=
br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
              &gt;&gt; +=C2=A0 =C2=A0 }<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 if (!add) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
              &gt;&gt; +=C2=A0 =C2=A0 }<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 if (area-&gt;readonly ||<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (!memory_region_is_ram(=
area) &amp;&amp;
              memory_region_is_romd(area))) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags =3D HV_MEMORY_REA=
D | HV_MEMORY_EXEC;<br>
              &gt;&gt; +=C2=A0 =C2=A0 } else {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags =3D HV_MEMORY_REA=
D | HV_MEMORY_WRITE
              | HV_MEMORY_EXEC;<br>
              &gt;&gt; +=C2=A0 =C2=A0 }<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 /* Now make a new slot. */<br>
              &gt;&gt; +=C2=A0 =C2=A0 int x;<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 for (x =3D 0; x &lt; hvf_state-&gt;nu=
m_slots;
              ++x) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mem =3D &amp;hvf_state-=
&gt;slots[x];<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!mem-&gt;size) {<br=
>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br=
>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
              &gt;&gt; +=C2=A0 =C2=A0 }<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 if (x =3D=3D hvf_state-&gt;num_slots)=
 {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;No f=
ree slots&quot;);<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
              &gt;&gt; +=C2=A0 =C2=A0 }<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 mem-&gt;size =3D
              int128_get64(section-&gt;size);<br>
              &gt;&gt; +=C2=A0 =C2=A0 mem-&gt;mem =3D
              memory_region_get_ram_ptr(area) +
              section-&gt;offset_within_region;<br>
              &gt;&gt; +=C2=A0 =C2=A0 mem-&gt;start =3D
              section-&gt;offset_within_address_space;<br>
              &gt;&gt; +=C2=A0 =C2=A0 mem-&gt;region =3D area;<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 if (do_hvf_set_memory(mem, flags)) {<=
br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Erro=
r registering new
              memory slot&quot;);<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
              &gt;&gt; +=C2=A0 =C2=A0 }<br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static void
              hvf_set_dirty_tracking(MemoryRegionSection *section, bool
              on)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 hvf_slot *slot;<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 slot =3D hvf_find_overlap_slot(<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              section-&gt;offset_within_address_space,<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int128_ge=
t64(section-&gt;size));<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 /* protect region against writes; beg=
in
              tracking it */<br>
              &gt;&gt; +=C2=A0 =C2=A0 if (on) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 slot-&gt;flags |=3D HVF=
_SLOT_LOG;<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hv_vm_protect((uintptr_=
t)slot-&gt;start,
              (size_t)slot-&gt;size,<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 HV_MEMORY_READ);<br>
              &gt;&gt; +=C2=A0 =C2=A0 /* stop tracking region*/<br>
              &gt;&gt; +=C2=A0 =C2=A0 } else {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 slot-&gt;flags &amp;=3D=
 ~HVF_SLOT_LOG;<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hv_vm_protect((uintptr_=
t)slot-&gt;start,
              (size_t)slot-&gt;size,<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 HV_MEMORY_READ |
              HV_MEMORY_WRITE);<br>
              &gt;&gt; +=C2=A0 =C2=A0 }<br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static void hvf_log_start(MemoryListener
              *listener,<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MemoryRegionSection
              *section, int old, int new)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 if (old !=3D 0) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
              &gt;&gt; +=C2=A0 =C2=A0 }<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 hvf_set_dirty_tracking(section, 1);<b=
r>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static void hvf_log_stop(MemoryListener
              *listener,<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegionSection
              *section, int old, int new)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 if (new !=3D 0) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
              &gt;&gt; +=C2=A0 =C2=A0 }<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 hvf_set_dirty_tracking(section, 0);<b=
r>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static void hvf_log_sync(MemoryListener
              *listener,<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegionSection
              *section)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 /*<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0* sync of dirty pages is handle=
d elsewhere;
              just make sure we keep<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0* tracking the region.<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
              &gt;&gt; +=C2=A0 =C2=A0 hvf_set_dirty_tracking(section, 1);<b=
r>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static void hvf_region_add(MemoryListener
              *listener,<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegionSection
              *section)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 hvf_set_phys_mem(section, true);<br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static void hvf_region_del(MemoryListener
              *listener,<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegionSection
              *section)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 hvf_set_phys_mem(section, false);<br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static MemoryListener hvf_memory_listener =3D {<br>
              &gt;&gt; +=C2=A0 =C2=A0 .priority =3D 10,<br>
              &gt;&gt; +=C2=A0 =C2=A0 .region_add =3D hvf_region_add,<br>
              &gt;&gt; +=C2=A0 =C2=A0 .region_del =3D hvf_region_del,<br>
              &gt;&gt; +=C2=A0 =C2=A0 .log_start =3D hvf_log_start,<br>
              &gt;&gt; +=C2=A0 =C2=A0 .log_stop =3D hvf_log_stop,<br>
              &gt;&gt; +=C2=A0 =C2=A0 .log_sync =3D hvf_log_sync,<br>
              &gt;&gt; +};<br>
              &gt;&gt; +<br>
              &gt;&gt; +static void
              do_hvf_cpu_synchronize_state(CPUState *cpu,
              run_on_cpu_data arg)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 if (!cpu-&gt;vcpu_dirty) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hvf_get_registers(cpu);=
<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;vcpu_dirty =3D =
true;<br>
              &gt;&gt; +=C2=A0 =C2=A0 }<br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static void hvf_cpu_synchronize_state(CPUState
              *cpu)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 if (!cpu-&gt;vcpu_dirty) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 run_on_cpu(cpu,
              do_hvf_cpu_synchronize_state, RUN_ON_CPU_NULL);<br>
              &gt;&gt; +=C2=A0 =C2=A0 }<br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static void
              do_hvf_cpu_synchronize_post_reset(CPUState *cpu,<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              run_on_cpu_data arg)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 hvf_put_registers(cpu);<br>
              &gt;&gt; +=C2=A0 =C2=A0 cpu-&gt;vcpu_dirty =3D false;<br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static void
              hvf_cpu_synchronize_post_reset(CPUState *cpu)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 run_on_cpu(cpu,
              do_hvf_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);<br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static void
              do_hvf_cpu_synchronize_post_init(CPUState *cpu,<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              =C2=A0run_on_cpu_data arg)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 hvf_put_registers(cpu);<br>
              &gt;&gt; +=C2=A0 =C2=A0 cpu-&gt;vcpu_dirty =3D false;<br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static void
              hvf_cpu_synchronize_post_init(CPUState *cpu)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 run_on_cpu(cpu,
              do_hvf_cpu_synchronize_post_init, RUN_ON_CPU_NULL);<br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static void
              do_hvf_cpu_synchronize_pre_loadvm(CPUState *cpu,<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              run_on_cpu_data arg)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 cpu-&gt;vcpu_dirty =3D true;<br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static void
              hvf_cpu_synchronize_pre_loadvm(CPUState *cpu)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 run_on_cpu(cpu,
              do_hvf_cpu_synchronize_pre_loadvm, RUN_ON_CPU_NULL);<br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static void hvf_vcpu_destroy(CPUState *cpu)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 hv_return_t ret =3D
              hv_vcpu_destroy(cpu-&gt;hvf_fd);<br>
              &gt;&gt; +=C2=A0 =C2=A0 assert_hvf_ok(ret);<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 hvf_arch_vcpu_destroy(cpu);<br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static void dummy_signal(int sig)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static int hvf_init_vcpu(CPUState *cpu)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 int r;<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 /* init cpu signals */<br>
              &gt;&gt; +=C2=A0 =C2=A0 sigset_t set;<br>
              &gt;&gt; +=C2=A0 =C2=A0 struct sigaction sigact;<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 memset(&amp;sigact, 0, sizeof(sigact)=
);<br>
              &gt;&gt; +=C2=A0 =C2=A0 sigact.sa_handler =3D dummy_signal;<b=
r>
              &gt;&gt; +=C2=A0 =C2=A0 sigaction(SIG_IPI, &amp;sigact, NULL)=
;<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 pthread_sigmask(SIG_BLOCK, NULL, &amp=
;set);<br>
              &gt;&gt; +=C2=A0 =C2=A0 sigdelset(&amp;set, SIG_IPI);<br>
              &gt;&gt; +<br>
              &gt;&gt; +#ifdef __aarch64__<br>
              &gt;&gt; +=C2=A0 =C2=A0 r =3D hv_vcpu_create(&amp;cpu-&gt;hvf=
_fd,
              (hv_vcpu_exit_t **)&amp;cpu-&gt;hvf_exit, NULL);<br>
              &gt;&gt; +#else<br>
              &gt;&gt; +=C2=A0 =C2=A0 r =3D hv_vcpu_create((hv_vcpuid_t
              *)&amp;cpu-&gt;hvf_fd, HV_VCPU_DEFAULT);<br>
              &gt;&gt; +#endif<br>
              &gt; I think the first __aarch64__ bit fits better to arm
              part of the series.<br>
              <br>
              <br>
              Oops. Thanks for catching it! Yes, absolutely. It should
              be part of the <br>
              ARM enablement.<br>
              <br>
              <br>
              &gt;<br>
              &gt;&gt; +=C2=A0 =C2=A0 cpu-&gt;vcpu_dirty =3D 1;<br>
              &gt;&gt; +=C2=A0 =C2=A0 assert_hvf_ok(r);<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 return hvf_arch_init_vcpu(cpu);<br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +/*<br>
              &gt;&gt; + * The HVF-specific vCPU thread function. This
              one should only run when the host<br>
              &gt;&gt; + * CPU supports the VMX &quot;unrestricted guest&qu=
ot;
              feature.<br>
              &gt;&gt; + */<br>
              &gt;&gt; +static void *hvf_cpu_thread_fn(void *arg)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 CPUState *cpu =3D arg;<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 int r;<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 assert(hvf_enabled());<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 rcu_register_thread();<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
              &gt;&gt; +=C2=A0 =C2=A0 qemu_thread_get_self(cpu-&gt;thread);=
<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 cpu-&gt;thread_id =3D qemu_get_thread=
_id();<br>
              &gt;&gt; +=C2=A0 =C2=A0 cpu-&gt;can_do_io =3D 1;<br>
              &gt;&gt; +=C2=A0 =C2=A0 current_cpu =3D cpu;<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 hvf_init_vcpu(cpu);<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 /* signal CPU creation */<br>
              &gt;&gt; +=C2=A0 =C2=A0 cpu_thread_signal_created(cpu);<br>
              &gt;&gt; +=C2=A0 =C2=A0
              qemu_guest_random_seed_thread_part2(cpu-&gt;random_seed);<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 do {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu_can_run(cpu)) {=
<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D hvf=
_vcpu_exec(cpu);<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r =3D=
=3D EXCP_DEBUG) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cpu_handle_guest_debug(cpu);<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_wait_io_event(cpu)=
;<br>
              &gt;&gt; +=C2=A0 =C2=A0 } while (!cpu-&gt;unplug ||
              cpu_can_run(cpu));<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 hvf_vcpu_destroy(cpu);<br>
              &gt;&gt; +=C2=A0 =C2=A0 cpu_thread_signal_destroyed(cpu);<br>
              &gt;&gt; +=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
              &gt;&gt; +=C2=A0 =C2=A0 rcu_unregister_thread();<br>
              &gt;&gt; +=C2=A0 =C2=A0 return NULL;<br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static void hvf_start_vcpu_thread(CPUState *cpu)<br=
>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 char thread_name[VCPU_THREAD_NAME_SIZ=
E];<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 /*<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0* HVF currently does not suppor=
t TCG, and
              only runs in<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0* unrestricted-guest mode.<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
              &gt;&gt; +=C2=A0 =C2=A0 assert(hvf_enabled());<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 cpu-&gt;thread =3D
              g_malloc0(sizeof(QemuThread));<br>
              &gt;&gt; +=C2=A0 =C2=A0 cpu-&gt;halt_cond =3D
              g_malloc0(sizeof(QemuCond));<br>
              &gt;&gt; +=C2=A0 =C2=A0 qemu_cond_init(cpu-&gt;halt_cond);<br=
>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 snprintf(thread_name, VCPU_THREAD_NAM=
E_SIZE,
              &quot;CPU %d/HVF&quot;,<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu=
-&gt;cpu_index);<br>
              &gt;&gt; +=C2=A0 =C2=A0 qemu_thread_create(cpu-&gt;thread,
              thread_name, hvf_cpu_thread_fn,<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu,
              QEMU_THREAD_JOINABLE);<br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static const CpusAccel hvf_cpus =3D {<br>
              &gt;&gt; +=C2=A0 =C2=A0 .create_vcpu_thread =3D hvf_start_vcp=
u_thread,<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 .synchronize_post_reset =3D
              hvf_cpu_synchronize_post_reset,<br>
              &gt;&gt; +=C2=A0 =C2=A0 .synchronize_post_init =3D
              hvf_cpu_synchronize_post_init,<br>
              &gt;&gt; +=C2=A0 =C2=A0 .synchronize_state =3D
              hvf_cpu_synchronize_state,<br>
              &gt;&gt; +=C2=A0 =C2=A0 .synchronize_pre_loadvm =3D
              hvf_cpu_synchronize_pre_loadvm,<br>
              &gt;&gt; +};<br>
              &gt;&gt; +<br>
              &gt;&gt; +static int hvf_accel_init(MachineState *ms)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 int x;<br>
              &gt;&gt; +=C2=A0 =C2=A0 hv_return_t ret;<br>
              &gt;&gt; +=C2=A0 =C2=A0 HVFState *s;<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 ret =3D hv_vm_create(HV_VM_DEFAULT);<=
br>
              &gt;&gt; +=C2=A0 =C2=A0 assert_hvf_ok(ret);<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 s =3D g_new0(HVFState, 1);<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 s-&gt;num_slots =3D 32;<br>
              &gt;&gt; +=C2=A0 =C2=A0 for (x =3D 0; x &lt; s-&gt;num_slots;=
 ++x) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;slots[x].size =3D=
 0;<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;slots[x].slot_id =
=3D x;<br>
              &gt;&gt; +=C2=A0 =C2=A0 }<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 hvf_state =3D s;<br>
              &gt;&gt; +=C2=A0 =C2=A0
              memory_listener_register(&amp;hvf_memory_listener,
              &amp;address_space_memory);<br>
              &gt;&gt; +=C2=A0 =C2=A0 cpus_register_accel(&amp;hvf_cpus);<b=
r>
              &gt;&gt; +=C2=A0 =C2=A0 return 0;<br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static void hvf_accel_class_init(ObjectClass
              *oc, void *data)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 AccelClass *ac =3D ACCEL_CLASS(oc);<b=
r>
              &gt;&gt; +=C2=A0 =C2=A0 ac-&gt;name =3D &quot;HVF&quot;;<br>
              &gt;&gt; +=C2=A0 =C2=A0 ac-&gt;init_machine =3D hvf_accel_ini=
t;<br>
              &gt;&gt; +=C2=A0 =C2=A0 ac-&gt;allowed =3D &amp;hvf_allowed;<=
br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +static const TypeInfo hvf_accel_type =3D {<br>
              &gt;&gt; +=C2=A0 =C2=A0 .name =3D TYPE_HVF_ACCEL,<br>
              &gt;&gt; +=C2=A0 =C2=A0 .parent =3D TYPE_ACCEL,<br>
              &gt;&gt; +=C2=A0 =C2=A0 .class_init =3D hvf_accel_class_init,=
<br>
              &gt;&gt; +};<br>
              &gt;&gt; +<br>
              &gt;&gt; +static void hvf_type_init(void)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +=C2=A0 =C2=A0 type_register_static(&amp;hvf_accel_t=
ype);<br>
              &gt;&gt; +}<br>
              &gt;&gt; +<br>
              &gt;&gt; +type_init(hvf_type_init);<br>
              &gt;&gt; diff --git a/accel/hvf/meson.build
              b/accel/hvf/meson.build<br>
              &gt;&gt; new file mode 100644<br>
              &gt;&gt; index 0000000000..dfd6b68dc7<br>
              &gt;&gt; --- /dev/null<br>
              &gt;&gt; +++ b/accel/hvf/meson.build<br>
              &gt;&gt; @@ -0,0 +1,7 @@<br>
              &gt;&gt; +hvf_ss =3D ss.source_set()<br>
              &gt;&gt; +hvf_ss.add(files(<br>
              &gt;&gt; +=C2=A0 &#39;hvf-all.c&#39;,<br>
              &gt;&gt; +=C2=A0 &#39;hvf-cpus.c&#39;,<br>
              &gt;&gt; +))<br>
              &gt;&gt; +<br>
              &gt;&gt; +specific_ss.add_all(when: &#39;CONFIG_HVF&#39;, if_=
true:
              hvf_ss)<br>
              &gt;&gt; diff --git a/accel/meson.build
              b/accel/meson.build<br>
              &gt;&gt; index b26cca227a..6de12ce5d5 100644<br>
              &gt;&gt; --- a/accel/meson.build<br>
              &gt;&gt; +++ b/accel/meson.build<br>
              &gt;&gt; @@ -1,5 +1,6 @@<br>
              &gt;&gt;=C2=A0 =C2=A0softmmu_ss.add(files(&#39;accel.c&#39;))=
<br>
              &gt;&gt;=C2=A0 =C2=A0<br>
              &gt;&gt; +subdir(&#39;hvf&#39;)<br>
              &gt;&gt;=C2=A0 =C2=A0subdir(&#39;qtest&#39;)<br>
              &gt;&gt;=C2=A0 =C2=A0subdir(&#39;kvm&#39;)<br>
              &gt;&gt;=C2=A0 =C2=A0subdir(&#39;tcg&#39;)<br>
              &gt;&gt; diff --git a/include/sysemu/hvf_int.h
              b/include/sysemu/hvf_int.h<br>
              &gt;&gt; new file mode 100644<br>
              &gt;&gt; index 0000000000..de9bad23a8<br>
              &gt;&gt; --- /dev/null<br>
              &gt;&gt; +++ b/include/sysemu/hvf_int.h<br>
              &gt;&gt; @@ -0,0 +1,69 @@<br>
              &gt;&gt; +/*<br>
              &gt;&gt; + * QEMU Hypervisor.framework (HVF) support<br>
              &gt;&gt; + *<br>
              &gt;&gt; + * This work is licensed under the terms of the
              GNU GPL, version 2 or later.<br>
              &gt;&gt; + * See the COPYING file in the top-level
              directory.<br>
              &gt;&gt; + *<br>
              &gt;&gt; + */<br>
              &gt;&gt; +<br>
              &gt;&gt; +/* header to be included in HVF-specific code */<br=
>
              &gt;&gt; +<br>
              &gt;&gt; +#ifndef HVF_INT_H<br>
              &gt;&gt; +#define HVF_INT_H<br>
              &gt;&gt; +<br>
              &gt;&gt; +#include &lt;Hypervisor/Hypervisor.h&gt;<br>
              &gt;&gt; +<br>
              &gt;&gt; +#define HVF_MAX_VCPU 0x10<br>
              &gt;&gt; +<br>
              &gt;&gt; +extern struct hvf_state hvf_global;<br>
              &gt;&gt; +<br>
              &gt;&gt; +struct hvf_vm {<br>
              &gt;&gt; +=C2=A0 =C2=A0 int id;<br>
              &gt;&gt; +=C2=A0 =C2=A0 struct hvf_vcpu_state *vcpus[HVF_MAX_=
VCPU];<br>
              &gt;&gt; +};<br>
              &gt;&gt; +<br>
              &gt;&gt; +struct hvf_state {<br>
              &gt;&gt; +=C2=A0 =C2=A0 uint32_t version;<br>
              &gt;&gt; +=C2=A0 =C2=A0 struct hvf_vm *vm;<br>
              &gt;&gt; +=C2=A0 =C2=A0 uint64_t mem_quota;<br>
              &gt;&gt; +};<br>
              &gt;&gt; +<br>
              &gt;&gt; +/* hvf_slot flags */<br>
              &gt;&gt; +#define HVF_SLOT_LOG (1 &lt;&lt; 0)<br>
              &gt;&gt; +<br>
              &gt;&gt; +typedef struct hvf_slot {<br>
              &gt;&gt; +=C2=A0 =C2=A0 uint64_t start;<br>
              &gt;&gt; +=C2=A0 =C2=A0 uint64_t size;<br>
              &gt;&gt; +=C2=A0 =C2=A0 uint8_t *mem;<br>
              &gt;&gt; +=C2=A0 =C2=A0 int slot_id;<br>
              &gt;&gt; +=C2=A0 =C2=A0 uint32_t flags;<br>
              &gt;&gt; +=C2=A0 =C2=A0 MemoryRegion *region;<br>
              &gt;&gt; +} hvf_slot;<br>
              &gt;&gt; +<br>
              &gt;&gt; +typedef struct hvf_vcpu_caps {<br>
              &gt;&gt; +=C2=A0 =C2=A0 uint64_t vmx_cap_pinbased;<br>
              &gt;&gt; +=C2=A0 =C2=A0 uint64_t vmx_cap_procbased;<br>
              &gt;&gt; +=C2=A0 =C2=A0 uint64_t vmx_cap_procbased2;<br>
              &gt;&gt; +=C2=A0 =C2=A0 uint64_t vmx_cap_entry;<br>
              &gt;&gt; +=C2=A0 =C2=A0 uint64_t vmx_cap_exit;<br>
              &gt;&gt; +=C2=A0 =C2=A0 uint64_t vmx_cap_preemption_timer;<br=
>
              &gt;&gt; +} hvf_vcpu_caps;<br>
              &gt;&gt; +<br>
              &gt;&gt; +struct HVFState {<br>
              &gt;&gt; +=C2=A0 =C2=A0 AccelState parent;<br>
              &gt;&gt; +=C2=A0 =C2=A0 hvf_slot slots[32];<br>
              &gt;&gt; +=C2=A0 =C2=A0 int num_slots;<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 hvf_vcpu_caps *hvf_caps;<br>
              &gt;&gt; +};<br>
              &gt;&gt; +extern HVFState *hvf_state;<br>
              &gt;&gt; +<br>
              &gt;&gt; +void assert_hvf_ok(hv_return_t ret);<br>
              &gt;&gt; +int hvf_get_registers(CPUState *cpu);<br>
              &gt;&gt; +int hvf_put_registers(CPUState *cpu);<br>
              &gt;&gt; +int hvf_arch_init_vcpu(CPUState *cpu);<br>
              &gt;&gt; +void hvf_arch_vcpu_destroy(CPUState *cpu);<br>
              &gt;&gt; +int hvf_vcpu_exec(CPUState *cpu);<br>
              &gt;&gt; +hvf_slot *hvf_find_overlap_slot(uint64_t,
              uint64_t);<br>
              &gt;&gt; +<br>
              &gt;&gt; +#endif<br>
              &gt;&gt; diff --git a/target/i386/hvf/hvf-cpus.c
              b/target/i386/hvf/hvf-cpus.c<br>
              &gt;&gt; deleted file mode 100644<br>
              &gt;&gt; index 817b3d7452..0000000000<br>
              &gt;&gt; --- a/target/i386/hvf/hvf-cpus.c<br>
              &gt;&gt; +++ /dev/null<br>
              &gt;&gt; @@ -1,131 +0,0 @@<br>
              &gt;&gt; -/*<br>
              &gt;&gt; - * Copyright 2008 IBM Corporation<br>
              &gt;&gt; - *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02008 Red=
 Hat, Inc.<br>
              &gt;&gt; - * Copyright 2011 Intel Corporation<br>
              &gt;&gt; - * Copyright 2016 Veertu, Inc.<br>
              &gt;&gt; - * Copyright 2017 The Android Open Source
              Project<br>
              &gt;&gt; - *<br>
              &gt;&gt; - * QEMU Hypervisor.framework support<br>
              &gt;&gt; - *<br>
              &gt;&gt; - * This program is free software; you can
              redistribute it and/or<br>
              &gt;&gt; - * modify it under the terms of version 2 of the
              GNU General Public<br>
              &gt;&gt; - * License as published by the Free Software
              Foundation.<br>
              &gt;&gt; - *<br>
              &gt;&gt; - * This program is distributed in the hope that
              it will be useful,<br>
              &gt;&gt; - * but WITHOUT ANY WARRANTY; without even the
              implied warranty of<br>
              &gt;&gt; - * MERCHANTABILITY or FITNESS FOR A PARTICULAR
              PURPOSE.=C2=A0 See the GNU<br>
              &gt;&gt; - * General Public License for more details.<br>
              &gt;&gt; - *<br>
              &gt;&gt; - * You should have received a copy of the GNU
              General Public License<br>
              &gt;&gt; - * along with this program; if not, see &lt;<a href=
=3D"http://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http=
://www.gnu.org/licenses/</a>&gt;.<br>
              &gt;&gt; - *<br>
              &gt;&gt; - * This file contain code under public domain
              from the hvdos project:<br>
              &gt;&gt; - * <a href=3D"https://github.com/mist64/hvdos" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/mist64/hvdos</a><br>
              &gt;&gt; - *<br>
              &gt;&gt; - * Parts Copyright (c) 2011 NetApp, Inc.<br>
              &gt;&gt; - * All rights reserved.<br>
              &gt;&gt; - *<br>
              &gt;&gt; - * Redistribution and use in source and binary
              forms, with or without<br>
              &gt;&gt; - * modification, are permitted provided that the
              following conditions<br>
              &gt;&gt; - * are met:<br>
              &gt;&gt; - * 1. Redistributions of source code must retain
              the above copyright<br>
              &gt;&gt; - *=C2=A0 =C2=A0 notice, this list of conditions and=
 the
              following disclaimer.<br>
              &gt;&gt; - * 2. Redistributions in binary form must
              reproduce the above copyright<br>
              &gt;&gt; - *=C2=A0 =C2=A0 notice, this list of conditions and=
 the
              following disclaimer in the<br>
              &gt;&gt; - *=C2=A0 =C2=A0 documentation and/or other material=
s
              provided with the distribution.<br>
              &gt;&gt; - *<br>
              &gt;&gt; - * THIS SOFTWARE IS PROVIDED BY NETAPP, INC ``AS
              IS&#39;&#39; AND<br>
              &gt;&gt; - * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
              BUT NOT LIMITED TO, THE<br>
              &gt;&gt; - * IMPLIED WARRANTIES OF MERCHANTABILITY AND
              FITNESS FOR A PARTICULAR PURPOSE<br>
              &gt;&gt; - * ARE DISCLAIMED.=C2=A0 IN NO EVENT SHALL NETAPP,
              INC OR CONTRIBUTORS BE LIABLE<br>
              &gt;&gt; - * FOR ANY DIRECT, INDIRECT, INCIDENTAL,
              SPECIAL, EXEMPLARY, OR CONSEQUENTIAL<br>
              &gt;&gt; - * DAMAGES (INCLUDING, BUT NOT LIMITED TO,
              PROCUREMENT OF SUBSTITUTE GOODS<br>
              &gt;&gt; - * OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
              OR BUSINESS INTERRUPTION)<br>
              &gt;&gt; - * HOWEVER CAUSED AND ON ANY THEORY OF
              LIABILITY, WHETHER IN CONTRACT, STRICT<br>
              &gt;&gt; - * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
              OTHERWISE) ARISING IN ANY WAY<br>
              &gt;&gt; - * OUT OF THE USE OF THIS SOFTWARE, EVEN IF
              ADVISED OF THE POSSIBILITY OF<br>
              &gt;&gt; - * SUCH DAMAGE.<br>
              &gt;&gt; - */<br>
              &gt;&gt; -<br>
              &gt;&gt; -#include &quot;qemu/osdep.h&quot;<br>
              &gt;&gt; -#include &quot;qemu/error-report.h&quot;<br>
              &gt;&gt; -#include &quot;qemu/main-loop.h&quot;<br>
              &gt;&gt; -#include &quot;sysemu/hvf.h&quot;<br>
              &gt;&gt; -#include &quot;sysemu/runstate.h&quot;<br>
              &gt;&gt; -#include &quot;target/i386/cpu.h&quot;<br>
              &gt;&gt; -#include &quot;qemu/guest-random.h&quot;<br>
              &gt;&gt; -<br>
              &gt;&gt; -#include &quot;hvf-cpus.h&quot;<br>
              &gt;&gt; -<br>
              &gt;&gt; -/*<br>
              &gt;&gt; - * The HVF-specific vCPU thread function. This
              one should only run when the host<br>
              &gt;&gt; - * CPU supports the VMX &quot;unrestricted guest&qu=
ot;
              feature.<br>
              &gt;&gt; - */<br>
              &gt;&gt; -static void *hvf_cpu_thread_fn(void *arg)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 CPUState *cpu =3D arg;<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 int r;<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 assert(hvf_enabled());<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 rcu_register_thread();<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
              &gt;&gt; -=C2=A0 =C2=A0 qemu_thread_get_self(cpu-&gt;thread);=
<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 cpu-&gt;thread_id =3D qemu_get_thread=
_id();<br>
              &gt;&gt; -=C2=A0 =C2=A0 cpu-&gt;can_do_io =3D 1;<br>
              &gt;&gt; -=C2=A0 =C2=A0 current_cpu =3D cpu;<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 hvf_init_vcpu(cpu);<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 /* signal CPU creation */<br>
              &gt;&gt; -=C2=A0 =C2=A0 cpu_thread_signal_created(cpu);<br>
              &gt;&gt; -=C2=A0 =C2=A0
              qemu_guest_random_seed_thread_part2(cpu-&gt;random_seed);<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 do {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu_can_run(cpu)) {=
<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D hvf=
_vcpu_exec(cpu);<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r =3D=
=3D EXCP_DEBUG) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cpu_handle_guest_debug(cpu);<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_wait_io_event(cpu)=
;<br>
              &gt;&gt; -=C2=A0 =C2=A0 } while (!cpu-&gt;unplug ||
              cpu_can_run(cpu));<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 hvf_vcpu_destroy(cpu);<br>
              &gt;&gt; -=C2=A0 =C2=A0 cpu_thread_signal_destroyed(cpu);<br>
              &gt;&gt; -=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
              &gt;&gt; -=C2=A0 =C2=A0 rcu_unregister_thread();<br>
              &gt;&gt; -=C2=A0 =C2=A0 return NULL;<br>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -static void hvf_start_vcpu_thread(CPUState *cpu)<br=
>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 char thread_name[VCPU_THREAD_NAME_SIZ=
E];<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 /*<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0* HVF currently does not suppor=
t TCG, and
              only runs in<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0* unrestricted-guest mode.<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0*/<br>
              &gt;&gt; -=C2=A0 =C2=A0 assert(hvf_enabled());<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 cpu-&gt;thread =3D
              g_malloc0(sizeof(QemuThread));<br>
              &gt;&gt; -=C2=A0 =C2=A0 cpu-&gt;halt_cond =3D
              g_malloc0(sizeof(QemuCond));<br>
              &gt;&gt; -=C2=A0 =C2=A0 qemu_cond_init(cpu-&gt;halt_cond);<br=
>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 snprintf(thread_name, VCPU_THREAD_NAM=
E_SIZE,
              &quot;CPU %d/HVF&quot;,<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu=
-&gt;cpu_index);<br>
              &gt;&gt; -=C2=A0 =C2=A0 qemu_thread_create(cpu-&gt;thread,
              thread_name, hvf_cpu_thread_fn,<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu,
              QEMU_THREAD_JOINABLE);<br>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -const CpusAccel hvf_cpus =3D {<br>
              &gt;&gt; -=C2=A0 =C2=A0 .create_vcpu_thread =3D hvf_start_vcp=
u_thread,<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 .synchronize_post_reset =3D
              hvf_cpu_synchronize_post_reset,<br>
              &gt;&gt; -=C2=A0 =C2=A0 .synchronize_post_init =3D
              hvf_cpu_synchronize_post_init,<br>
              &gt;&gt; -=C2=A0 =C2=A0 .synchronize_state =3D
              hvf_cpu_synchronize_state,<br>
              &gt;&gt; -=C2=A0 =C2=A0 .synchronize_pre_loadvm =3D
              hvf_cpu_synchronize_pre_loadvm,<br>
              &gt;&gt; -};<br>
              &gt;&gt; diff --git a/target/i386/hvf/hvf-cpus.h
              b/target/i386/hvf/hvf-cpus.h<br>
              &gt;&gt; deleted file mode 100644<br>
              &gt;&gt; index ced31b82c0..0000000000<br>
              &gt;&gt; --- a/target/i386/hvf/hvf-cpus.h<br>
              &gt;&gt; +++ /dev/null<br>
              &gt;&gt; @@ -1,25 +0,0 @@<br>
              &gt;&gt; -/*<br>
              &gt;&gt; - * Accelerator CPUS Interface<br>
              &gt;&gt; - *<br>
              &gt;&gt; - * Copyright 2020 SUSE LLC<br>
              &gt;&gt; - *<br>
              &gt;&gt; - * This work is licensed under the terms of the
              GNU GPL, version 2 or later.<br>
              &gt;&gt; - * See the COPYING file in the top-level
              directory.<br>
              &gt;&gt; - */<br>
              &gt;&gt; -<br>
              &gt;&gt; -#ifndef HVF_CPUS_H<br>
              &gt;&gt; -#define HVF_CPUS_H<br>
              &gt;&gt; -<br>
              &gt;&gt; -#include &quot;sysemu/cpus.h&quot;<br>
              &gt;&gt; -<br>
              &gt;&gt; -extern const CpusAccel hvf_cpus;<br>
              &gt;&gt; -<br>
              &gt;&gt; -int hvf_init_vcpu(CPUState *);<br>
              &gt;&gt; -int hvf_vcpu_exec(CPUState *);<br>
              &gt;&gt; -void hvf_cpu_synchronize_state(CPUState *);<br>
              &gt;&gt; -void hvf_cpu_synchronize_post_reset(CPUState *);<br=
>
              &gt;&gt; -void hvf_cpu_synchronize_post_init(CPUState *);<br>
              &gt;&gt; -void hvf_cpu_synchronize_pre_loadvm(CPUState *);<br=
>
              &gt;&gt; -void hvf_vcpu_destroy(CPUState *);<br>
              &gt;&gt; -<br>
              &gt;&gt; -#endif /* HVF_CPUS_H */<br>
              &gt;&gt; diff --git a/target/i386/hvf/hvf-i386.h
              b/target/i386/hvf/hvf-i386.h<br>
              &gt;&gt; index e0edffd077..6d56f8f6bb 100644<br>
              &gt;&gt; --- a/target/i386/hvf/hvf-i386.h<br>
              &gt;&gt; +++ b/target/i386/hvf/hvf-i386.h<br>
              &gt;&gt; @@ -18,57 +18,11 @@<br>
              &gt;&gt;=C2=A0 =C2=A0<br>
              &gt;&gt;=C2=A0 =C2=A0#include &quot;sysemu/accel.h&quot;<br>
              &gt;&gt;=C2=A0 =C2=A0#include &quot;sysemu/hvf.h&quot;<br>
              &gt;&gt; +#include &quot;sysemu/hvf_int.h&quot;<br>
              &gt;&gt;=C2=A0 =C2=A0#include &quot;cpu.h&quot;<br>
              &gt;&gt;=C2=A0 =C2=A0#include &quot;x86.h&quot;<br>
              &gt;&gt;=C2=A0 =C2=A0<br>
              &gt;&gt; -#define HVF_MAX_VCPU 0x10<br>
              &gt;&gt; -<br>
              &gt;&gt; -extern struct hvf_state hvf_global;<br>
              &gt;&gt; -<br>
              &gt;&gt; -struct hvf_vm {<br>
              &gt;&gt; -=C2=A0 =C2=A0 int id;<br>
              &gt;&gt; -=C2=A0 =C2=A0 struct hvf_vcpu_state *vcpus[HVF_MAX_=
VCPU];<br>
              &gt;&gt; -};<br>
              &gt;&gt; -<br>
              &gt;&gt; -struct hvf_state {<br>
              &gt;&gt; -=C2=A0 =C2=A0 uint32_t version;<br>
              &gt;&gt; -=C2=A0 =C2=A0 struct hvf_vm *vm;<br>
              &gt;&gt; -=C2=A0 =C2=A0 uint64_t mem_quota;<br>
              &gt;&gt; -};<br>
              &gt;&gt; -<br>
              &gt;&gt; -/* hvf_slot flags */<br>
              &gt;&gt; -#define HVF_SLOT_LOG (1 &lt;&lt; 0)<br>
              &gt;&gt; -<br>
              &gt;&gt; -typedef struct hvf_slot {<br>
              &gt;&gt; -=C2=A0 =C2=A0 uint64_t start;<br>
              &gt;&gt; -=C2=A0 =C2=A0 uint64_t size;<br>
              &gt;&gt; -=C2=A0 =C2=A0 uint8_t *mem;<br>
              &gt;&gt; -=C2=A0 =C2=A0 int slot_id;<br>
              &gt;&gt; -=C2=A0 =C2=A0 uint32_t flags;<br>
              &gt;&gt; -=C2=A0 =C2=A0 MemoryRegion *region;<br>
              &gt;&gt; -} hvf_slot;<br>
              &gt;&gt; -<br>
              &gt;&gt; -typedef struct hvf_vcpu_caps {<br>
              &gt;&gt; -=C2=A0 =C2=A0 uint64_t vmx_cap_pinbased;<br>
              &gt;&gt; -=C2=A0 =C2=A0 uint64_t vmx_cap_procbased;<br>
              &gt;&gt; -=C2=A0 =C2=A0 uint64_t vmx_cap_procbased2;<br>
              &gt;&gt; -=C2=A0 =C2=A0 uint64_t vmx_cap_entry;<br>
              &gt;&gt; -=C2=A0 =C2=A0 uint64_t vmx_cap_exit;<br>
              &gt;&gt; -=C2=A0 =C2=A0 uint64_t vmx_cap_preemption_timer;<br=
>
              &gt;&gt; -} hvf_vcpu_caps;<br>
              &gt;&gt; -<br>
              &gt;&gt; -struct HVFState {<br>
              &gt;&gt; -=C2=A0 =C2=A0 AccelState parent;<br>
              &gt;&gt; -=C2=A0 =C2=A0 hvf_slot slots[32];<br>
              &gt;&gt; -=C2=A0 =C2=A0 int num_slots;<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 hvf_vcpu_caps *hvf_caps;<br>
              &gt;&gt; -};<br>
              &gt;&gt; -extern HVFState *hvf_state;<br>
              &gt;&gt; -<br>
              &gt;&gt; -void hvf_set_phys_mem(MemoryRegionSection *,
              bool);<br>
              &gt;&gt;=C2=A0 =C2=A0void hvf_handle_io(CPUArchState *, uint1=
6_t,
              void *, int, int, int);<br>
              &gt;&gt; -hvf_slot *hvf_find_overlap_slot(uint64_t,
              uint64_t);<br>
              &gt;&gt;=C2=A0 =C2=A0<br>
              &gt;&gt;=C2=A0 =C2=A0#ifdef NEED_CPU_H<br>
              &gt;&gt;=C2=A0 =C2=A0/* Functions exported to host specific m=
ode */<br>
              &gt;&gt; diff --git a/target/i386/hvf/hvf.c
              b/target/i386/hvf/hvf.c<br>
              &gt;&gt; index ed9356565c..8b96ecd619 100644<br>
              &gt;&gt; --- a/target/i386/hvf/hvf.c<br>
              &gt;&gt; +++ b/target/i386/hvf/hvf.c<br>
              &gt;&gt; @@ -51,6 +51,7 @@<br>
              &gt;&gt;=C2=A0 =C2=A0#include &quot;qemu/error-report.h&quot;=
<br>
              &gt;&gt;=C2=A0 =C2=A0<br>
              &gt;&gt;=C2=A0 =C2=A0#include &quot;sysemu/hvf.h&quot;<br>
              &gt;&gt; +#include &quot;sysemu/hvf_int.h&quot;<br>
              &gt;&gt;=C2=A0 =C2=A0#include &quot;sysemu/runstate.h&quot;<b=
r>
              &gt;&gt;=C2=A0 =C2=A0#include &quot;hvf-i386.h&quot;<br>
              &gt;&gt;=C2=A0 =C2=A0#include &quot;vmcs.h&quot;<br>
              &gt;&gt; @@ -72,171 +73,6 @@<br>
              &gt;&gt;=C2=A0 =C2=A0#include &quot;sysemu/accel.h&quot;<br>
              &gt;&gt;=C2=A0 =C2=A0#include &quot;target/i386/cpu.h&quot;<b=
r>
              &gt;&gt;=C2=A0 =C2=A0<br>
              &gt;&gt; -#include &quot;hvf-cpus.h&quot;<br>
              &gt;&gt; -<br>
              &gt;&gt; -HVFState *hvf_state;<br>
              &gt;&gt; -<br>
              &gt;&gt; -static void assert_hvf_ok(hv_return_t ret)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 if (ret =3D=3D HV_SUCCESS) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
              &gt;&gt; -=C2=A0 =C2=A0 }<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 switch (ret) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 case HV_ERROR:<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Erro=
r: HV_ERROR&quot;);<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
              &gt;&gt; -=C2=A0 =C2=A0 case HV_BUSY:<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Erro=
r: HV_BUSY&quot;);<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
              &gt;&gt; -=C2=A0 =C2=A0 case HV_BAD_ARGUMENT:<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Erro=
r: HV_BAD_ARGUMENT&quot;);<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
              &gt;&gt; -=C2=A0 =C2=A0 case HV_NO_RESOURCES:<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Erro=
r: HV_NO_RESOURCES&quot;);<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
              &gt;&gt; -=C2=A0 =C2=A0 case HV_NO_DEVICE:<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Erro=
r: HV_NO_DEVICE&quot;);<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
              &gt;&gt; -=C2=A0 =C2=A0 case HV_UNSUPPORTED:<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Erro=
r: HV_UNSUPPORTED&quot;);<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
              &gt;&gt; -=C2=A0 =C2=A0 default:<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Unkn=
own Error&quot;);<br>
              &gt;&gt; -=C2=A0 =C2=A0 }<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 abort();<br>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -/* Memory slots */<br>
              &gt;&gt; -hvf_slot *hvf_find_overlap_slot(uint64_t start,
              uint64_t size)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 hvf_slot *slot;<br>
              &gt;&gt; -=C2=A0 =C2=A0 int x;<br>
              &gt;&gt; -=C2=A0 =C2=A0 for (x =3D 0; x &lt; hvf_state-&gt;nu=
m_slots;
              ++x) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 slot =3D &amp;hvf_state=
-&gt;slots[x];<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (slot-&gt;size &amp;=
&amp; start &lt;
              (slot-&gt;start + slot-&gt;size) &amp;&amp;<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (start + =
size) &gt; slot-&gt;start)
              {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return sl=
ot;<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
              &gt;&gt; -=C2=A0 =C2=A0 }<br>
              &gt;&gt; -=C2=A0 =C2=A0 return NULL;<br>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -struct mac_slot {<br>
              &gt;&gt; -=C2=A0 =C2=A0 int present;<br>
              &gt;&gt; -=C2=A0 =C2=A0 uint64_t size;<br>
              &gt;&gt; -=C2=A0 =C2=A0 uint64_t gpa_start;<br>
              &gt;&gt; -=C2=A0 =C2=A0 uint64_t gva;<br>
              &gt;&gt; -};<br>
              &gt;&gt; -<br>
              &gt;&gt; -struct mac_slot mac_slots[32];<br>
              &gt;&gt; -<br>
              &gt;&gt; -static int do_hvf_set_memory(hvf_slot *slot,
              hv_memory_flags_t flags)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 struct mac_slot *macslot;<br>
              &gt;&gt; -=C2=A0 =C2=A0 hv_return_t ret;<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 macslot =3D &amp;mac_slots[slot-&gt;s=
lot_id];<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 if (macslot-&gt;present) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (macslot-&gt;size !=
=3D slot-&gt;size) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 macslot-&=
gt;present =3D 0;<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D
              hv_vm_unmap(macslot-&gt;gpa_start, macslot-&gt;size);<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_hv=
f_ok(ret);<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
              &gt;&gt; -=C2=A0 =C2=A0 }<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 if (!slot-&gt;size) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
              &gt;&gt; -=C2=A0 =C2=A0 }<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 macslot-&gt;present =3D 1;<br>
              &gt;&gt; -=C2=A0 =C2=A0 macslot-&gt;gpa_start =3D slot-&gt;st=
art;<br>
              &gt;&gt; -=C2=A0 =C2=A0 macslot-&gt;size =3D slot-&gt;size;<b=
r>
              &gt;&gt; -=C2=A0 =C2=A0 ret =3D hv_vm_map((hv_uvaddr_t)slot-&=
gt;mem,
              slot-&gt;start, slot-&gt;size, flags);<br>
              &gt;&gt; -=C2=A0 =C2=A0 assert_hvf_ok(ret);<br>
              &gt;&gt; -=C2=A0 =C2=A0 return 0;<br>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -void hvf_set_phys_mem(MemoryRegionSection
              *section, bool add)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 hvf_slot *mem;<br>
              &gt;&gt; -=C2=A0 =C2=A0 MemoryRegion *area =3D section-&gt;mr=
;<br>
              &gt;&gt; -=C2=A0 =C2=A0 bool writeable =3D !area-&gt;readonly
              &amp;&amp; !area-&gt;rom_device;<br>
              &gt;&gt; -=C2=A0 =C2=A0 hv_memory_flags_t flags;<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 if (!memory_region_is_ram(area)) {<br=
>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (writeable) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<b=
r>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!memory_regi=
on_is_romd(area))
              {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* I=
f the memory device is not in
              romd_mode, then we actually want<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* t=
o remove the hvf memory slot so
              all accesses will trap.<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<=
br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add=
 =3D false;<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
              &gt;&gt; -=C2=A0 =C2=A0 }<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 mem =3D hvf_find_overlap_slot(<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              section-&gt;offset_within_address_space,<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int128_ge=
t64(section-&gt;size));<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 if (mem &amp;&amp; add) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mem-&gt;size =3D=3D
              int128_get64(section-&gt;size) &amp;&amp;<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem-&gt;s=
tart =3D=3D
              section-&gt;offset_within_address_space &amp;&amp;<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem-&gt;m=
em =3D=3D
              (memory_region_get_ram_ptr(area) +<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 section-&=
gt;offset_within_region)) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return; /=
* Same region was attempted
              to register, go away. */<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
              &gt;&gt; -=C2=A0 =C2=A0 }<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 /* Region needs to be reset. set the =
size to
              0 and remap it. */<br>
              &gt;&gt; -=C2=A0 =C2=A0 if (mem) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mem-&gt;size =3D 0;<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (do_hvf_set_memory(m=
em, 0)) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_rep=
ort(&quot;Failed to reset
              overlapping slot&quot;);<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<=
br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
              &gt;&gt; -=C2=A0 =C2=A0 }<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 if (!add) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
              &gt;&gt; -=C2=A0 =C2=A0 }<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 if (area-&gt;readonly ||<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 (!memory_region_is_ram(=
area) &amp;&amp;
              memory_region_is_romd(area))) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags =3D HV_MEMORY_REA=
D | HV_MEMORY_EXEC;<br>
              &gt;&gt; -=C2=A0 =C2=A0 } else {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags =3D HV_MEMORY_REA=
D | HV_MEMORY_WRITE
              | HV_MEMORY_EXEC;<br>
              &gt;&gt; -=C2=A0 =C2=A0 }<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 /* Now make a new slot. */<br>
              &gt;&gt; -=C2=A0 =C2=A0 int x;<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 for (x =3D 0; x &lt; hvf_state-&gt;nu=
m_slots;
              ++x) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mem =3D &amp;hvf_state-=
&gt;slots[x];<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!mem-&gt;size) {<br=
>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br=
>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
              &gt;&gt; -=C2=A0 =C2=A0 }<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 if (x =3D=3D hvf_state-&gt;num_slots)=
 {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;No f=
ree slots&quot;);<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
              &gt;&gt; -=C2=A0 =C2=A0 }<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 mem-&gt;size =3D
              int128_get64(section-&gt;size);<br>
              &gt;&gt; -=C2=A0 =C2=A0 mem-&gt;mem =3D
              memory_region_get_ram_ptr(area) +
              section-&gt;offset_within_region;<br>
              &gt;&gt; -=C2=A0 =C2=A0 mem-&gt;start =3D
              section-&gt;offset_within_address_space;<br>
              &gt;&gt; -=C2=A0 =C2=A0 mem-&gt;region =3D area;<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 if (do_hvf_set_memory(mem, flags)) {<=
br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Erro=
r registering new
              memory slot&quot;);<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
              &gt;&gt; -=C2=A0 =C2=A0 }<br>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt;=C2=A0 =C2=A0void vmx_update_tpr(CPUState *cpu)<br>
              &gt;&gt;=C2=A0 =C2=A0{<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* TODO: need integrate AP=
IC handling */<br>
              &gt;&gt; @@ -276,56 +112,6 @@ void
              hvf_handle_io(CPUArchState *env, uint16_t port, void
              *buffer,<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
              &gt;&gt;=C2=A0 =C2=A0}<br>
              &gt;&gt;=C2=A0 =C2=A0<br>
              &gt;&gt; -static void
              do_hvf_cpu_synchronize_state(CPUState *cpu,
              run_on_cpu_data arg)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 if (!cpu-&gt;vcpu_dirty) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 hvf_get_registers(cpu);=
<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;vcpu_dirty =3D =
true;<br>
              &gt;&gt; -=C2=A0 =C2=A0 }<br>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -void hvf_cpu_synchronize_state(CPUState *cpu)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 if (!cpu-&gt;vcpu_dirty) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 run_on_cpu(cpu,
              do_hvf_cpu_synchronize_state, RUN_ON_CPU_NULL);<br>
              &gt;&gt; -=C2=A0 =C2=A0 }<br>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -static void
              do_hvf_cpu_synchronize_post_reset(CPUState *cpu,<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              run_on_cpu_data arg)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 hvf_put_registers(cpu);<br>
              &gt;&gt; -=C2=A0 =C2=A0 cpu-&gt;vcpu_dirty =3D false;<br>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -void hvf_cpu_synchronize_post_reset(CPUState
              *cpu)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 run_on_cpu(cpu,
              do_hvf_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);<br>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -static void
              do_hvf_cpu_synchronize_post_init(CPUState *cpu,<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              =C2=A0run_on_cpu_data arg)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 hvf_put_registers(cpu);<br>
              &gt;&gt; -=C2=A0 =C2=A0 cpu-&gt;vcpu_dirty =3D false;<br>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -void hvf_cpu_synchronize_post_init(CPUState
              *cpu)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 run_on_cpu(cpu,
              do_hvf_cpu_synchronize_post_init, RUN_ON_CPU_NULL);<br>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -static void
              do_hvf_cpu_synchronize_pre_loadvm(CPUState *cpu,<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              run_on_cpu_data arg)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 cpu-&gt;vcpu_dirty =3D true;<br>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -void hvf_cpu_synchronize_pre_loadvm(CPUState
              *cpu)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 run_on_cpu(cpu,
              do_hvf_cpu_synchronize_pre_loadvm, RUN_ON_CPU_NULL);<br>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt;=C2=A0 =C2=A0static bool ept_emulation_fault(hvf_slot=
 *slot,
              uint64_t gpa, uint64_t ept_qual)<br>
              &gt;&gt;=C2=A0 =C2=A0{<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int read, write;<br>
              &gt;&gt; @@ -370,109 +156,19 @@ static bool
              ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t
              ept_qual)<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
              &gt;&gt;=C2=A0 =C2=A0}<br>
              &gt;&gt;=C2=A0 =C2=A0<br>
              &gt;&gt; -static void
              hvf_set_dirty_tracking(MemoryRegionSection *section, bool
              on)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 hvf_slot *slot;<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 slot =3D hvf_find_overlap_slot(<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              section-&gt;offset_within_address_space,<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int128_ge=
t64(section-&gt;size));<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 /* protect region against writes; beg=
in
              tracking it */<br>
              &gt;&gt; -=C2=A0 =C2=A0 if (on) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 slot-&gt;flags |=3D HVF=
_SLOT_LOG;<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0
              hv_vm_protect((hv_gpaddr_t)slot-&gt;start,
              (size_t)slot-&gt;size,<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 HV_MEMORY_READ);<br>
              &gt;&gt; -=C2=A0 =C2=A0 /* stop tracking region*/<br>
              &gt;&gt; -=C2=A0 =C2=A0 } else {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 slot-&gt;flags &amp;=3D=
 ~HVF_SLOT_LOG;<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0
              hv_vm_protect((hv_gpaddr_t)slot-&gt;start,
              (size_t)slot-&gt;size,<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 HV_MEMORY_READ |
              HV_MEMORY_WRITE);<br>
              &gt;&gt; -=C2=A0 =C2=A0 }<br>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -static void hvf_log_start(MemoryListener
              *listener,<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MemoryRegionSection
              *section, int old, int new)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 if (old !=3D 0) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
              &gt;&gt; -=C2=A0 =C2=A0 }<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 hvf_set_dirty_tracking(section, 1);<b=
r>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -static void hvf_log_stop(MemoryListener
              *listener,<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegionSection
              *section, int old, int new)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 if (new !=3D 0) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
              &gt;&gt; -=C2=A0 =C2=A0 }<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 hvf_set_dirty_tracking(section, 0);<b=
r>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -static void hvf_log_sync(MemoryListener
              *listener,<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegionSection
              *section)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 /*<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0* sync of dirty pages is handle=
d elsewhere;
              just make sure we keep<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0* tracking the region.<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0*/<br>
              &gt;&gt; -=C2=A0 =C2=A0 hvf_set_dirty_tracking(section, 1);<b=
r>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -static void hvf_region_add(MemoryListener
              *listener,<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegionSection
              *section)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 hvf_set_phys_mem(section, true);<br>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -static void hvf_region_del(MemoryListener
              *listener,<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegionSection
              *section)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 hvf_set_phys_mem(section, false);<br>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -static MemoryListener hvf_memory_listener =3D {<br>
              &gt;&gt; -=C2=A0 =C2=A0 .priority =3D 10,<br>
              &gt;&gt; -=C2=A0 =C2=A0 .region_add =3D hvf_region_add,<br>
              &gt;&gt; -=C2=A0 =C2=A0 .region_del =3D hvf_region_del,<br>
              &gt;&gt; -=C2=A0 =C2=A0 .log_start =3D hvf_log_start,<br>
              &gt;&gt; -=C2=A0 =C2=A0 .log_stop =3D hvf_log_stop,<br>
              &gt;&gt; -=C2=A0 =C2=A0 .log_sync =3D hvf_log_sync,<br>
              &gt;&gt; -};<br>
              &gt;&gt; -<br>
              &gt;&gt; -void hvf_vcpu_destroy(CPUState *cpu)<br>
              &gt;&gt; +void hvf_arch_vcpu_destroy(CPUState *cpu)<br>
              &gt;&gt;=C2=A0 =C2=A0{<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0X86CPU *x86_cpu =3D X86_CP=
U(cpu);<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CPUX86State *env =3D &amp;=
x86_cpu-&gt;env;<br>
              &gt;&gt;=C2=A0 =C2=A0<br>
              &gt;&gt; -=C2=A0 =C2=A0 hv_return_t ret =3D
              hv_vcpu_destroy((hv_vcpuid_t)cpu-&gt;hvf_fd);<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(env-&gt;hvf_mmio_bu=
f);<br>
              &gt;&gt; -=C2=A0 =C2=A0 assert_hvf_ok(ret);<br>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -static void dummy_signal(int sig)<br>
              &gt;&gt; -{<br>
              &gt;&gt;=C2=A0 =C2=A0}<br>
              &gt;&gt;=C2=A0 =C2=A0<br>
              &gt;&gt; -int hvf_init_vcpu(CPUState *cpu)<br>
              &gt;&gt; +int hvf_arch_init_vcpu(CPUState *cpu)<br>
              &gt;&gt;=C2=A0 =C2=A0{<br>
              &gt;&gt;=C2=A0 =C2=A0<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0X86CPU *x86cpu =3D X86_CPU=
(cpu);<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CPUX86State *env =3D &amp;=
x86cpu-&gt;env;<br>
              &gt;&gt; -=C2=A0 =C2=A0 int r;<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 /* init cpu signals */<br>
              &gt;&gt; -=C2=A0 =C2=A0 sigset_t set;<br>
              &gt;&gt; -=C2=A0 =C2=A0 struct sigaction sigact;<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 memset(&amp;sigact, 0, sizeof(sigact)=
);<br>
              &gt;&gt; -=C2=A0 =C2=A0 sigact.sa_handler =3D dummy_signal;<b=
r>
              &gt;&gt; -=C2=A0 =C2=A0 sigaction(SIG_IPI, &amp;sigact, NULL)=
;<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 pthread_sigmask(SIG_BLOCK, NULL, &amp=
;set);<br>
              &gt;&gt; -=C2=A0 =C2=A0 sigdelset(&amp;set, SIG_IPI);<br>
              &gt;&gt;=C2=A0 =C2=A0<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0init_emu();<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0init_decoder();<br>
              &gt;&gt; @@ -480,10 +176,6 @@ int hvf_init_vcpu(CPUState
              *cpu)<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hvf_state-&gt;hvf_caps =3D=
 g_new0(struct
              hvf_vcpu_caps, 1);<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;hvf_mmio_buf =3D g=
_new(char, 4096);<br>
              &gt;&gt;=C2=A0 =C2=A0<br>
              &gt;&gt; -=C2=A0 =C2=A0 r =3D hv_vcpu_create((hv_vcpuid_t
              *)&amp;cpu-&gt;hvf_fd, HV_VCPU_DEFAULT);<br>
              &gt;&gt; -=C2=A0 =C2=A0 cpu-&gt;vcpu_dirty =3D 1;<br>
              &gt;&gt; -=C2=A0 =C2=A0 assert_hvf_ok(r);<br>
              &gt;&gt; -<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if
              (hv_vmx_read_capability(HV_VMX_CAP_PINBASED,<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              =C2=A0&amp;hvf_state-&gt;hvf_caps-&gt;vmx_cap_pinbased)) {<br=
>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abort();<br>
              &gt;&gt; @@ -865,49 +557,3 @@ int hvf_vcpu_exec(CPUState
              *cpu)<br>
              &gt;&gt;=C2=A0 =C2=A0<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
              &gt;&gt;=C2=A0 =C2=A0}<br>
              &gt;&gt; -<br>
              &gt;&gt; -bool hvf_allowed;<br>
              &gt;&gt; -<br>
              &gt;&gt; -static int hvf_accel_init(MachineState *ms)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 int x;<br>
              &gt;&gt; -=C2=A0 =C2=A0 hv_return_t ret;<br>
              &gt;&gt; -=C2=A0 =C2=A0 HVFState *s;<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 ret =3D hv_vm_create(HV_VM_DEFAULT);<=
br>
              &gt;&gt; -=C2=A0 =C2=A0 assert_hvf_ok(ret);<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 s =3D g_new0(HVFState, 1);<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 s-&gt;num_slots =3D 32;<br>
              &gt;&gt; -=C2=A0 =C2=A0 for (x =3D 0; x &lt; s-&gt;num_slots;=
 ++x) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;slots[x].size =3D=
 0;<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;slots[x].slot_id =
=3D x;<br>
              &gt;&gt; -=C2=A0 =C2=A0 }<br>
              &gt;&gt; -<br>
              &gt;&gt; -=C2=A0 =C2=A0 hvf_state =3D s;<br>
              &gt;&gt; -=C2=A0 =C2=A0
              memory_listener_register(&amp;hvf_memory_listener,
              &amp;address_space_memory);<br>
              &gt;&gt; -=C2=A0 =C2=A0 cpus_register_accel(&amp;hvf_cpus);<b=
r>
              &gt;&gt; -=C2=A0 =C2=A0 return 0;<br>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -static void hvf_accel_class_init(ObjectClass
              *oc, void *data)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 AccelClass *ac =3D ACCEL_CLASS(oc);<b=
r>
              &gt;&gt; -=C2=A0 =C2=A0 ac-&gt;name =3D &quot;HVF&quot;;<br>
              &gt;&gt; -=C2=A0 =C2=A0 ac-&gt;init_machine =3D hvf_accel_ini=
t;<br>
              &gt;&gt; -=C2=A0 =C2=A0 ac-&gt;allowed =3D &amp;hvf_allowed;<=
br>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -static const TypeInfo hvf_accel_type =3D {<br>
              &gt;&gt; -=C2=A0 =C2=A0 .name =3D TYPE_HVF_ACCEL,<br>
              &gt;&gt; -=C2=A0 =C2=A0 .parent =3D TYPE_ACCEL,<br>
              &gt;&gt; -=C2=A0 =C2=A0 .class_init =3D hvf_accel_class_init,=
<br>
              &gt;&gt; -};<br>
              &gt;&gt; -<br>
              &gt;&gt; -static void hvf_type_init(void)<br>
              &gt;&gt; -{<br>
              &gt;&gt; -=C2=A0 =C2=A0 type_register_static(&amp;hvf_accel_t=
ype);<br>
              &gt;&gt; -}<br>
              &gt;&gt; -<br>
              &gt;&gt; -type_init(hvf_type_init);<br>
              &gt;&gt; diff --git a/target/i386/hvf/meson.build
              b/target/i386/hvf/meson.build<br>
              &gt;&gt; index 409c9a3f14..c8a43717ee 100644<br>
              &gt;&gt; --- a/target/i386/hvf/meson.build<br>
              &gt;&gt; +++ b/target/i386/hvf/meson.build<br>
              &gt;&gt; @@ -1,6 +1,5 @@<br>
              &gt;&gt;=C2=A0 =C2=A0i386_softmmu_ss.add(when: [hvf, &#39;CON=
FIG_HVF&#39;],
              if_true: files(<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0&#39;hvf.c&#39;,<br>
              &gt;&gt; -=C2=A0 &#39;hvf-cpus.c&#39;,<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0&#39;x86.c&#39;,<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0&#39;x86_cpuid.c&#39;,<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0&#39;x86_decode.c&#39;,<br>
              &gt;&gt; diff --git a/target/i386/hvf/x86hvf.c
              b/target/i386/hvf/x86hvf.c<br>
              &gt;&gt; index bbec412b6c..89b8e9d87a 100644<br>
              &gt;&gt; --- a/target/i386/hvf/x86hvf.c<br>
              &gt;&gt; +++ b/target/i386/hvf/x86hvf.c<br>
              &gt;&gt; @@ -20,6 +20,9 @@<br>
              &gt;&gt;=C2=A0 =C2=A0#include &quot;qemu/osdep.h&quot;<br>
              &gt;&gt;=C2=A0 =C2=A0<br>
              &gt;&gt;=C2=A0 =C2=A0#include &quot;qemu-common.h&quot;<br>
              &gt;&gt; +#include &quot;sysemu/hvf.h&quot;<br>
              &gt;&gt; +#include &quot;sysemu/hvf_int.h&quot;<br>
              &gt;&gt; +#include &quot;sysemu/hw_accel.h&quot;<br>
              &gt;&gt;=C2=A0 =C2=A0#include &quot;x86hvf.h&quot;<br>
              &gt;&gt;=C2=A0 =C2=A0#include &quot;vmx.h&quot;<br>
              &gt;&gt;=C2=A0 =C2=A0#include &quot;vmcs.h&quot;<br>
              &gt;&gt; @@ -32,8 +35,6 @@<br>
              &gt;&gt;=C2=A0 =C2=A0#include &lt;Hypervisor/hv.h&gt;<br>
              &gt;&gt;=C2=A0 =C2=A0#include &lt;Hypervisor/hv_vmx.h&gt;<br>
              &gt;&gt;=C2=A0 =C2=A0<br>
              &gt;&gt; -#include &quot;hvf-cpus.h&quot;<br>
              &gt;&gt; -<br>
              &gt;&gt;=C2=A0 =C2=A0void hvf_set_segment(struct CPUState *cp=
u,
              struct vmx_segment *vmx_seg,<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SegmentCache *qseg, bool
              is_tr)<br>
              &gt;&gt;=C2=A0 =C2=A0{<br>
              &gt;&gt; @@ -437,7 +438,7 @@ int
              hvf_process_events(CPUState *cpu_state)<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;eflags =3D rreg(cp=
u_state-&gt;hvf_fd,
              HV_X86_RFLAGS);<br>
              &gt;&gt;=C2=A0 =C2=A0<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_state-&gt;interrup=
t_request &amp;
              CPU_INTERRUPT_INIT) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 hvf_cpu_synchronize_sta=
te(cpu_state);<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_synchronize_state(c=
pu_state);<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_cpu_init(=
cpu);<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
              &gt;&gt;=C2=A0 =C2=A0<br>
              &gt;&gt; @@ -451,12 +452,12 @@ int
              hvf_process_events(CPUState *cpu_state)<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_state-&g=
t;halted =3D 0;<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_state-&gt;interrup=
t_request &amp;
              CPU_INTERRUPT_SIPI) {<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 hvf_cpu_synchronize_sta=
te(cpu_state);<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_synchronize_state(c=
pu_state);<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_cpu_sipi(=
cpu);<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_state-&gt;interrup=
t_request &amp;
              CPU_INTERRUPT_TPR) {<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_state-&g=
t;interrupt_request &amp;=3D
              ~CPU_INTERRUPT_TPR;<br>
              &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 hvf_cpu_synchronize_sta=
te(cpu_state);<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_synchronize_state(c=
pu_state);<br>
              &gt; The changes from hvf_cpu_*() to cpu_*() are cleanup
              and perhaps should<br>
              &gt; be a separate patch. It follows cpu/accel cleanups
              Claudio was doing the<br>
              &gt; summer.<br>
              <br>
              <br>
              The only reason they&#39;re in here is because we no longer
              have access to <br>
              the hvf_ functions from the file. I am perfectly happy to
              rebase the <br>
              patch on top of Claudio&#39;s if his goes in first. I&#39;m s=
ure
              it&#39;ll be <br>
              trivial for him to rebase on top of this too if my series
              goes in first.<br>
              <br>
              <br>
              &gt;<br>
              &gt; Phillipe raised the idea that the patch might go
              ahead of ARM-specific<br>
              &gt; part (which might involve some discussions) and I
              agree with that.<br>
              &gt;<br>
              &gt; Some sync between Claudio series (CC&#39;d him) and the
              patch might be need.<br>
              <br>
              <br>
              I would prefer not to hold back because of the sync.
              Claudio&#39;s cleanup <br>
              is trivial enough to adjust for if it gets merged ahead of
              this.<br>
              <br>
              <br>
              Alex<br>
              <br>
              <br>
              <br>
            </blockquote>
          </div>
        </blockquote>
      </div>
    </blockquote>
  </div>

</blockquote></div></div>

--000000000000579c1d05b5593d8e--

