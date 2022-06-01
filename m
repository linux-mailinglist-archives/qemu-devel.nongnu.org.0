Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EBB53A0D8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 11:41:16 +0200 (CEST)
Received: from localhost ([::1]:34004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwKqp-0007uj-Sd
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 05:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nwKoI-0006Q4-TS
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 05:38:38 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:39725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nwKoD-0000we-VS
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 05:38:38 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 w19-20020a9d6393000000b0060aeb359ca8so848594otk.6
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 02:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uc27UG4HniabnxAq0/BTcE7nQkT1CJ05031SvhdLOxs=;
 b=qeo93CF1CKALZyokHY6y+QYUYiG6OTHqrDK9eguk8c70lL136jmzoGSMf+UZIQF5ec
 KnnxTFzHrBGDCnR0nC2MFrSy94DI4JsyJ6Acr9MtRrXW/4gEmv35SnvevPN8u5SUu0FP
 wBrOkgxHL5cUty9yX/nThwLUO0LmZiJ672OdVoLqOfPzG+NlBnABm9ZjfQ8cpv3STWhV
 BKAi0svwdFr3jOz0nADNkE8xb4H1tNYeKcJQnyTOqW0prKEFDDkQBte2YtfiIOhM5rr3
 6gLLIBZVlIvkkz28gvnagur6a+opfw0dIXmehEVuMYXOtdPtHZ5/AUFaWvdWYoOSQxn5
 l6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uc27UG4HniabnxAq0/BTcE7nQkT1CJ05031SvhdLOxs=;
 b=1Tj4dP4f5IQSplmExX68KFU6kd+GbDWKX/bRHuddr1K/gCuljcKhTpUp9Cq0f+kJst
 0JrnWuhu3X2nm5rb0O7Rzelty0Dt3JpQngqR9rLfVs4b+f/5UHy1ZbWsHPfoFZZ496Zh
 a3E0CtY1mhSqcj23Q1LJUITZSAhCom0gJElRZ0slq7aRjgwJqxBAPFSH4l7n7/F8JLjP
 uOuPTCPsolSWIrVzIB308kJv/nvDwwD+csBNTbHUvpSGDwMwd+/d2lkKIWFy95iVBL8W
 W9S2crbppBHKGCRJI9FcTIYJJfD6+E7dnWGotGn4QdnM8nLdi5+VN87ppz/yzeRexdng
 K/PA==
X-Gm-Message-State: AOAM532D/8r0kIaeaA1rH39mn3oTsdmhSh8OayPULupwhTIg8xnin7uz
 HWTbv6PNdDfUIt+RGxq0VpMAFGQDzlg7M3In9fs=
X-Google-Smtp-Source: ABdhPJxXsqul8JgAEi1HJrep7DWLy7TDYzSAVB9saR8EmORI6m+kvs8kaS44MksiDUuVkR2xIop2L/JS93gVMDsw7P0=
X-Received: by 2002:a9d:4782:0:b0:60b:13bc:de61 with SMTP id
 b2-20020a9d4782000000b0060b13bcde61mr18230691otf.310.1654076311021; Wed, 01
 Jun 2022 02:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1653404595.git.jag.raman@oracle.com>
 <2a492c16e0464f70f7be1fd9c04172f4f18d14ca.1653404595.git.jag.raman@oracle.com>
 <Yo5DBb8i5SMbDKnq@stefanha-x1.localdomain>
 <E6AB9FA3-6580-44C6-93FA-AFC19477C296@oracle.com>
 <20220531141046.04b448e5.alex.williamson@redhat.com>
 <CAJSP0QU13=fLTVEjE1JbkOef5im4Dwb8x3xhpYYd7KPRJjav_Q@mail.gmail.com>
 <20220531154538.6d002124.alex.williamson@redhat.com>
 <E29AF321-4F2C-40B9-A1E1-ED6B455A0EEF@oracle.com>
In-Reply-To: <E29AF321-4F2C-40B9-A1E1-ED6B455A0EEF@oracle.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 1 Jun 2022 10:38:19 +0100
Message-ID: <CAJSP0QUXhx=bmz_qQRBafXRrdDWBJG+A1iu2b6qO=qwO6znyyA@mail.gmail.com>
Subject: Re: [PATCH v10 13/14] vfio-user: handle device interrupts
To: John Johnson <john.g.johnson@oracle.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, 
 QEMU Devel Mailing List <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=stefanha@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Wed, 1 Jun 2022 at 07:40, John Johnson <john.g.johnson@oracle.com> wrote=
:
>
> > On May 31, 2022, at 2:45 PM, Alex Williamson <alex.williamson@redhat.co=
m> wrote:
> >
> > On Tue, 31 May 2022 22:03:14 +0100
> > Stefan Hajnoczi <stefanha@gmail.com> wrote:
> >
> >> On Tue, 31 May 2022 at 21:11, Alex Williamson
> >> <alex.williamson@redhat.com> wrote:
> >>>
> >>> On Tue, 31 May 2022 15:01:57 +0000
> >>> Jag Raman <jag.raman@oracle.com> wrote:
> >>>
> >>>>> On May 25, 2022, at 10:53 AM, Stefan Hajnoczi <stefanha@redhat.com>=
 wrote:
> >>>>>
> >>>>> On Tue, May 24, 2022 at 11:30:32AM -0400, Jagannathan Raman wrote:
> >>>>>> Forward remote device's interrupts to the guest
> >>>>>>
> >>>>>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> >>>>>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> >>>>>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> >>>>>> ---
> >>>>>> include/hw/pci/pci.h              |  13 ++++
> >>>>>> include/hw/remote/vfio-user-obj.h |   6 ++
> >>>>>> hw/pci/msi.c                      |  16 ++--
> >>>>>> hw/pci/msix.c                     |  10 ++-
> >>>>>> hw/pci/pci.c                      |  13 ++++
> >>>>>> hw/remote/machine.c               |  14 +++-
> >>>>>> hw/remote/vfio-user-obj.c         | 123 ++++++++++++++++++++++++++=
++++
> >>>>>> stubs/vfio-user-obj.c             |   6 ++
> >>>>>> MAINTAINERS                       |   1 +
> >>>>>> hw/remote/trace-events            |   1 +
> >>>>>> stubs/meson.build                 |   1 +
> >>>>>> 11 files changed, 193 insertions(+), 11 deletions(-)
> >>>>>> create mode 100644 include/hw/remote/vfio-user-obj.h
> >>>>>> create mode 100644 stubs/vfio-user-obj.c
> >>>>>
> >>>>> It would be great if Michael Tsirkin and Alex Williamson would revi=
ew
> >>>>> this.
> >>>>
> >>>> Hi Michael and Alex,
> >>>>
> >>>> Do you have any thoughts on this patch?
> >>>
> >>> Ultimately this is just how to insert callbacks to replace the defaul=
t
> >>> MSI/X triggers so you can send a vector# over the wire for a remote
> >>> machine, right?  I'll let the code owners, Michael and Marcel, commen=
t
> >>> if they have grand vision how to architect this differently.  Thanks,
> >>
> >> An earlier version of the patch intercepted MSI-X at the msix_notify()
> >> level, replacing the entire function. This patch replaces
> >> msix_get_message() and msi_send_message(), leaving the masking logic
> >> in place.
> >>
> >> I haven't seen the latest vfio-user client implementation for QEMU,
> >> but if the idea is to allow the guest to directly control the
> >> vfio-user device's MSI-X table's mask bits, then I think this is a
> >> different design from VFIO kernel where masking is emulated by QEMU
> >> and not passed through to the PCI device.
> >
> > Essentially what's happening here is an implementation of an interrupt
> > handler callback in the remote QEMU instance.  The default handler is
> > to simply write the MSI message data at the MSI message address of the
> > vCPU, vfio-user replaces that with hijacking the MSI message itself to
> > simply report the vector# so that the "handler", ie. trigger, can
> > forward it to the client.  That's very analogous to the kernel
> > implementation.
> >
> > The equivalent masking we have today with vfio kernel would happen on
> > the client side, where the MSI/X code might instead set a pending bit
> > if the vector is masked on the client.  Likewise the possibility
> > remains, just as it does on the kernel side, that the guest masking a
> > vector could be relayed over ioctl/socket to set the equivalent mask on
> > the host/remote.
> >
> > I don't see a fundamental design difference here, but please point out
> > if I'm missing something.  Thanks,
> >
>
>
>
>         I don=E2=80=99t think you=E2=80=99ve missed anything.  We were tr=
ying to stay
> close to the kernel implementation.

Okay.

Stefan

