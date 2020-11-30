Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2154A2C8FA6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 22:09:51 +0100 (CET)
Received: from localhost ([::1]:60568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjqQg-0003Xv-76
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 16:09:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kjqPh-0002zw-38
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 16:08:49 -0500
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:39937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kjqPa-0006Qf-Tu
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 16:08:48 -0500
Received: by mail-io1-xd2e.google.com with SMTP id r9so13319497ioo.7
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 13:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pp7mJ+Pd170A5k9LcjG5oIspzy6H4SLCC8wIQUp+TNY=;
 b=oIHVC8vqi5ei20U4uf7OHI2p3eV9JffM4j/rUVq48Be/7Y2X63MicvCILDynf2+qXW
 y/02B/RA3DSo5+/qyqluC3IXDLYSd3HSbkZprnc3dE83/a9+htHmmvv74srwayz31nmd
 LdZEz6/r/KQ8gn4RBgLRklicta0IKkR4on9PBbb8YUpe4uxCw+rqbvAKnfL5EzuEDSbw
 yloODnpz+WQJ9P7PDQjlT0k9ZiGKhKPLNDcs1EH6PfI55vrPnVUx7j8dWIHQ7t9imaLP
 U//z85BPqoFmoMcKnKLyAFA4q4voW/ezloMelQJHGMSPjZQ+u1HDxuk54/638r+94a7e
 gMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pp7mJ+Pd170A5k9LcjG5oIspzy6H4SLCC8wIQUp+TNY=;
 b=IDxQQ3jE2L7/Kgxv/g8r2IpyyGBsO/2gqj6XSNGaTFIWiGMKDpJQ8jO8T/YnN/9B+X
 PCwbYv484O8mYAPeMxTU2UzulI6HH/jSvJWHoW7KtV22LfV8Stmp25qA1S6JWpCzr2yc
 12EvGDGcDQ7K7Pp3hbCggFUk4hpMRl8Y7k0sVpfzMGrWj6/U/VvwhFB0hwB/KsinbMbb
 3O/Vp8eaJPrFNHSmJumwL8ZGhSZas6nVlP+pUDqxifW1P9CKNncUKP2I9IHjkxAbr9so
 uWedEFYu5obzAsLnj0kI7YX1504H961oqlD3ln7xhO3bhXxoCaNJvG5UDeQNLao9+YKH
 QoAw==
X-Gm-Message-State: AOAM533KcirO1dgrtA8cD8WSm8lK+c6w+zWD4FkF6Bxd76k3zY9SFx34
 CYTIejx32rH8Tx8pZj4dETnu2te4fQubP5MbkWp99UqTF1oDOQ==
X-Google-Smtp-Source: ABdhPJyJefFFdcI5VFS8zV6eaPhi/XVlYBZXo024gIOblNPRY5uDTrGxm26DfLjujGC8qaRqDOPS/LMV28DfG56Yn1Q=
X-Received: by 2002:a5e:de08:: with SMTP id e8mr8780800iok.203.1606770519997; 
 Mon, 30 Nov 2020 13:08:39 -0800 (PST)
MIME-Version: 1.0
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-3-agraf@csgraf.de>
 <20201127200054.GC56950@SPB-NB-133.local>
 <392c2465-157e-e15a-0a2c-2e3faa166d22@csgraf.de>
 <CAEkmjvUArgL+Mcvy6nUhfJrdX3OaF=U8UdWia7ZDo9GWk0VF=g@mail.gmail.com>
 <CAEkmjvVJ5zup4NR2+DStt_NvV2cV7+7dj2=fJ3DQBkth8pAfcw@mail.gmail.com>
 <cecd20d0-278b-0a4b-ba9c-0207504c99d7@csgraf.de>
 <CAEkmjvVOAYP6wJyVpAtZE3d=iNOOWGZeHptQ9xJDGcTi4qQ0hQ@mail.gmail.com>
In-Reply-To: <CAEkmjvVOAYP6wJyVpAtZE3d=iNOOWGZeHptQ9xJDGcTi4qQ0hQ@mail.gmail.com>
From: Peter Collingbourne <pcc@google.com>
Date: Mon, 30 Nov 2020 13:08:28 -0800
Message-ID: <CAMn1gO7jqjsqJHtSaV7F+2qmtfF-YFDJwo=O8ot2iem+Uz4Zrw@mail.gmail.com>
Subject: Re: [PATCH 2/8] hvf: Move common code out
To: Frank Yang <lfy@google.com>
Cc: Alexander Graf <agraf@csgraf.de>, Roman Bolshakov <r.bolshakov@yadro.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=pcc@google.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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

On Mon, Nov 30, 2020 at 12:56 PM Frank Yang <lfy@google.com> wrote:
>
>
>
> On Mon, Nov 30, 2020 at 12:34 PM Alexander Graf <agraf@csgraf.de> wrote:
>>
>> Hi Frank,
>>
>> Thanks for the update :). Your previous email nudged me into the right d=
irection. I previously had implemented WFI through the internal timer frame=
work which performed way worse.
>
> Cool, glad it's helping. Also, Peter found out that the main thing keepin=
g us from just using cntpct_el0 on the host directly and compare with cval =
is that if we sleep, cval is going to be much < cntpct_el0 by the sleep tim=
e. If we can get either the architecture or macos to read out the sleep tim=
e then we might be able to not have to use a poll interval either!
>>
>> Along the way, I stumbled over a few issues though. For starters, the si=
gnal mask for SIG_IPI was not set correctly, so while pselect() would exit,=
 the signal would never get delivered to the thread! For a fix, check out
>>
>>   https://patchew.org/QEMU/20201130030723.78326-1-agraf@csgraf.de/202011=
30030723.78326-4-agraf@csgraf.de/
>>
>
> Thanks, we'll take a look :)
>
>>
>> Please also have a look at my latest stab at WFI emulation. It doesn't h=
andle WFE (that's only relevant in overcommitted scenarios). But it does ha=
ndle WFI and even does something similar to hlt polling, albeit not with an=
 adaptive threshold.

Sorry I'm not subscribed to qemu-devel (I'll subscribe in a bit) so
I'll reply to your patch here. You have:

+                    /* Set cpu->hvf->sleeping so that we get a
SIG_IPI signal. */
+                    cpu->hvf->sleeping =3D true;
+                    smp_mb();
+
+                    /* Bail out if we received an IRQ meanwhile */
+                    if (cpu->thread_kicked || (cpu->interrupt_request &
+                        (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
+                        cpu->hvf->sleeping =3D false;
+                        break;
+                    }
+
+                    /* nanosleep returns on signal, so we wake up on kick.=
 */
+                    nanosleep(ts, NULL);

and then send the signal conditional on whether sleeping is true, but
I think this is racy. If the signal is sent after sleeping is set to
true but before entering nanosleep then I think it will be ignored and
we will miss the wakeup. That's why in my implementation I block IPI
on the CPU thread at startup and then use pselect to atomically
unblock and begin sleeping. The signal is sent unconditionally so
there's no need to worry about races between actually sleeping and the
"we think we're sleeping" state. It may lead to an extra wakeup but
that's better than missing it entirely.

Peter

>>
>> Also, is there a particular reason you're working on this super interest=
ing and useful code in a random downstream fork of QEMU? Wouldn't it be mor=
e helpful to contribute to the upstream code base instead?
>
> We'd actually like to contribute upstream too :) We do want to maintain o=
ur own downstream though; Android Emulator codebase needs to work solidly o=
n macos and windows which has made keeping up with upstream difficult, and =
staying on a previous version (2.12) with known quirks easier. (theres also=
 some android related customization relating to Qt Ui + different set of vi=
rtual devices and snapshot support (incl. snapshots of graphics devices wit=
h OpenGLES state tracking), which we hope to separate into other libraries/=
processes, but its not insignificant)
>>
>>
>> Alex
>>
>>
>> On 30.11.20 21:15, Frank Yang wrote:
>>
>> Update: We're not quite sure how to compare the CNTV_CVAL and CNTVCT. Bu=
t the high CPU usage seems to be mitigated by having a poll interval (like =
KVM does) in handling WFI:
>>
>> https://android-review.googlesource.com/c/platform/external/qemu/+/15125=
01
>>
>> This is loosely inspired by https://elixir.bootlin.com/linux/v5.10-rc6/s=
ource/virt/kvm/kvm_main.c#L2766 which does seem to specify a poll interval.
>>
>> It would be cool if we could have a lightweight way to enter sleep and r=
estart the vcpus precisely when CVAL passes, though.
>>
>> Frank
>>
>>
>> On Fri, Nov 27, 2020 at 3:30 PM Frank Yang <lfy@google.com> wrote:
>>>
>>> Hi all,
>>>
>>> +Peter Collingbourne
>>>
>>> I'm a developer on the Android Emulator, which is in a fork of QEMU.
>>>
>>> Peter and I have been working on an HVF Apple Silicon backend with an e=
ye toward Android guests.
>>>
>>> We have gotten things to basically switch to Android userspace already =
(logcat/shell and graphics available at least)
>>>
>>> Our strategy so far has been to import logic from the KVM implementatio=
n and hook into QEMU's software devices that previously assumed to only wor=
k with TCG, or have KVM-specific paths.
>>>
>>> Thanks to Alexander for the tip on the 36-bit address space limitation =
btw; our way of addressing this is to still allow highmem but not put pci h=
igh mmio so high.
>>>
>>> Also, note we have a sleep/signal based mechanism to deal with WFx, whi=
ch might be worth looking into in Alexander's implementation as well:
>>>
>>> https://android-review.googlesource.com/c/platform/external/qemu/+/1512=
551
>>>
>>> Patches so far, FYI:
>>>
>>> https://android-review.googlesource.com/c/platform/external/qemu/+/1513=
429/1
>>> https://android-review.googlesource.com/c/platform/external/qemu/+/1512=
554/3
>>> https://android-review.googlesource.com/c/platform/external/qemu/+/1512=
553/3
>>> https://android-review.googlesource.com/c/platform/external/qemu/+/1512=
552/3
>>> https://android-review.googlesource.com/c/platform/external/qemu/+/1512=
551/3
>>>
>>> https://android.googlesource.com/platform/external/qemu/+/c17eb6a3ffd50=
047e9646aff6640b710cb8ff48a
>>> https://android.googlesource.com/platform/external/qemu/+/74bed16de1afb=
41b7a7ab8da1d1861226c9db63b
>>> https://android.googlesource.com/platform/external/qemu/+/eccd9e47ab2cc=
b9003455e3bb721f57f9ebc3c01
>>> https://android.googlesource.com/platform/external/qemu/+/54fe3d67ed469=
8e85826537a4f49b2b9074b2228
>>> https://android.googlesource.com/platform/external/qemu/+/82ef91a6fede1=
d1000f36be037ad4d58fbe0d102
>>> https://android.googlesource.com/platform/external/qemu/+/c28147aa7c74d=
98b858e99623d2fe46e74a379f6
>>>
>>> Peter's also noticed that there are extra steps needed for M1's to allo=
w TCG to work, as it involves JIT:
>>>
>>> https://android.googlesource.com/platform/external/qemu/+/740e3fe47f889=
26c6bda9abb22ee6eae1bc254a9
>>>
>>> We'd appreciate any feedback/comments :)
>>>
>>> Best,
>>>
>>> Frank
>>>
>>> On Fri, Nov 27, 2020 at 1:57 PM Alexander Graf <agraf@csgraf.de> wrote:
>>>>
>>>>
>>>> On 27.11.20 21:00, Roman Bolshakov wrote:
>>>> > On Thu, Nov 26, 2020 at 10:50:11PM +0100, Alexander Graf wrote:
>>>> >> Until now, Hypervisor.framework has only been available on x86_64 s=
ystems.
>>>> >> With Apple Silicon shipping now, it extends its reach to aarch64. T=
o
>>>> >> prepare for support for multiple architectures, let's move common c=
ode out
>>>> >> into its own accel directory.
>>>> >>
>>>> >> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>>> >> ---
>>>> >>   MAINTAINERS                 |   9 +-
>>>> >>   accel/hvf/hvf-all.c         |  56 +++++
>>>> >>   accel/hvf/hvf-cpus.c        | 468 +++++++++++++++++++++++++++++++=
+++++
>>>> >>   accel/hvf/meson.build       |   7 +
>>>> >>   accel/meson.build           |   1 +
>>>> >>   include/sysemu/hvf_int.h    |  69 ++++++
>>>> >>   target/i386/hvf/hvf-cpus.c  | 131 ----------
>>>> >>   target/i386/hvf/hvf-cpus.h  |  25 --
>>>> >>   target/i386/hvf/hvf-i386.h  |  48 +---
>>>> >>   target/i386/hvf/hvf.c       | 360 +--------------------------
>>>> >>   target/i386/hvf/meson.build |   1 -
>>>> >>   target/i386/hvf/x86hvf.c    |  11 +-
>>>> >>   target/i386/hvf/x86hvf.h    |   2 -
>>>> >>   13 files changed, 619 insertions(+), 569 deletions(-)
>>>> >>   create mode 100644 accel/hvf/hvf-all.c
>>>> >>   create mode 100644 accel/hvf/hvf-cpus.c
>>>> >>   create mode 100644 accel/hvf/meson.build
>>>> >>   create mode 100644 include/sysemu/hvf_int.h
>>>> >>   delete mode 100644 target/i386/hvf/hvf-cpus.c
>>>> >>   delete mode 100644 target/i386/hvf/hvf-cpus.h
>>>> >>
>>>> >> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> >> index 68bc160f41..ca4b6d9279 100644
>>>> >> --- a/MAINTAINERS
>>>> >> +++ b/MAINTAINERS
>>>> >> @@ -444,9 +444,16 @@ M: Cameron Esfahani <dirty@apple.com>
>>>> >>   M: Roman Bolshakov <r.bolshakov@yadro.com>
>>>> >>   W: https://wiki.qemu.org/Features/HVF
>>>> >>   S: Maintained
>>>> >> -F: accel/stubs/hvf-stub.c
>>>> > There was a patch for that in the RFC series from Claudio.
>>>>
>>>>
>>>> Yeah, I'm not worried about this hunk :).
>>>>
>>>>
>>>> >
>>>> >>   F: target/i386/hvf/
>>>> >> +
>>>> >> +HVF
>>>> >> +M: Cameron Esfahani <dirty@apple.com>
>>>> >> +M: Roman Bolshakov <r.bolshakov@yadro.com>
>>>> >> +W: https://wiki.qemu.org/Features/HVF
>>>> >> +S: Maintained
>>>> >> +F: accel/hvf/
>>>> >>   F: include/sysemu/hvf.h
>>>> >> +F: include/sysemu/hvf_int.h
>>>> >>
>>>> >>   WHPX CPUs
>>>> >>   M: Sunil Muthuswamy <sunilmut@microsoft.com>
>>>> >> diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
>>>> >> new file mode 100644
>>>> >> index 0000000000..47d77a472a
>>>> >> --- /dev/null
>>>> >> +++ b/accel/hvf/hvf-all.c
>>>> >> @@ -0,0 +1,56 @@
>>>> >> +/*
>>>> >> + * QEMU Hypervisor.framework support
>>>> >> + *
>>>> >> + * This work is licensed under the terms of the GNU GPL, version 2=
.  See
>>>> >> + * the COPYING file in the top-level directory.
>>>> >> + *
>>>> >> + * Contributions after 2012-01-13 are licensed under the terms of =
the
>>>> >> + * GNU GPL, version 2 or (at your option) any later version.
>>>> >> + */
>>>> >> +
>>>> >> +#include "qemu/osdep.h"
>>>> >> +#include "qemu-common.h"
>>>> >> +#include "qemu/error-report.h"
>>>> >> +#include "sysemu/hvf.h"
>>>> >> +#include "sysemu/hvf_int.h"
>>>> >> +#include "sysemu/runstate.h"
>>>> >> +
>>>> >> +#include "qemu/main-loop.h"
>>>> >> +#include "sysemu/accel.h"
>>>> >> +
>>>> >> +#include <Hypervisor/Hypervisor.h>
>>>> >> +
>>>> >> +bool hvf_allowed;
>>>> >> +HVFState *hvf_state;
>>>> >> +
>>>> >> +void assert_hvf_ok(hv_return_t ret)
>>>> >> +{
>>>> >> +    if (ret =3D=3D HV_SUCCESS) {
>>>> >> +        return;
>>>> >> +    }
>>>> >> +
>>>> >> +    switch (ret) {
>>>> >> +    case HV_ERROR:
>>>> >> +        error_report("Error: HV_ERROR");
>>>> >> +        break;
>>>> >> +    case HV_BUSY:
>>>> >> +        error_report("Error: HV_BUSY");
>>>> >> +        break;
>>>> >> +    case HV_BAD_ARGUMENT:
>>>> >> +        error_report("Error: HV_BAD_ARGUMENT");
>>>> >> +        break;
>>>> >> +    case HV_NO_RESOURCES:
>>>> >> +        error_report("Error: HV_NO_RESOURCES");
>>>> >> +        break;
>>>> >> +    case HV_NO_DEVICE:
>>>> >> +        error_report("Error: HV_NO_DEVICE");
>>>> >> +        break;
>>>> >> +    case HV_UNSUPPORTED:
>>>> >> +        error_report("Error: HV_UNSUPPORTED");
>>>> >> +        break;
>>>> >> +    default:
>>>> >> +        error_report("Unknown Error");
>>>> >> +    }
>>>> >> +
>>>> >> +    abort();
>>>> >> +}
>>>> >> diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
>>>> >> new file mode 100644
>>>> >> index 0000000000..f9bb5502b7
>>>> >> --- /dev/null
>>>> >> +++ b/accel/hvf/hvf-cpus.c
>>>> >> @@ -0,0 +1,468 @@
>>>> >> +/*
>>>> >> + * Copyright 2008 IBM Corporation
>>>> >> + *           2008 Red Hat, Inc.
>>>> >> + * Copyright 2011 Intel Corporation
>>>> >> + * Copyright 2016 Veertu, Inc.
>>>> >> + * Copyright 2017 The Android Open Source Project
>>>> >> + *
>>>> >> + * QEMU Hypervisor.framework support
>>>> >> + *
>>>> >> + * This program is free software; you can redistribute it and/or
>>>> >> + * modify it under the terms of version 2 of the GNU General Publi=
c
>>>> >> + * License as published by the Free Software Foundation.
>>>> >> + *
>>>> >> + * This program is distributed in the hope that it will be useful,
>>>> >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the G=
NU
>>>> >> + * General Public License for more details.
>>>> >> + *
>>>> >> + * You should have received a copy of the GNU General Public Licen=
se
>>>> >> + * along with this program; if not, see <http://www.gnu.org/licens=
es/>.
>>>> >> + *
>>>> >> + * This file contain code under public domain from the hvdos proje=
ct:
>>>> >> + * https://github.com/mist64/hvdos
>>>> >> + *
>>>> >> + * Parts Copyright (c) 2011 NetApp, Inc.
>>>> >> + * All rights reserved.
>>>> >> + *
>>>> >> + * Redistribution and use in source and binary forms, with or with=
out
>>>> >> + * modification, are permitted provided that the following conditi=
ons
>>>> >> + * are met:
>>>> >> + * 1. Redistributions of source code must retain the above copyrig=
ht
>>>> >> + *    notice, this list of conditions and the following disclaimer=
.
>>>> >> + * 2. Redistributions in binary form must reproduce the above copy=
right
>>>> >> + *    notice, this list of conditions and the following disclaimer=
 in the
>>>> >> + *    documentation and/or other materials provided with the distr=
ibution.
>>>> >> + *
>>>> >> + * THIS SOFTWARE IS PROVIDED BY NETAPP, INC ``AS IS'' AND
>>>> >> + * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED T=
O, THE
>>>> >> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICU=
LAR PURPOSE
>>>> >> + * ARE DISCLAIMED.  IN NO EVENT SHALL NETAPP, INC OR CONTRIBUTORS =
BE LIABLE
>>>> >> + * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CO=
NSEQUENTIAL
>>>> >> + * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITU=
TE GOODS
>>>> >> + * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRU=
PTION)
>>>> >> + * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTR=
ACT, STRICT
>>>> >> + * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING =
IN ANY WAY
>>>> >> + * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBI=
LITY OF
>>>> >> + * SUCH DAMAGE.
>>>> >> + */
>>>> >> +
>>>> >> +#include "qemu/osdep.h"
>>>> >> +#include "qemu/error-report.h"
>>>> >> +#include "qemu/main-loop.h"
>>>> >> +#include "exec/address-spaces.h"
>>>> >> +#include "exec/exec-all.h"
>>>> >> +#include "sysemu/cpus.h"
>>>> >> +#include "sysemu/hvf.h"
>>>> >> +#include "sysemu/hvf_int.h"
>>>> >> +#include "sysemu/runstate.h"
>>>> >> +#include "qemu/guest-random.h"
>>>> >> +
>>>> >> +#include <Hypervisor/Hypervisor.h>
>>>> >> +
>>>> >> +/* Memory slots */
>>>> >> +
>>>> >> +struct mac_slot {
>>>> >> +    int present;
>>>> >> +    uint64_t size;
>>>> >> +    uint64_t gpa_start;
>>>> >> +    uint64_t gva;
>>>> >> +};
>>>> >> +
>>>> >> +hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
>>>> >> +{
>>>> >> +    hvf_slot *slot;
>>>> >> +    int x;
>>>> >> +    for (x =3D 0; x < hvf_state->num_slots; ++x) {
>>>> >> +        slot =3D &hvf_state->slots[x];
>>>> >> +        if (slot->size && start < (slot->start + slot->size) &&
>>>> >> +            (start + size) > slot->start) {
>>>> >> +            return slot;
>>>> >> +        }
>>>> >> +    }
>>>> >> +    return NULL;
>>>> >> +}
>>>> >> +
>>>> >> +struct mac_slot mac_slots[32];
>>>> >> +
>>>> >> +static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t fla=
gs)
>>>> >> +{
>>>> >> +    struct mac_slot *macslot;
>>>> >> +    hv_return_t ret;
>>>> >> +
>>>> >> +    macslot =3D &mac_slots[slot->slot_id];
>>>> >> +
>>>> >> +    if (macslot->present) {
>>>> >> +        if (macslot->size !=3D slot->size) {
>>>> >> +            macslot->present =3D 0;
>>>> >> +            ret =3D hv_vm_unmap(macslot->gpa_start, macslot->size)=
;
>>>> >> +            assert_hvf_ok(ret);
>>>> >> +        }
>>>> >> +    }
>>>> >> +
>>>> >> +    if (!slot->size) {
>>>> >> +        return 0;
>>>> >> +    }
>>>> >> +
>>>> >> +    macslot->present =3D 1;
>>>> >> +    macslot->gpa_start =3D slot->start;
>>>> >> +    macslot->size =3D slot->size;
>>>> >> +    ret =3D hv_vm_map(slot->mem, slot->start, slot->size, flags);
>>>> >> +    assert_hvf_ok(ret);
>>>> >> +    return 0;
>>>> >> +}
>>>> >> +
>>>> >> +static void hvf_set_phys_mem(MemoryRegionSection *section, bool ad=
d)
>>>> >> +{
>>>> >> +    hvf_slot *mem;
>>>> >> +    MemoryRegion *area =3D section->mr;
>>>> >> +    bool writeable =3D !area->readonly && !area->rom_device;
>>>> >> +    hv_memory_flags_t flags;
>>>> >> +
>>>> >> +    if (!memory_region_is_ram(area)) {
>>>> >> +        if (writeable) {
>>>> >> +            return;
>>>> >> +        } else if (!memory_region_is_romd(area)) {
>>>> >> +            /*
>>>> >> +             * If the memory device is not in romd_mode, then we a=
ctually want
>>>> >> +             * to remove the hvf memory slot so all accesses will =
trap.
>>>> >> +             */
>>>> >> +             add =3D false;
>>>> >> +        }
>>>> >> +    }
>>>> >> +
>>>> >> +    mem =3D hvf_find_overlap_slot(
>>>> >> +            section->offset_within_address_space,
>>>> >> +            int128_get64(section->size));
>>>> >> +
>>>> >> +    if (mem && add) {
>>>> >> +        if (mem->size =3D=3D int128_get64(section->size) &&
>>>> >> +            mem->start =3D=3D section->offset_within_address_space=
 &&
>>>> >> +            mem->mem =3D=3D (memory_region_get_ram_ptr(area) +
>>>> >> +            section->offset_within_region)) {
>>>> >> +            return; /* Same region was attempted to register, go a=
way. */
>>>> >> +        }
>>>> >> +    }
>>>> >> +
>>>> >> +    /* Region needs to be reset. set the size to 0 and remap it. *=
/
>>>> >> +    if (mem) {
>>>> >> +        mem->size =3D 0;
>>>> >> +        if (do_hvf_set_memory(mem, 0)) {
>>>> >> +            error_report("Failed to reset overlapping slot");
>>>> >> +            abort();
>>>> >> +        }
>>>> >> +    }
>>>> >> +
>>>> >> +    if (!add) {
>>>> >> +        return;
>>>> >> +    }
>>>> >> +
>>>> >> +    if (area->readonly ||
>>>> >> +        (!memory_region_is_ram(area) && memory_region_is_romd(area=
))) {
>>>> >> +        flags =3D HV_MEMORY_READ | HV_MEMORY_EXEC;
>>>> >> +    } else {
>>>> >> +        flags =3D HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXE=
C;
>>>> >> +    }
>>>> >> +
>>>> >> +    /* Now make a new slot. */
>>>> >> +    int x;
>>>> >> +
>>>> >> +    for (x =3D 0; x < hvf_state->num_slots; ++x) {
>>>> >> +        mem =3D &hvf_state->slots[x];
>>>> >> +        if (!mem->size) {
>>>> >> +            break;
>>>> >> +        }
>>>> >> +    }
>>>> >> +
>>>> >> +    if (x =3D=3D hvf_state->num_slots) {
>>>> >> +        error_report("No free slots");
>>>> >> +        abort();
>>>> >> +    }
>>>> >> +
>>>> >> +    mem->size =3D int128_get64(section->size);
>>>> >> +    mem->mem =3D memory_region_get_ram_ptr(area) + section->offset=
_within_region;
>>>> >> +    mem->start =3D section->offset_within_address_space;
>>>> >> +    mem->region =3D area;
>>>> >> +
>>>> >> +    if (do_hvf_set_memory(mem, flags)) {
>>>> >> +        error_report("Error registering new memory slot");
>>>> >> +        abort();
>>>> >> +    }
>>>> >> +}
>>>> >> +
>>>> >> +static void hvf_set_dirty_tracking(MemoryRegionSection *section, b=
ool on)
>>>> >> +{
>>>> >> +    hvf_slot *slot;
>>>> >> +
>>>> >> +    slot =3D hvf_find_overlap_slot(
>>>> >> +            section->offset_within_address_space,
>>>> >> +            int128_get64(section->size));
>>>> >> +
>>>> >> +    /* protect region against writes; begin tracking it */
>>>> >> +    if (on) {
>>>> >> +        slot->flags |=3D HVF_SLOT_LOG;
>>>> >> +        hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
>>>> >> +                      HV_MEMORY_READ);
>>>> >> +    /* stop tracking region*/
>>>> >> +    } else {
>>>> >> +        slot->flags &=3D ~HVF_SLOT_LOG;
>>>> >> +        hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
>>>> >> +                      HV_MEMORY_READ | HV_MEMORY_WRITE);
>>>> >> +    }
>>>> >> +}
>>>> >> +
>>>> >> +static void hvf_log_start(MemoryListener *listener,
>>>> >> +                          MemoryRegionSection *section, int old, i=
nt new)
>>>> >> +{
>>>> >> +    if (old !=3D 0) {
>>>> >> +        return;
>>>> >> +    }
>>>> >> +
>>>> >> +    hvf_set_dirty_tracking(section, 1);
>>>> >> +}
>>>> >> +
>>>> >> +static void hvf_log_stop(MemoryListener *listener,
>>>> >> +                         MemoryRegionSection *section, int old, in=
t new)
>>>> >> +{
>>>> >> +    if (new !=3D 0) {
>>>> >> +        return;
>>>> >> +    }
>>>> >> +
>>>> >> +    hvf_set_dirty_tracking(section, 0);
>>>> >> +}
>>>> >> +
>>>> >> +static void hvf_log_sync(MemoryListener *listener,
>>>> >> +                         MemoryRegionSection *section)
>>>> >> +{
>>>> >> +    /*
>>>> >> +     * sync of dirty pages is handled elsewhere; just make sure we=
 keep
>>>> >> +     * tracking the region.
>>>> >> +     */
>>>> >> +    hvf_set_dirty_tracking(section, 1);
>>>> >> +}
>>>> >> +
>>>> >> +static void hvf_region_add(MemoryListener *listener,
>>>> >> +                           MemoryRegionSection *section)
>>>> >> +{
>>>> >> +    hvf_set_phys_mem(section, true);
>>>> >> +}
>>>> >> +
>>>> >> +static void hvf_region_del(MemoryListener *listener,
>>>> >> +                           MemoryRegionSection *section)
>>>> >> +{
>>>> >> +    hvf_set_phys_mem(section, false);
>>>> >> +}
>>>> >> +
>>>> >> +static MemoryListener hvf_memory_listener =3D {
>>>> >> +    .priority =3D 10,
>>>> >> +    .region_add =3D hvf_region_add,
>>>> >> +    .region_del =3D hvf_region_del,
>>>> >> +    .log_start =3D hvf_log_start,
>>>> >> +    .log_stop =3D hvf_log_stop,
>>>> >> +    .log_sync =3D hvf_log_sync,
>>>> >> +};
>>>> >> +
>>>> >> +static void do_hvf_cpu_synchronize_state(CPUState *cpu, run_on_cpu=
_data arg)
>>>> >> +{
>>>> >> +    if (!cpu->vcpu_dirty) {
>>>> >> +        hvf_get_registers(cpu);
>>>> >> +        cpu->vcpu_dirty =3D true;
>>>> >> +    }
>>>> >> +}
>>>> >> +
>>>> >> +static void hvf_cpu_synchronize_state(CPUState *cpu)
>>>> >> +{
>>>> >> +    if (!cpu->vcpu_dirty) {
>>>> >> +        run_on_cpu(cpu, do_hvf_cpu_synchronize_state, RUN_ON_CPU_N=
ULL);
>>>> >> +    }
>>>> >> +}
>>>> >> +
>>>> >> +static void do_hvf_cpu_synchronize_post_reset(CPUState *cpu,
>>>> >> +                                              run_on_cpu_data arg)
>>>> >> +{
>>>> >> +    hvf_put_registers(cpu);
>>>> >> +    cpu->vcpu_dirty =3D false;
>>>> >> +}
>>>> >> +
>>>> >> +static void hvf_cpu_synchronize_post_reset(CPUState *cpu)
>>>> >> +{
>>>> >> +    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_reset, RUN_ON_CPU_=
NULL);
>>>> >> +}
>>>> >> +
>>>> >> +static void do_hvf_cpu_synchronize_post_init(CPUState *cpu,
>>>> >> +                                             run_on_cpu_data arg)
>>>> >> +{
>>>> >> +    hvf_put_registers(cpu);
>>>> >> +    cpu->vcpu_dirty =3D false;
>>>> >> +}
>>>> >> +
>>>> >> +static void hvf_cpu_synchronize_post_init(CPUState *cpu)
>>>> >> +{
>>>> >> +    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_init, RUN_ON_CPU_N=
ULL);
>>>> >> +}
>>>> >> +
>>>> >> +static void do_hvf_cpu_synchronize_pre_loadvm(CPUState *cpu,
>>>> >> +                                              run_on_cpu_data arg)
>>>> >> +{
>>>> >> +    cpu->vcpu_dirty =3D true;
>>>> >> +}
>>>> >> +
>>>> >> +static void hvf_cpu_synchronize_pre_loadvm(CPUState *cpu)
>>>> >> +{
>>>> >> +    run_on_cpu(cpu, do_hvf_cpu_synchronize_pre_loadvm, RUN_ON_CPU_=
NULL);
>>>> >> +}
>>>> >> +
>>>> >> +static void hvf_vcpu_destroy(CPUState *cpu)
>>>> >> +{
>>>> >> +    hv_return_t ret =3D hv_vcpu_destroy(cpu->hvf_fd);
>>>> >> +    assert_hvf_ok(ret);
>>>> >> +
>>>> >> +    hvf_arch_vcpu_destroy(cpu);
>>>> >> +}
>>>> >> +
>>>> >> +static void dummy_signal(int sig)
>>>> >> +{
>>>> >> +}
>>>> >> +
>>>> >> +static int hvf_init_vcpu(CPUState *cpu)
>>>> >> +{
>>>> >> +    int r;
>>>> >> +
>>>> >> +    /* init cpu signals */
>>>> >> +    sigset_t set;
>>>> >> +    struct sigaction sigact;
>>>> >> +
>>>> >> +    memset(&sigact, 0, sizeof(sigact));
>>>> >> +    sigact.sa_handler =3D dummy_signal;
>>>> >> +    sigaction(SIG_IPI, &sigact, NULL);
>>>> >> +
>>>> >> +    pthread_sigmask(SIG_BLOCK, NULL, &set);
>>>> >> +    sigdelset(&set, SIG_IPI);
>>>> >> +
>>>> >> +#ifdef __aarch64__
>>>> >> +    r =3D hv_vcpu_create(&cpu->hvf_fd, (hv_vcpu_exit_t **)&cpu->hv=
f_exit, NULL);
>>>> >> +#else
>>>> >> +    r =3D hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf_fd, HV_VCPU_DEFA=
ULT);
>>>> >> +#endif
>>>> > I think the first __aarch64__ bit fits better to arm part of the ser=
ies.
>>>>
>>>>
>>>> Oops. Thanks for catching it! Yes, absolutely. It should be part of th=
e
>>>> ARM enablement.
>>>>
>>>>
>>>> >
>>>> >> +    cpu->vcpu_dirty =3D 1;
>>>> >> +    assert_hvf_ok(r);
>>>> >> +
>>>> >> +    return hvf_arch_init_vcpu(cpu);
>>>> >> +}
>>>> >> +
>>>> >> +/*
>>>> >> + * The HVF-specific vCPU thread function. This one should only run=
 when the host
>>>> >> + * CPU supports the VMX "unrestricted guest" feature.
>>>> >> + */
>>>> >> +static void *hvf_cpu_thread_fn(void *arg)
>>>> >> +{
>>>> >> +    CPUState *cpu =3D arg;
>>>> >> +
>>>> >> +    int r;
>>>> >> +
>>>> >> +    assert(hvf_enabled());
>>>> >> +
>>>> >> +    rcu_register_thread();
>>>> >> +
>>>> >> +    qemu_mutex_lock_iothread();
>>>> >> +    qemu_thread_get_self(cpu->thread);
>>>> >> +
>>>> >> +    cpu->thread_id =3D qemu_get_thread_id();
>>>> >> +    cpu->can_do_io =3D 1;
>>>> >> +    current_cpu =3D cpu;
>>>> >> +
>>>> >> +    hvf_init_vcpu(cpu);
>>>> >> +
>>>> >> +    /* signal CPU creation */
>>>> >> +    cpu_thread_signal_created(cpu);
>>>> >> +    qemu_guest_random_seed_thread_part2(cpu->random_seed);
>>>> >> +
>>>> >> +    do {
>>>> >> +        if (cpu_can_run(cpu)) {
>>>> >> +            r =3D hvf_vcpu_exec(cpu);
>>>> >> +            if (r =3D=3D EXCP_DEBUG) {
>>>> >> +                cpu_handle_guest_debug(cpu);
>>>> >> +            }
>>>> >> +        }
>>>> >> +        qemu_wait_io_event(cpu);
>>>> >> +    } while (!cpu->unplug || cpu_can_run(cpu));
>>>> >> +
>>>> >> +    hvf_vcpu_destroy(cpu);
>>>> >> +    cpu_thread_signal_destroyed(cpu);
>>>> >> +    qemu_mutex_unlock_iothread();
>>>> >> +    rcu_unregister_thread();
>>>> >> +    return NULL;
>>>> >> +}
>>>> >> +
>>>> >> +static void hvf_start_vcpu_thread(CPUState *cpu)
>>>> >> +{
>>>> >> +    char thread_name[VCPU_THREAD_NAME_SIZE];
>>>> >> +
>>>> >> +    /*
>>>> >> +     * HVF currently does not support TCG, and only runs in
>>>> >> +     * unrestricted-guest mode.
>>>> >> +     */
>>>> >> +    assert(hvf_enabled());
>>>> >> +
>>>> >> +    cpu->thread =3D g_malloc0(sizeof(QemuThread));
>>>> >> +    cpu->halt_cond =3D g_malloc0(sizeof(QemuCond));
>>>> >> +    qemu_cond_init(cpu->halt_cond);
>>>> >> +
>>>> >> +    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/HVF",
>>>> >> +             cpu->cpu_index);
>>>> >> +    qemu_thread_create(cpu->thread, thread_name, hvf_cpu_thread_fn=
,
>>>> >> +                       cpu, QEMU_THREAD_JOINABLE);
>>>> >> +}
>>>> >> +
>>>> >> +static const CpusAccel hvf_cpus =3D {
>>>> >> +    .create_vcpu_thread =3D hvf_start_vcpu_thread,
>>>> >> +
>>>> >> +    .synchronize_post_reset =3D hvf_cpu_synchronize_post_reset,
>>>> >> +    .synchronize_post_init =3D hvf_cpu_synchronize_post_init,
>>>> >> +    .synchronize_state =3D hvf_cpu_synchronize_state,
>>>> >> +    .synchronize_pre_loadvm =3D hvf_cpu_synchronize_pre_loadvm,
>>>> >> +};
>>>> >> +
>>>> >> +static int hvf_accel_init(MachineState *ms)
>>>> >> +{
>>>> >> +    int x;
>>>> >> +    hv_return_t ret;
>>>> >> +    HVFState *s;
>>>> >> +
>>>> >> +    ret =3D hv_vm_create(HV_VM_DEFAULT);
>>>> >> +    assert_hvf_ok(ret);
>>>> >> +
>>>> >> +    s =3D g_new0(HVFState, 1);
>>>> >> +
>>>> >> +    s->num_slots =3D 32;
>>>> >> +    for (x =3D 0; x < s->num_slots; ++x) {
>>>> >> +        s->slots[x].size =3D 0;
>>>> >> +        s->slots[x].slot_id =3D x;
>>>> >> +    }
>>>> >> +
>>>> >> +    hvf_state =3D s;
>>>> >> +    memory_listener_register(&hvf_memory_listener, &address_space_=
memory);
>>>> >> +    cpus_register_accel(&hvf_cpus);
>>>> >> +    return 0;
>>>> >> +}
>>>> >> +
>>>> >> +static void hvf_accel_class_init(ObjectClass *oc, void *data)
>>>> >> +{
>>>> >> +    AccelClass *ac =3D ACCEL_CLASS(oc);
>>>> >> +    ac->name =3D "HVF";
>>>> >> +    ac->init_machine =3D hvf_accel_init;
>>>> >> +    ac->allowed =3D &hvf_allowed;
>>>> >> +}
>>>> >> +
>>>> >> +static const TypeInfo hvf_accel_type =3D {
>>>> >> +    .name =3D TYPE_HVF_ACCEL,
>>>> >> +    .parent =3D TYPE_ACCEL,
>>>> >> +    .class_init =3D hvf_accel_class_init,
>>>> >> +};
>>>> >> +
>>>> >> +static void hvf_type_init(void)
>>>> >> +{
>>>> >> +    type_register_static(&hvf_accel_type);
>>>> >> +}
>>>> >> +
>>>> >> +type_init(hvf_type_init);
>>>> >> diff --git a/accel/hvf/meson.build b/accel/hvf/meson.build
>>>> >> new file mode 100644
>>>> >> index 0000000000..dfd6b68dc7
>>>> >> --- /dev/null
>>>> >> +++ b/accel/hvf/meson.build
>>>> >> @@ -0,0 +1,7 @@
>>>> >> +hvf_ss =3D ss.source_set()
>>>> >> +hvf_ss.add(files(
>>>> >> +  'hvf-all.c',
>>>> >> +  'hvf-cpus.c',
>>>> >> +))
>>>> >> +
>>>> >> +specific_ss.add_all(when: 'CONFIG_HVF', if_true: hvf_ss)
>>>> >> diff --git a/accel/meson.build b/accel/meson.build
>>>> >> index b26cca227a..6de12ce5d5 100644
>>>> >> --- a/accel/meson.build
>>>> >> +++ b/accel/meson.build
>>>> >> @@ -1,5 +1,6 @@
>>>> >>   softmmu_ss.add(files('accel.c'))
>>>> >>
>>>> >> +subdir('hvf')
>>>> >>   subdir('qtest')
>>>> >>   subdir('kvm')
>>>> >>   subdir('tcg')
>>>> >> diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
>>>> >> new file mode 100644
>>>> >> index 0000000000..de9bad23a8
>>>> >> --- /dev/null
>>>> >> +++ b/include/sysemu/hvf_int.h
>>>> >> @@ -0,0 +1,69 @@
>>>> >> +/*
>>>> >> + * QEMU Hypervisor.framework (HVF) support
>>>> >> + *
>>>> >> + * This work is licensed under the terms of the GNU GPL, version 2=
 or later.
>>>> >> + * See the COPYING file in the top-level directory.
>>>> >> + *
>>>> >> + */
>>>> >> +
>>>> >> +/* header to be included in HVF-specific code */
>>>> >> +
>>>> >> +#ifndef HVF_INT_H
>>>> >> +#define HVF_INT_H
>>>> >> +
>>>> >> +#include <Hypervisor/Hypervisor.h>
>>>> >> +
>>>> >> +#define HVF_MAX_VCPU 0x10
>>>> >> +
>>>> >> +extern struct hvf_state hvf_global;
>>>> >> +
>>>> >> +struct hvf_vm {
>>>> >> +    int id;
>>>> >> +    struct hvf_vcpu_state *vcpus[HVF_MAX_VCPU];
>>>> >> +};
>>>> >> +
>>>> >> +struct hvf_state {
>>>> >> +    uint32_t version;
>>>> >> +    struct hvf_vm *vm;
>>>> >> +    uint64_t mem_quota;
>>>> >> +};
>>>> >> +
>>>> >> +/* hvf_slot flags */
>>>> >> +#define HVF_SLOT_LOG (1 << 0)
>>>> >> +
>>>> >> +typedef struct hvf_slot {
>>>> >> +    uint64_t start;
>>>> >> +    uint64_t size;
>>>> >> +    uint8_t *mem;
>>>> >> +    int slot_id;
>>>> >> +    uint32_t flags;
>>>> >> +    MemoryRegion *region;
>>>> >> +} hvf_slot;
>>>> >> +
>>>> >> +typedef struct hvf_vcpu_caps {
>>>> >> +    uint64_t vmx_cap_pinbased;
>>>> >> +    uint64_t vmx_cap_procbased;
>>>> >> +    uint64_t vmx_cap_procbased2;
>>>> >> +    uint64_t vmx_cap_entry;
>>>> >> +    uint64_t vmx_cap_exit;
>>>> >> +    uint64_t vmx_cap_preemption_timer;
>>>> >> +} hvf_vcpu_caps;
>>>> >> +
>>>> >> +struct HVFState {
>>>> >> +    AccelState parent;
>>>> >> +    hvf_slot slots[32];
>>>> >> +    int num_slots;
>>>> >> +
>>>> >> +    hvf_vcpu_caps *hvf_caps;
>>>> >> +};
>>>> >> +extern HVFState *hvf_state;
>>>> >> +
>>>> >> +void assert_hvf_ok(hv_return_t ret);
>>>> >> +int hvf_get_registers(CPUState *cpu);
>>>> >> +int hvf_put_registers(CPUState *cpu);
>>>> >> +int hvf_arch_init_vcpu(CPUState *cpu);
>>>> >> +void hvf_arch_vcpu_destroy(CPUState *cpu);
>>>> >> +int hvf_vcpu_exec(CPUState *cpu);
>>>> >> +hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
>>>> >> +
>>>> >> +#endif
>>>> >> diff --git a/target/i386/hvf/hvf-cpus.c b/target/i386/hvf/hvf-cpus.=
c
>>>> >> deleted file mode 100644
>>>> >> index 817b3d7452..0000000000
>>>> >> --- a/target/i386/hvf/hvf-cpus.c
>>>> >> +++ /dev/null
>>>> >> @@ -1,131 +0,0 @@
>>>> >> -/*
>>>> >> - * Copyright 2008 IBM Corporation
>>>> >> - *           2008 Red Hat, Inc.
>>>> >> - * Copyright 2011 Intel Corporation
>>>> >> - * Copyright 2016 Veertu, Inc.
>>>> >> - * Copyright 2017 The Android Open Source Project
>>>> >> - *
>>>> >> - * QEMU Hypervisor.framework support
>>>> >> - *
>>>> >> - * This program is free software; you can redistribute it and/or
>>>> >> - * modify it under the terms of version 2 of the GNU General Publi=
c
>>>> >> - * License as published by the Free Software Foundation.
>>>> >> - *
>>>> >> - * This program is distributed in the hope that it will be useful,
>>>> >> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> >> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the G=
NU
>>>> >> - * General Public License for more details.
>>>> >> - *
>>>> >> - * You should have received a copy of the GNU General Public Licen=
se
>>>> >> - * along with this program; if not, see <http://www.gnu.org/licens=
es/>.
>>>> >> - *
>>>> >> - * This file contain code under public domain from the hvdos proje=
ct:
>>>> >> - * https://github.com/mist64/hvdos
>>>> >> - *
>>>> >> - * Parts Copyright (c) 2011 NetApp, Inc.
>>>> >> - * All rights reserved.
>>>> >> - *
>>>> >> - * Redistribution and use in source and binary forms, with or with=
out
>>>> >> - * modification, are permitted provided that the following conditi=
ons
>>>> >> - * are met:
>>>> >> - * 1. Redistributions of source code must retain the above copyrig=
ht
>>>> >> - *    notice, this list of conditions and the following disclaimer=
.
>>>> >> - * 2. Redistributions in binary form must reproduce the above copy=
right
>>>> >> - *    notice, this list of conditions and the following disclaimer=
 in the
>>>> >> - *    documentation and/or other materials provided with the distr=
ibution.
>>>> >> - *
>>>> >> - * THIS SOFTWARE IS PROVIDED BY NETAPP, INC ``AS IS'' AND
>>>> >> - * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED T=
O, THE
>>>> >> - * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICU=
LAR PURPOSE
>>>> >> - * ARE DISCLAIMED.  IN NO EVENT SHALL NETAPP, INC OR CONTRIBUTORS =
BE LIABLE
>>>> >> - * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CO=
NSEQUENTIAL
>>>> >> - * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITU=
TE GOODS
>>>> >> - * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRU=
PTION)
>>>> >> - * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTR=
ACT, STRICT
>>>> >> - * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING =
IN ANY WAY
>>>> >> - * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBI=
LITY OF
>>>> >> - * SUCH DAMAGE.
>>>> >> - */
>>>> >> -
>>>> >> -#include "qemu/osdep.h"
>>>> >> -#include "qemu/error-report.h"
>>>> >> -#include "qemu/main-loop.h"
>>>> >> -#include "sysemu/hvf.h"
>>>> >> -#include "sysemu/runstate.h"
>>>> >> -#include "target/i386/cpu.h"
>>>> >> -#include "qemu/guest-random.h"
>>>> >> -
>>>> >> -#include "hvf-cpus.h"
>>>> >> -
>>>> >> -/*
>>>> >> - * The HVF-specific vCPU thread function. This one should only run=
 when the host
>>>> >> - * CPU supports the VMX "unrestricted guest" feature.
>>>> >> - */
>>>> >> -static void *hvf_cpu_thread_fn(void *arg)
>>>> >> -{
>>>> >> -    CPUState *cpu =3D arg;
>>>> >> -
>>>> >> -    int r;
>>>> >> -
>>>> >> -    assert(hvf_enabled());
>>>> >> -
>>>> >> -    rcu_register_thread();
>>>> >> -
>>>> >> -    qemu_mutex_lock_iothread();
>>>> >> -    qemu_thread_get_self(cpu->thread);
>>>> >> -
>>>> >> -    cpu->thread_id =3D qemu_get_thread_id();
>>>> >> -    cpu->can_do_io =3D 1;
>>>> >> -    current_cpu =3D cpu;
>>>> >> -
>>>> >> -    hvf_init_vcpu(cpu);
>>>> >> -
>>>> >> -    /* signal CPU creation */
>>>> >> -    cpu_thread_signal_created(cpu);
>>>> >> -    qemu_guest_random_seed_thread_part2(cpu->random_seed);
>>>> >> -
>>>> >> -    do {
>>>> >> -        if (cpu_can_run(cpu)) {
>>>> >> -            r =3D hvf_vcpu_exec(cpu);
>>>> >> -            if (r =3D=3D EXCP_DEBUG) {
>>>> >> -                cpu_handle_guest_debug(cpu);
>>>> >> -            }
>>>> >> -        }
>>>> >> -        qemu_wait_io_event(cpu);
>>>> >> -    } while (!cpu->unplug || cpu_can_run(cpu));
>>>> >> -
>>>> >> -    hvf_vcpu_destroy(cpu);
>>>> >> -    cpu_thread_signal_destroyed(cpu);
>>>> >> -    qemu_mutex_unlock_iothread();
>>>> >> -    rcu_unregister_thread();
>>>> >> -    return NULL;
>>>> >> -}
>>>> >> -
>>>> >> -static void hvf_start_vcpu_thread(CPUState *cpu)
>>>> >> -{
>>>> >> -    char thread_name[VCPU_THREAD_NAME_SIZE];
>>>> >> -
>>>> >> -    /*
>>>> >> -     * HVF currently does not support TCG, and only runs in
>>>> >> -     * unrestricted-guest mode.
>>>> >> -     */
>>>> >> -    assert(hvf_enabled());
>>>> >> -
>>>> >> -    cpu->thread =3D g_malloc0(sizeof(QemuThread));
>>>> >> -    cpu->halt_cond =3D g_malloc0(sizeof(QemuCond));
>>>> >> -    qemu_cond_init(cpu->halt_cond);
>>>> >> -
>>>> >> -    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/HVF",
>>>> >> -             cpu->cpu_index);
>>>> >> -    qemu_thread_create(cpu->thread, thread_name, hvf_cpu_thread_fn=
,
>>>> >> -                       cpu, QEMU_THREAD_JOINABLE);
>>>> >> -}
>>>> >> -
>>>> >> -const CpusAccel hvf_cpus =3D {
>>>> >> -    .create_vcpu_thread =3D hvf_start_vcpu_thread,
>>>> >> -
>>>> >> -    .synchronize_post_reset =3D hvf_cpu_synchronize_post_reset,
>>>> >> -    .synchronize_post_init =3D hvf_cpu_synchronize_post_init,
>>>> >> -    .synchronize_state =3D hvf_cpu_synchronize_state,
>>>> >> -    .synchronize_pre_loadvm =3D hvf_cpu_synchronize_pre_loadvm,
>>>> >> -};
>>>> >> diff --git a/target/i386/hvf/hvf-cpus.h b/target/i386/hvf/hvf-cpus.=
h
>>>> >> deleted file mode 100644
>>>> >> index ced31b82c0..0000000000
>>>> >> --- a/target/i386/hvf/hvf-cpus.h
>>>> >> +++ /dev/null
>>>> >> @@ -1,25 +0,0 @@
>>>> >> -/*
>>>> >> - * Accelerator CPUS Interface
>>>> >> - *
>>>> >> - * Copyright 2020 SUSE LLC
>>>> >> - *
>>>> >> - * This work is licensed under the terms of the GNU GPL, version 2=
 or later.
>>>> >> - * See the COPYING file in the top-level directory.
>>>> >> - */
>>>> >> -
>>>> >> -#ifndef HVF_CPUS_H
>>>> >> -#define HVF_CPUS_H
>>>> >> -
>>>> >> -#include "sysemu/cpus.h"
>>>> >> -
>>>> >> -extern const CpusAccel hvf_cpus;
>>>> >> -
>>>> >> -int hvf_init_vcpu(CPUState *);
>>>> >> -int hvf_vcpu_exec(CPUState *);
>>>> >> -void hvf_cpu_synchronize_state(CPUState *);
>>>> >> -void hvf_cpu_synchronize_post_reset(CPUState *);
>>>> >> -void hvf_cpu_synchronize_post_init(CPUState *);
>>>> >> -void hvf_cpu_synchronize_pre_loadvm(CPUState *);
>>>> >> -void hvf_vcpu_destroy(CPUState *);
>>>> >> -
>>>> >> -#endif /* HVF_CPUS_H */
>>>> >> diff --git a/target/i386/hvf/hvf-i386.h b/target/i386/hvf/hvf-i386.=
h
>>>> >> index e0edffd077..6d56f8f6bb 100644
>>>> >> --- a/target/i386/hvf/hvf-i386.h
>>>> >> +++ b/target/i386/hvf/hvf-i386.h
>>>> >> @@ -18,57 +18,11 @@
>>>> >>
>>>> >>   #include "sysemu/accel.h"
>>>> >>   #include "sysemu/hvf.h"
>>>> >> +#include "sysemu/hvf_int.h"
>>>> >>   #include "cpu.h"
>>>> >>   #include "x86.h"
>>>> >>
>>>> >> -#define HVF_MAX_VCPU 0x10
>>>> >> -
>>>> >> -extern struct hvf_state hvf_global;
>>>> >> -
>>>> >> -struct hvf_vm {
>>>> >> -    int id;
>>>> >> -    struct hvf_vcpu_state *vcpus[HVF_MAX_VCPU];
>>>> >> -};
>>>> >> -
>>>> >> -struct hvf_state {
>>>> >> -    uint32_t version;
>>>> >> -    struct hvf_vm *vm;
>>>> >> -    uint64_t mem_quota;
>>>> >> -};
>>>> >> -
>>>> >> -/* hvf_slot flags */
>>>> >> -#define HVF_SLOT_LOG (1 << 0)
>>>> >> -
>>>> >> -typedef struct hvf_slot {
>>>> >> -    uint64_t start;
>>>> >> -    uint64_t size;
>>>> >> -    uint8_t *mem;
>>>> >> -    int slot_id;
>>>> >> -    uint32_t flags;
>>>> >> -    MemoryRegion *region;
>>>> >> -} hvf_slot;
>>>> >> -
>>>> >> -typedef struct hvf_vcpu_caps {
>>>> >> -    uint64_t vmx_cap_pinbased;
>>>> >> -    uint64_t vmx_cap_procbased;
>>>> >> -    uint64_t vmx_cap_procbased2;
>>>> >> -    uint64_t vmx_cap_entry;
>>>> >> -    uint64_t vmx_cap_exit;
>>>> >> -    uint64_t vmx_cap_preemption_timer;
>>>> >> -} hvf_vcpu_caps;
>>>> >> -
>>>> >> -struct HVFState {
>>>> >> -    AccelState parent;
>>>> >> -    hvf_slot slots[32];
>>>> >> -    int num_slots;
>>>> >> -
>>>> >> -    hvf_vcpu_caps *hvf_caps;
>>>> >> -};
>>>> >> -extern HVFState *hvf_state;
>>>> >> -
>>>> >> -void hvf_set_phys_mem(MemoryRegionSection *, bool);
>>>> >>   void hvf_handle_io(CPUArchState *, uint16_t, void *, int, int, in=
t);
>>>> >> -hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
>>>> >>
>>>> >>   #ifdef NEED_CPU_H
>>>> >>   /* Functions exported to host specific mode */
>>>> >> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
>>>> >> index ed9356565c..8b96ecd619 100644
>>>> >> --- a/target/i386/hvf/hvf.c
>>>> >> +++ b/target/i386/hvf/hvf.c
>>>> >> @@ -51,6 +51,7 @@
>>>> >>   #include "qemu/error-report.h"
>>>> >>
>>>> >>   #include "sysemu/hvf.h"
>>>> >> +#include "sysemu/hvf_int.h"
>>>> >>   #include "sysemu/runstate.h"
>>>> >>   #include "hvf-i386.h"
>>>> >>   #include "vmcs.h"
>>>> >> @@ -72,171 +73,6 @@
>>>> >>   #include "sysemu/accel.h"
>>>> >>   #include "target/i386/cpu.h"
>>>> >>
>>>> >> -#include "hvf-cpus.h"
>>>> >> -
>>>> >> -HVFState *hvf_state;
>>>> >> -
>>>> >> -static void assert_hvf_ok(hv_return_t ret)
>>>> >> -{
>>>> >> -    if (ret =3D=3D HV_SUCCESS) {
>>>> >> -        return;
>>>> >> -    }
>>>> >> -
>>>> >> -    switch (ret) {
>>>> >> -    case HV_ERROR:
>>>> >> -        error_report("Error: HV_ERROR");
>>>> >> -        break;
>>>> >> -    case HV_BUSY:
>>>> >> -        error_report("Error: HV_BUSY");
>>>> >> -        break;
>>>> >> -    case HV_BAD_ARGUMENT:
>>>> >> -        error_report("Error: HV_BAD_ARGUMENT");
>>>> >> -        break;
>>>> >> -    case HV_NO_RESOURCES:
>>>> >> -        error_report("Error: HV_NO_RESOURCES");
>>>> >> -        break;
>>>> >> -    case HV_NO_DEVICE:
>>>> >> -        error_report("Error: HV_NO_DEVICE");
>>>> >> -        break;
>>>> >> -    case HV_UNSUPPORTED:
>>>> >> -        error_report("Error: HV_UNSUPPORTED");
>>>> >> -        break;
>>>> >> -    default:
>>>> >> -        error_report("Unknown Error");
>>>> >> -    }
>>>> >> -
>>>> >> -    abort();
>>>> >> -}
>>>> >> -
>>>> >> -/* Memory slots */
>>>> >> -hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
>>>> >> -{
>>>> >> -    hvf_slot *slot;
>>>> >> -    int x;
>>>> >> -    for (x =3D 0; x < hvf_state->num_slots; ++x) {
>>>> >> -        slot =3D &hvf_state->slots[x];
>>>> >> -        if (slot->size && start < (slot->start + slot->size) &&
>>>> >> -            (start + size) > slot->start) {
>>>> >> -            return slot;
>>>> >> -        }
>>>> >> -    }
>>>> >> -    return NULL;
>>>> >> -}
>>>> >> -
>>>> >> -struct mac_slot {
>>>> >> -    int present;
>>>> >> -    uint64_t size;
>>>> >> -    uint64_t gpa_start;
>>>> >> -    uint64_t gva;
>>>> >> -};
>>>> >> -
>>>> >> -struct mac_slot mac_slots[32];
>>>> >> -
>>>> >> -static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t fla=
gs)
>>>> >> -{
>>>> >> -    struct mac_slot *macslot;
>>>> >> -    hv_return_t ret;
>>>> >> -
>>>> >> -    macslot =3D &mac_slots[slot->slot_id];
>>>> >> -
>>>> >> -    if (macslot->present) {
>>>> >> -        if (macslot->size !=3D slot->size) {
>>>> >> -            macslot->present =3D 0;
>>>> >> -            ret =3D hv_vm_unmap(macslot->gpa_start, macslot->size)=
;
>>>> >> -            assert_hvf_ok(ret);
>>>> >> -        }
>>>> >> -    }
>>>> >> -
>>>> >> -    if (!slot->size) {
>>>> >> -        return 0;
>>>> >> -    }
>>>> >> -
>>>> >> -    macslot->present =3D 1;
>>>> >> -    macslot->gpa_start =3D slot->start;
>>>> >> -    macslot->size =3D slot->size;
>>>> >> -    ret =3D hv_vm_map((hv_uvaddr_t)slot->mem, slot->start, slot->s=
ize, flags);
>>>> >> -    assert_hvf_ok(ret);
>>>> >> -    return 0;
>>>> >> -}
>>>> >> -
>>>> >> -void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
>>>> >> -{
>>>> >> -    hvf_slot *mem;
>>>> >> -    MemoryRegion *area =3D section->mr;
>>>> >> -    bool writeable =3D !area->readonly && !area->rom_device;
>>>> >> -    hv_memory_flags_t flags;
>>>> >> -
>>>> >> -    if (!memory_region_is_ram(area)) {
>>>> >> -        if (writeable) {
>>>> >> -            return;
>>>> >> -        } else if (!memory_region_is_romd(area)) {
>>>> >> -            /*
>>>> >> -             * If the memory device is not in romd_mode, then we a=
ctually want
>>>> >> -             * to remove the hvf memory slot so all accesses will =
trap.
>>>> >> -             */
>>>> >> -             add =3D false;
>>>> >> -        }
>>>> >> -    }
>>>> >> -
>>>> >> -    mem =3D hvf_find_overlap_slot(
>>>> >> -            section->offset_within_address_space,
>>>> >> -            int128_get64(section->size));
>>>> >> -
>>>> >> -    if (mem && add) {
>>>> >> -        if (mem->size =3D=3D int128_get64(section->size) &&
>>>> >> -            mem->start =3D=3D section->offset_within_address_space=
 &&
>>>> >> -            mem->mem =3D=3D (memory_region_get_ram_ptr(area) +
>>>> >> -            section->offset_within_region)) {
>>>> >> -            return; /* Same region was attempted to register, go a=
way. */
>>>> >> -        }
>>>> >> -    }
>>>> >> -
>>>> >> -    /* Region needs to be reset. set the size to 0 and remap it. *=
/
>>>> >> -    if (mem) {
>>>> >> -        mem->size =3D 0;
>>>> >> -        if (do_hvf_set_memory(mem, 0)) {
>>>> >> -            error_report("Failed to reset overlapping slot");
>>>> >> -            abort();
>>>> >> -        }
>>>> >> -    }
>>>> >> -
>>>> >> -    if (!add) {
>>>> >> -        return;
>>>> >> -    }
>>>> >> -
>>>> >> -    if (area->readonly ||
>>>> >> -        (!memory_region_is_ram(area) && memory_region_is_romd(area=
))) {
>>>> >> -        flags =3D HV_MEMORY_READ | HV_MEMORY_EXEC;
>>>> >> -    } else {
>>>> >> -        flags =3D HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXE=
C;
>>>> >> -    }
>>>> >> -
>>>> >> -    /* Now make a new slot. */
>>>> >> -    int x;
>>>> >> -
>>>> >> -    for (x =3D 0; x < hvf_state->num_slots; ++x) {
>>>> >> -        mem =3D &hvf_state->slots[x];
>>>> >> -        if (!mem->size) {
>>>> >> -            break;
>>>> >> -        }
>>>> >> -    }
>>>> >> -
>>>> >> -    if (x =3D=3D hvf_state->num_slots) {
>>>> >> -        error_report("No free slots");
>>>> >> -        abort();
>>>> >> -    }
>>>> >> -
>>>> >> -    mem->size =3D int128_get64(section->size);
>>>> >> -    mem->mem =3D memory_region_get_ram_ptr(area) + section->offset=
_within_region;
>>>> >> -    mem->start =3D section->offset_within_address_space;
>>>> >> -    mem->region =3D area;
>>>> >> -
>>>> >> -    if (do_hvf_set_memory(mem, flags)) {
>>>> >> -        error_report("Error registering new memory slot");
>>>> >> -        abort();
>>>> >> -    }
>>>> >> -}
>>>> >> -
>>>> >>   void vmx_update_tpr(CPUState *cpu)
>>>> >>   {
>>>> >>       /* TODO: need integrate APIC handling */
>>>> >> @@ -276,56 +112,6 @@ void hvf_handle_io(CPUArchState *env, uint16_t=
 port, void *buffer,
>>>> >>       }
>>>> >>   }
>>>> >>
>>>> >> -static void do_hvf_cpu_synchronize_state(CPUState *cpu, run_on_cpu=
_data arg)
>>>> >> -{
>>>> >> -    if (!cpu->vcpu_dirty) {
>>>> >> -        hvf_get_registers(cpu);
>>>> >> -        cpu->vcpu_dirty =3D true;
>>>> >> -    }
>>>> >> -}
>>>> >> -
>>>> >> -void hvf_cpu_synchronize_state(CPUState *cpu)
>>>> >> -{
>>>> >> -    if (!cpu->vcpu_dirty) {
>>>> >> -        run_on_cpu(cpu, do_hvf_cpu_synchronize_state, RUN_ON_CPU_N=
ULL);
>>>> >> -    }
>>>> >> -}
>>>> >> -
>>>> >> -static void do_hvf_cpu_synchronize_post_reset(CPUState *cpu,
>>>> >> -                                              run_on_cpu_data arg)
>>>> >> -{
>>>> >> -    hvf_put_registers(cpu);
>>>> >> -    cpu->vcpu_dirty =3D false;
>>>> >> -}
>>>> >> -
>>>> >> -void hvf_cpu_synchronize_post_reset(CPUState *cpu)
>>>> >> -{
>>>> >> -    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_reset, RUN_ON_CPU_=
NULL);
>>>> >> -}
>>>> >> -
>>>> >> -static void do_hvf_cpu_synchronize_post_init(CPUState *cpu,
>>>> >> -                                             run_on_cpu_data arg)
>>>> >> -{
>>>> >> -    hvf_put_registers(cpu);
>>>> >> -    cpu->vcpu_dirty =3D false;
>>>> >> -}
>>>> >> -
>>>> >> -void hvf_cpu_synchronize_post_init(CPUState *cpu)
>>>> >> -{
>>>> >> -    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_init, RUN_ON_CPU_N=
ULL);
>>>> >> -}
>>>> >> -
>>>> >> -static void do_hvf_cpu_synchronize_pre_loadvm(CPUState *cpu,
>>>> >> -                                              run_on_cpu_data arg)
>>>> >> -{
>>>> >> -    cpu->vcpu_dirty =3D true;
>>>> >> -}
>>>> >> -
>>>> >> -void hvf_cpu_synchronize_pre_loadvm(CPUState *cpu)
>>>> >> -{
>>>> >> -    run_on_cpu(cpu, do_hvf_cpu_synchronize_pre_loadvm, RUN_ON_CPU_=
NULL);
>>>> >> -}
>>>> >> -
>>>> >>   static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uin=
t64_t ept_qual)
>>>> >>   {
>>>> >>       int read, write;
>>>> >> @@ -370,109 +156,19 @@ static bool ept_emulation_fault(hvf_slot *sl=
ot, uint64_t gpa, uint64_t ept_qual)
>>>> >>       return false;
>>>> >>   }
>>>> >>
>>>> >> -static void hvf_set_dirty_tracking(MemoryRegionSection *section, b=
ool on)
>>>> >> -{
>>>> >> -    hvf_slot *slot;
>>>> >> -
>>>> >> -    slot =3D hvf_find_overlap_slot(
>>>> >> -            section->offset_within_address_space,
>>>> >> -            int128_get64(section->size));
>>>> >> -
>>>> >> -    /* protect region against writes; begin tracking it */
>>>> >> -    if (on) {
>>>> >> -        slot->flags |=3D HVF_SLOT_LOG;
>>>> >> -        hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size=
,
>>>> >> -                      HV_MEMORY_READ);
>>>> >> -    /* stop tracking region*/
>>>> >> -    } else {
>>>> >> -        slot->flags &=3D ~HVF_SLOT_LOG;
>>>> >> -        hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size=
,
>>>> >> -                      HV_MEMORY_READ | HV_MEMORY_WRITE);
>>>> >> -    }
>>>> >> -}
>>>> >> -
>>>> >> -static void hvf_log_start(MemoryListener *listener,
>>>> >> -                          MemoryRegionSection *section, int old, i=
nt new)
>>>> >> -{
>>>> >> -    if (old !=3D 0) {
>>>> >> -        return;
>>>> >> -    }
>>>> >> -
>>>> >> -    hvf_set_dirty_tracking(section, 1);
>>>> >> -}
>>>> >> -
>>>> >> -static void hvf_log_stop(MemoryListener *listener,
>>>> >> -                         MemoryRegionSection *section, int old, in=
t new)
>>>> >> -{
>>>> >> -    if (new !=3D 0) {
>>>> >> -        return;
>>>> >> -    }
>>>> >> -
>>>> >> -    hvf_set_dirty_tracking(section, 0);
>>>> >> -}
>>>> >> -
>>>> >> -static void hvf_log_sync(MemoryListener *listener,
>>>> >> -                         MemoryRegionSection *section)
>>>> >> -{
>>>> >> -    /*
>>>> >> -     * sync of dirty pages is handled elsewhere; just make sure we=
 keep
>>>> >> -     * tracking the region.
>>>> >> -     */
>>>> >> -    hvf_set_dirty_tracking(section, 1);
>>>> >> -}
>>>> >> -
>>>> >> -static void hvf_region_add(MemoryListener *listener,
>>>> >> -                           MemoryRegionSection *section)
>>>> >> -{
>>>> >> -    hvf_set_phys_mem(section, true);
>>>> >> -}
>>>> >> -
>>>> >> -static void hvf_region_del(MemoryListener *listener,
>>>> >> -                           MemoryRegionSection *section)
>>>> >> -{
>>>> >> -    hvf_set_phys_mem(section, false);
>>>> >> -}
>>>> >> -
>>>> >> -static MemoryListener hvf_memory_listener =3D {
>>>> >> -    .priority =3D 10,
>>>> >> -    .region_add =3D hvf_region_add,
>>>> >> -    .region_del =3D hvf_region_del,
>>>> >> -    .log_start =3D hvf_log_start,
>>>> >> -    .log_stop =3D hvf_log_stop,
>>>> >> -    .log_sync =3D hvf_log_sync,
>>>> >> -};
>>>> >> -
>>>> >> -void hvf_vcpu_destroy(CPUState *cpu)
>>>> >> +void hvf_arch_vcpu_destroy(CPUState *cpu)
>>>> >>   {
>>>> >>       X86CPU *x86_cpu =3D X86_CPU(cpu);
>>>> >>       CPUX86State *env =3D &x86_cpu->env;
>>>> >>
>>>> >> -    hv_return_t ret =3D hv_vcpu_destroy((hv_vcpuid_t)cpu->hvf_fd);
>>>> >>       g_free(env->hvf_mmio_buf);
>>>> >> -    assert_hvf_ok(ret);
>>>> >> -}
>>>> >> -
>>>> >> -static void dummy_signal(int sig)
>>>> >> -{
>>>> >>   }
>>>> >>
>>>> >> -int hvf_init_vcpu(CPUState *cpu)
>>>> >> +int hvf_arch_init_vcpu(CPUState *cpu)
>>>> >>   {
>>>> >>
>>>> >>       X86CPU *x86cpu =3D X86_CPU(cpu);
>>>> >>       CPUX86State *env =3D &x86cpu->env;
>>>> >> -    int r;
>>>> >> -
>>>> >> -    /* init cpu signals */
>>>> >> -    sigset_t set;
>>>> >> -    struct sigaction sigact;
>>>> >> -
>>>> >> -    memset(&sigact, 0, sizeof(sigact));
>>>> >> -    sigact.sa_handler =3D dummy_signal;
>>>> >> -    sigaction(SIG_IPI, &sigact, NULL);
>>>> >> -
>>>> >> -    pthread_sigmask(SIG_BLOCK, NULL, &set);
>>>> >> -    sigdelset(&set, SIG_IPI);
>>>> >>
>>>> >>       init_emu();
>>>> >>       init_decoder();
>>>> >> @@ -480,10 +176,6 @@ int hvf_init_vcpu(CPUState *cpu)
>>>> >>       hvf_state->hvf_caps =3D g_new0(struct hvf_vcpu_caps, 1);
>>>> >>       env->hvf_mmio_buf =3D g_new(char, 4096);
>>>> >>
>>>> >> -    r =3D hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf_fd, HV_VCPU_DEFA=
ULT);
>>>> >> -    cpu->vcpu_dirty =3D 1;
>>>> >> -    assert_hvf_ok(r);
>>>> >> -
>>>> >>       if (hv_vmx_read_capability(HV_VMX_CAP_PINBASED,
>>>> >>           &hvf_state->hvf_caps->vmx_cap_pinbased)) {
>>>> >>           abort();
>>>> >> @@ -865,49 +557,3 @@ int hvf_vcpu_exec(CPUState *cpu)
>>>> >>
>>>> >>       return ret;
>>>> >>   }
>>>> >> -
>>>> >> -bool hvf_allowed;
>>>> >> -
>>>> >> -static int hvf_accel_init(MachineState *ms)
>>>> >> -{
>>>> >> -    int x;
>>>> >> -    hv_return_t ret;
>>>> >> -    HVFState *s;
>>>> >> -
>>>> >> -    ret =3D hv_vm_create(HV_VM_DEFAULT);
>>>> >> -    assert_hvf_ok(ret);
>>>> >> -
>>>> >> -    s =3D g_new0(HVFState, 1);
>>>> >> -
>>>> >> -    s->num_slots =3D 32;
>>>> >> -    for (x =3D 0; x < s->num_slots; ++x) {
>>>> >> -        s->slots[x].size =3D 0;
>>>> >> -        s->slots[x].slot_id =3D x;
>>>> >> -    }
>>>> >> -
>>>> >> -    hvf_state =3D s;
>>>> >> -    memory_listener_register(&hvf_memory_listener, &address_space_=
memory);
>>>> >> -    cpus_register_accel(&hvf_cpus);
>>>> >> -    return 0;
>>>> >> -}
>>>> >> -
>>>> >> -static void hvf_accel_class_init(ObjectClass *oc, void *data)
>>>> >> -{
>>>> >> -    AccelClass *ac =3D ACCEL_CLASS(oc);
>>>> >> -    ac->name =3D "HVF";
>>>> >> -    ac->init_machine =3D hvf_accel_init;
>>>> >> -    ac->allowed =3D &hvf_allowed;
>>>> >> -}
>>>> >> -
>>>> >> -static const TypeInfo hvf_accel_type =3D {
>>>> >> -    .name =3D TYPE_HVF_ACCEL,
>>>> >> -    .parent =3D TYPE_ACCEL,
>>>> >> -    .class_init =3D hvf_accel_class_init,
>>>> >> -};
>>>> >> -
>>>> >> -static void hvf_type_init(void)
>>>> >> -{
>>>> >> -    type_register_static(&hvf_accel_type);
>>>> >> -}
>>>> >> -
>>>> >> -type_init(hvf_type_init);
>>>> >> diff --git a/target/i386/hvf/meson.build b/target/i386/hvf/meson.bu=
ild
>>>> >> index 409c9a3f14..c8a43717ee 100644
>>>> >> --- a/target/i386/hvf/meson.build
>>>> >> +++ b/target/i386/hvf/meson.build
>>>> >> @@ -1,6 +1,5 @@
>>>> >>   i386_softmmu_ss.add(when: [hvf, 'CONFIG_HVF'], if_true: files(
>>>> >>     'hvf.c',
>>>> >> -  'hvf-cpus.c',
>>>> >>     'x86.c',
>>>> >>     'x86_cpuid.c',
>>>> >>     'x86_decode.c',
>>>> >> diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
>>>> >> index bbec412b6c..89b8e9d87a 100644
>>>> >> --- a/target/i386/hvf/x86hvf.c
>>>> >> +++ b/target/i386/hvf/x86hvf.c
>>>> >> @@ -20,6 +20,9 @@
>>>> >>   #include "qemu/osdep.h"
>>>> >>
>>>> >>   #include "qemu-common.h"
>>>> >> +#include "sysemu/hvf.h"
>>>> >> +#include "sysemu/hvf_int.h"
>>>> >> +#include "sysemu/hw_accel.h"
>>>> >>   #include "x86hvf.h"
>>>> >>   #include "vmx.h"
>>>> >>   #include "vmcs.h"
>>>> >> @@ -32,8 +35,6 @@
>>>> >>   #include <Hypervisor/hv.h>
>>>> >>   #include <Hypervisor/hv_vmx.h>
>>>> >>
>>>> >> -#include "hvf-cpus.h"
>>>> >> -
>>>> >>   void hvf_set_segment(struct CPUState *cpu, struct vmx_segment *vm=
x_seg,
>>>> >>                        SegmentCache *qseg, bool is_tr)
>>>> >>   {
>>>> >> @@ -437,7 +438,7 @@ int hvf_process_events(CPUState *cpu_state)
>>>> >>       env->eflags =3D rreg(cpu_state->hvf_fd, HV_X86_RFLAGS);
>>>> >>
>>>> >>       if (cpu_state->interrupt_request & CPU_INTERRUPT_INIT) {
>>>> >> -        hvf_cpu_synchronize_state(cpu_state);
>>>> >> +        cpu_synchronize_state(cpu_state);
>>>> >>           do_cpu_init(cpu);
>>>> >>       }
>>>> >>
>>>> >> @@ -451,12 +452,12 @@ int hvf_process_events(CPUState *cpu_state)
>>>> >>           cpu_state->halted =3D 0;
>>>> >>       }
>>>> >>       if (cpu_state->interrupt_request & CPU_INTERRUPT_SIPI) {
>>>> >> -        hvf_cpu_synchronize_state(cpu_state);
>>>> >> +        cpu_synchronize_state(cpu_state);
>>>> >>           do_cpu_sipi(cpu);
>>>> >>       }
>>>> >>       if (cpu_state->interrupt_request & CPU_INTERRUPT_TPR) {
>>>> >>           cpu_state->interrupt_request &=3D ~CPU_INTERRUPT_TPR;
>>>> >> -        hvf_cpu_synchronize_state(cpu_state);
>>>> >> +        cpu_synchronize_state(cpu_state);
>>>> > The changes from hvf_cpu_*() to cpu_*() are cleanup and perhaps shou=
ld
>>>> > be a separate patch. It follows cpu/accel cleanups Claudio was doing=
 the
>>>> > summer.
>>>>
>>>>
>>>> The only reason they're in here is because we no longer have access to
>>>> the hvf_ functions from the file. I am perfectly happy to rebase the
>>>> patch on top of Claudio's if his goes in first. I'm sure it'll be
>>>> trivial for him to rebase on top of this too if my series goes in firs=
t.
>>>>
>>>>
>>>> >
>>>> > Phillipe raised the idea that the patch might go ahead of ARM-specif=
ic
>>>> > part (which might involve some discussions) and I agree with that.
>>>> >
>>>> > Some sync between Claudio series (CC'd him) and the patch might be n=
eed.
>>>>
>>>>
>>>> I would prefer not to hold back because of the sync. Claudio's cleanup
>>>> is trivial enough to adjust for if it gets merged ahead of this.
>>>>
>>>>
>>>> Alex
>>>>
>>>>
>>>>

