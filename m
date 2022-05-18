Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B0852B81E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 12:49:55 +0200 (CEST)
Received: from localhost ([::1]:60400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrHFa-0004DT-SK
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 06:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrHCm-0002iA-8G
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:47:00 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:34517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrHCk-0003aR-1C
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:46:59 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2ff1ed64f82so19971737b3.1
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 03:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2hWGb9tGcTv7O0AGBNTv309pWLK709AaUDGfXJy9Fk0=;
 b=JolFOPfKA40v5XCZe0CKuiteUhWIBUG4lBUsbmwEJKUUK/KwdCEXe36jGAFKUjGyT9
 NhW5zK67qnlxTLnFusn2mwPZNj0XFIy0YzafWzXwkmkHhl3DVswoq9p2mUfyI2RlCniE
 hVCrS92uJtWV06MRkwyoUvQ/8w/IrxS5n7nDD8nWryrZln/5O2WLvha/1ngy/Bvpko3g
 3AEf2P4FhoV0RrCQLpdKrUrIxlVpemp3JRCg/vLnjxVWOT9PyZGFCWLM+P+TYM4SGpoz
 hiYUCqXQ+DRanQxUPDu+99LIzbcwNHwH+4VQydUvkWv+MEIXCkYrEgVuZJxGOU4vsO9v
 JrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2hWGb9tGcTv7O0AGBNTv309pWLK709AaUDGfXJy9Fk0=;
 b=QxdNj+PKkLnWixMue8Q2WJC7ATT/ffoJQogLQBbvcvbggMGvRiIGrXKsoNR1DfUapS
 SAJpIBN5Cq93anYLg1gYPyAxv6z4dDOtGFAEC0LeHAUCQZZ3WacXcaRp5SauvC6Bk5Mq
 XhB9wwag/5IInls0XTrVWMG/AJf+GwwKISn9qJozgudzpWKZPKDeTVgliC/L/WRKiHuq
 kBX90tEPnWLQOdyx6iWesthxGvodD7LEv+LedzjKwe4NXNt0cCN4Qaxs7NDlCtcgqJ11
 nKO/809JS2HSL3zlfVr3bAcap6SsW9+tZVGlDht3/Kz1NObn/j/1qn4LiZOFc8YfpRSw
 4kMA==
X-Gm-Message-State: AOAM533YQnklJKqVoxcVtg4Iyvg3tjUs2wqA+gk/a53y277V2VOVshPY
 QmhS4kVO30HUb5Ee21m4V5OcakzvhxRdE68fs9JqPg==
X-Google-Smtp-Source: ABdhPJzZ4vg7zDQvVu0UoQnkl7oeI/2YhhGQoib/msbQ7eLfK2sWuIpCH3Oii5xEOiBROp7OBTFmWR/luoQ/Hu+A/pU=
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr17620347ywc.329.1652870817023; Wed, 18
 May 2022 03:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKPy=abr_m_YSA2v-rVN8TdnsFX8uzUOpp0BpJkGj9yXMQ@mail.gmail.com>
 <YnOhHZGJphk30SmJ@redhat.com>
 <CAKmqyKMKxb81ZSpz-ncGc3fpt8f06EcEcXvtHjEpWLABXGT+uQ@mail.gmail.com>
 <YnTZP1iG+77Cugaq@redhat.com>
 <CAFEAcA_MncAJWUqG3yRVGMT0mXKvnBUqJLdoHwMdd=OW8fnodQ@mail.gmail.com>
 <CAHBxVyH=7hX5mjWcUBODk_tNHoczefdkfS8dFcf6is=vpz=SZw@mail.gmail.com>
 <CAKmqyKPK_F7Z4-tM9k8+3yXDdSTSFagieH23vqoW+TciXpnYqA@mail.gmail.com>
 <YoNiPw/3e+CY0v7o@redhat.com>
 <CAKmqyKOC0Fgu7WUXRcAJZNmVR8GeiXHGh4K8fg+5_c+pvZR_7w@mail.gmail.com>
 <CAOnJCU+i3m5OjM-wBf+t58YP9k5Jd0VeBK_yoPSPtzoE68H2EQ@mail.gmail.com>
 <YoStifZ0sCQkjyik@redhat.com>
In-Reply-To: <YoStifZ0sCQkjyik@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 May 2022 11:46:45 +0100
Message-ID: <CAFEAcA_UGkVUzN1fsNuK8ErVKM4bPoo7hretpF3wPbbR0nLV3A@mail.gmail.com>
Subject: Re: [RFC 0/3] Introduce a new Qemu machine for RISC-V
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <alistair23@gmail.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 18 May 2022 at 09:25, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> The fact that RISC-V ecosystem is so young & has relatively few
> users, and even fewer expecting  long term stability, is precisely
> why we should just modify the existing 'virt' machine now rather
> than introducing a new 'virt-pcie'. We can afford to have the
> limited incompatibility in the short term given the small userbase.
> We went through this same exercise with aarch64 virt machine and
> despite the short term disruption, it was a good success IMHO to
> get it switched from MMIO to PCI, instead of having two machines
> in parallel long term.

The aarch64 virt board does still carry around the mmio devices,
though...it's just that we have pci as well now.

Personally I don't think that switching to a new machine type
is likely to help escape from the "bloat" problem, which arises
from two conflicting desires:

 (1) people want this kind of board to be nice and small and
     simple, with a minimal set of devices
 (2) everybody has their own "but this specific one device is
     really important and it should be in the minimal set"
     (watchdog? acpi? ability to power the machine on and off?
     second UART? i2c? etc etc etc)

So either your 'minimal' board is only serving a small subset
of the users who want a minimal board; or else it's not as
minimal as any of them would like; or else it acquires a
growing set of -machine options to turn various devices on
and off...

-- PMM

