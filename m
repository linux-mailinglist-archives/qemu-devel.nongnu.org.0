Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CE6490ADD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 15:57:19 +0100 (CET)
Received: from localhost ([::1]:33172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9TRe-00083R-NH
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 09:57:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n9TF0-0002Ma-08
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:44:14 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:33317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n9TEv-0007hV-Il
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:44:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=HvRWx10ilSS8pDAfxnrupBgqJgDkcvqxJxjMuTvsZw0=; b=C8mj2RStTr7E9svtFoLsmdwVn2
 qt5ZEoXpwL7OcTqfbakOGSmBXQ/IZz2xwJJ11j2gx4udr5Glb2NCE9vJG+YUBjIdpv2rYPiCIfxNA
 XqGTqhEl/pV0ypJk/LSlTaOKdup4wRJRwNQNOkK2Qa0DUhh5efs5+zUsd4n5LhblmPxTEJ0E3+Q/2
 iH6rOHC92KLz4/J+UZIVKLH8FNPE1qPSCGmzZJ7FrM7u+ecJRodJD14K0qGM+JwWale/9Uyj1pz+A
 mS0twxCtD5WxGt+0LU6ySiJ2r2ugOt2BaYSEwtqP1DGFmreom+aVtAsU6hinff6uthBLZFB5dJ9q7
 Sxc8iSrY3Es0Z9jJc6zrtzL8ryL7v1yQSYuPR32Bl71Z1kh0lVa3WGILl2cmbEmrTfEAAhojnI/KT
 VTRab2/G82j0hhEL0KNlS9ybCO1GXnnQHmm4GGr+LWFojdC4gqh6CWoIFV8Ltyegm1DJ0WPBaSLDB
 3x9PVa8Q9+SplXHriDsgNLXwON6aRIlHJhhgVRi5nMxtgOyDAxBSL43lFAcJWJmeXZxh4iI/jcTcx
 Ao+oEXg6E5LUyG6iZI8Zi1HvfprYhVz5DC7lK02fA6BrmpEG8RBltOm5PkBKLxUuHeB4hTfrT+Dal
 dKpM2qWMLu/vtu4gOchK95Izg8i51ytH/zWW7IJ4c=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Subject: Re: 9p root fs HOWTO
Date: Mon, 17 Jan 2022 15:44:05 +0100
Message-ID: <3065564.DFbkM2JXdW@silver>
In-Reply-To: <37a251a7-b6bc-ac80-8c2f-02a03f4fab26@amsat.org>
References: <2785520.nJZE4KsnAZ@silver>
 <37a251a7-b6bc-ac80-8c2f-02a03f4fab26@amsat.org>
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

On Montag, 17. Januar 2022 15:03:05 CET Philippe Mathieu-Daud=E9 wrote:
> On 17/1/22 14:14, Christian Schoenebeck wrote:
> > As I was still reading claims on the net that 9p was not usable for more
> > complex use cases, I decided to write a complete HOWTO for installing a=
nd
> > configuring an entire guest OS (with Debian 11 "Bullseye" as example) on
> > top of 9p being guest's root fs:
> >=20
> > https://wiki.qemu.org/Documentation/9p_root_fs
>=20
> Thanks for doing this!
>=20
> Doesn't it deserve its entry in the sphinx-generated manual,
> rather than the wiki?

I already had a run on this for the 9p developer docs before, but=20
unfortunately there does not seem to be an adequate solution:

https://lore.kernel.org/qemu-devel/2001177.cHeAXU27Kk@silver/

Best regards,
Christian Schoenebeck



