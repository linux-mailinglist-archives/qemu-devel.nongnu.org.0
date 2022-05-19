Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9727052DCA2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 20:20:12 +0200 (CEST)
Received: from localhost ([::1]:51120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkkt-00076R-8L
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 14:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nrkhZ-0004wg-Uc
 for qemu-devel@nongnu.org; Thu, 19 May 2022 14:16:45 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:33331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nrkhW-0006hU-QQ
 for qemu-devel@nongnu.org; Thu, 19 May 2022 14:16:45 -0400
Received: by mail-lf1-x12b.google.com with SMTP id bu29so10588683lfb.0
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 11:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Zi30fcTYn1lOMCKTjoTWwTFuPrF6I6u26bHaiGANU7g=;
 b=0qrQvOnwmPKHAo3l0n9b6UT6CbiRVs4Za1Y1HFSL+eCiZzQVptr+w6CyYjCqaMLSD/
 6Q6CIrTQTQJBzyhhYsd+DfP+E7WGHn1IoDBfoJzXPhJk6fX4sTQ9uUq3fd6plhfNATCn
 V1mgK9oZ1Nb3J7SYERsy25KovpxqKZV9cE/vbaEKOPhiIWjXkestybOd5l3XyTGO+zhk
 0IMaXVSIfq8ZUr2YTl38KZ4v1HSp8ZBBXfq1g4bBgLQoisELKFVNQFkUTizoRnVM/78o
 D6G2UxdPO/DTB4pz/C07iJyoQUMP+/iQS46awF6Og3GLVor5EPbpc+hrDV28aYe0S0r1
 Ouzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Zi30fcTYn1lOMCKTjoTWwTFuPrF6I6u26bHaiGANU7g=;
 b=crJTYh8djGrks34vh6K1wUYC+JPaUd1n2w5W/8t5oictowyKIa3BwCU1kj86e3mQlr
 Mg81vC7ATRnSIXx2Pp+CcqGAidm9Dk1Pz5Q9kydiB4Rmis9PKJ/cajOOE1h5VkZuPiMo
 QH1k8g/8VNVdratYLYoLiTVckHfX2hlEIv/V4qzgH3jGf44T8h5y8AC3C7NVOh5fbCvG
 Klj6Q5QeFNntrPv7f6tsDmC3yoEM1rK60GxysxSwFmHtH/fUfL38fUiMFlFAcIJJz/hM
 HAeR7LcrnoS3qRBCC+1hGued7yDDFiDiwX3BZCt6LMp577BmXSTceYNIN0/5B6Ax9I/b
 AMpA==
X-Gm-Message-State: AOAM533J6HHDT0L/p33MnGftizh2y8kuwE97G6IOU6c/Hwt8xTxmpP6r
 0bv3UbHUVDSvEP0GOg250yha2vEitFFljwMA2KlWlA==
X-Google-Smtp-Source: ABdhPJyRlzVk+pDv5UjSnnkdLKzo6IAir8Rkq8n5Y2Jc8TLRZCxUDN1/3AlDZf6+LTt9tqr6v4wx7y6U/Qbxdhd5FnA=
X-Received: by 2002:a05:6512:b1e:b0:44a:9b62:3201 with SMTP id
 w30-20020a0565120b1e00b0044a9b623201mr4356622lfu.42.1652984197425; Thu, 19
 May 2022 11:16:37 -0700 (PDT)
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
 <CAFEAcA_UGkVUzN1fsNuK8ErVKM4bPoo7hretpF3wPbbR0nLV3A@mail.gmail.com>
In-Reply-To: <CAFEAcA_UGkVUzN1fsNuK8ErVKM4bPoo7hretpF3wPbbR0nLV3A@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 19 May 2022 11:16:25 -0700
Message-ID: <CAHBxVyH3BMe=CAxPkUpKGmhhb3E+Q03uAkCBavbx=ACDqN1v_g@mail.gmail.com>
Subject: Re: [RFC 0/3] Introduce a new Qemu machine for RISC-V
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Atish Patra <atishp@atishpatra.org>, Alistair Francis <alistair23@gmail.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=atishp@rivosinc.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, May 18, 2022 at 3:46 AM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Wed, 18 May 2022 at 09:25, Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
> > The fact that RISC-V ecosystem is so young & has relatively few
> > users, and even fewer expecting  long term stability, is precisely
> > why we should just modify the existing 'virt' machine now rather
> > than introducing a new 'virt-pcie'. We can afford to have the
> > limited incompatibility in the short term given the small userbase.
> > We went through this same exercise with aarch64 virt machine and
> > despite the short term disruption, it was a good success IMHO to
> > get it switched from MMIO to PCI, instead of having two machines
> > in parallel long term.
>
> The aarch64 virt board does still carry around the mmio devices,
> though...it's just that we have pci as well now.
>
> Personally I don't think that switching to a new machine type
> is likely to help escape from the "bloat" problem, which arises
> from two conflicting desires:
>
>  (1) people want this kind of board to be nice and small and
>      simple, with a minimal set of devices
>  (2) everybody has their own "but this specific one device is
>      really important and it should be in the minimal set"
>      (watchdog? acpi? ability to power the machine on and off?
>      second UART? i2c? etc etc etc)
>

Both acpi/device tree support should be there anyways.
MMIO based reset will probably needed as well (I listed that earlier
with mandatory MMIO devices)

AFAIK everything else can be PCIe based which the new board will mandate.
It must strictly enforce the rules about what can be added to it. The
bar to allow
new MMIO devices must be very high and must have a wide range of usage.
This will make life easier for the entire ecosystem as well. AFAIK,
libvirt uses PCIe devices only to build VMs.

I understand that is probably a big ask but if odd mmio devices sneak
into this platform, then that defeats the purpose.
On other hand, having a flag day for virt machines creates a lot of
incompatibility for the users until everyone transitions.
The transition also has to happen based on Qemu version as virt
machine doesn't have any versioning right now.

Do we make users' life difficult by having a flag date based on the
Qemu version or take additional responsibility of maintaining another
board ?
I hope the new board will continue to be small so the maintenance
burden is not too much. Personally, I feel the latter approach will
have minimum inconvenience for everybody
but I am okay with whatever is decided by the community.



> So either your 'minimal' board is only serving a small subset
> of the users who want a minimal board; or else it's not as
> minimal as any of them would like; or else it acquires a
> growing set of -machine options to turn various devices on
> and off...
>
> -- PMM

