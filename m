Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D75A6D817E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 17:18:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk4te-0007Pv-Qk; Wed, 05 Apr 2023 11:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pk4tc-0007Pf-Cr
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 11:18:00 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pk4ta-0003hq-EV
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 11:18:00 -0400
Received: by mail-ed1-x52b.google.com with SMTP id eh3so141923281edb.11
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 08:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680707876;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bAmF1hJCSeVno7Za+WQQ+tKe7BivfHylAdafRYVOua0=;
 b=sT38Epp0D4hOfkXjve7F+skHig0RDUkdUgvf2lAxi5XFSNojbyumCpyN37J8G6SugN
 gTkH2ICxQKVO4XQOsyDTBm+5B7IMLyG33pmszkQCri0Skxdlg0TEyTLtLIpAnbyZwfcN
 uRSU9bNXEFizL/ZOJRkFnbxF/3OQtqZnHusupvuUHyqGMDlUoaOojfAoKT/f6MndiJOx
 dC8wXHir/0FdlBao2gZkwQD/syfHQEQ/SvlotJbjjfxx5llsOCoct9iTG2K9yY52D5oL
 Fe7dnoGA/dlGo5zaAacAC+DiOvI8xuXYB/RnY1OoJNt+I8ITV5H1HY/vWNgTz6Rn653v
 3MVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680707876;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bAmF1hJCSeVno7Za+WQQ+tKe7BivfHylAdafRYVOua0=;
 b=PVgD75S2K321YwtQAQWZSP2udnAN8yxk4gPx/ybNFXfhLOERL6bQOGC0kzItwWpT6z
 mSfyExZe08uBQtAJDbGsGbvEZAoOSdezA8WrJJcdrKqgWBugway4NaxnJ7sJO/4YZ99b
 U63Zsmhiq0s570FudN8kJjHcfHcb8+q2nyIr3B3/y39M0p5Xw0Iq4Kkq2MgMtn4+WMQi
 Tucj2QspudOkRzGGBTYACvhdUwPp3hPWw/z2/KOtYU/ofr+jLyhN5XLAsuyQEDCjGaEZ
 XsrLf9oLfURFgghjrSRefMLZ8queWrf6HoOuiLLXE+6HjWc1xUuW0/J9F/In3WwpBE/J
 R1hw==
X-Gm-Message-State: AAQBX9faLsjw2PgncE/e79G+Po+rEPcg/+izBSbgiS+4g1auX8SX9C7p
 3QoPDncClQI8eiZ9P2eOWQR5hzFVv0x44W5QBbZPWQ==
X-Google-Smtp-Source: AKy350bfammrAmAjEKPYwaLUGDkLrnsAfquTQZAkNleCTDf2Vrf4/yE8H9tkPnmU02A0L4wJnGykoT0bQLrX0/t/mlA=
X-Received: by 2002:a17:907:118d:b0:932:4577:6705 with SMTP id
 uz13-20020a170907118d00b0093245776705mr1904754ejb.6.1680707876409; Wed, 05
 Apr 2023 08:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <917c1c552b2d1b732f9a86c6a90684c3a5e4cada.1680640587.git.mst@redhat.com>
 <6c84a18e-beff-36e6-1b0b-f8c419197bd2@linaro.org>
In-Reply-To: <6c84a18e-beff-36e6-1b0b-f8c419197bd2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Apr 2023 16:17:45 +0100
Message-ID: <CAFEAcA_5SzdkrTxJOVw0T2Yi6D_bsQ9TbPkKNbnrqSmJTNoRWg@mail.gmail.com>
Subject: Re: [PATCH] Revert "memory: Optimize replay of guest mapping"
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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

On Tue, 4 Apr 2023 at 23:04, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 4/4/23 22:37, Michael S. Tsirkin wrote:
> > From: Peter Maydell <peter.maydell@linaro.org>
> >
> > This reverts commit 6da24341866fa940fd7d575788a2319514941c77
> > ("memory: Optimize replay of guest mapping").
> >
> > This change breaks the mps3-an547 board under TCG (and
> > probably other TCG boards using an IOMMU), which now
> > assert:
> >
> > $ ./build/x86/qemu-system-arm --machine mps3-an547 -serial stdio
> > -kernel /tmp/an547-mwe/build/test.elf
> > qemu-system-arm: ../../softmmu/memory.c:1903:
> > memory_region_register_iommu_notifier: Assertion `n->end <=3D
> > memory_region_size(mr)' failed.
> >
> > This is because tcg_register_iommu_notifier() registers
> > an IOMMU notifier which covers the entire address space,
> > so the assertion added in this commit is not correct.
> >
> > For the 8.0 release, just revert this commit as it is
> > only an optimization.
> >
> > Fixes: 6da24341866f ("memory: Optimize replay of guest mapping")
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >
> > completely untested but Pater asked help in sending this.
> >
> >   hw/i386/intel_iommu.c | 2 +-
> >   softmmu/memory.c      | 4 ++--
> >   2 files changed, 3 insertions(+), 3 deletions(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Thanks; I have applied this to master to fix the assertion failure
for rc3.

-- PMM

