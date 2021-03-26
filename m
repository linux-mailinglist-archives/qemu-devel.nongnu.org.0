Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFB0349D88
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 01:14:51 +0100 (CET)
Received: from localhost ([::1]:47708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPa7h-000709-EU
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 20:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lPa67-0006NJ-VS
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 20:13:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lPa65-0006P5-9H
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 20:13:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616717583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZCIrO1FGl8KC/HqOeQRLS9/eh9/xTR0oR5oo5ADHo8s=;
 b=acuIwlTB9QOePQzj99WVsQnZqZSKGGTD5ziXzeTS0UetH84NiNkUzOi3vmYYtXjCeyOZ0T
 uMtuyP/vdSFlXSiqc4Uo1XQI7+xM2ALj+SjqE8b/IdYS4+QzR5qcmWxjhayq902ygPSleW
 yRK7TaSRXuykUgvnzwTw0Rpb4qFDELY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-ccIRAfYGPIiCU6PZXxuqtA-1; Thu, 25 Mar 2021 20:12:59 -0400
X-MC-Unique: ccIRAfYGPIiCU6PZXxuqtA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA5D187A83B;
 Fri, 26 Mar 2021 00:12:57 +0000 (UTC)
Received: from localhost (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 789F11972B;
 Fri, 26 Mar 2021 00:12:52 +0000 (UTC)
Date: Fri, 26 Mar 2021 01:12:50 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] i386/acpi: restore device paths for pre-5.1 vms
Message-ID: <20210326011250.74fb7a1e@redhat.com>
In-Reply-To: <20210323152835-mutt-send-email-mst@kernel.org>
References: <20210301195919.9333-1-cheptsov@ispras.ru>
 <20210322114116-mutt-send-email-mst@kernel.org>
 <B813DBC6-B989-4630-B2DE-8F5825484E78@ispras.ru>
 <20210323104542-mutt-send-email-mst@kernel.org>
 <71AD039B-775A-4DF3-B16D-4BC3768A20AC@ispras.ru>
 <a1a1b783-6217-cb22-0dd8-fab9b7971542@proxmox.com>
 <20210323152835-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-stable@nongnu.org, Vitaly Cheptsov <cheptsov@ispras.ru>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>,
 qemu devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Mar 2021 15:32:23 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Mar 23, 2021 at 04:04:11PM +0100, Thomas Lamprecht wrote:
> > On 23.03.21 15:55, Vitaly Cheptsov wrote: =20
> > >> 23 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2021 =D0=B3., =D0=B2 17:48, Michae=
l S. Tsirkin <mst@redhat.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=
=D0=B0):
> > >>
> > >> The issue is with people who installed a VM using 5.1 qemu,
> > >> migrated to 5.2, booted there and set a config on a device
> > >> e.g. IP on a NIC.
> > >> They now have a 5.1 machine type but changing uid back
> > >> like we do will break these VMs.
> > >>
> > >> Unlikley to be common but let's at least create a way for these peop=
le
> > >> to used these VMs.
> > >> =20
> > > They can simply set the 5.2 VM version in such a case. I do not want =
to  =20
> > let this legacy hack to be enabled in any modern QEMU VM version, as it=
 violates ACPI specification and makes the life more difficult for various =
other software like bootloaders and operating systems.
> >=20
> > Yeah here I agree with Vitaly, if they already used 5.2 and made some c=
onfigurations
> > for those "new" devices they can just keep using 5.2? =20
>=20
> People just create a VM, the machine type gets set in stone then.
>=20
> > If some of the devices got configured on 5.1 and some on 5.2 there's no=
thing we can
> > do anyway, from a QEMU POV - there the user always need to choose one m=
achine version
> > and fix up the device configured while on the other machine. =20
>=20
> I think I did not explain it well. Here is an example.
>=20
>=20
> 1. start qemu version 5.1 with machine type 5.1
>=20
> 2. reboot with qemu version 5.2 still machine type 5.1
>=20
> 3. set static IP on NIC
>=20
> 4. reboot with qemu version 6.0 still machine type 5.1
>=20
>    at this point NIC loses the static IP.
>=20
>=20
>=20
> What I suggest is that we use a property to at stage 4,

Question is how users would know about fixup property, nobody knows about i=
t
beside new QEMU.
Or even better how to make it transparent to user,
so the only action user would have to do is to upgrade to the newest QEMU.

> user can set a flag and avoid losing the static IP.
> Yes in theory maybe at stage 2 or 4 user can switch to 5.2 machine type
> but we were always telling people not to do that, let's not start.
>=20


