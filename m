Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9D51760F5
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 18:23:25 +0100 (CET)
Received: from localhost ([::1]:35834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8omq-0001Qu-Q6
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 12:23:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33008)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1j8oli-0000R2-Aj
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 12:22:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1j8olh-0002d4-CR
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 12:22:14 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57788
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1j8olh-0002cx-8i
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 12:22:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583169732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtYy+cK109k8D6eMALoutVWxfUnT7akusbEJwpFjO5w=;
 b=isv9O/tlcGqQtDCYjaf/iLkdTvNnH2Z7jazUO5vP8Y8srKN0/MwQOkN7ahVEX8WQC6Pthi
 umFyhOfQWvnJvGilO0e2v5MNvHb+GGd+jxlWFuYqjtxVsRfcJ7bk2kU3jNrUG0FusZHySc
 U/TxAPv6nKtbXYLxzen7O5994IiO28o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-8dLeun2aMPiONmXvCl7w3Q-1; Mon, 02 Mar 2020 12:22:10 -0500
X-MC-Unique: 8dLeun2aMPiONmXvCl7w3Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 666568018A2;
 Mon,  2 Mar 2020 17:22:09 +0000 (UTC)
Received: from localhost (ovpn-126-231.rdu2.redhat.com [10.10.126.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96B8E90CEE;
 Mon,  2 Mar 2020 17:22:06 +0000 (UTC)
Date: Mon, 2 Mar 2020 12:22:05 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Kamil Rytarowski <n54@gmx.com>
Subject: Re: [PATCH v4 0/4] Implements the NetBSD Virtual Machine Monitor
 accelerator
Message-ID: <20200302172205.GJ4440@habkost.net>
References: <20200206115731.13552-1-n54@gmx.com>
 <20200206213232.1918-1-n54@gmx.com>
 <3d63b5ea-2da8-499e-c617-c25a7d87106e@gmx.com>
 <b26b1c03-cb2b-9c8b-4796-24b3b296a103@gmx.com>
 <48851271-4a15-f207-ba17-335d9c9a7302@gmx.com>
 <20200302171027.GH4440@habkost.net>
 <01e0ef70-b4de-1b74-1596-a816e111bd58@gmx.com>
MIME-Version: 1.0
In-Reply-To: <01e0ef70-b4de-1b74-1596-a816e111bd58@gmx.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: peter.maydell@linaro.org, slp@redhat.com, qemu-devel@nongnu.org,
 jmcneill@invisible.ca, pbonzini@redhat.com, philmd@redhat.com, max@m00nbsd.net,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 02, 2020 at 06:10:50PM +0100, Kamil Rytarowski wrote:
> On 02.03.2020 18:10, Eduardo Habkost wrote:
> > Hi Kamil, Maxime,
> >
> > I haven't managed to reserve time to review this, sorry for that.
> > I hope others can chime in before I do.
> >
> > Would any of you be willing to be included as maintainer of the
> > new code on MAINTAINERS?
> >
>=20
> I'm already mentioned as the NetBSD maintainer and NVMM is NetBSD-only
> (at least today).

I don't see the new files (accel/stubs/nvmm-stub.c,
include/sysemu/nvmm.h, target/i386/nvmm-all.c) being added to
MAINTAINERS.  Can you add it as a follow up patch?

--=20
Eduardo


