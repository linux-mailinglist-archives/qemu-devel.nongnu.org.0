Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AB66E638
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 15:17:23 +0200 (CEST)
Received: from localhost ([::1]:45166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoSlG-0000G9-8Y
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 09:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33236)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hoSkT-0005xr-Bm
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 09:16:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hoSkS-0001rJ-BQ
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 09:16:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37490)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hoSkQ-0001pc-AW; Fri, 19 Jul 2019 09:16:30 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0A24081DF0;
 Fri, 19 Jul 2019 13:16:29 +0000 (UTC)
Received: from dhcp-200-226.str.redhat.com (dhcp-200-226.str.redhat.com
 [10.33.200.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBAFE5D97A;
 Fri, 19 Jul 2019 13:16:25 +0000 (UTC)
Date: Fri, 19 Jul 2019 15:16:24 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Message-ID: <20190719131624.GA5036@dhcp-200-226.str.redhat.com>
References: <20190719092618.24891-1-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190719092618.24891-1-mreitz@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 19 Jul 2019 13:16:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 00/10] block: Delay poll when ending
 drained sections
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.07.2019 um 11:26 hat Max Reitz geschrieben:
> Hi,
>=20
> This series:
>=20
> (1) Keeps patch 1, as the previous series, and
>=20
> (2) Decides whether all *drained_end* functions should poll or not; as
>     proposed by Kevin, all that should not poll now get a
>     @drained_end_counter pointer, whose pointee they have to increment
>     once for every background operation scheduled, and that background
>     operation will decrement it once it settles.
>     This allows functions that should poll to do so until the counter
>     reaches 0, so they don=E2=80=99t have to poll after scheduling ever=
y single
>     operation but can do so once in a place where it=E2=80=99s safe.

Thanks, applied to the block branch.

Kevin

