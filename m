Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3488E2614
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 00:05:03 +0200 (CEST)
Received: from localhost ([::1]:49678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNOkY-0004Rd-7t
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 18:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60635)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1iNMiw-00028m-W5
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 15:55:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1iNMiv-0005QR-RT
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 15:55:14 -0400
Received: from charlie.dont.surf ([128.199.63.193]:44890)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1iNMit-0005Lw-5V; Wed, 23 Oct 2019 15:55:11 -0400
Received: from apples.localdomain (ip-5-186-123-87.cgn.fibianet.dk
 [5.186.123.87])
 by charlie.dont.surf (Postfix) with ESMTPSA id 2FFCEBF44C;
 Wed, 23 Oct 2019 19:55:09 +0000 (UTC)
Date: Wed, 23 Oct 2019 21:55:05 +0200
From: Klaus Birkelund <its@irrelevant.dk>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] nvme: fix NSSRS offset in CAP register
Message-ID: <20191023195505.GA466001@apples.localdomain>
References: <20191023073315.446534-1-its@irrelevant.dk>
 <4a51bf95-c38b-7fef-9b97-0bec2bd36854@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4a51bf95-c38b-7fef-9b97-0bec2bd36854@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.199.63.193
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 23, 2019 at 11:26:57AM -0400, John Snow wrote:
>=20
>=20
> On 10/23/19 3:33 AM, Klaus Jensen wrote:
> > Fix the offset of the NSSRS field the CAP register.
>=20
> From NVME 1.4, section 3 ("Controller Registers"), subsection 3.1.1
> ("Offset 0h: CAP =E2=80=93 Controller Capabilities") CAP_NSSRS_SHIFT is=
 bit 36,
> not 33.
>=20
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > Reported-by: Javier Gonzalez <javier.gonz@samsung.com>
> > ---
> >  include/block/nvme.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/include/block/nvme.h b/include/block/nvme.h
> > index 3ec8efcc435e..fa15b51c33bb 100644
> > --- a/include/block/nvme.h
> > +++ b/include/block/nvme.h
> > @@ -23,7 +23,7 @@ enum NvmeCapShift {
> >      CAP_AMS_SHIFT      =3D 17,
> >      CAP_TO_SHIFT       =3D 24,
> >      CAP_DSTRD_SHIFT    =3D 32,
> > -    CAP_NSSRS_SHIFT    =3D 33,
> > +    CAP_NSSRS_SHIFT    =3D 36,
> >      CAP_CSS_SHIFT      =3D 37,
> >      CAP_MPSMIN_SHIFT   =3D 48,
> >      CAP_MPSMAX_SHIFT   =3D 52,
> >=20
>=20
> I like updating commit messages with spec references; if it can be
> updated that would be nice.
>=20
> Regardless:
>=20
> Reviewed-by: John Snow <jsnow@redhat.com>
>=20

Sounds good. Can the committer squash that in?


Cheers,
Klaus

