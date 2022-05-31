Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B7A5398F5
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 23:47:58 +0200 (CEST)
Received: from localhost ([::1]:52650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw9iX-0007ea-6z
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 17:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nw9gW-0006wi-FK
 for qemu-devel@nongnu.org; Tue, 31 May 2022 17:45:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nw9gS-0002ww-Ud
 for qemu-devel@nongnu.org; Tue, 31 May 2022 17:45:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654033545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tIvfYxYWqbQM1CfPNgRpUNeV0yiW9Lxx25WokDNt8bU=;
 b=Ya8EoQCVT/aJYSY1QDKkUw8yE4FfUnpIU0paQ7xWJfklrnp6ddQ7dRKx7TJy0cf+aKP+jc
 C0VEoZnaubACfw1ty3ykEqWj0PG/W6A6l3BuiOWFYjXDQE5DQUhHnnXUqeUi2NRl0VPw73
 TzvT5lajUlE2X08F+Gl/G7ezQu9tCZs=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278--A4dd2buNF-nqqZ6TgVS_Q-1; Tue, 31 May 2022 17:45:42 -0400
X-MC-Unique: -A4dd2buNF-nqqZ6TgVS_Q-1
Received: by mail-il1-f198.google.com with SMTP id
 r9-20020a92cd89000000b002d16798b3cfso11137360ilb.22
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 14:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=tIvfYxYWqbQM1CfPNgRpUNeV0yiW9Lxx25WokDNt8bU=;
 b=sQr/knPmvzYw5c66tGAvu84GDDr0NvqfiX6W1IPUBQ8n9jJ/HpPtUaoTOuDK5owCKH
 zfuQpdMFaDUBDiUSMwQCG56jcYFWbWHwhhPBNAz+Tp1dzgk46o+WuvJmkncQzpfi+pvH
 Jmw6/GQjDqGOY78OkojqVsY88p+gfqd7+RIsjTir55fxInFHnw41lyBrr5/ZKmuHrbSb
 vafIbLfExSLpceOKhrcrR/Wb4AfKZWI8hUUh9QdMO/GViBStW+hFdvJie22g1nrJ5pK5
 MC5GNPC0rIm2+BH2nRcqPjC5bJT5IV2E4nYZl0ELwfTHr0+aiHAW7ah8p+qU4bJTp0vs
 FnTw==
X-Gm-Message-State: AOAM532u7WOAaWNjmoKBE9bBK/z8XpkLfxn3fZtKWPXfFkJY5PI9tJQq
 ucgEjQ0sEh7KVS9Q8rwwxGr9myyoum2Dyk+72cGYRUv4Q9ycLdWglbnj9iZiBiie82lo4cMAp6U
 DPYM1Z9C8A65qoP0=
X-Received: by 2002:a05:6638:3051:b0:317:8a78:7be5 with SMTP id
 u17-20020a056638305100b003178a787be5mr31502269jak.142.1654033541338; 
 Tue, 31 May 2022 14:45:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUQomOCzVFeDxom1dxGGgmzTYc1bxxXrz1xx+70aarXzLlBskRr4Na5wVX+UAgokdHSszzag==
X-Received: by 2002:a05:6638:3051:b0:317:8a78:7be5 with SMTP id
 u17-20020a056638305100b003178a787be5mr31502242jak.142.1654033541106; 
 Tue, 31 May 2022 14:45:41 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 u17-20020a5d8711000000b0065a47e16f62sm4272661iom.52.2022.05.31.14.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 14:45:40 -0700 (PDT)
Date: Tue, 31 May 2022 15:45:38 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Jag Raman <jag.raman@oracle.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "eduardo@habkost.net" <eduardo@habkost.net>, "marcel.apfelbaum@gmail.com"
 <marcel.apfelbaum@gmail.com>, "eblake@redhat.com" <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "peterx@redhat.com"
 <peterx@redhat.com>, "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>, Elena Ufimtseva
 <elena.ufimtseva@oracle.com>, John Johnson <john.g.johnson@oracle.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>
Subject: Re: [PATCH v10 13/14] vfio-user: handle device interrupts
Message-ID: <20220531154538.6d002124.alex.williamson@redhat.com>
In-Reply-To: <CAJSP0QU13=fLTVEjE1JbkOef5im4Dwb8x3xhpYYd7KPRJjav_Q@mail.gmail.com>
References: <cover.1653404595.git.jag.raman@oracle.com>
 <2a492c16e0464f70f7be1fd9c04172f4f18d14ca.1653404595.git.jag.raman@oracle.com>
 <Yo5DBb8i5SMbDKnq@stefanha-x1.localdomain>
 <E6AB9FA3-6580-44C6-93FA-AFC19477C296@oracle.com>
 <20220531141046.04b448e5.alex.williamson@redhat.com>
 <CAJSP0QU13=fLTVEjE1JbkOef5im4Dwb8x3xhpYYd7KPRJjav_Q@mail.gmail.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 31 May 2022 22:03:14 +0100
Stefan Hajnoczi <stefanha@gmail.com> wrote:

> On Tue, 31 May 2022 at 21:11, Alex Williamson
> <alex.williamson@redhat.com> wrote:
> >
> > On Tue, 31 May 2022 15:01:57 +0000
> > Jag Raman <jag.raman@oracle.com> wrote:
> >  
> > > > On May 25, 2022, at 10:53 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > > >
> > > > On Tue, May 24, 2022 at 11:30:32AM -0400, Jagannathan Raman wrote:  
> > > >> Forward remote device's interrupts to the guest
> > > >>
> > > >> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > > >> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> > > >> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> > > >> ---
> > > >> include/hw/pci/pci.h              |  13 ++++
> > > >> include/hw/remote/vfio-user-obj.h |   6 ++
> > > >> hw/pci/msi.c                      |  16 ++--
> > > >> hw/pci/msix.c                     |  10 ++-
> > > >> hw/pci/pci.c                      |  13 ++++
> > > >> hw/remote/machine.c               |  14 +++-
> > > >> hw/remote/vfio-user-obj.c         | 123 ++++++++++++++++++++++++++++++
> > > >> stubs/vfio-user-obj.c             |   6 ++
> > > >> MAINTAINERS                       |   1 +
> > > >> hw/remote/trace-events            |   1 +
> > > >> stubs/meson.build                 |   1 +
> > > >> 11 files changed, 193 insertions(+), 11 deletions(-)
> > > >> create mode 100644 include/hw/remote/vfio-user-obj.h
> > > >> create mode 100644 stubs/vfio-user-obj.c  
> > > >
> > > > It would be great if Michael Tsirkin and Alex Williamson would review
> > > > this.  
> > >
> > > Hi Michael and Alex,
> > >
> > > Do you have any thoughts on this patch?  
> >
> > Ultimately this is just how to insert callbacks to replace the default
> > MSI/X triggers so you can send a vector# over the wire for a remote
> > machine, right?  I'll let the code owners, Michael and Marcel, comment
> > if they have grand vision how to architect this differently.  Thanks,  
> 
> An earlier version of the patch intercepted MSI-X at the msix_notify()
> level, replacing the entire function. This patch replaces
> msix_get_message() and msi_send_message(), leaving the masking logic
> in place.
> 
> I haven't seen the latest vfio-user client implementation for QEMU,
> but if the idea is to allow the guest to directly control the
> vfio-user device's MSI-X table's mask bits, then I think this is a
> different design from VFIO kernel where masking is emulated by QEMU
> and not passed through to the PCI device.

Essentially what's happening here is an implementation of an interrupt
handler callback in the remote QEMU instance.  The default handler is
to simply write the MSI message data at the MSI message address of the
vCPU, vfio-user replaces that with hijacking the MSI message itself to
simply report the vector# so that the "handler", ie. trigger, can
forward it to the client.  That's very analogous to the kernel
implementation.

The equivalent masking we have today with vfio kernel would happen on
the client side, where the MSI/X code might instead set a pending bit
if the vector is masked on the client.  Likewise the possibility
remains, just as it does on the kernel side, that the guest masking a
vector could be relayed over ioctl/socket to set the equivalent mask on
the host/remote.

I don't see a fundamental design difference here, but please point out
if I'm missing something.  Thanks,

Alex


