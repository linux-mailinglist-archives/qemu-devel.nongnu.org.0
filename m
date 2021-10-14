Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1E242DEA6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 17:51:19 +0200 (CEST)
Received: from localhost ([::1]:33724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb30o-0004nG-Od
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 11:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mb2lo-0007ro-HW
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:35:49 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:48520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mb2li-0006j3-Jn
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:35:45 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-IMeUTCzaOmOPbrgaE31mEA-1; Thu, 14 Oct 2021 11:35:35 -0400
X-MC-Unique: IMeUTCzaOmOPbrgaE31mEA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23703814245;
 Thu, 14 Oct 2021 15:35:33 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C81A100164A;
 Thu, 14 Oct 2021 15:35:29 +0000 (UTC)
Date: Thu, 14 Oct 2021 17:35:28 +0200
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: Is the ppc440 "bamboo" board in QEMU still of any use?
Message-ID: <20211014173528.5b160842@bahia.huguette>
In-Reply-To: <836a36f7-936b-ec36-f8e8-472bcec3970f@redhat.com>
References: <fc2e00d1-2373-3223-03c8-195585face66@redhat.com>
 <80f727b8-9eb0-6a49-e4a7-b2616583c43f@csgroup.eu>
 <2c5ec93d-d1d1-5f08-cbf0-513e101114df@kaod.org>
 <836a36f7-936b-ec36-f8e8-472bcec3970f@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Thomas Huth <thuth@redhat.com>,
 hpoussin@reactos.org, qemu-devel@nongnu.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc@nongnu.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Oct 2021 17:26:53 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 10/14/21 13:29, C=C3=A9dric Le Goater wrote:
> > On 10/14/21 12:34, Christophe Leroy wrote:
>=20
> >> I have the following change in QEMU to be able to run the bamboo,
> >> found it some time ago via google (can't remember where):
> >>
> >> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
> >> index 8147ba6f94..600e89e791 100644
> >> --- a/hw/ppc/ppc4xx_pci.c
> >> +++ b/hw/ppc/ppc4xx_pci.c
> >> @@ -246,7 +246,7 @@ static int ppc4xx_pci_map_irq(PCIDevice *pci_dev,
> >> int irq_num)
> >>
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 trace_ppc4xx_pci_map_irq(pci_dev->devfn=
, irq_num, slot);
> >>
> >> -=C2=A0=C2=A0=C2=A0 return slot - 1;
> >> +=C2=A0=C2=A0=C2=A0 return slot ? slot - 1 : slot;
> >> =C2=A0=C2=A0}
> >>
> >> =C2=A0=C2=A0static void ppc4xx_pci_set_irq(void *opaque, int irq_num, =
int level)
> >=20
> > could you try to use :
> >=20
> > static inline int ppce500_pci_map_irq_slot(int devno, int irq_num)
> > {
> > =C2=A0=C2=A0=C2=A0 return (devno + irq_num) % 4;
> > }
>=20
> Is this pci_swizzle()?
>=20

Yes :-)


