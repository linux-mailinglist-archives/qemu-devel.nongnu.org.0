Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE272607C0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 02:42:20 +0200 (CEST)
Received: from localhost ([::1]:45054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFRiE-0008Kq-Sp
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 20:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1kFRhM-0007uv-3k
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 20:41:24 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:41039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1kFRhK-0006lp-0z
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 20:41:23 -0400
Received: by mail-il1-x143.google.com with SMTP id w8so13786630ilj.8
 for <qemu-devel@nongnu.org>; Mon, 07 Sep 2020 17:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2imIpy1311azDE+Sopd9ksoJmiBYEkbHQbCvOv41/0o=;
 b=kgVjcuMtcvcFnImBJOS3vjYALi4fuhXKWXXkkhrxy8o4yblQ0akeT1jqRRQMyzSqJH
 H+7yaUYE+KXmJeNeXzloPMPlN49WFh2vukjc0ZzfB1QySSV10k8jp3h7rt2t3E62kwe+
 RN9TZ2rcGpvvs1J7HMSRjhwXiC9WaAejHnVIfNxBBY8NXju5xuhXjHMc5baQ8qr8dJDN
 aJeXNZ4m61th4IdAPkL6yI85EkAY3kWwH4OWp49rjXMk/EZndJOFSmIzry/c4h8B2isF
 bZT5ZP4yhG6tTGN/AhLCqE/7Hn+RKnzeFzxRbc3MxVCvmd6fyIEp4kRSbmhQki7JGAMz
 GiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2imIpy1311azDE+Sopd9ksoJmiBYEkbHQbCvOv41/0o=;
 b=jInsB1b6fd/+E3UYIO92/Wo6FiE6Fmgm0hhKgmKE95flllefYP4h+Cp4CTaopmEH66
 3RxIPrmcaI2YQl4lQsEn5JYGPNMved1KFTtmmop46DdBMf2fZiwjlmHmEk34185zYLlP
 2Fkh7S73lN2/3x4PnpF46rMSsJ28jpk5pu30WKWsPTeMZa4xebKQHZGoOMRtRExo6d7E
 kznlh+ft+rlbb7BJ8GaMkvHBlh270y+/qaJk0dHIq1rp/jOXdLwhh2udQjYKDStyJR0P
 D4Phgmg80XoM+u2vRdoYen0sn5e4UlWx8FYJ3i6Vz2FB4a2uJNtBc25QUbyqar1DckMx
 A/Mw==
X-Gm-Message-State: AOAM531Df1H5EaL4oZxM/Q7F6S7c8hYsv7b0U7Wlr3m6dLLtelXXnnWH
 kU+9PH8NT6WXCoVyYApEJz7x69ZpJIKcwa8N4u4=
X-Google-Smtp-Source: ABdhPJz7gayT42xM11xl+dD1BWlDzSlhO0068B0blm36aNfw8DRhvyQBK0VmQKK4yTl0IkRntsi5hSD/AytD6A04NHs=
X-Received: by 2002:a92:c083:: with SMTP id h3mr21243337ile.208.1599525680526; 
 Mon, 07 Sep 2020 17:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <1598256668-12131-1-git-send-email-chenhc@lemote.com>
 <d594ed8e-1cb5-f9ac-09d3-7da28f5a95d3@amsat.org>
 <CAAhV-H4hRT+7KNCDX7bWwxK_mgYRSkWh+9rh1o6LLfD8zmGdqg@mail.gmail.com>
 <15357cf6-43d0-557c-f3c8-1668aa44fd5d@amsat.org>
In-Reply-To: <15357cf6-43d0-557c-f3c8-1668aa44fd5d@amsat.org>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Tue, 8 Sep 2020 08:41:09 +0800
Message-ID: <CAAhV-H5FdKzBxJQZTtxCQnA0SDr1qYSSupsQ96PQU2mpyr4TMA@mail.gmail.com>
Subject: Re: [PATCH V2 for-5.2] hw/null-machine: Add the kvm_type() hook for
 MIPS
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=chenhuacai@gmail.com; helo=mail-il1-x143.google.com
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
Cc: Huacai Chen <zltjiangshi@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Philippe,

On Mon, Sep 7, 2020 at 11:39 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> You forgot to Cc the maintainers, doing it for you:
>
> ./scripts/get_maintainer.pl -f hw/core/null-machine.c
> Eduardo Habkost <ehabkost@redhat.com> (supporter:Machine core)
> Marcel Apfelbaum <marcel.apfelbaum@gmail.com> (supporter:Machine core)
Thank you very much!

Huacai
>
> On 9/3/20 2:58 AM, Huacai Chen wrote:
> > Hi, Philippe,
> >
> > On Wed, Sep 2, 2020 at 9:55 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
> >>
> >> Hi Huacai,
> >>
> >> On 8/24/20 10:11 AM, Huacai Chen wrote:
> >>> MIPS has two types of KVM: TE & VZ, and TE is the default type. Now,
> >>> libvirt uses a null-machine to detect the kvm capability. In the MIPS
> >>> case, it will return "KVM not supported" on a VZ platform by default.
> >>> So, add the kvm_type() hook to the null-machine.
> >>>
> >>> This seems not a very good solution, but I cannot do it better now.
> >>>
> >>> Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
> >>> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> >>> Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >>> ---
> >>>  hw/core/meson.build    | 2 +-
> >>>  hw/core/null-machine.c | 6 ++++++
> >>>  2 files changed, 7 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/hw/core/meson.build b/hw/core/meson.build
> >>> index fc91f98..b6591b9 100644
> >>> --- a/hw/core/meson.build
> >>> +++ b/hw/core/meson.build
> >>> @@ -35,7 +35,6 @@ softmmu_ss.add(files(
> >>>    'machine-hmp-cmds.c',
> >>>    'machine.c',
> >>>    'nmi.c',
> >>> -  'null-machine.c',
> >>>    'qdev-fw.c',
> >>>    'qdev-properties-system.c',
> >>>    'sysbus.c',
> >>> @@ -45,5 +44,6 @@ softmmu_ss.add(files(
> >>>
> >>>  specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
> >>>    'machine-qmp-cmds.c',
> >>> +  'null-machine.c',
> >>>    'numa.c',
> >>>  ))
> >>> diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
> >>> index 7e69352..4b4ab76 100644
> >>> --- a/hw/core/null-machine.c
> >>> +++ b/hw/core/null-machine.c
> >>> @@ -17,6 +17,9 @@
> >>>  #include "sysemu/sysemu.h"
> >>>  #include "exec/address-spaces.h"
> >>>  #include "hw/core/cpu.h"
> >>> +#ifdef TARGET_MIPS
> >>> +#include "kvm_mips.h"
> >>> +#endif
> >>>
> >>>  static void machine_none_init(MachineState *mch)
> >>>  {
> >>> @@ -55,6 +58,9 @@ static void machine_none_machine_init(MachineClass =
*mc)
> >>>      mc->no_floppy =3D 1;
> >>>      mc->no_cdrom =3D 1;
> >>>      mc->no_sdcard =3D 1;
> >>> +#ifdef TARGET_MIPS
> >>> +    mc->kvm_type =3D mips_kvm_type;
> >>> +#endif
> >>
> >> I'm a bit confused here, you are taking the same path from your v4...
> >> https://www.mail-archive.com/qemu-devel@nongnu.org/msg712550.html
> >>
> >> Did you rebase the correct version?
> > The old patch has split to two parts, the first part is used by MIPS
> > machine and already merged. This is the second part used by the
> > null-machine (and libvirt use null-machine to detect kvm
> > capabilities).
> >
> > Huacai
> >>
> >>>  }
> >>>
> >>>  DEFINE_MACHINE("none", machine_none_machine_init)
> >>>
> >

