Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 154164CBBDD
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 11:57:32 +0100 (CET)
Received: from localhost ([::1]:60274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPj9H-0000Ma-5B
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 05:57:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nPj7X-0007GF-T2
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 05:55:44 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:57925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nPj7V-0003Lf-Vb
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 05:55:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=c3r4uJsUNPo7X8KXVi9rpxt4uiMiHjSrBOv+anngObc=; b=axaOGuw75fgJ2YNdszCFJC2D2L
 i/DLdcBI0es6Vz+9tJZWEVZHtQBQmRVoe9QQoT5n/PaetG8HmquBMwCV6dkHJjqCf9MYkXefZWpz6
 x/mgtHWeLZTWH/+YyffkC9HL5bIFnWxs6s+OEnPS5qI8+Mbg4bsgRGAN/rlycOU2eMrtGYeSxWlc2
 qlM+AmH6J43LMMp34/omqLy3lW7dvVox0VYS/gpjNgmD0iGViwz1dxGNYW9NI/hyb+rhqbe/LVqcx
 zyL703N4iUk5bo9zAY+AGrTf+gAh+yjLzcJm5r+KBFI5JDO6RN5F/UKEmnKL05wFyZnfhQfbQYxVk
 U1csvnbm0BkD+McirlNIs+z4mySi7fSn+TogC5vIApIxTuSNxYVIf2nbdPyntqtVqAvbcHo6jKMnq
 GqKuQ8jEOTCcq0Iqt2Hxz1PHPCEa3gJewsjk1bZuMwdot8FvzwDl6iQTJsA02UnyslCyHZQ8FJitd
 POok0Z9n8tLYwUIS8l3y9pSeQ6DnTuluK/9a1Z62KiXa4n8ajd0kQ1TGGH/cM9eMvpxmn79Sfh5bH
 I8DJG9F5LBJJJBhd9CGVR+yX88r4PAsVF62gSoCfcyb33PJldKeNCb9FTtLRl9bZJrNvFlSU5aKX0
 OCT8sUFqvT1J31pYkPgmuD7R7yA5JlPtxORG0bIb4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] 9pfs: drop Doxygen format from qemu_dirent_dup() API
 comment
Date: Thu, 03 Mar 2022 11:55:36 +0100
Message-ID: <1847380.I5uLlGeFOO@silver>
In-Reply-To: <20220303105332.5ce078a9@bahia>
References: <E1nPTwO-0006pl-Np@lizzy.crudebyte.com>
 <20220303105332.5ce078a9@bahia>
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

On Donnerstag, 3. M=E4rz 2022 10:53:32 CET Greg Kurz wrote:
> On Wed, 2 Mar 2022 19:30:39 +0100
>=20
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > API doc comments in QEMU are supposed to be in kerneldoc format, so drop
> > occurrences of "@c" which is Doxygen format for fixed-width text.
> >=20
> > Link:
> > https://lore.kernel.org/qemu-devel/CAFEAcA89+ENOM6x19OEF53Kd2DWkhN5SN21=
Va
> > 0D7yepJSa3Jyg@mail.gmail.com/ Based-on:
> > <E1nP9Oz-00043L-KJ@lizzy.crudebyte.com>
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
>=20
> Sorry for not catching these during previous reviews :-\
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>
>=20
> FWIW it seems some more de-doxygenation is needed :
>=20
> fsdev/p9array.h: * Consider the following user struct @c Foo which shall =
be
> used as scalar fsdev/p9array.h: * @code
> fsdev/p9array.h: * and assume it has the following function to free memory
> allocated by @c Foo fsdev/p9array.h: * @code
> fsdev/p9array.h: * @code
> fsdev/p9array.h: * @code
> fsdev/p9array.h: * @code
> hw/9pfs/9p.h:     * Lenght of the affix, that is how many (of the lowest)
> bits of @c value extra nit  ^^
> hw/9pfs/codir.c: * @note You must @b ALWAYS call @c
> v9fs_free_dirents(entries) after calling

OK, I send more patches to wipe these as well today.

Greg, if something is tagged as junk email at your end, please remove it fr=
om=20
the subject line, otherwise I will not receive your reply. It was pure luck=
=20
that I noticed your message on the archives this time.

Best regards,
Christian Schoenebeck



