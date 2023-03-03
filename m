Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ED76A9D8A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:24:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY98y-0006GO-0q; Fri, 03 Mar 2023 12:24:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1pY98w-0006GE-Ln
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:24:30 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1pY98u-0005EZ-VL
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:24:30 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso6848886pjb.2
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1677864267;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UB2ctIOUmbM2Fdk9iEXeFn5HWLJlbBo1vZWbMSxD2DQ=;
 b=iz8OiDphwYTPiGgZQxz1A3q6+zcAUgOOQa3//E92jeA4KUhL4a0FPeS2RL8oWKHYZl
 la7SWFXqAr7mQK/S25gOoOzZIL1bqpnmtKPrZU/J8GFO7WSjrxGS0qORnZN4t26YaP1M
 N2/owJ0S2jbQzKYc4bnSyDrqkwdlPhdGIsCHpW7jLllCbtHhqb8f/jD+ZsBZNxy6b4/G
 rueBalxF4lmLxi2NWdpqIr1Wdqb6mEqFif1JPFE4pT/hFJ/uxfPKAaYGPcna2uQ4cPzm
 hPgcxdacoIFzCM6j4lZdlK9Y2xzL1fIpsaZmQcncOkA4eyCbxm4dqKg1Ir7uxTFV9VwF
 OBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864267;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UB2ctIOUmbM2Fdk9iEXeFn5HWLJlbBo1vZWbMSxD2DQ=;
 b=WQyaTVB18biJuv4znh2bsFJvxoMImWrX8VuVskNZLl/ZC3RKHPVUmvEjdoIIXIiC9G
 8+Ab2aDpiJOnKU2dc1wlogILawVBmTPX6lwiyoznogEP/Cfrl25R6l5zRu8N3u+pQjzz
 RSNkAL+coJvD/f8GFs+0hyx3JankwD6dLvc40UXFcndTnsDT7JBPO0+4p48TCRiqJH8/
 k22WvhZLQtl4kq4DT5YhlvSHkssecQ0ME3BuzoZLgPR8SzlzG63LvQgLZ2b5KqtgrIr9
 cZi6DPs6BfsCwgTq+ir73UwgCEiTUE49eAmBiD0BoTFNfeZxW97nBogPrC7iVXNs8LTB
 M5xA==
X-Gm-Message-State: AO0yUKXEQf65yqogn5JWwzAhyrXnxJFVWOlWAlhmwsLif1eZCiB28p4P
 kOfM01SDRqgNsIUG9xUEjoe1AL3KAkMLOhM+/9MQYQ==
X-Google-Smtp-Source: AK7set9vtH/3xdcROOm6wotxqiHehS1bCIb69RHkMtCraly/cxBzd25yrc1hcWbAzQ2HTPhW1ctDWh0Y8mGkXbeZnZM=
X-Received: by 2002:a17:90a:f98f:b0:231:1dab:f8e with SMTP id
 cq15-20020a17090af98f00b002311dab0f8emr872821pjb.9.1677864267310; Fri, 03 Mar
 2023 09:24:27 -0800 (PST)
MIME-Version: 1.0
References: <20230303022618.4098825-1-hshan@google.com>
 <20230303023013-mutt-send-email-mst@kernel.org>
 <aeac5ad3-6672-10b1-283d-10d950688697@linaro.org>
In-Reply-To: <aeac5ad3-6672-10b1-283d-10d950688697@linaro.org>
From: Haitao Shan <hshan@google.com>
Date: Fri, 3 Mar 2023 09:24:16 -0800
Message-ID: <CAGD3tSw+_qiNpSX51vGb7-XMKPFQuFKxBj072BegL_A4krn3Ag@mail.gmail.com>
Subject: Re: [PATCH 1/6] Add the Android Emulator hypervisor driver (AEHD)
 accelerator.
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=hshan@google.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Fri, Mar 3, 2023 at 2:19=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> On 3/3/23 08:33, Michael S. Tsirkin wrote:
> > On Thu, Mar 02, 2023 at 06:26:12PM -0800, Haitao Shan wrote:
> >> Add the configure support for the Android Emulator hypervisor driver
> >> accelerator. The Android Emulator hypervisor driver is a Windows
> >> driver made by porting the KVM from kernel 4.9-rc7.
> >>
> >> Signed-off-by: Haitao Shan <hshan@google.com>
> >
> > Replying on patch 1 but it applies to the whole patchset.
>
> Indeed this series lacks a cover letter, which would show
> this huge diffstat:
Sorry. I think I made a mistake and I know being new to
the community is not an excuse. I will correct it in future.
I don't know if "git sendmail" can have a cover letter. So the
cover letter was written separately. Again, I am sorry for
that.
>
>   MAINTAINERS                       |   12 +
>   accel/Kconfig                     |    3 +
>   docs/about/build-platforms.rst    |    2 +-
>   hw/i386/aehd/apic.c               |  204 +++++++++++++++
>   hw/i386/aehd/i8259.c              |  165 ++++++++++++
>   hw/i386/aehd/ioapic.c             |  164 ++++++++++++
>   hw/i386/aehd/meson.build          |    6 +
>   hw/i386/meson.build               |    1 +
>   hw/i386/pc.c                      |    5 +
>   hw/i386/x86.c                     |    5 +-
>   include/exec/poison.h             |    1 +
>   include/exec/ram_addr.h           |    2 -
>   include/hw/core/cpu.h             |    7 +
>   include/hw/intc/i8259.h           |    1 +
>   include/hw/intc/ioapic.h          |    1 +
>   include/sysemu/aehd-interface.h   |  878
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   include/sysemu/aehd.h             |  168 ++++++++++++
>   include/sysemu/hw_accel.h         |    1 +
>   meson.build                       |   16 ++
>   meson_options.txt                 |    2 +
>   qemu-options.hx                   |   20 +-
>   scripts/meson-buildoptions.sh     |    2 +
>   target/i386/aehd/aehd-accel-ops.c |  119 +++++++++
>   target/i386/aehd/aehd-accel-ops.h |   22 ++
>   target/i386/aehd/aehd-all.c       | 1349
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++
>   target/i386/aehd/aehd-cpu.c       |  150 +++++++++++
>   target/i386/aehd/aehd-cpu.h       |   41 +++
>   target/i386/aehd/aehd-stub.c      |   22 ++
>   target/i386/aehd/aehd.c           | 2003
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   target/i386/aehd/aehd_i386.h      |   26 ++
>   target/i386/aehd/aehd_int.h       |   50 ++++
>   target/i386/aehd/meson.build      |    8 +
>   target/i386/cpu-sysemu.c          |    3 +
>   target/i386/cpu.c                 |   12 +-
>   target/i386/cpu.h                 |    5 +-
>   target/i386/helper.c              |    3 +
>   target/i386/meson.build           |    2 +
>   37 files changed, 5465 insertions(+), 16 deletions(-)
>
> > There's obvious duplication with kvm here - probably not surprising.
> >
> > I'd be interested to hear from KVM people to know whether
> > there's interest in unifying code, or they would rather
> > not bother supporting this platform and it's better off
> > being kept separate.
>
> I believe the hw part can be unified, reducing the maintenance
> cost. (I gave Haitao few hints replying to the relevant patches).
Thanks. I will follow up in the relevant patch thread.
>
> Regards,
>
> Phil.



--=20
Haitao @Google

