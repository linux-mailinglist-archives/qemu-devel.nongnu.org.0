Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C4D4192B5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 13:04:34 +0200 (CEST)
Received: from localhost ([::1]:37094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUoQz-0005kP-Bn
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 07:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mUoMc-000449-Gw
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 07:00:02 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:40258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mUoMa-00005e-G6
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 07:00:02 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-4-h9GmDqNMKjUmpMXgxnRw-1; Mon, 27 Sep 2021 06:59:47 -0400
X-MC-Unique: 4-h9GmDqNMKjUmpMXgxnRw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0490DBBEE8;
 Mon, 27 Sep 2021 10:59:46 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B0445D9D5;
 Mon, 27 Sep 2021 10:59:41 +0000 (UTC)
Date: Mon, 27 Sep 2021 12:59:40 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v3 0/5] introduce QArray
Message-ID: <20210927125940.3ef12485@bahia.huguette>
In-Reply-To: <2431106.PTX978RE0L@silver>
References: <cover.1629982046.git.qemu_oss@crudebyte.com>
 <20210831135802.349fb447@bahia.lan> <1697912.9TVREAEhXh@silver>
 <2431106.PTX978RE0L@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 27 Sep 2021 12:35:16 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Dienstag, 31. August 2021 14:25:04 CEST Christian Schoenebeck wrote:
> > On Dienstag, 31. August 2021 13:58:02 CEST Greg Kurz wrote:
> > > On Thu, 26 Aug 2021 14:47:26 +0200
> > >=20
> > > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > > Patches 1 and 2 introduce include/qemu/qarray.h which implements a =
deep
> > > > auto free mechanism for arrays. See commit log of patch 1 for a det=
ailed
> > > > explanation and motivation for introducing QArray.
> > > >=20
> > > > Patches 3..5 are provided (e.g. as example) for 9p being the first =
user
> > > > of
> > > > this new QArray API. These particular patches 3..5 are rebased on m=
y
> > > > current 9p queue: https://github.com/cschoenebeck/qemu/commits/9p.n=
ext
> > >=20
> > > > which are basically just the following two queued patches:
> > > This looks nice indeed but I have the impression the same could be
> > > achieved using glib's g_autoptr framework with less code being added
> > > to QEMU (at the cost of being less generic maybe).
> >=20
> > I haven't seen a way doing this with glib, except of GArray which has s=
ome
> > disadvantages. But who knows, maybe I was missing something.
>=20
> Ping
>=20
> Let's do this?
>=20

Hi Christian,

Sorry I don't have enough bandwidth to review or to look for an alternate
way... :-\ So I suggest you just go forward with this series. Hopefully
you can get some reviews from Markus and/or Richard.

Cheers,

--
Greg

> > > Anyway, we should likely sort out the SEGV issue you're hitting
> > > before going forward with supplementary changes in v9fs_walk().
> >=20
> > Yeah, let's postpone this series here. I'll look into the Twalk crash i=
ssue
> > more closely today and will get back on that issue first.
> >=20
> > Best regards,
> > Christian Schoenebeck
>=20
>=20


