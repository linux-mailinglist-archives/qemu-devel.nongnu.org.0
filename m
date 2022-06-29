Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BDB55FDA8
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 12:45:02 +0200 (CEST)
Received: from localhost ([::1]:48872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6VBu-0003ao-0M
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 06:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1o6VAQ-0002qE-NS
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 06:43:30 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:33517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1o6VAK-0005Uo-8O
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 06:43:30 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-101d2e81bceso20960786fac.0
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 03:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DsG7tY6Ksy4EeYRn1qqLGHvj39CN1nG0874/IvNEy8I=;
 b=CyFrS8tI0D9PLS+wzOwAGubIHa6ztFCgjTW3exbAUL+StSrQZUs9Ihf5DsZyvDL37a
 Te1eET8bzB1+ibR9dNHB4LzmG3OxRhNrJf4AT1mH6d+bRGgR424VJsBh6YLjxobyC77R
 m/9kfQW/T52vu3p/NTzxfCCdcTuUsNXpMBkgbURoHCGm8/6L5sSSL+ZFu6Wzt0kJRgQP
 m2ST+s1D+HEgTOndNPe/R+ysAIy1khv1XwJaVC7VOFHYmAKp5iPZHUDtCHHqf0rKEgsO
 L5hD95cJydFOAk6g+OD15WKIViZNGj3Kb8gBaWNp92gWRWZpB+VmblsWAw31w91dg+R1
 d3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DsG7tY6Ksy4EeYRn1qqLGHvj39CN1nG0874/IvNEy8I=;
 b=1tfp4q+Tv4Np+m2ITSiFoStEWKAWP82dbQbH51jx6tqOiR+j0Zl15Qol8ij4+TWh1m
 jBCkUMv/CGCenBtdg8wjaty9/oth0pJ/z9VtAhDiAlMo+rxdaMriWEZu4Qb7dMMNJPIP
 AnAou0IUeNH1yoZ7g1woyr6vr8Vd4lhNNSVeFu5WEm21T4njxD7PHUEVI3zIj4fhlbLY
 EpRJQhJ9iXrP/DlgmHbYZ+BFXbkvyLZ/2+wRKnF0KgIHUopQEtT5geOWtwukOsB92UCf
 DBlEJ4NMxZ3ZwPSek2Pk8BhX4TUOP5SO+8882hkW+P7IFb47Hatv1mSoS6le+L1W21Cc
 wVIg==
X-Gm-Message-State: AJIora86Uy2RK3FYjn3KXBN5i+GEUtASXyU4Ti6xUD+S0VKH13SIDVTn
 fRlW6eCrkS4+I/0L9K5+rlgWxoYz5K3nMDU7Tyyvaw==
X-Google-Smtp-Source: AGRyM1trnO2OxhruXM4mdQOAPDrCAJtJiCrXQ93wTSyoDcEJ6+3SD9+a7xiQ0sMaeYP92LFWPGDYI9kSQawiwnhV5pY=
X-Received: by 2002:a05:6870:c1cd:b0:fe:1295:6e34 with SMTP id
 i13-20020a056870c1cd00b000fe12956e34mr1538522oad.137.1656499401788; Wed, 29
 Jun 2022 03:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220617073630.535914-1-chen.zhang@intel.com>
In-Reply-To: <20220617073630.535914-1-chen.zhang@intel.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Wed, 29 Jun 2022 13:43:10 +0300
Message-ID: <CABcq3pFZ_LZpWgpyLUOf2a=h0X4YunEH601oRN71Ui=YrO=4EQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/12] Introduce QEMU userspace ebpf support
To: Zhang Chen <chen.zhang@intel.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Yuri Benditovich <yuri.benditovich@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2001:4860:4864:20::32;
 envelope-from=andrew@daynix.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,
Nice idea.
It would be great if future patches would add the BPF map support(if
uBPF allows it).

On Fri, Jun 17, 2022 at 10:51 AM Zhang Chen <chen.zhang@intel.com> wrote:
>
> Hi All,
>
>     The goal of this series is to bring the power of ebpf to QEMU.
> It makes QEMU have the ability to extend the capabilities without
> requiring changing source code. Just need to load the eBPF binary
> file even at VM runtime. And already have some userspace ebpf
> implementation like: Intel DPDK eBPF, windows eBPF, etc..
> The original idea suggested by Jason Wang.
>
>     eBPF is a revolutionary technology with origins in the Linux kernel
> that can run sandboxed programs in an operating system kernel. It is
> used to safely and efficiently extend the capabilities of the kernel
> without requiring to change kernel source code or load kernel
> modules.(from https://ebpf.io/)
>
>     KVM already got benefits from it, but QEMU did not. Hence we want
> to bring the power of eBPF to QEMU. It can load binary eBPF program
> even when VM running. At the same time, add some hooks in QEMU as
> the user space eBPF load point. Do the things on different layers.
>
>    That=E2=80=99s the advantages of kernel eBPF. Most of the functions ca=
n be
> implemented in QEMU. This series just a start of the Power of Programmabi=
lity.
>
>     1). Safety:
>
>     Building on the foundation of seeing and understanding all system
>     calls and combining that with a packet and socket-level view of all
>     networking operations allows for revolutionary new approaches to
>     securing systems.
>
>     2). Tracing & Profiling:
>
>     The ability to attach eBPF programs to trace points as well as kernel
>     and user application probe points allows unprecedented visibility int=
o
>     the runtime behavior of applications and the system itself.
>
>     3). Networking:
>
>     The combination of programmability and efficiency makes eBPF a natura=
l
>     fit for all packet processing requirements of networking solutions.
>
>     4). Observability & Monitoring:
>
>     Instead of relying on static counters and gauges exposed by the
>     perating system, eBPF enables the collection & in-kernel aggregation
>     of custom metrics and generation of visibility events based on a wide
>     range of possible sources.
>
>     QEMU userspace ebpf design based on ubpf project (https://github.com/=
iovisor/ubpf).
> The most mature userspace ebpf implementation. This project officially
> support by iovisor(Like BCC and bpftrace). This project includes an eBPF
> assembler, disassembler, interpreter (for all platforms), and JIT compile=
r
> (for x86-64 and Arm64 targets). Qemu userspace ebpf make the ubpf project
> as the git submodule.
>
>     Current implementation support load ebpf program and run it in
> net/filter-ubpf module, this filter can support any user defined rules
> to hanle network packet. At the same time, it's easy for other developers
> to use the ubpf infrastructue in QEMU's other modules from the function
> in /ebpf/ubpf.c, and it support JIT.
>
>     For the uBPF License is Apache License 2.0, It's OK to compatible
> with QEMU=E2=80=99s GPLv2 LICENSE same as mason.
>
>     TODO: Need to add more comments and test-case for ubpf, current
> implementation not include ebpf verifier. But I think maybe it's not
> a big problem, current ebpf load/unload API exposed by QMP command.
> Qemu is a userspace program, if someone want to hack QEMU, no need to
> load a malicious ubpf program, it can hack QEMU code or crash QEMU on
> host directly(different from kernel ebpf needs strict inspection, but
> yes, it still need basic check).
>
> Any comments are welcome.
>
> Thanks
> Chen
>
>
> Zhang Chen (12):
>   configure: Add iovisor/ubpf project as a submodule for QEMU
>   meson: Add ubpf build config and misc
>   ebpf/uBPF: Introduce userspace ebpf data structure
>   ebpf/uBPF: Introduce ubpf initialize functions
>   ebpf/uBPF: Add qemu_prepare_ubpf to load ebpf binary
>   ebpf/uBPF: Add qemu_ubpf_run_once excute real ebpf program
>   net/filter: Introduce filter-ubpf module
>   qapi: Add FilterUbpfProperties and qemu-options
>   softmmu/vl.c: Add filter-ubpf for netdev as other netfilters
>   net/filter-ubpf.c: run the ubpf program to handle network packet
>   docs/devel: Add userspace-ebpf.rst
>   test/qtest: Add ubpf basic test case
>
>  .gitmodules                         |   3 +
>  configure                           |  20 +++
>  docs/devel/userspace-ebpf.rst       | 106 ++++++++++++++
>  ebpf/meson.build                    |   1 +
>  ebpf/ubpf-stub.c                    |  35 +++++
>  ebpf/ubpf.c                         | 217 ++++++++++++++++++++++++++++
>  ebpf/ubpf.h                         |  44 ++++++
>  meson.build                         |  47 ++++++
>  meson_options.txt                   |   3 +
>  net/filter-ubpf.c                   | 185 ++++++++++++++++++++++++
>  net/meson.build                     |   1 +
>  qapi/qom.json                       |  18 +++
>  qemu-options.hx                     |   6 +
>  scripts/coverity-scan/COMPONENTS.md |   3 +
>  scripts/meson-buildoptions.sh       |   5 +
>  softmmu/vl.c                        |   3 +-
>  tests/qtest/demo_ubpf.o             | Bin 0 -> 544 bytes
>  tests/qtest/integer_5.mem           | Bin 0 -> 4 bytes
>  tests/qtest/meson.build             |   3 +-
>  tests/qtest/ubpf-test.c             |  64 ++++++++
>  ubpf                                |   1 +
>  21 files changed, 763 insertions(+), 2 deletions(-)
>  create mode 100644 docs/devel/userspace-ebpf.rst
>  create mode 100644 ebpf/ubpf-stub.c
>  create mode 100644 ebpf/ubpf.c
>  create mode 100644 ebpf/ubpf.h
>  create mode 100644 net/filter-ubpf.c
>  create mode 100644 tests/qtest/demo_ubpf.o
>  create mode 100644 tests/qtest/integer_5.mem
>  create mode 100644 tests/qtest/ubpf-test.c
>  create mode 160000 ubpf
>
> --
> 2.25.1
>

