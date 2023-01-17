Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D368666DFCF
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 15:03:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHmXF-0007ln-4c; Tue, 17 Jan 2023 09:01:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmXC-0007lY-J8
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:01:54 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmXA-0007TP-Bt
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:01:54 -0500
Received: by mail-pl1-x635.google.com with SMTP id jl4so33610770plb.8
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 06:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rt2FWvc+qWz60EOlJZ3tlgcztDYsaZqfrR+reFiA4kk=;
 b=WbpXZQfrBZwbm+dcsjNPtC0wx7wJbM+QvDn/1scT6mZF/zUYmO8v+I9jaVb+raYhlE
 JDzINjOJj7NpHsXCSL9tbSgNGiHBupqQo+ctghgaa5Neft2qlG3vSCMGB+7DswWJ8M8r
 7VvWxoUgphacpGVRlRSigHtVJscG+m/rC/5BIkV8IWqe/61o6wnoD8h7iE0za6+c/3hJ
 O7wkYHbmO8wtxPF3/cs9lHcEy1pWcrR/10pLFN3jCmOV/k2DyIYmI6iqfRe/xSJmFhQ2
 CxdwpYfzBAS1s3RNLWQWOCX526BaQJ2qhXFaJBf5bsAfXaxEdCPAvT38samr2cWEpPkz
 lm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rt2FWvc+qWz60EOlJZ3tlgcztDYsaZqfrR+reFiA4kk=;
 b=F3n5uvhyl3YtSM89xfPVJoQf+gMVq4kOv30GJnKJea5kuMXPc+7oJtt+bSq08yj9NG
 t9A+DRBVwDsMG1ndBWDUjvUkz1W4RTPmtrH5VyWUzzRRJJvqQ3ujmy0zQ6lojkrWA6jZ
 e3tWUdnc1evrGAf77BA8OSyC1/Vc8OLNcVbzzrZlQTeb1DLkBA0Myt360ztl8T1v+2Gl
 o622IaKOVJjp47s6eeD4C7hVy6mqt0GSccBJMUd1sTGmb2TLKftyUXEanaTw3UsGoQKE
 /z+chkW36ep69UfL3aICM1ISF4v9O9kZlVdeSyRUw7G2pxiF6SowsVQurdHvjW8qPdgB
 96eg==
X-Gm-Message-State: AFqh2kr0PTIHS1ZuDjqiPcQh4PmxTIgzBeY//TX2ZgDz2dDXjeZgko7p
 BbROoB2E1d+OSc37qoo7lsSQW8VOVJA/sGqGq4fDTw==
X-Google-Smtp-Source: AMrXdXuUYm/MoQO3JzMgjFFG1pcSAdi8HU7/ysayDHuKfNNPIHELs2opYZbsZTMZpD+Gl4VK+qxyiClcViUMFNzrBSY=
X-Received: by 2002:a17:902:7045:b0:194:957b:e80a with SMTP id
 h5-20020a170902704500b00194957be80amr240249plt.90.1673964110628; Tue, 17 Jan
 2023 06:01:50 -0800 (PST)
MIME-Version: 1.0
References: <20230113133923.1642627-1-alex.bennee@linaro.org>
 <20230113133923.1642627-5-alex.bennee@linaro.org>
In-Reply-To: <20230113133923.1642627-5-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 14:01:39 +0000
Message-ID: <CAFEAcA8-ocjrvqSpcuR4g1m1ERFSTArETGxYtHit_HeMvERKOA@mail.gmail.com>
Subject: Re: [PATCH 4/4] docs: add an introduction to the system docs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>, 
 Markus Armbruster <armbru@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 John G Johnson <john.g.johnson@oracle.com>, 
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Jagannathan Raman <jag.raman@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 13 Jan 2023 at 13:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Drop the frankly misleading quickstart section for a more rounded
> introduction section. This new section gives an overview of the
> accelerators and high level introduction to some of the key features
> of the emulator. We also expand on a general form for a QEMU command
> line with a hopefully not too scary worked example of what this looks
> like.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Yes, the quickstart section is definitely something worth dumping.

> ---
>  docs/interop/qemu-qmp-ref.rst |   2 +
>  docs/system/index.rst         |   2 +-
>  docs/system/introduction.rst  | 216 ++++++++++++++++++++++++++++++++++
>  docs/system/multi-process.rst |   2 +
>  docs/system/quickstart.rst    |  21 ----
>  qemu-options.hx               |   3 +
>  6 files changed, 224 insertions(+), 22 deletions(-)
>  create mode 100644 docs/system/introduction.rst
>  delete mode 100644 docs/system/quickstart.rst
>
> diff --git a/docs/interop/qemu-qmp-ref.rst b/docs/interop/qemu-qmp-ref.rs=
t
> index 357effd64f..f94614a0b2 100644
> --- a/docs/interop/qemu-qmp-ref.rst
> +++ b/docs/interop/qemu-qmp-ref.rst
> @@ -1,3 +1,5 @@
> +.. _QMP Ref:
> +
>  QEMU QMP Reference Manual
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>
> diff --git a/docs/system/index.rst b/docs/system/index.rst
> index 282b6ffb56..3605bbe1ce 100644
> --- a/docs/system/index.rst
> +++ b/docs/system/index.rst
> @@ -12,7 +12,7 @@ or Hypervisor.Framework.
>  .. toctree::
>     :maxdepth: 3
>
> -   quickstart
> +   introduction
>     invocation
>     device-emulation
>     keys
> diff --git a/docs/system/introduction.rst b/docs/system/introduction.rst
> new file mode 100644
> index 0000000000..15e4cf773d
> --- /dev/null
> +++ b/docs/system/introduction.rst
> @@ -0,0 +1,216 @@
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Virtualisation Accelerators
> +---------------------------
> +
> +QEMU's system emulation provides a virtual model of a machine (CPU,
> +memory and emulated devices) to run a guest OS. It supports a number
> +of hypervisors (known as accelerators) as well as a dynamic JIT known
> +as the Tiny Code Generator (TCG) capable of emulating many CPUs.
> +
> +.. list-table:: Supported Accelerators
> +  :header-rows: 1
> +
> +  * - Accelerator
> +    - Host OS
> +    - Host Architectures
> +  * - KVM
> +    - Linux
> +    - Arm (64 bit only), MIPS, PPC, RISC-V, s390x, x86
> +  * - Xen
> +    - Linux (as dom0)
> +    - Arm, x86
> +  * - Intel HAXM (hax)
> +    - Linux, Windows
> +    - x86
> +  * - Hypervisor Framework (hvf)
> +    - MacOS
> +    - x86 (64 bit only), Arm (64 bit only)
> +  * - Windows Hypervisor Platform (wphx)
> +    - Windows
> +    - x86
> +  * - NetBSD Virtual Machine Monitor (nvmm)
> +    - NetBSD
> +    - x86
> +  * - Tiny Code Generator (tcg)
> +    - Linux, other POSIX, Windows, MacOS
> +    - Arm, x86, Loongarch64, MIPS, PPC, s390x, Sparc64
> +
> +Feature Overview
> +----------------
> +
> +System emulation provides a wide range of device models to emulate
> +various hardware components you may want to add to your machine. This
> +includes a wide number of VirtIO devices which are specifically tuned
> +for efficient operation under virtualisation. Some of the device
> +emulation can be offloaded from the main QEMU process using either
> +vhost-user (for VirtIO) or :ref:`Multi-process QEMU`. If the platform
> +supports it QEMU also supports directly passing devices through to
> +guest VMs to eliminate the device emulation overhead. See
> +:ref:`device-emulation` for more details.
> +
> +There is a full featured block layer allows for construction of

"which allows"

> +complex storage topology which can be stacked across multiple layers
> +supporting redirection, networking, snapshots and migration support.
> +
> +The flexible ``chardev`` system allows for handling IO from character
> +like devices using stdio, files, unix sockets and TCP networking.
> +
> +QEMU provides a number of management interfaces including a line based
> +:ref:`Human Monitor Protocol (HMP)<QEMU monitor>` that allows you to
> +dynamically add and remove devices as well as introspect the system
> +state. The :ref:`QEMU Monitor Protocol<QMP Ref>` (QMP) is a well
> +defined, versioned, machine usable API that presents a rich interface
> +to other tools to create, control and manage Virtual Machines. This is
> +the interface used by higher level tools interfaces such as `Virt
> +Manager <https://virt-manager.org/>`_ using the `libvirt framework
> +<https://libvirt.org>`_.
> +
> +For the common accelerators QEMU supported debugging with its
> +:ref:`gdbstub<GDB usage>` which allows users to connect GDB and debug
> +system software images.
> +
> +Running
> +-------
> +
> +QEMU provides a rich and complex API which can be overwhelming to
> +understand. While some architectures can boot something with just a
> +disk image those examples elide a lot of details with defaults that

"disk image, "

> +may not be optimal for modern systems.
> +
> +For a non-x86 system where we emulate a broad range of machine types,
> +the command lines are generally more explicit in defining the machine
> +and boot behaviour. You will find often find example command lines in
> +the :ref:`system-targets-ref` section of the manual.
> +
> +While the project doesn't want to discourage users from using the
> +command line to launch VMs we do want to highlight there are a number

"VMs, "

"highlight that"

> +of projects dedicated to providing a more user friendly experience.
> +Those built around the ``libvirt`` framework can make use of feature
> +probing to build modern VM images tailored to run on the hardware you
> +have.
> +
> +That said the general form of a QEMU command line could be expressed

"That said, ". "can be expressed"

> +as:
> +
> +.. parsed-literal::
> +
> +  $ |qemu_system| [machine opts] \\
> +                  [cpu opts] \\
> +                  [accelerator opts] \\
> +                  [device opts] \\
> +                  [backend opts] \\
> +                  [interface opts] \\
> +                  [boot opts]
> +
> +Most options will generate some help information. So for example:
> +
> +.. parsed-literal::
> +
> +   $ |qemu_system| -M help
> +
> +will list the supported machine types by that QEMU binary. Help can

"the machine types supported by that QEMU binary"

"``help`` can"

> +also be passed as an argument to another option. For example:
> +
> +.. parsed-literal::
> +
> +  $ |qemu_system| -device scsi-hd,help
> +
> +will list the arguments and their default values of additional options
> +that can control the behaviour of the ``scsi-hd`` device.
> +
> +.. list-table:: Options Overview
> +  :header-rows: 1
> +  :widths: 10, 90
> +
> +  * - Options
> +    -
> +  * - Machine
> +    - Define the :ref:`machine type<Machine Options>`, amount of memory =
etc
> +  * - CPU
> +    - Type and number/topology of vCPUs. Most accelerators offer
> +      a ``host`` cpu option which simply passes through your host CPU
> +      configurtaion without filtering out any features.

"configuration"

> +  * - Accelerator
> +    - This will depend on the hypervisor you run, will fallback to
> +      slow TCG emulation by default

"Note that the default is TCG, which is purely emulated, so
you must specify an accelerator type to take advantage of
hardware virtualization."


> +  * - Devices
> +    - Additional devices that are not defined as default with the

"by default"

> +      machine type
> +  * - Backends
> +    - Backends are how QEMU deals with the guests data, for example

"guest's"

> +      how a block device is stored, how network devices see the
> +      network or a serial device is directed to the outside world.

"or how"

> +  * - Interfaces
> +    - How the system is displayed, how it is managed and controlled or
> +      debugged

We should be consistent about whether we end these bullet points
with a full stop or not.

> +  * - Boot
> +    - How the system boots, via firmware or direct kernel boot
> +
> +In the following example we first define a ``virt`` machine which is a
> +general purpose platform for running Aarch64 guests. We enable
> +virtualisation so we can use KVM inside the emulated guest

Missing full stop.


thanks
-- PMM

