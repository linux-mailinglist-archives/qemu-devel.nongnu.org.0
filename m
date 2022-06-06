Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EB953F0F9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 22:52:17 +0200 (CEST)
Received: from localhost ([::1]:36620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyJhw-0000aV-Fs
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 16:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1nyJVB-0003F9-Pf
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 16:39:05 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:36580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1nyJUv-0006jx-Ay
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 16:39:03 -0400
Received: by mail-ej1-x636.google.com with SMTP id s12so23995551ejx.3
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 13:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WXzWkSKyDGkg51htMGQ7iVLxq8zQQCq1Mxef8R/uVrg=;
 b=J+ssGxwFOg6UZxfCse797e++GjUm8U9ylpAGJbMe8urafNBs53Dj0IB4C6OfK6HGb+
 lf1DHpj1wtPEV5VE/nIgnMukdcL8StXWlA5IvIID0bQ8rIPqGBk3cMLXC4ZFd+L/4+t6
 Si0ab7+iOt2KK4/Cez8XQhjFEGIC3ARO4M03B2awcI2JWf1Mv5KfiHMFyoFTerwWRfQq
 s4jc9OZq7+sNc46v3o+qp3EIcfkSfrO/mBo2WTMgeDldWNsPMCljgSbl06GXxeUuodyi
 zSymn/uEBXdGCO5WTkb3C4wOSUvWkOj60+STni9sC4TgGy4ZfAHwaYTo5lykiDfHfshV
 WY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WXzWkSKyDGkg51htMGQ7iVLxq8zQQCq1Mxef8R/uVrg=;
 b=rEtUsKBTgjjEB9sscbEM2v2eEC2v7TsHMC30XqgZVUsW7PVwku3Whh7y9F820zqGds
 Dh19omsv+vfLabIUYKxs1s0QfFS8cOrsksIA6MU5GwXFNXzeR+9aA0e6LogT+xcWzc5a
 flECW595CMWko7utl9ruD9Ec0wzubSAzdfLnjPQwO52XXSJvanfGxddwqvE2GyxO9cVb
 57ZnFplxkEzoDaB5pP8metj9cASl5B+0WQQbXSKB+S7qeCNNDVKrbLUd53IjTwhfA+LE
 h1CZtSvH1yDtu+cpUG6ILAb4qlkThk+6bR9mkqgU7Mkqi1oNcZ8lWlQQxsTdrMj6c6mv
 xzWA==
X-Gm-Message-State: AOAM530zaL1IywDthFajcANsPjbQSqdWpD9hrECtBsKzY1wFcDMlaNjw
 iTIMpR9UiQLDFND3+5+F3pvzpeuY9ijwKqaysmc=
X-Google-Smtp-Source: ABdhPJxkEb0uVJODatLWuKuh3ZhV5U50TXemblMIQJoaTqugIb+9xoTWlGzBLa/F9TXY3R8wW6epZsURNfQGMUIHkLM=
X-Received: by 2002:a17:906:586:b0:70d:9052:fdf0 with SMTP id
 6-20020a170906058600b0070d9052fdf0mr18142271ejn.633.1654547922187; Mon, 06
 Jun 2022 13:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1653404595.git.jag.raman@oracle.com>
 <2a492c16e0464f70f7be1fd9c04172f4f18d14ca.1653404595.git.jag.raman@oracle.com>
 <CAKgT0UdnSjUqubFT2pjB1KiVcE42ScPjBMSvV8cNf=S=1U7n=g@mail.gmail.com>
 <7F3721E6-A29D-4B74-872C-6648BC6E97E7@oracle.com>
In-Reply-To: <7F3721E6-A29D-4B74-872C-6648BC6E97E7@oracle.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Mon, 6 Jun 2022 13:38:30 -0700
Message-ID: <CAKgT0Uf9KYAFfuoaCWv1_GwTH6kcwgpdFwrd4AUSSpnPkyu73w@mail.gmail.com>
Subject: Re: [PATCH v10 13/14] vfio-user: handle device interrupts
To: Jag Raman <jag.raman@oracle.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, "f4bug@amsat.org" <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "thuth@redhat.com" <thuth@redhat.com>, 
 "bleal@redhat.com" <bleal@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 "eduardo@habkost.net" <eduardo@habkost.net>, 
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "eblake@redhat.com" <eblake@redhat.com>, 
 "armbru@redhat.com" <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, Peter Xu <peterx@redhat.com>, 
 "john.levon@nutanix.com" <john.levon@nutanix.com>, 
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
 John Johnson <john.g.johnson@oracle.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alexander.duyck@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Jun 6, 2022 at 12:29 PM Jag Raman <jag.raman@oracle.com> wrote:
>
>
>
> > On Jun 6, 2022, at 2:32 PM, Alexander Duyck <alexander.duyck@gmail.com>=
 wrote:
> >
> > On Tue, May 24, 2022 at 9:11 AM Jagannathan Raman <jag.raman@oracle.com=
> wrote:
> >>
> >> Forward remote device's interrupts to the guest
> >>
> >> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> >> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> >> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> >> ---
> >> include/hw/pci/pci.h              |  13 ++++
> >> include/hw/remote/vfio-user-obj.h |   6 ++
> >> hw/pci/msi.c                      |  16 ++--
> >> hw/pci/msix.c                     |  10 ++-
> >> hw/pci/pci.c                      |  13 ++++
> >> hw/remote/machine.c               |  14 +++-
> >> hw/remote/vfio-user-obj.c         | 123 ++++++++++++++++++++++++++++++
> >> stubs/vfio-user-obj.c             |   6 ++
> >> MAINTAINERS                       |   1 +
> >> hw/remote/trace-events            |   1 +
> >> stubs/meson.build                 |   1 +
> >> 11 files changed, 193 insertions(+), 11 deletions(-)
> >> create mode 100644 include/hw/remote/vfio-user-obj.h
> >> create mode 100644 stubs/vfio-user-obj.c
> >>
> >
> > So I had a question about a few bits below. Specifically I ran into
> > issues when I had setup two devices to be assigned to the same VM via
> > two vfio-user-pci/x-vfio-user-server interfaces.
>
> Thanks for the heads up, Alexander!
>
> >
> > What I am hitting is an assert(irq_num < bus->nirq) in
> > pci_bus_change_irq_level in the server.
>
> That is issue is because we are only initializing only one
> IRQ for the PCI bus - but it should be more. We will update
> it and when the bus initializes interrupts and get back to you.
>
> We only tested MSI/x devices for the multi-device config. We
> should also test INTx - could you please confirm which device
> you=E2=80=99re using so we could verify that it works before posting
> the next revision.
>
> Thank you!
> --
> Jag

I was testing an MSI-X capable NIC, so you can reproduce with e1000e.
During the device enumeration before the driver was even loaded it
threw the error:
qemu-system-x86_64: ../hw/pci/pci.c:276: pci_bus_change_irq_level:
Assertion `irq_num < bus->nirq' failed.

All it really takes is attaching to the second device, that is enough
to trigger the error since the irq_num will be non-zero.

If I recall, all the kernel is doing is unmasking the interrupt via
the config space and it is triggering the error which then shuts down
the server.

