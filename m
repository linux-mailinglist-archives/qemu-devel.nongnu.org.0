Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EDB4CBCB0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 12:33:24 +0100 (CET)
Received: from localhost ([::1]:50862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPjhz-0008Ma-D3
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 06:33:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nPjem-000770-P3
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 06:30:06 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:32975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nPjek-0007eq-VS
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 06:30:04 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-IbdKJaoNNeinlYrwg8G83Q-1; Thu, 03 Mar 2022 06:29:57 -0500
X-MC-Unique: IbdKJaoNNeinlYrwg8G83Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00406801AAD;
 Thu,  3 Mar 2022 11:29:56 +0000 (UTC)
Received: from bahia (unknown [10.39.193.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E473582E5A;
 Thu,  3 Mar 2022 11:29:54 +0000 (UTC)
Date: Thu, 3 Mar 2022 12:29:53 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] 9pfs: drop Doxygen format from qemu_dirent_dup() API
 comment
Message-ID: <20220303122953.01ee1139@bahia>
In-Reply-To: <1847380.I5uLlGeFOO@silver>
References: <E1nPTwO-0006pl-Np@lizzy.crudebyte.com>
 <20220303105332.5ce078a9@bahia> <1847380.I5uLlGeFOO@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 03 Mar 2022 11:55:36 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Donnerstag, 3. M=C3=A4rz 2022 10:53:32 CET Greg Kurz wrote:
> > On Wed, 2 Mar 2022 19:30:39 +0100
> >=20
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > API doc comments in QEMU are supposed to be in kerneldoc format, so d=
rop
> > > occurrences of "@c" which is Doxygen format for fixed-width text.
> > >=20
> > > Link:
> > > https://lore.kernel.org/qemu-devel/CAFEAcA89+ENOM6x19OEF53Kd2DWkhN5SN=
21Va
> > > 0D7yepJSa3Jyg@mail.gmail.com/ Based-on:
> > > <E1nP9Oz-00043L-KJ@lizzy.crudebyte.com>
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> >=20
> > Sorry for not catching these during previous reviews :-\
> >=20
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> >=20
> > FWIW it seems some more de-doxygenation is needed :
> >=20
> > fsdev/p9array.h: * Consider the following user struct @c Foo which shal=
l be
> > used as scalar fsdev/p9array.h: * @code
> > fsdev/p9array.h: * and assume it has the following function to free mem=
ory
> > allocated by @c Foo fsdev/p9array.h: * @code
> > fsdev/p9array.h: * @code
> > fsdev/p9array.h: * @code
> > fsdev/p9array.h: * @code
> > hw/9pfs/9p.h:     * Lenght of the affix, that is how many (of the lowes=
t)
> > bits of @c value extra nit  ^^
> > hw/9pfs/codir.c: * @note You must @b ALWAYS call @c
> > v9fs_free_dirents(entries) after calling
>=20
> OK, I send more patches to wipe these as well today.
>=20
> Greg, if something is tagged as junk email at your end, please remove it =
from=20
> the subject line, otherwise I will not receive your reply. It was pure lu=
ck=20
> that I noticed your message on the archives this time.
>=20

Sure... I usually do but I forgot this time. Sorry for that.

Since you seem to be the only affected person which I receive
mail from, I'll try to automate this on my side.

> Best regards,
> Christian Schoenebeck
>=20
>=20


