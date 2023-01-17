Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FBF66E05D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 15:23:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHmqb-0005lL-50; Tue, 17 Jan 2023 09:21:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmqY-0005ko-Hw
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:21:54 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmqW-0002EW-Dq
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:21:54 -0500
Received: by mail-pg1-x52b.google.com with SMTP id b12so22062010pgj.6
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 06:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KDWVUJ0bPWqsvAK21FjyVdTC67skb8FZZZ0Y2NDN+4E=;
 b=DD0dhzMvvgp0gR0txfdvzQw3mh709ufX8i/+fsYmmlJ5OcKw03yDNWTJMpVsIbaHfw
 c0+UWN5eaLKNW9u/jgaLHvYPRQxL7TALOgu0LALjHChpl6YR5ngiBmbh951/fBPqqfez
 smwaTPrnahv5NpszE2q6getS3xeq5H8MY67OfktAWiqjmRahpKOimcS/dnPfa5o6hQTo
 XIANo9jpuEX3tu+Yir8GwKUwqXzRzjfRO+x0d8REzR1UU1jOp5Vv87kW25O7NRa7VwvD
 Wxs1zkF/fwDI77P07ap7YC+JXOQpufI2EYTV0SXNVImqBfDb5JCOIEdSuh9iJ4MEYyWY
 KdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KDWVUJ0bPWqsvAK21FjyVdTC67skb8FZZZ0Y2NDN+4E=;
 b=7/4li6q/yYr9yZkQJg71YIqwkTdfAjsU1iSeBjmqfQx/C+7kILf8+M6a3fO6lGxbsi
 0CGMnpZDWpzFXZ9C+DSQQH2aTgdKf1EGKvTEGcmW49D3rMEZdD1iEsEnWv4Lzv+GB2sg
 8uTgnSdIQOgRruBX/Y5XiblqyFf23rlP773rVbXxeZ14u6gl5R/BZxs66e4KW/ZomlKD
 WgofdRrgF0DLHhRFAPg4gtL+yvafhlySEpdzXznR6jLqQAxugz6085N5T6o7CEobfa33
 qVmPj3m8hRJ43JS4Yfr4KQZoVBTbpx7kq6DnrCNU2tOY/fbGoKVkYPHFiPBjNAtEepCB
 eOHg==
X-Gm-Message-State: AFqh2kruapEBGwkh+3EDcpY2fsqZuQWivmmgwcyaelZdG6SRaLPklRmE
 /T3ahXdrEtcJlH3GsOmo4XMjIxDiHzWH9ZpiKrsMAA==
X-Google-Smtp-Source: AMrXdXuXydMCc1srvdZRpDOOx9cseFcuAL32AbPovQZq6LmLWkASB2xp+CgqMVZoYnViBv1sRLVA6aadUrOSdXNj+p8=
X-Received: by 2002:a05:6a00:2b1:b0:582:a212:d922 with SMTP id
 q17-20020a056a0002b100b00582a212d922mr277864pfs.3.1673965310589; Tue, 17 Jan
 2023 06:21:50 -0800 (PST)
MIME-Version: 1.0
References: <20230113133923.1642627-1-alex.bennee@linaro.org>
 <20230113133923.1642627-4-alex.bennee@linaro.org>
In-Reply-To: <20230113133923.1642627-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 14:21:38 +0000
Message-ID: <CAFEAcA9tWzJgzKWQr9TOXi1NGc7Fat2xcdgJhj9Su6Hju0o7LA@mail.gmail.com>
Subject: Re: [PATCH 3/4] semihosting: add semihosting section to the docs
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
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
> The main reason to do this is to document our O_BINARY implementation
> decision somewhere. However I've also moved some of the implementation
> details out of qemu-options and added links between the two. As a
> bonus I've highlighted the scary warnings about host access with the
> appropriate RST tags.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v2
>   - moved inside the generic emulation section
> ---
>  docs/about/emulation.rst | 80 ++++++++++++++++++++++++++++++++++++++++
>  qemu-options.hx          | 27 +++++---------
>  2 files changed, 90 insertions(+), 17 deletions(-)
>
> diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
> index d919175b5e..4d978e697b 100644
> --- a/docs/about/emulation.rst
> +++ b/docs/about/emulation.rst
> @@ -101,3 +101,83 @@ depending on the guest architecture.
>
>  A number of features are are only available when running under
>  emulation including :ref:`Record/Replay<replay>` and :ref:`TCG Plugins`.
> +
> +.. _Semihosting:
> +
> +Semihosting
> +-----------
> +
> +Semihosting is a feature provided by a number of guests that allow the

It's not provided by the guest, it's provided by QEMU... The
important thing here is that semihosting is an API defined by
somebody else, eg the owner of the architecture, and QEMU
offers an implementation of it.

> +program running on the target to interact with the host system. On
> +real hardware this is usually provided by a debugger hooked directly
> +to the system.
> +
> +Generally semihosting makes it easier to bring up low level code before =
a
> +more fully functional operating system has been enabled. On QEMU it
> +also allows for embedded micro-controller code which typically doesn't
> +have a full libc to be run as "bare-metal" code under QEMU's user-mode
> +emulation. It is also useful for writing test cases and indeed a
> +number of compiler suites as well as QEMU itself use semihosting calls
> +to exit test code while reporting the success state.
> +
> +Semihosting is only available using TCG emulation. This is because the
> +instructions to trigger a semihosting call are typically reserved
> +causing most hypervisors to trap and fault on them.
> +
> +.. warning::
> +   Semihosting inherently bypasses any isolation there may be between
> +   the guest and the host. As a result a program using semihosting can
> +   happily trash your host system. You should only ever run trusted
> +   code with semihosting enabled.

(One of these days I might write the patch for 'safe semihosting'
which limits support to only non-harmful functions like console
output and makes all the file access stuff return an error...)

> +
> +Redirection
> +~~~~~~~~~~~
> +
> +Semihosting calls can be re-directed to a (potentially remote) gdb
> +during debugging via the :ref:`gdbstub<GDB usage>`. Output to the
> +semihosting console is configured as a ``chardev`` so can be
> +redirected to a file, pipe or socket like any other ``chardev``
> +device.
> +
> +See :ref:`Semihosting Options<Semihosting Options>` for details.
> +
> +Supported Targets
> +~~~~~~~~~~~~~~~~~
> +
> +Most targets offer a similar semihosting implementations with some

"offer similar"

> +minor changes to define the appropriate instruction to encode the
> +semihosting call and which registers hold the parameters. They tend to
> +presents a simple POSIX-like API which allows your program to read and
> +write files, access the console and some other basic interactions.

"For full details of the ABI for a particular target, and the
set of calls it provides, you should consult the semihosting
specification for that architecture."

> +
> +.. note::
> +   QEMU makes an implementation decision to implement all file access
> +   in ``O_BINARY`` mode regardless of the host operating system.

We should say what the user-visible effect of this is (i.e. that even
if the semihosting API the guest uses makes a distinction between
"text" and "binary" mode files, QEMU does not, and no line-terminator
conversion is performed for input or output).

> This
> +   is because gdb semihosting support doesn't make the distinction
> +   between the modes and magically processing line endings can be confus=
ing.
> +
> +.. list-table:: Guest Architectures supporting Semihosting
> +  :widths: 10 10 80
> +  :header-rows: 1
> +
> +  * - Architecture
> +    - Modes
> +    - Specification
> +  * - Arm
> +    - System and User-mode
> +    - https://github.com/ARM-software/abi-aa/blob/main/semihosting/semih=
osting.rst
> +  * - m68k
> +    - System
> +    - https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3Dlib=
gloss/m68k/m68k-semi.txt;hb=3DHEAD
> +  * - mips
> +    - System
> +    - Unified Hosting Interface (MD01069)
> +  * - Nios II
> +    - System
> +    - https://sourceware.org/git/gitweb.cgi?p=3Dnewlib-cygwin.git;a=3Dbl=
ob;f=3Dlibgloss/nios2/nios2-semi.txt;hb=3DHEAD
> +  * - RISC-V
> +    - System and User-mode
> +    - https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-se=
mihosting-spec.adoc
> +  * - Xtensa
> +    - System
> +    - Tensilica ISS SIMCALL

We should be consistent in this table whether we're naming the
architectures by their official names (eg "RISC-V"), or by the
QEMU lowercase names for them (eg "mips").

> diff --git a/qemu-options.hx b/qemu-options.hx
> index 3aa3a2f5a3..de3a368f58 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4633,10 +4633,13 @@ DEF("semihosting", 0, QEMU_OPTION_semihosting,
>      QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
>  SRST
>  ``-semihosting``
> -    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V on=
ly).
> +    Enable :ref:`Semihosting` mode (ARM, M68K, Xtensa, MIPS, Nios II, RI=
SC-V only).
>
> -    Note that this allows guest direct access to the host filesystem, so
> -    should only be used with a trusted guest OS.
> +    .. warning::
> +      Note that this allows guest direct access to the host filesystem, =
so
> +      should only be used with a trusted guest OS.
> +
> +    .. _Semihosting Options:

Does this render OK in the manpage version of this text ?

>      See the -semihosting-config option documentation for further
>      information about the facilities this enables.
> @@ -4648,22 +4651,12 @@ QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA=
 |
>  QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
>  SRST
>  ``-semihosting-config [enable=3Don|off][,target=3Dnative|gdb|auto][,char=
dev=3Did][,userspace=3Don|off][,arg=3Dstr[,...]]``
> -    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II, =
RISC-V
> +    Enable and configure :ref:`Semihosting` (ARM, M68K, Xtensa, MIPS, Ni=
os II, RISC-V
>      only).
>
> -    Note that this allows guest direct access to the host filesystem, so
> -    should only be used with a trusted guest OS.
> -
> -    On Arm this implements the standard semihosting API, version 2.0.
> -
> -    On M68K this implements the "ColdFire GDB" interface used by
> -    libgloss.
> -
> -    Xtensa semihosting provides basic file IO calls, such as
> -    open/read/write/seek/select. Tensilica baremetal libc for ISS and
> -    linux platform "sim" use this interface.
> -
> -    On RISC-V this implements the standard semihosting API, version 0.2.
> +    .. warning::
> +      Note that this allows guest direct access to the host filesystem, =
so
> +      should only be used with a trusted guest OS.
>
>      ``target=3Dnative|gdb|auto``
>          Defines where the semihosting calls will be addressed, to QEMU
> --
> 2.34.1
>



-- PMM

