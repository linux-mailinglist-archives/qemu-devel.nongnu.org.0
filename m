Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9344D627D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 14:36:49 +0100 (CET)
Received: from localhost ([::1]:56610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSfRo-0000ZP-HR
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 08:36:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nSfOp-0007Og-Vp
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 08:33:44 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:38079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nSfOo-00074A-8H
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 08:33:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=9tfbyWhK6zFHs2rqdZxrupEcKNcUAy+gHeLfTB+CAQg=; b=c8b8UVxIUbpQ3SEsRLgWGdYXxL
 672FZuyk7dnxGE2edhXN24PYvV7XkA4qcUKpdw6f6lfjEG4WoUzxP4ctZKYW7x+lRJTjQJ6Aznalj
 POx1VFD0rBfCCq3YYTTGyzr7CMtAyZjzUqbgQcFX2dRzXZ9b+iAh3+xsdYDP8Icu/aFLt30kCCmkJ
 PtJ2WshnX6m7wOku+0hAEKyzUuesjPV6bEQoKmBTzN34OLy1Rvu9WY+v4jq9nhmMTVJQViRqPdI6q
 pbVhYsFX7hHez9EVZ0/tUQaodgGc1XWO7Fynp+iTs7Zsr90Xj33sqn38OswBoR/St2ARR3JZgL5Dr
 SwJTNBSjUDCEwYUl3cybHLvtua00uEu6w25NqvINdia9ABwe+/Ec1+vIFk+85IS/i9fGBb8hJZwnO
 gAtNptJQn6QUhY2DT2asBm7nBCothsY7ypN+YybovJbINlFw0nt7F78pcKwWwHET5Y9QaYC93f7v9
 Y9cPcaefyVrexljryxGe3I67h+4wnw0xRJCyIJ43gmuSYGyT+hxC/QE5ohlPGIE5M6iGyLpRBxdtP
 TG03EY7WqeDSQCQ7ovGJsgbRXn2cskHBRelxMXN0kYDhHqpxwSeOK/oGaA6tImbN5C4Oe3N2BWYzc
 ul/YAg0YIfVnbAgz5UztvrcBgFus+ut7egY56a2s8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 2/6] tests/9pfs: Twalk with nwname=0
Date: Fri, 11 Mar 2022 14:33:29 +0100
Message-ID: <3174746.CFxLxtX5Ws@silver>
In-Reply-To: <20220311124132.522fa396@bahia>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
 <22257136.YvWK5Ti9pE@silver> <20220311124132.522fa396@bahia>
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

On Freitag, 11. M=E4rz 2022 12:41:32 CET Greg Kurz wrote:
> On Thu, 10 Mar 2022 09:57:25 +0100
>=20
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Mittwoch, 9. M=E4rz 2022 14:24:24 CET Christian Schoenebeck wrote:
> > > Send Twalk request with nwname=3D0. In this case no QIDs should
> > > be returned by 9p server; this is equivalent to walking to dot.
> > >=20
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > >=20
> > >  tests/qtest/virtio-9p-test.c | 22 ++++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > >=20
> > > diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-tes=
t.c
> > > index 22bdd74bc1..6c00da03f4 100644
> > > --- a/tests/qtest/virtio-9p-test.c
> > > +++ b/tests/qtest/virtio-9p-test.c
> > > @@ -1002,6 +1002,27 @@ static void fs_walk_nonexistent(void *obj, void
> > > *data, QGuestAllocator *t_alloc) do_walk_expect_error(v9p,
> > > "non-existent",
> > > ENOENT);
> > >=20
> > >  }
> > >=20
> > > +static void fs_walk_none(void *obj, void *data, QGuestAllocator
> > > *t_alloc)
> > > +{
> >=20
> > Or maybe calling this function fs_walk_clone_fid and the test case name
> > "synth/walk/clone_fid" respectively instead?
>=20
> I agree that Twalk with nwname=3D0 does clone the fid in practice but
> the test doesn't explicitly check that. In its present form, I'd
> suggest a "no_names" wording but it is already fine as is, so:

It actually does; not with this patch 2 yet, but with patch 3 (which compar=
es=20
QIDs).

> Reviewed-by: Greg Kurz <groug@kaod.org>

Thanks!

Best regards,
Christian Schoenebeck



