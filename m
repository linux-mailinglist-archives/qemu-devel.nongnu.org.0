Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40C46A920
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 15:04:41 +0200 (CEST)
Received: from localhost ([::1]:48610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnN8K-0001oP-W4
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 09:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43475)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hnN89-0001PT-MR
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 09:04:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hnN88-0007Jg-Ob
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 09:04:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53424)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hnN88-0007H9-JN; Tue, 16 Jul 2019 09:04:28 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2C6648553A;
 Tue, 16 Jul 2019 13:04:27 +0000 (UTC)
Received: from gondolin (ovpn-117-180.ams2.redhat.com [10.36.117.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B9F71001DC2;
 Tue, 16 Jul 2019 13:04:23 +0000 (UTC)
Date: Tue, 16 Jul 2019 15:04:19 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Message-ID: <20190716150419.6452ab9c.cohuck@redhat.com>
In-Reply-To: <20598EE9-577B-4C96-A106-4CFA2DB5D914@linux.ibm.com>
References: <20190716123446.24039-1-iii@linux.ibm.com>
 <f3989d45-5451-db13-c5d7-f4601bfff55c@redhat.com>
 <20598EE9-577B-4C96-A106-4CFA2DB5D914@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Tue, 16 Jul 2019 13:04:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] s390: support EDAT-2 in
 mmu_translate_region
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, rth@twiddle.net,
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Jul 2019 14:52:03 +0200
Ilya Leoshkevich <iii@linux.ibm.com> wrote:

> > Am 16.07.2019 um 14:41 schrieb David Hildenbrand <david@redhat.com>:
> >=20
> > How urgent is this? If this can wait, I can polish and send my series I=
 have here
> > instead, which also implents
> > - IEP support
> > - access-exception-fetch/store-indication facility
> > - ESOP-1, ESOP-2 =20
>=20
> This is not urgent, I can live with my patch for now.
> It=E2=80=99s good to know that proper EDAT-2 support is being worked on.
>=20
> Thanks!
> Ilya

Ok, so I will not queue this patch right now (I assume you're fine with
keeping this locally for now?), but wait for David's series for 4.2.

Sounds reasonable?

