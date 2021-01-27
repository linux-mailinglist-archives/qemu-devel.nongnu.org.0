Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A842C306127
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 17:41:51 +0100 (CET)
Received: from localhost ([::1]:57290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4nt8-0007Mz-Ej
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 11:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l4nrL-0006bG-Sj
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 11:39:59 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:56659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l4nrJ-0001Xh-If
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 11:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=cIbQp9H4wyRiMIwtcFVUUK2Ifi2ktdy6Q0rz2Tqb9uc=; b=IBEN1B/29+u3j4b9IauPEcsPiH
 7uxrPcLcvpFeV2dW8WZnsUIZ5i2nMB8xTBPpY0szbRPWVeILVVcdmnra7wJyjAJYZn+fdKE6KFrvV
 4L8qushIvcF0W0HJiqQHhZ6Q6XTyQgH11KaHYmPT7oRsOut0+A1sJ6vt6FKis+uLzjB0QpkTdHRWa
 oVes6gR5y8MT/jnJhluif2uIypkgklqRwXGqh3+XcYPzhKoNTZ6bsXIAF6mkOJILb1PKuWdbAZ0QZ
 Ct0NEbcgSQWatvEA40IBRKhLOc8t1x+R5LdvaCE9pyAGKSaS8g6BgtRzlH/my+UOt4sLCeObyqFnC
 s+OM90BV59JFuje7L+ovIadGWuXuWJA89UWzIzmwo2/EOOv2HDIDk4582ImgqOGVARpVKNLLwjmss
 P146/zM0YIVIQCN6uZwJh9vf0ILA/vQWObOvNUQWoiqdwKKEmadpe6TtitTi3ypq/jz9V5E67rB+W
 LS6v6F0FTixR8l7iVBdG+w47kjV1rPgp0ph49eXHFrGw+2mcztjMEtGLbnQZxXDeiuh367zhZKdqI
 IujKMnWQspqi+L0HjflePP0fgwJJGbc35yHt05XakLNfKhHLKi6VuKpTTAPtH9sczrRX7HK4h6Bds
 KRi25OLQRLh3aanOMnRd9+PKyndreQyttrKsXz9t4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] MAINTAINERS: Update 9pfs tree URL
Date: Wed, 27 Jan 2021 17:39:54 +0100
Message-ID: <2906255.2JxxRs86CH@silver>
In-Reply-To: <bb2628ed-0e46-16e0-030f-5b846f3e0c62@vivier.eu>
References: <161071814430.152031.14540382419012818908.stgit@bahia.lan>
 <20210127170255.1d381a0a@bahia.lan>
 <bb2628ed-0e46-16e0-030f-5b846f3e0c62@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 27. Januar 2021 17:07:38 CET Laurent Vivier wrote:
> Le 27/01/2021 =E0 17:02, Greg Kurz a =E9crit :
> > On Wed, 27 Jan 2021 15:33:51 +0100
> >=20
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> >> On Freitag, 15. Januar 2021 14:50:17 CET Christian Schoenebeck wrote:
> >>> On Freitag, 15. Januar 2021 14:42:24 CET Greg Kurz wrote:
> >>>> I've already moved my repositories to gitlab for extra CI coverage,
> >>>> and I won't use the ones at github anymore.
> >>>>=20
> >>>> Signed-off-by: Greg Kurz <groug@kaod.org>
> >>>=20
> >>> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> >>>=20
> >>>> ---
> >>>>=20
> >>>>  MAINTAINERS |    2 +-
> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>=20
> >>>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>>> index cb0656aec3d4..21038d3fdfce 100644
> >>>> --- a/MAINTAINERS
> >>>> +++ b/MAINTAINERS
> >>>> @@ -1828,7 +1828,7 @@ X: hw/9pfs/xen-9p*
> >>>>=20
> >>>>  F: fsdev/
> >>>>  F: docs/interop/virtfs-proxy-helper.rst
> >>>>  F: tests/qtest/virtio-9p-test.c
> >>>>=20
> >>>> -T: git https://github.com/gkurz/qemu.git 9p-next
> >>>> +T: git https://gitlab.com/gkurz/qemu.git 9p-next
> >>>>=20
> >>>>  virtio-blk
> >>>>  M: Stefan Hajnoczi <stefanha@redhat.com>
> >>=20
> >> What's the status of this patch? I would add my T: line below just for
> >> the
> >> records. But I'd rather wait for this patch being merged to main line.
> >=20
> > Drat... I forgot about this one and I'm not about to post a PR
> > anytime soon.

:-)

I suggest I will take over the next 9p queue round of whatever might come u=
p.=20
I have some head room now.

> >=20
> > Laurent,
> >=20
> > Any chance you can take this in the trivial tree ?
>=20
> Applied to my trivial-patches branch.
>=20
> Thanks,
> Laurent

Thanks Laurent!

I wait for this being merged. No hurry.

Best regards,
Christian Schoenebeck



