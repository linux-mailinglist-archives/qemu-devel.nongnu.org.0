Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69752DF58C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 21:02:50 +0200 (CEST)
Received: from localhost ([::1]:46856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMcx6-00021N-RZ
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 15:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57205)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1iMcvy-0001X8-33
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 15:01:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1iMcvw-0007om-DN
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 15:01:37 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27137
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1iMcvw-0007oK-9l
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 15:01:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571684494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EhBbrPn8WzEv4si9VNCjQXxAPPcud1I+ksBNId+TJYM=;
 b=B1glYs8pk+/7q9eLs7bNKwZido4Fv1c3H3pKl7o62Un4niuv5mkVxK/5PKCcz2sYm1SCR2
 LLlEa9DWrIdU8fThnXaLiLG+NNDj71GOoa/3Ngi8TwIqqEUoU540q7APhdN0+IISJqJsd6
 tdkQJxgoXD2nciayyHZhnfPEAja2TFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-jEWK0XUtP-CLMKacyqLtqw-1; Mon, 21 Oct 2019 15:01:32 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19CC3107AD31;
 Mon, 21 Oct 2019 19:01:31 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96648196AE;
 Mon, 21 Oct 2019 19:01:23 +0000 (UTC)
Date: Mon, 21 Oct 2019 13:01:22 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jens Freimann <jfreimann@redhat.com>
Subject: Re: [PATCH 02/11] pci: add option for net failover
Message-ID: <20191021130122.2787245f@x1.home>
In-Reply-To: <20191021184546.n5iddctnnlxe3tay@jenstp.localdomain>
References: <20191018202040.30349-1-jfreimann@redhat.com>
 <20191018202040.30349-3-jfreimann@redhat.com>
 <20191021085823.72ac4b37@x1.home>
 <20191021184546.n5iddctnnlxe3tay@jenstp.localdomain>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: jEWK0XUtP-CLMKacyqLtqw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 mst@redhat.com, aadam@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 laine@redhat.com, ailan@redhat.com, parav@mellanox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Oct 2019 20:45:46 +0200
Jens Freimann <jfreimann@redhat.com> wrote:

> On Mon, Oct 21, 2019 at 08:58:23AM -0600, Alex Williamson wrote:
> >On Fri, 18 Oct 2019 22:20:31 +0200
> >Jens Freimann <jfreimann@redhat.com> wrote:
> > =20
> >> This patch adds a net_failover_pair_id property to PCIDev which is
> >> used to link the primary device in a failover pair (the PCI dev) to
> >> a standby (a virtio-net-pci) device.
> >>
> >> It only supports ethernet devices. Also currently it only supports
> >> PCIe devices. QEMU will exit with an error message otherwise. =20
> >
> >Doesn't the PCIe device also need to be hotpluggable?  We can have PCIe
> >devices attached to the root bus where we don't currently support
> >hotplug.  Thanks, =20
>=20
> How do I recognize such a device? hotpluggable in DeviceClass?

I wouldn't expect it to be a device property, it's more of a function
of whether the bus that it's attached to supports hotplug, so probably
something related to the bus controller.  Thanks,

Alex


