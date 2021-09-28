Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F9941B408
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 18:39:05 +0200 (CEST)
Received: from localhost ([::1]:53310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVG8F-0000qF-US
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 12:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mVG6T-00007k-Uh
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 12:37:13 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:56645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mVG6S-0007GN-1U
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 12:37:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=tgDBuO9igVUQUW9vBVSXe1si4DsIvMbB5+Ue7YVMql4=; b=NGV6TbitDrk+6kea3gi25TpmPC
 YHuU0SuH/KDLkgs3IIcSxIbO3CfvcJpEnEOwLhEz6+a5i0chtM6TdxdEAVr3uYRxPTEvrXFsZ+r0b
 BQiH5/RlcwtN0CvXckfQw0GtvdtN+DB69pRvnlEGQr1srEADbA/cRyhIu64Tx0HX/131Y5gzcSeQ7
 5ZcMNuX7EabUnL/FZINIMx2FtowITj2SjX4aW0B/RxGTjAw7qUGGdOt5fCTkAQhX8ZE9+p9DfA/Y4
 iWZKipyBzNzo5945+CYmSCEkGc28+eOR5wHiGyhOTk7NlPG3mkwft4ajfX29REzDzNaVrY+GR6rQP
 Y4GPVAdJg841HJ0Cc9u6U2f4yqchMMmlaCPiEpF2H096pbZCFQ2s+/ILfDFzd7/4Kt/t06xyIOtif
 Z26j1KNFOoO9bExg4KSIUjKODVtX/3MrShhZjBIXwmV4p0GSaNH8yZT8etMUqjkGzeoDDJFvDdqyi
 Gr3a8KzA46dGmKN8r5zmcFHvXxwBh2ArmcuxtWf221BycTJoBBvebiacyv1wC3pJaeabjWskTP/Cl
 iPhjfTDSXnl+YroseqZfWNsdhd2M5JsENrneDGTPGJKUckV86D9fMixZbYRUeAXxq3SX94Jwslry4
 dKIUTT9ZAQURuysl9CC5v/+7EQS9/DR0iQ0Ra3KSE=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 0/5] introduce QArray
Date: Tue, 28 Sep 2021 18:37:09 +0200
Message-ID: <8687103.ngNPQyVK68@silver>
In-Reply-To: <87v92k7qyd.fsf@linaro.org>
References: <cover.1629982046.git.qemu_oss@crudebyte.com>
 <1811981.VuayHpH01O@silver> <87v92k7qyd.fsf@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 28. September 2021 15:37:45 CEST Alex Benn=E9e wrote:
> Christian Schoenebeck <qemu_oss@crudebyte.com> writes:
> > On Montag, 27. September 2021 12:59:40 CEST Greg Kurz wrote:
> >> On Mon, 27 Sep 2021 12:35:16 +0200
> >>=20
> >> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> >> > On Dienstag, 31. August 2021 14:25:04 CEST Christian Schoenebeck wro=
te:
> >> > > On Dienstag, 31. August 2021 13:58:02 CEST Greg Kurz wrote:
> >> > > > On Thu, 26 Aug 2021 14:47:26 +0200
> >> > > >=20
> >> > > > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> >> > > > > Patches 1 and 2 introduce include/qemu/qarray.h which implemen=
ts
> >> > > > > a
> >> > > > > deep
> >> > > > > auto free mechanism for arrays. See commit log of patch 1 for a
> >> > > > > detailed
> >> > > > > explanation and motivation for introducing QArray.
> >> > > > >=20
> >> > > > > Patches 3..5 are provided (e.g. as example) for 9p being the
> >> > > > > first
> >> > > > > user
> >> > > > > of
> >> > > > > this new QArray API. These particular patches 3..5 are rebased=
 on
> >> > > > > my
> >> > > > > current 9p queue:
> >> > > > > https://github.com/cschoenebeck/qemu/commits/9p.next
> >> > > >=20
> >> > > > > which are basically just the following two queued patches:
> >> > > > This looks nice indeed but I have the impression the same could =
be
> >> > > > achieved using glib's g_autoptr framework with less code being
> >> > > > added
> >> > > > to QEMU (at the cost of being less generic maybe).
> >> > >=20
> >> > > I haven't seen a way doing this with glib, except of GArray which =
has
> >> > > some
> >> > > disadvantages. But who knows, maybe I was missing something.
> >> >=20
> >> > Ping
> >> >=20
> >> > Let's do this?
> >>=20
> >> Hi Christian,
> >>=20
> >> Sorry I don't have enough bandwidth to review or to look for an altern=
ate
> >> way... :-\ So I suggest you just go forward with this series. Hopefully
> >> you can get some reviews from Markus and/or Richard.
> >=20
> > Ok, then I wait for few more days, and if there are no repsonses, nor
> > vetos
> > then I'll queue these patches anyway.
>=20
> As far as I can make out the main argument for introducing a QEMU
> specific array handler is to avoid needing to use g_array_index() to
> reference the elements of the array. This in itself doesn't seem enough
> justification to me.
>=20
> I also see you handle deep frees which I admit is not something I've
> really done with GArray as usually I'm using it when I want to have
> everything local to each other.

The main motivation for this API is to simplify and reduce code, which also=
=20
increases safety.

Most of the suggested header file are really just comments. If you strip th=
ose=20
comments away, you actually only have a few lines of code left.

There are user code functions which are already complex enough on its own,=
=20
where I don't want to additionally need to think about for *each* individua=
l=20
branch whether I need to free something here and there, and if yes what=20
exactly, how deep, and whether there are any exceptions I have to take care=
=20
about, etc.

Best regards,
Christian Schoenebeck



