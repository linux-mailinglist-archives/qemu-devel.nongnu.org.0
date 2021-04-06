Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AC2355A8F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 19:41:22 +0200 (CEST)
Received: from localhost ([::1]:43574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTphZ-0001Qs-NI
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 13:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lTpfF-0000BQ-4o
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:38:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lTpet-000585-AS
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617730712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QNRBdFbZEPEE65rl8n1mcVOKay8iZdkqzMvztGsXuxU=;
 b=dh+RMYLGEqt3L7JI3MgB478rkdm4r+1CtJeLIFIC4+QvfQLM2xe6j4wDdMaML4vKtiTkSL
 2h+ITyr8cU8xTpONE3baMmUbhLTDYQr0PWhT9ttuBjZbgZ0Zsx/KvXqjydpiy+cb5pnol3
 J/jkUK53HBvCiCGKzYNCdy952h4XxxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-M4fBGncAP7icfvAx0gTbkg-1; Tue, 06 Apr 2021 13:38:31 -0400
X-MC-Unique: M4fBGncAP7icfvAx0gTbkg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 412B587A826
 for <qemu-devel@nongnu.org>; Tue,  6 Apr 2021 17:38:30 +0000 (UTC)
Received: from localhost (unknown [10.40.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CF7B10023B2;
 Tue,  6 Apr 2021 17:38:18 +0000 (UTC)
Date: Tue, 6 Apr 2021 19:38:17 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [PATCH 2/6] pci: introduce apci-index property for PCI device
Message-ID: <20210406193817.728bb52a@redhat.com>
In-Reply-To: <YGwuIF69gi4a0fbo@redhat.com>
References: <20210315180102.3008391-1-imammedo@redhat.com>
 <20210315180102.3008391-3-imammedo@redhat.com>
 <YGwuIF69gi4a0fbo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: jusual@redhat.com, qemu-devel@nongnu.org, laine@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Apr 2021 10:47:12 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Mon, Mar 15, 2021 at 02:00:58PM -0400, Igor Mammedov wrote:
> > In x86/ACPI world, linux distros are using predictable
> > network interface naming since systemd v197. Which on
> > QEMU based VMs results into path based naming scheme,
> > that names network interfaces based on PCI topology.
> >=20
> > With itm on has to plug NIC in exactly the same bus/slot,
> > which was used when disk image was first provisioned/configured
> > or one risks to loose network configuration due to NIC being
> > renamed to actually used topology.
> > That also restricts freedom to reshape PCI configuration of
> > VM without need to reconfigure used guest image.
> >=20
> > systemd also offers "onboard" naming scheme which is
> > preferred over PCI slot/topology one, provided that
> > firmware implements:
> >     "
> >     PCI Firmware Specification 3.1
> >     4.6.7.  DSM for Naming a PCI or PCI Express Device Under
> >             Operating Systems
> >     "
> > that allows to assign user defined index to PCI device,
> > which systemd will use to name NIC. For example, using
> >   -device e1000,acpi-index=3D100
> > guest will rename NIC to 'eno100', where 'eno' is default
> > prefix for "onboard" naming scheme. This doesn't require
> > any advance configuration on guest side to com in effect
> > at 'onboard' scheme takes priority over path based naming.
> >=20
> > Hope is that 'acpi-index' it will be easier to consume by
> > management layer, compared to forcing specific PCI topology
> > and/or having several disk image templates for different
> > topologies and will help to simplify process of spawning
> > VM from the same template without need to reconfigure
> > guest NIC.
> >=20
> > This patch adds, 'acpi-index'* property and wires up
> > a 32bit register on top of pci hotplug register block
> > to pass index value to AML code at runtime.
> > Following patch will add corresponding _DSM code and
> > wire it up to PCI devices described in ACPI. =20
>=20
> You've illustrated usage & benefits with NICs, but IIUC, this
> feature is wired up for any PCI device. Are you aware of any
> usage of this feature for non-NIC devices ?

I'm not aware of anything else that might currently use it.

It might be useful for virtio-win (HDDs/NICs) (as we saw recently
breakage due to PCI root bus UID change, where devices installed
on old QEMU enumerated as new instances breaking network config or
causing boot issues)

As Lane mentioned, it would be really useful if we could add acpi-index
as some meta data to qcow2 image so that new guest could import it
at creation time.

> Regards,
> Daniel


