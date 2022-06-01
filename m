Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F7753ACF3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:43:23 +0200 (CEST)
Received: from localhost ([::1]:56772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwTJS-0000IU-70
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nwT7W-0004eu-3q
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:31:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nwT7S-0000YT-6J
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654108255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7h8rVn0aQ3m+VYr5dOeXQs+BqaaloInWJHhLy+jiB+M=;
 b=K3/ezAGLUowhe6FDSvU4OkX/KYGUXQTdQ92i6uIHN1cneAVTTS/YPPHyA8IQj2u4AMA9Ut
 oAkrgTFy6H4gvY/kVS712eFkCAJUwNKAAKJv74qKsOwPJQNloKyu26iUFSH28/33i06dT6
 e+vtyYGIdX0+60R9E5t8Fw2sCtvZzm0=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-xDnwu2FZPDeD-9cpfDpJQA-1; Wed, 01 Jun 2022 14:30:53 -0400
X-MC-Unique: xDnwu2FZPDeD-9cpfDpJQA-1
Received: by mail-io1-f72.google.com with SMTP id
 z22-20020a5e8616000000b0066576918849so1391465ioj.1
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=7h8rVn0aQ3m+VYr5dOeXQs+BqaaloInWJHhLy+jiB+M=;
 b=UrmbPaJWp0K2HbXxrfx5lJdj+A3kjV0p4P52X7H32pphH+OOP2LsdJZC7cL65GP+DJ
 sD49joNnhhkOeBcpmlvQKpalaq1EczfZ5B/Qlb7lYVVEhELO48w8s1USkYB3YsLOIxjv
 Z3CRDtekcIoZcuEWYtI+6q0QM59rGbKteKlBh5Z0CLnmJ6B8cN0VOwutB09OeXJ25nrM
 PIYaI1CJU4E6Gy1IAhMJnXd4sTY9XDHfY9Yg6a528KP+YSFz1u2njiobDuhiIXLP0vb5
 NtScrKUl55+cMcfpCCXCDxN5ijkaGrZuQUZgPs1ldjhtoB01pA272Am8DkzobS3XIwSY
 nm5A==
X-Gm-Message-State: AOAM531Dh3Uo/0lgE4RsUwRo+BlSwHhflLgcaBodw6RbWctihPefjYoI
 ppHqnaHfz98YqqU52cSpBCfOKonWvcYB60P13YqlxMMoLWkTdT9ifbRP0BgQw9Fxp5QvEqYq58h
 iFUk6KUApAmsEP4g=
X-Received: by 2002:a05:6602:160e:b0:64f:8c93:6a40 with SMTP id
 x14-20020a056602160e00b0064f8c936a40mr747510iow.8.1654108245858; 
 Wed, 01 Jun 2022 11:30:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTK6TzuyhQVfSZqEWMNCj93MwbXdtg0mqJHvEk9GwcYBo2NmrUKsLULBHV9KqwF2U17myRCw==
X-Received: by 2002:a05:6602:160e:b0:64f:8c93:6a40 with SMTP id
 x14-20020a056602160e00b0064f8c936a40mr747478iow.8.1654108245566; 
 Wed, 01 Jun 2022 11:30:45 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 n12-20020a02cc0c000000b0032e42cd4274sm640388jap.89.2022.06.01.11.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:30:45 -0700 (PDT)
Date: Wed, 1 Jun 2022 12:30:42 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, John Johnson
 <john.g.johnson@oracle.com>, Stefan Hajnoczi <stefanha@gmail.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
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
 <elena.ufimtseva@oracle.com>, Kanth Ghatraju <kanth.ghatraju@oracle.com>
Subject: Re: [PATCH v10 13/14] vfio-user: handle device interrupts
Message-ID: <20220601123042.2e8a6b18.alex.williamson@redhat.com>
In-Reply-To: <ACEAC13E-C1E2-4E4B-86F8-2A56D56151AF@oracle.com>
References: <cover.1653404595.git.jag.raman@oracle.com>
 <2a492c16e0464f70f7be1fd9c04172f4f18d14ca.1653404595.git.jag.raman@oracle.com>
 <Yo5DBb8i5SMbDKnq@stefanha-x1.localdomain>
 <E6AB9FA3-6580-44C6-93FA-AFC19477C296@oracle.com>
 <20220531141046.04b448e5.alex.williamson@redhat.com>
 <CAJSP0QU13=fLTVEjE1JbkOef5im4Dwb8x3xhpYYd7KPRJjav_Q@mail.gmail.com>
 <20220531154538.6d002124.alex.williamson@redhat.com>
 <B3FC4541-1DB2-4C1F-8CB5-01D8771C8803@oracle.com>
 <20220601112658.07f97a9a.alex.williamson@redhat.com>
 <ACEAC13E-C1E2-4E4B-86F8-2A56D56151AF@oracle.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
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

On Wed, 1 Jun 2022 18:01:39 +0000
Jag Raman <jag.raman@oracle.com> wrote:

> > On Jun 1, 2022, at 1:26 PM, Alex Williamson <alex.williamson@redhat.com=
> wrote:
> >=20
> > On Wed, 1 Jun 2022 17:00:54 +0000
> > Jag Raman <jag.raman@oracle.com> wrote: =20
> >>=20
> >> Hi Alex,
> >>=20
> >> Just to add some more detail, the emulated PCI device in QEMU presently
> >> maintains a MSIx table (PCIDevice->msix_table) and Pending Bit Array. =
In the
> >> present VFIO PCI device implementation, QEMU leverages the same
> >> MSIx table for interrupt masking/unmasking. The backend PCI device (su=
ch as
> >> the passthru device) always thinks that the interrupt is unmasked and =
lets
> >> QEMU manage masking.
> >>=20
> >> Whereas in the vfio-user case, the client additionally pushes a copy of
> >> emulated PCI device=E2=80=99s table downstream to the remote device. W=
e did this
> >> to allow a small set of devices (such as e1000e) to clear the
> >> PBA (msix_clr_pending()). Secondly, the remote device uses its copy of=
 the
> >> MSIx table to determine if interrupt should be triggered - this would =
prevent
> >> an interrupt from being sent to the client unnecessarily if it's maske=
d.
> >>=20
> >> We are wondering if pushing the MSIx table to the remote device and
> >> reading PBA from it would diverge from the VFIO protocol specification?
> >>=20
> >> From your comment, I understand it=E2=80=99s similar to VFIO protocol =
because VFIO
> >> clients could mask an interrupt using VFIO_DEVICE_SET_IRQS ioctl +
> >> VFIO_IRQ_SET_ACTION_MASK / _UNMASK flags. I observed that QEMU present=
ly
> >> does not use this approach and the kernel does not support it for MSI.=
 =20
> >=20
> > I believe the SET_IRQS ioctl definition is pre-enabled to support
> > masking and unmasking, we've just lacked kernel support to mask at the
> > device which leads to the hybrid approach we have today.  Our intention
> > would be to use the current uAPI, to provide that masking support, at
> > which point we'd leave the PBA mapped to the device. =20
>=20
> Thank you for clarifying!
>=20
> >=20
> > So whether your proposal diverges from the VFIO uAPI depends on what
> > you mean by "pushing the MSIx table to the remote device".  If that's
> > done by implementing the existing SET_IRQS masking support, then you're
> > spot on.  OTOH, if you're actually pushing a copy of the MSIx table
> > from the client, that's certainly not how I had envisioned the kernel =
=20
>=20
> In the current implementation - when the guest accesses the MSIx table and
> PBA, the client passes these accesses through to the remote device.

I suppose you can do this because you don't need some means for the
client to register a notification mechanism for the interrupt, you can
already send notifications via the socket.  But this is now a
divergence from the kernel vfio uapi and eliminates what is intended to
be a device agnostic interrupt interface.

> If we switch to using SET_IRQS approach, we could use SET_IRQS
> message for masking/unmasking, but still pass through the the PBA
> access to the backend PCI device.

Yes.

> So I think the question is, if we should switch vfio-user to SET_IRQS
> now for masking or unmasking, or whenever QEMU does it in the future?
> The PBA access would remain the same as it=E2=80=99s now - via device BAR.

I apologize that I'm constantly overwhelmed with requests that I
haven't reviewed it, but it seems like the client side would be far
more compliant to the vfio kernel interface if vfio-user did implement
an interpretation of the SET_IRQS ioctl.  Potentially couldn't you also
make use of eventfds or define other data types to pass that would give
the client more flexibility in receiving interrupts?  Thanks,

Alex


