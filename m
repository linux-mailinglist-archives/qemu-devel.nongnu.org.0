Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FEE1C326C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 08:07:31 +0200 (CEST)
Received: from localhost ([::1]:60846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVUGI-00011g-7z
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 02:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1jVUF9-0000ZU-Ua
 for qemu-devel@nongnu.org; Mon, 04 May 2020 02:06:19 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:34251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1jVUF8-0003hT-7M
 for qemu-devel@nongnu.org; Mon, 04 May 2020 02:06:19 -0400
Received: by mail-lf1-x143.google.com with SMTP id s9so3460120lfp.1
 for <qemu-devel@nongnu.org>; Sun, 03 May 2020 23:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=olMZOs4SQDKa54vqF82hRIbaarwl03zQa0+MNLMtbd4=;
 b=RkSvEaOzitWp0uAQL9hEpg83wHyOnPuVb0K97VemIsqG9aIoM7byk4RG9upLEN9ej5
 1TlKM8nA1KEMOAe+4EtBTvkT2SJlKKkuhXU/wND7JrUKM3kZQ+E+0W5Ivq6ZpzWz0IQf
 nmqdE2+JjttLiwr0j+B3dbSC4Md9dyshOZkWvX8Y7D+wSiTwV9M17+YSHwk4fV80G4yr
 36MqzYx1ss30sj3dHCFYt2cpCa1c7sFIRXEZxdKb4TKvAOx3xsOqTa5NY4jmqC/Ngqy0
 xuHiH2hA9DW0cDVLbYe3n1MEtnJcpa8lfxzdVrhly4TxCIKBIzZn8LG9X4XsKaYETzAu
 KywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=olMZOs4SQDKa54vqF82hRIbaarwl03zQa0+MNLMtbd4=;
 b=aGZz0CjYTlPH4qESV2LToleO1EKJQu0BTMTtpGYngRwSXqFS5hEDsegOIRo5UKyZOF
 3hl6jLh5RbnS8qkakymFin1edy4WA2a4oMU/eRxX0VgFjKx174JjOMoheikwUiBbvtam
 6Hcgx41vxKWttwRS+8NvER5MX3ZR6hjNCudYv+FwZ/pRzdYMXy1XDJO7hIvqOlxMS2T2
 Eg2uIL6GvVc/vJIB35ALeQ8JtayFtaNPPmoz2oqDiZKEyBWefzI+PpEuT7J7BfoREgqz
 rnLRc/gx1xiSgopSyB/1GJhPd2c/nKOfMIf3hXFTfs4tUT/CI0b0PwlwjyaQYHQZ+kJQ
 Gcmw==
X-Gm-Message-State: AGi0Pub6aAYI5XbSkPfZvFHjTV3ch7vehcqfdTmvy/kPfmsqG2rE4nij
 c4ox2eUrSWuQgY6dHzcaMbAHEk/m+FtlaOOrXuQ=
X-Google-Smtp-Source: APiQypIkaEuPPz8NJ7l8uQpqpEz2tztJ5vBytUVWB4MGlPXPMS88oXMmAYpevAJ8g/AMDcUYFnhUH8po42Ruiz3gybM=
X-Received: by 2002:ac2:5e24:: with SMTP id o4mr78359lfg.37.1588572372211;
 Sun, 03 May 2020 23:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <1588501221-1205-1-git-send-email-chenhc@lemote.com>
 <CAE2XoE-6VMKY-_upyGoNeD0N6nWj2bfD6g9H0sZFFciWnOYwjw@mail.gmail.com>
In-Reply-To: <CAE2XoE-6VMKY-_upyGoNeD0N6nWj2bfD6g9H0sZFFciWnOYwjw@mail.gmail.com>
From: chen huacai <zltjiangshi@gmail.com>
Date: Mon, 4 May 2020 14:13:46 +0800
Message-ID: <CABDp7VrPVmhmfv7TTnXH8+kR_-9wDsmBvfTCJ+805yNSvLnCjA@mail.gmail.com>
Subject: Re: [PATCH for-5.1 V3 0/7] mips: Add Loongson-3 machine support (with
 KVM)
To: luoyonggang@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=zltjiangshi@gmail.com; helo=mail-lf1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Huacai Chen <chenhuacai@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-level <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Yonggang,

We are planning to translate these manuals to English by human, but it
needs a very long time to complete.

Huacai

On Sun, May 3, 2020 at 6:42 PM =E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo) <l=
uoyonggang@gmail.com> wrote:
>
> The english version of the reference document is hard to head.
> I suggest first convert the chinese version into markdown or alternative =
format and
> place them at github.
> And we then translate the document with google translate.
>
> On Sun, May 3, 2020 at 6:22 PM Huacai Chen <zltjiangshi@gmail.com> wrote:
>>
>> Loongson-3 CPU family include Loongson-3A R1/R2/R3/R4 and Loongson-3B
>> R1/R2. Loongson-3A R1 is the oldest and its ISA is the smallest, while
>> Loongson-3A R4 is the newest and its ISA is almost the superset of all
>> others. To reduce complexity, in QEMU we just define two CPU types:
>>
>> 1, "Loongson-3A1000" CPU which is corresponding to Loongson-3A R1. It is
>>    suitable for TCG because Loongson-3A R1 has fewest ASE.
>> 2, "Loongson-3A4000" CPU which is corresponding to Loongson-3A R4. It is
>>    suitable for KVM because Loongson-3A R4 has the VZ ASE.
>>
>> Loongson-3 lacks English documents. I've tried to translated them with
>> translate.google.com, and the machine translated documents (together
>> with their original Chinese versions) are available here.
>>
>> Loongson-3A R1 (Loongson-3A1000)
>> User Manual Part 1:
>> http://ftp.godson.ac.cn/lemote/3A1000_p1.pdf
>> http://ftp.godson.ac.cn/lemote/Loongson3A1000_processor_user_manual_P1.p=
df (Chinese Version)
>> User Manual Part 2:
>> http://ftp.godson.ac.cn/lemote/3A1000_p2.pdf
>> http://ftp.godson.ac.cn/lemote/Loongson3A1000_processor_user_manual_P2.p=
df (Chinese Version)
>>
>> Loongson-3A R2 (Loongson-3A2000)
>> User Manual Part 1:
>> http://ftp.godson.ac.cn/lemote/3A2000_p1.pdf
>> http://ftp.godson.ac.cn/lemote/Loongson3A2000_user1.pdf (Chinese Version=
)
>> User Manual Part 2:
>> http://ftp.godson.ac.cn/lemote/3A2000_p2.pdf
>> http://ftp.godson.ac.cn/lemote/Loongson3A2000_user2.pdf (Chinese Version=
)
>>
>> Loongson-3A R3 (Loongson-3A3000)
>> User Manual Part 1:
>> http://ftp.godson.ac.cn/lemote/3A3000_p1.pdf
>> http://ftp.godson.ac.cn/lemote/Loongson3A3000_3B3000usermanual1.pdf (Chi=
nese Version)
>> User Manual Part 2:
>> http://ftp.godson.ac.cn/lemote/3A3000_p2.pdf
>> http://ftp.godson.ac.cn/lemote/Loongson3A3000_3B3000usermanual2.pdf (Chi=
nese Version)
>>
>> Loongson-3A R4 (Loongson-3A4000)
>> User Manual Part 1:
>> http://ftp.godson.ac.cn/lemote/3A4000_p1.pdf
>> http://ftp.godson.ac.cn/lemote/3A4000user.pdf (Chinese Version)
>> User Manual Part 2:
>> I'm sorry that it is unavailable now.
>>
>> We are preparing to add QEMU's Loongson-3 support. MIPS VZ extension is
>> fully supported in Loongson-3A R4+, so we at first add QEMU/KVM support
>> in this series. And the next series will add QEMU/TCG support (it will
>> emulate Loongson-3A R1).
>>
>> We already have a full functional Linux kernel (based on Linux-5.4.x LTS
>> but not upstream yet) here:
>>
>> https://github.com/chenhuacai/linux
>>
>> How to use QEMU/Loongson-3?
>> 1, Download kernel source from the above URL;
>> 2, Build a kernel with arch/mips/configs/loongson3_{def,hpc}config;
>> 3, Boot a Loongson-3A4000 host with this kernel;
>> 4, Build QEMU-5.0.0 with this patchset;
>> 5, modprobe kvm;
>> 6, Use QEMU with TCG (available in future):
>>        qemu-system-mips64el -M loongson3,accel=3Dtcg -cpu Loongson-3A100=
0 -kernel <path_to_kernel> -append ...
>>    Use QEMU with KVM (available at present):
>>        qemu-system-mips64el -M loongson3,accel=3Dkvm -cpu Loongson-3A400=
0 -kernel <path_to_kernel> -append ...
>>
>>    The "-cpu" parameter can be omitted here and QEMU will use the correc=
t type for TCG/KVM automatically.
>>
>> V1 -> V2:
>> 1, Add a cover letter;
>> 2, Improve CPU definitions;
>> 3, Remove LS7A-related things (Use GPEX instead);
>> 4, Add a description of how to run QEMU/Loongson-3.
>>
>> V2 -> V3:
>> 1, Fix all possible checkpatch.pl errors and warnings.
>>
>> Huacai Chen(7):
>>  configure: Add KVM target support for MIPS64
>>  hw/mips: Implement the kvm_type() hook in MachineClass
>>  hw/mips: Add CPU IRQ3 delivery for KVM
>>  target/mips: Add Loongson-3 CPU definition
>>  target/mips: Add more CP0 register for save/restor
>>  hw/mips: Add Loongson-3 machine support (with KVM)
>>  MAINTAINERS: Add myself as Loongson-3 maintainer
>>
>> Signed-off-by: Huacai Chen <chenhc@lemote.com>
>> ---
>>  MAINTAINERS                          |   5 +
>>  configure                            |   2 +-
>>  default-configs/mips64el-softmmu.mak |   1 +
>>  hw/core/Makefile.objs                |   2 +-
>>  hw/core/null-machine.c               |   4 +
>>  hw/mips/Kconfig                      |  10 +
>>  hw/mips/Makefile.objs                |   3 +-
>>  hw/mips/common.c                     |  31 ++
>>  hw/mips/mips_int.c                   |   4 +-
>>  hw/mips/mips_loongson3.c             | 901 ++++++++++++++++++++++++++++=
+++++++
>>  include/hw/mips/mips.h               |   3 +
>>  target/mips/cpu.h                    |  28 ++
>>  target/mips/internal.h               |   2 +
>>  target/mips/kvm.c                    | 212 +++++++++
>>  target/mips/machine.c                |   6 +-
>>  target/mips/mips-defs.h              |   7 +-
>>  target/mips/translate.c              |   2 +
>>  target/mips/translate_init.inc.c     |  86 ++++
>>  18 files changed, 1300 insertions(+), 9 deletions(-)
>>  create mode 100644 hw/mips/common.c
>>  create mode 100644 hw/mips/mips_loongson3.c
>> --
>> 2.7.0
>>
>
>
> --
>          =E6=AD=A4=E8=87=B4
> =E7=A4=BC
> =E7=BD=97=E5=8B=87=E5=88=9A
> Yours
>     sincerely,
> Yonggang Luo



--=20
Huacai Chen

