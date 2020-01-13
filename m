Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B577138E90
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 11:08:12 +0100 (CET)
Received: from localhost ([::1]:48118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqwdn-0004rv-K3
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 05:08:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45019)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iqwct-0004Qw-1B
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 05:07:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iqwcn-0006oO-6f
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 05:07:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52494
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iqwcm-0006nQ-Rp
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 05:07:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578910027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kcrd1PaZbI/3VGzByuRzwiPFJ4FlpYwOS2TmYPwDymo=;
 b=Bmw0nS2c0bZ9XsjQ8vX6YvWqMDxV6AMQKMYCkwSz27Jv7wBsDD8GQqvUPswsE3jwnu0Z3/
 l1f2F3qteeGdvZ+U9fGnWIycJ3vQ0ywSgkQ5fcRp/i07Cu/6mZUf69aboyzJ1z3rPu/sPB
 0KP6al8NNiGwoY9i2DV4QDkx5q4EUSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-v7Pv6SD9Nsi-yf7pbQue-w-1; Mon, 13 Jan 2020 05:07:04 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AB6A107ACC4;
 Mon, 13 Jan 2020 10:07:02 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-192.ams2.redhat.com [10.36.117.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBA195DA32;
 Mon, 13 Jan 2020 10:06:49 +0000 (UTC)
Date: Mon, 13 Jan 2020 11:06:48 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Pavel Dovgalyuk <dovgaluk@ispras.ru>
Subject: Re: [for-5.0 PATCH 00/11] Support for reverse debugging with GDB
Message-ID: <20200113100648.GB5549@linux.fritz.box>
References: <157709434917.12933.4351155074716553976.stgit@pasha-Precision-3630-Tower>
 <003a01d5c6b3$df62afd0$9e280f70$@ru>
 <20200109120038.GD9504@linux.fritz.box>
 <87k15v1z71.fsf@dusky.pond.sub.org>
 <000f01d5c9f4$cfbc1230$6f343690$@ru>
MIME-Version: 1.0
In-Reply-To: <000f01d5c9f4$cfbc1230$6f343690$@ru>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: v7Pv6SD9Nsi-yf7pbQue-w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, boost.lists@gmail.com,
 artem.k.pisarenko@gmail.com, crosthwaite.peter@gmail.com,
 ciro.santilli@gmail.com, jasowang@redhat.com, quintela@redhat.com,
 'Markus Armbruster' <armbru@redhat.com>, qemu-devel@nongnu.org,
 'Pavel Dovgalyuk' <pavel.dovgaluk@gmail.com>, maria.klimushenkova@ispras.ru,
 mst@redhat.com, kraxel@redhat.com, pavel.dovgaluk@ispras.ru,
 thomas.dullien@googlemail.com, pbonzini@redhat.com, mreitz@redhat.com,
 alex.bennee@linaro.org, dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.01.2020 um 10:35 hat Pavel Dovgalyuk geschrieben:
> > From: Markus Armbruster [mailto:armbru@redhat.com]
> > Kevin Wolf <kwolf@redhat.com> writes:
> >=20
> > > Am 09.01.2020 um 07:13 hat Pavel Dovgalyuk geschrieben:
> > >> Ping.
> > >
> > > I think you have my Acked-by for the block-related patches in this
> > > series now. If I missed something, please let me know.
> >=20
> > Pavel, whom are you nudging to do what?
>=20
> I'm not sure.
> My prior patches for record/replay were pulled by Paolo.
> But reverse debugging is more like a modification of things,
> and not a completely new subsystem.=20

In MAINTAINERS, you are listed yourself as the maintainer for
record/replay. I wonder whether you shouldn't just be sending pull
requests after getting Acked-by or Reviewed-by from the maintainers of
other subsystems you touch.

> Everything but gdbstub was already acked by the maintainers.

The GDB stub seems to be maintained by Alex Benn=E9e, so he is probably
the one you need to nudge to give at least an Acked-by.

Kevin


