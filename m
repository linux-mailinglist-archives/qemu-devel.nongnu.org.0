Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7601715D9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 12:18:50 +0100 (CET)
Received: from localhost ([::1]:57502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7HBo-0008GL-PX
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 06:18:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34524)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1j7HAg-0007c3-74
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 06:17:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1j7HAe-0007zJ-HI
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 06:17:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57975
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1j7HAe-0007ys-CB
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 06:17:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582802255;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/Qao5mVrMLtiFprpgRK9mpQ8H/RGFsXAG8L+fjZqCI=;
 b=B/n7yag2G89osl7BghQf1NnqGDtJ8rBueUwru58GIsNyHAKX7S9BN3Bqfpi+/yS1cluATQ
 K8WZw/z8zJ4R5+JnCvSW94SpjyWxPH/5X3IiFn026oLXqlkSan8Xkgnfhge3EbCQ8eUi2N
 6IcHJNBUFWwkCnJI0AM4cFKbIxVgU8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-W2xLvMUCNqyqmdRH4pt75A-1; Thu, 27 Feb 2020 06:17:32 -0500
X-MC-Unique: W2xLvMUCNqyqmdRH4pt75A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 697281005512;
 Thu, 27 Feb 2020 11:17:31 +0000 (UTC)
Received: from redhat.com (ovpn-112-43.ams2.redhat.com [10.36.112.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C4BF60BE2;
 Thu, 27 Feb 2020 11:17:20 +0000 (UTC)
Date: Thu, 27 Feb 2020 11:17:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v16 00/10] VIRTIO-IOMMU device
Message-ID: <20200227111717.GG1645630@redhat.com>
References: <20200214132745.23392-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200214132745.23392-1-eric.auger@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, dgilbert@redhat.com, bharatb.linux@gmail.com,
 qemu-arm@nongnu.org, mst@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 14, 2020 at 02:27:35PM +0100, Eric Auger wrote:
> This series implements the QEMU virtio-iommu device.
>=20
> This matches the v0.12 spec (voted) and the corresponding
> virtio-iommu driver upstreamed in 5.3. All kernel dependencies
> are resolved for DT integration. The virtio-iommu can be
> instantiated in ARM virt using:
>=20
> "-device virtio-iommu-pci".

Is there any more documentation besides this ?

I'm wondering on the intended usage of this, and its relation
or pros/cons vs other iommu devices

You mention Arm here, but can this virtio-iommu-pci be used on
ppc64, s390x, x86_64 too ?  If so, is it a better choice than
using intel-iommu on x86_64 ?  Anything else that is relevant
for management applications to know about when using this ?


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


