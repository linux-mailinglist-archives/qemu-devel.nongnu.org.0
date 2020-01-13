Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6412A138E17
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 10:45:22 +0100 (CET)
Received: from localhost ([::1]:47878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqwHh-0002ez-DD
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 04:45:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36967)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iqwGu-0002F1-Sf
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 04:44:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iqwGt-0001US-1T
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 04:44:31 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45669
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iqwGs-0001T2-Tj
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 04:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578908669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P2jq+4Y1QqfZ+/Uz4K/eWeEGuph0sr6i9UhvsXYBgt0=;
 b=OWqQhfvpKVicYMiwRMTV0VeZqAzhIKgBz6RhfzljJBPc44zcpLA3kZJm1nTUaoMci12MAG
 brkVy5xdAGnNyhreslOAm0SgJILFYrXTbLWr/jLeNVkCqqNgrfiF6PiEHxriwwKM2TAOah
 Uk4dQuwyRv0oBnFG+I21TsGiwtCT98g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-bUjkyCJLNZuuTrUx8DTu1g-1; Mon, 13 Jan 2020 04:44:28 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B082C1092E4B
 for <qemu-devel@nongnu.org>; Mon, 13 Jan 2020 09:44:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com
 [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0187E1001B35;
 Mon, 13 Jan 2020 09:44:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EC8719DB3; Mon, 13 Jan 2020 10:44:23 +0100 (CET)
Date: Mon, 13 Jan 2020 10:44:23 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] hw/usb: Introduce Kconfig switches for the CCID card
 devices
Message-ID: <20200113094423.xljgmdxrvm676oyq@sirius.home.kraxel.org>
References: <20191211102029.1772-1-thuth@redhat.com>
 <20200107073607.zaeag7giehjm7t52@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20200107073607.zaeag7giehjm7t52@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: bUjkyCJLNZuuTrUx8DTu1g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 07, 2020 at 08:36:07AM +0100, Gerd Hoffmann wrote:
> On Wed, Dec 11, 2019 at 11:20:29AM +0100, Thomas Huth wrote:
> > In our downstream distribution of QEMU, we need more fine-grained
> > control on the set of CCID card devices that we want to include.
> > So let's introduce some proper Kconfig switches that it is easier
> > to disable them without modifying the corresponding Makefile.objs.
> >=20
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
>=20
> Added to usb queue.

Oops, this patch breaks "make check" on openbsd (make
TARGET_LIST=3Dx86_64-softmmu vm-build-openbsd).  Unqueued.

cheers,
  Gerd


