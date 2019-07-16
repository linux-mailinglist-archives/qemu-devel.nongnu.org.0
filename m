Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FBF6ABB7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 17:27:08 +0200 (CEST)
Received: from localhost ([::1]:50122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnPMB-0001KT-9a
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 11:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60092)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hnPLj-0007xi-1r
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 11:26:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hnPLh-0003b8-W3
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 11:26:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36156)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hnPLh-0003ak-Qx; Tue, 16 Jul 2019 11:26:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 149563092650;
 Tue, 16 Jul 2019 15:26:37 +0000 (UTC)
Received: from gondolin (ovpn-117-180.ams2.redhat.com [10.36.117.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 591E75B681;
 Tue, 16 Jul 2019 15:26:29 +0000 (UTC)
Date: Tue, 16 Jul 2019 17:26:26 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Message-ID: <20190716172626.7abc7736.cohuck@redhat.com>
In-Reply-To: <cfce6fc7-8459-7c04-0b57-500f3d143931@redhat.com>
References: <20190708125433.16927-1-cohuck@redhat.com>
 <20190708125433.16927-3-cohuck@redhat.com>
 <cfce6fc7-8459-7c04-0b57-500f3d143931@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 16 Jul 2019 15:26:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-4.1 2/2] s390x/tcg: move fallthrough
 annotation
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
Cc: Collin Walling <walling@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Jul 2019 17:22:59 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 7/8/19 2:54 PM, Cornelia Huck wrote:
> > ...so that the compiler properly recognizes it.
> >=20
> > Reported-by: Stefan Weil <sw@weilnetz.de>
> > Fixes: f180da83c039 ("s390x/tcg: Implement VECTOR LOAD LOGICAL ELEMENT =
AND ZERO")
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> >  target/s390x/translate_vx.inc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_v=
x.inc.c
> > index 7b1d31cba5cf..41d5cf869f94 100644
> > --- a/target/s390x/translate_vx.inc.c
> > +++ b/target/s390x/translate_vx.inc.c
> > @@ -577,8 +577,8 @@ static DisasJumpType op_vllez(DisasContext *s, Disa=
sOps *o)
> >              enr =3D 0;
> >              break;
> >          }
> > -    default:
> >          /* fallthrough */
> > +    default: =20
>=20
> Haha :)
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks, but this is already merged :)

>=20
> >          gen_program_exception(s, PGM_SPECIFICATION);
> >          return DISAS_NORETURN;
> >      }
> >  =20


