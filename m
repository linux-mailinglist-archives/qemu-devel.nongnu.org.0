Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC93260E42
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 11:02:40 +0200 (CEST)
Received: from localhost ([::1]:48966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFZWR-0000CY-Bv
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 05:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kFZVF-0007zs-G8
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 05:01:25 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:38267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kFZV9-0006UQ-QG
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 05:01:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=urgfRpwIdSTaMAVZN8KmU1DPmTCxuCqYc+Txlem9SDA=; b=osaZzzYs5hixrC2ejChZkGYVsg
 K5sXWC+5dlnVjEtNLO+H+SROQWnahVbxFV0VTDz4hO4GY4BFiS0eVWmyqtlgf2JkK3vEdRaXwKNZz
 Tvs3daDS+v+JKHPXWK3NbpY1OdgP/YxghwVoLlek7/PFs7715pzlgSSIYfaPwqdhsk3HAuFvteZVg
 Q79ZigAP2PFcf/QXUAcPOFsnnf25lrq3EMS7RptWR9BR5V8gRdstS+zMphMU8KCykf0itG0eNiiz2
 4RGU7Tt2KH1xjdtWzaOZgXxNhNj99Fy+39ZNCW+v85N3oTz64mHnWrtZJR57bQKN0hgkfEGZTANww
 ymqTPnfA==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] 9pfs: disable msize warning for synth driver
Date: Tue, 08 Sep 2020 11:01:15 +0200
Message-ID: <4834247.Ya9cJq7G5r@silver>
In-Reply-To: <20200908101036.6b3a76db@bahia.lan>
References: <E1kEyDy-0006nN-5A@lizzy.crudebyte.com>
 <20200907142719.35a4f079@bahia.lan> <20200908101036.6b3a76db@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 05:01:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 8. September 2020 10:10:36 CEST Greg Kurz wrote:
> > > BTW, have you ever tried dealing with patchwork client's 'state' feat=
ure
> > > for already transmited patches on the list (new, rejected, etc.)?
> >=20
> > Nope, never used patchwork's state at all and I've no idea on how it
> > works... but I can ask to my former IBM colleagues at Ozlabs.
>=20
> It seems that you need to be a "maintainer" from a patchwork standpoint
> to manipulate patch states.
>=20
> https://patchwork.readthedocs.io/en/latest/usage/overview/#maintainers
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Maintainers
>=20
> Maintainers are a special type of user that with permissions to do
> certain operations that regular Patchwork users can=E2=80=99t. Patchwork
> maintainers usually have a 1:1 mapping with a project=E2=80=99s code
> maintainers though this is not necessary.
>=20
> The operations that a maintainer can invoke include:
>=20
>     Change the state of a patch
>     Archive a patch
>     Delegate a patch, or be delegated a patch
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> No clue how to upgrade to maintainer though...

The command to change a patch state is, e.g.:

	pwclient update -s Queued 11759645

When I do that I get this error:

	The update action requires authentication, but no username or password
	is configured

So looks like it would require somebody to create an account somewhere,=20
wherever that is.

Best regards,
Christian Schoenebeck



