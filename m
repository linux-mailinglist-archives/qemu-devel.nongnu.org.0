Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1980E6CDE4
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 14:13:20 +0200 (CEST)
Received: from localhost ([::1]:37376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ho5Hj-0000AD-9l
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 08:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37119)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1ho5HW-00087s-DN
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 08:13:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1ho5HV-0001kx-C9
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 08:13:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48074)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1ho5HT-0001id-7p; Thu, 18 Jul 2019 08:13:03 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D5BAB309264C;
 Thu, 18 Jul 2019 12:13:01 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-130.ams2.redhat.com
 [10.36.117.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 990A65D6A9;
 Thu, 18 Jul 2019 12:12:53 +0000 (UTC)
Date: Thu, 18 Jul 2019 14:12:50 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190718121250.GC5454@localhost.localdomain>
References: <20190718091740.6834-1-philmd@redhat.com>
 <ac53542f-40c3-8e2e-c8fb-0673183a3504@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <ac53542f-40c3-8e2e-c8fb-0673183a3504@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 18 Jul 2019 12:13:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH-for-4.1] hw/ide/piix: Mark the
 PIIX IDE interfaces as not user_creatable
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
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.07.2019 um 11:26 hat Paolo Bonzini geschrieben:
> On 18/07/19 11:17, Philippe Mathieu-Daud=E9 wrote:
> > The 'piix3-ide' (and 'piix3-ide-xen') devices are part of the
> > PIIX3 chipset modelled as TYPE_PIIX3_PCI_DEVICE (respectivelly
> > TYPE_PIIX3_XEN_DEVICE). The PIIX3 chipset can not be created
> > in part, it has to be created and used as a whole.
> >=20
> > Similarly with the 'piix4-ide' device and the PIIX4 chipset
> > modelled as TYPE_PIIX4_PCI_DEVICE.
> >=20
> > Disable the 'user_creatable' flag.
> >=20
> > part of TYPE_PIIX3_PCI_DEVICE (TYPE_PIIX3_XEN_DEVICE)
> >=20
> > Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
>=20
> This works though:
>=20
>   qemu-system-x86_64 \
>     -M q35,sata=3Doff -device piix3-ide,addr=3D1f.2 \
>     -drive if=3Dnone,file=3Dfreedos.raw,id=3Dhd -device ide-hd,drive=3D=
hd
>=20
> And it is a nice hack to mimic Q35's legacy IDE mode...

And I've seen it often enough that I'm sure users are using it.

If we want to remove it at all, we'd have to go through the usual
deprecation period. But as long as we don't have another option for
getting a legacy IDE controller on Q35, I don't think we should remove
this.

Kevin

