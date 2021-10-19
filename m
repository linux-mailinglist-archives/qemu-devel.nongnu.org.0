Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFFD433C6E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:35:50 +0200 (CEST)
Received: from localhost ([::1]:58084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcs5e-0007Bv-1Y
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mcr0y-0000LK-N2
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:26:56 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:32264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mcr0w-0000sk-AO
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:26:55 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-ajb8w15WNvSrLulYUM70Fg-1; Tue, 19 Oct 2021 11:26:42 -0400
X-MC-Unique: ajb8w15WNvSrLulYUM70Fg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C05E11006AA3;
 Tue, 19 Oct 2021 15:26:40 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96A9C226E9;
 Tue, 19 Oct 2021 15:26:39 +0000 (UTC)
Date: Tue, 19 Oct 2021 17:26:38 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 00/64] Patch Round-up for stable 6.0.1, freeze on
 2021-10-26
Message-ID: <20211019172638.103cbde6@bahia.huguette>
In-Reply-To: <2448414.exmQesOQCs@silver>
References: <20211019140944.152419-1-michael.roth@amd.com>
 <2448414.exmQesOQCs@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Oct 2021 16:52:37 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Dienstag, 19. Oktober 2021 16:08:40 CEST Michael Roth wrote:
> > Hi everyone,
> >=20
> > The following new patches are queued for QEMU stable v6.0.1:
> >=20
> >   https://gitlab.com/qemu-project/qemu/-/commits/stable-6.0-staging/
> >=20
> > Patch freeze is 2021-10-26, and the release is planned for 2021-10-28:
> >=20
> >   https://wiki.qemu.org/Planning/6.0
> >=20
> > Please respond here or CC qemu-stable@nongnu.org on any additional patc=
hes
> > you think should (or shouldn't) be included in the release.
> >=20
> > Thanks!
>=20
> Hi Micheal,
>=20
> I think the following 9p fix is yet missing:
>=20
> f83df00900816476cca41bb536e4d532b297d76e 9pfs: fix crash in v9fs_walk()
>=20

No, this commit fixes 8d6cb100731c ("9pfs: reduce latency of Twalk")
which was merged in QEMU 6.1. This is a good candidate for the upcoming
QEMU 6.1.1 though :-)

> Best regards,
> Christian Schoenebeck
>=20
>=20


