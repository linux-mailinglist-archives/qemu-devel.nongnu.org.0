Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C0718C8E3
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 09:21:24 +0100 (CET)
Received: from localhost ([::1]:49263 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFCuB-0000d3-P2
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 04:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43682)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jFCsy-000873-Rc
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 04:20:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1jFCsx-00051U-IZ
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 04:20:08 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:43364)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1jFCsx-0004yT-Ar
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 04:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584692406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bkG2+19fBYk7D8HpztfMfOw3iDQjeTzsIxNZpQ1K5r8=;
 b=SYBBqiD4Ais3AoFx0EL3dLmzqNWCNmSA/TzwJcKWgdh+owtKssF3CujN6u1zMa5BQsBI3Y
 eu5CR4CDQrRwn5GJb0KeM6/y6W1+TXWmA/NN/oOT1QUv6pkAc5z8XJjPgejyE5g8UIUSo1
 Yc2uTrLPV4A0f204oRt6oLRXJucQyrs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-CHiWLQ4eNge1AnbsgSmPow-1; Fri, 20 Mar 2020 04:20:04 -0400
X-MC-Unique: CHiWLQ4eNge1AnbsgSmPow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CCA58024D5;
 Fri, 20 Mar 2020 08:19:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-49.ams2.redhat.com
 [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A50675D9CA;
 Fri, 20 Mar 2020 08:19:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 68A089DB3; Fri, 20 Mar 2020 09:19:48 +0100 (CET)
Date: Fri, 20 Mar 2020 09:19:48 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 05/13] microvm: add acpi_dsdt_add_virtio() for x86
Message-ID: <20200320081948.plaeuihbr33qgvzj@sirius.home.kraxel.org>
References: <20200319080117.7725-1-kraxel@redhat.com>
 <20200319080117.7725-6-kraxel@redhat.com>
 <20200319153015.43f29fe0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200319153015.43f29fe0@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > +            uint32_t irq =3D VIRTIO_IRQ_BASE + index;
> > +            hwaddr base =3D VIRTIO_MMIO_BASE + index * 512;
> > +            hwaddr size =3D 512;
> is it possible to fish these values out from device without poking in its=
 guts
> like using sysbus_get_connected_irq() and make up something to do get mmi=
o parameters from sysbus device

Had a brief look at this while making VIRTIO_IRQ_BASE configurable.
The virtio-mmio proxy gets passed an qemu_irq struct on initialization,
so it doesn't know what the irq number is ...

cheers,
  Gerd


