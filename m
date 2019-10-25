Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56185E48DA
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 12:49:45 +0200 (CEST)
Received: from localhost ([::1]:58488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNxA8-0000SZ-4G
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 06:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33602)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iNwVa-000814-IR
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 06:07:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iNwVY-0007cI-6v
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 06:07:49 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27858
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iNwVY-0007bt-1y
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 06:07:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571998067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7NY0QQkvgEmagJQV1cgcHincdfGdOv+jNLg3U90IX+Q=;
 b=PtPTVZ8xKjSExccd2899CrYwQ2U/NSUg4EkHxrtS0a2/Z2pmr7SFKAyHbdrcy80EcDx0EH
 aUxlPOuGrhWUx6dCma6B82fjjjNGZKJeutCYoTwC89iLhTHcDkCDPPgZ5wf1rWUkE3vIBA
 VSS0Z5FnRXR50ljpHfb+x2JkO7NBORM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-Y2Rh6EeLN1GfvIrb_I8Mhg-1; Fri, 25 Oct 2019 06:07:41 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BC7A47B;
 Fri, 25 Oct 2019 10:07:40 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-223.ams2.redhat.com
 [10.36.117.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEE48100194E;
 Fri, 25 Oct 2019 10:07:36 +0000 (UTC)
Date: Fri, 25 Oct 2019 12:07:35 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Fernando Casas =?iso-8859-1?Q?Sch=F6ssow?= <casasfernando@outlook.com>
Subject: Re: qemu crashing when attaching an ISO file to a virtio-scsi CD-ROM
 device through libvirt
Message-ID: <20191025100735.GA7275@localhost.localdomain>
References: <VI1PR03MB481484C08A04458ACA64F7A0A46C0@VI1PR03MB4814.eurprd03.prod.outlook.com>
 <dbb363cf-bc3a-6de5-a62a-1467208d0017@redhat.com>
 <VI1PR03MB4814DBEC71814C520D123ADDA46B0@VI1PR03MB4814.eurprd03.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <VI1PR03MB4814DBEC71814C520D123ADDA46B0@VI1PR03MB4814.eurprd03.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Y2Rh6EeLN1GfvIrb_I8Mhg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.10.2019 um 19:28 hat Fernando Casas Sch=F6ssow geschrieben:
> Hi John,
>=20
> Thanks for looking into this.  I can quickly repro the problem with
> qemu 4.0 binary with debugging symbols enabled as I have it available
> already.  Doing the same with qemu 4.1 or development head may be too
> much hassle but if it's really the only way I can give it try.

We had a lot of iothread related fixes in 4.1, so this would really be
the only way to tell if it's a bug that still exists. I suspect that
it's already fixed (and to be more precise, I assume that commit
d0ee0204f fixed it).

Kevin


