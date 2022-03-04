Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF394CDDC1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 21:18:17 +0100 (CET)
Received: from localhost ([::1]:38188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQENU-0003FK-A9
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 15:18:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nQEM5-0002Qf-Pv
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:16:53 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:45471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nQEM3-0008DN-7h
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:16:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=H+rxRka1wTPwRikgojqwmeGwk7YXCShnznTQNUh+vgI=; b=W08B/KIwSmFky9E8Nll6+IEmkr
 YenEPOzbdSTN8/6pANgVl3vDYOwqRPAZd5lk2C8PeWoxogSHdarkmbe8eHocoBZhzXG/qmJFteHH5
 H1BfZtuqJ086B/Y4jC8IOaSzJTsdCOlrJBpGVUCW+dPVMdnjw+7Jg5KcvXpMoXFe0AXQqmswoPeAD
 LIllum+rrohgzkorzslwCh6vcW8kM6krIjpl+XkxAnrV2dCuhRCYt+INsHt4vlRwVKRDGnHki05r/
 KJQNPF+S4F2TqkbH+3ke/Ywa8yfx5XSlo9pycgdChTZ7rldgN3dte0OGDQK4DLqfIkndSgsTyOoew
 qbyLDcdLfx9Mb8Bv5xkJEetbZGxMcs7rQ8N4ZQZv55NbMRH4GkHvGRqk1mZYeH7QOW41GgCkr7Yhy
 biqYPNzULbVUGAdTvs/9d4D6mUUWOjAVYy3cQHkmtrLmy7zEan+XN7v/qXhWvCuK2D1K2mOmC0erL
 y8agUgOjfCEZoyhdW3oE1b0tAF036Rtfi24g19pVDp7Z9/BMLIO0Dh3vooS/qSXCNfWFTtMjK/FB2
 mIVvZyaDBXm9rb92wQEOcHEnF4vHIq2b5yvux8mVAlPmfEfmfPKcKFGyuXY0LgUnIGWliDkXk5Qry
 Gu+neOjJdbeXiGbQP+9eedpfFaWyz4KwOlYw1IzIQ=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 Will Cohen <wwcohen@gmail.com>, Keno Fischer <keno@juliacomputing.com>
Subject: Re: [PULL 00/19] 9p queue 2022-03-04
Date: Fri, 04 Mar 2022 21:16:41 +0100
Message-ID: <11201492.CjeqJxXfGd@silver>
In-Reply-To: <CAFEAcA8EN8sSSYYMh=u68-a7qXGaG-oSnAz2hT8kXXGtnDLnww@mail.gmail.com>
References: <cover.1646396869.git.qemu_oss@crudebyte.com>
 <CAFEAcA8EN8sSSYYMh=u68-a7qXGaG-oSnAz2hT8kXXGtnDLnww@mail.gmail.com>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 4. M=E4rz 2022 19:42:18 CET Peter Maydell wrote:
> On Fri, 4 Mar 2022 at 12:32, Christian Schoenebeck
>=20
> <qemu_oss@crudebyte.com> wrote:
> > The following changes since commit=20
5959ef7d431ffd02db112209cf55e47b677256fd:
> >   Merge remote-tracking branch
> >   'remotes/alistair/tags/pull-riscv-to-apply-20220303' into staging
> >   (2022-03-03 19:59:38 +0000)>=20
> > are available in the Git repository at:
> >   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220304
> >=20
> > for you to fetch changes up to 39edfe337c418995b2932a9a14a612fb0c329dc5:
> >   fsdev/p9array.h: convert Doxygen -> kerneldoc format (2022-03-04
> >   13:07:39 +0100)>=20
> > ----------------------------------------------------------------
> > 9pfs: introduce macOS host support and cleanup
> >=20
> > * Add support for Darwin (a.k.a. macOS) hosts.
> >=20
> > * Code cleanup (move qemu_dirent_dup() from osdep -> 9p-util).
> >=20
> > * API doc cleanup (convert Doxygen -> kerneldoc format).
>=20
> This fails to build on my OSX box:
>=20
> In file included from ../../hw/9pfs/9p-util-darwin.c:12:
> ../../hw/9pfs/9p-util.h:57:1: error: unused label 'again'
> [-Werror,-Wunused-label]
> again:
> ^~~~~~
>=20
> because the use of the label is inside a #ifndef CONFIG_DARWIN
> but the definition is not.
>=20
> thanks
> -- PMM

So basically it needs this change:

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index cfa7af43c5..97e681e167 100644
=2D-- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -54,7 +54,9 @@ static inline int openat_file(int dirfd, const char *name=
,=20
int flags,
 {
     int fd, serrno, ret;
=20
+#ifndef CONFIG_DARWIN
 again:
+#endif
     fd =3D openat(dirfd, name, flags | O_NOFOLLOW | O_NOCTTY | O_NONBLOCK,
                 mode);
     if (fd =3D=3D -1) {

Will, can you check why this did not fail there and whether there are proba=
bly=20
more issues?

If that's the only one, let me know, then I would fix this on my end and=20
resend a PR ASAP. Thanks!

Best regards,
Christian Schoenebeck



