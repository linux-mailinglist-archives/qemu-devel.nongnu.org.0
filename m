Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D1122C81
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 09:04:37 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hScLc-0005Hb-6g
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 03:04:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hScKW-0004uk-5W
	for qemu-devel@nongnu.org; Mon, 20 May 2019 03:03:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hScKV-0004Oq-Ah
	for qemu-devel@nongnu.org; Mon, 20 May 2019 03:03:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36308)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hScKV-0004OG-5c; Mon, 20 May 2019 03:03:27 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B78B13AA9;
	Mon, 20 May 2019 07:03:19 +0000 (UTC)
Received: from gondolin (ovpn-204-110.brq.redhat.com [10.40.204.110])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F70760C9D;
	Mon, 20 May 2019 07:03:15 +0000 (UTC)
Date: Mon, 20 May 2019 09:03:12 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Message-ID: <20190520090312.780ab6e4.cohuck@redhat.com>
In-Reply-To: <20190520062552.389-1-clg@kaod.org>
References: <20190513084245.25755-2-clg@kaod.org>
	<20190520062552.389-1-clg@kaod.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 20 May 2019 07:03:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] linux-headers: Update linux headers to
 5.2-rc1
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
	Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 May 2019 08:25:52 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Update the QEMU copy of the Linux headers to upstream 5.2-rc1 (linux
> commit a188339ca5a3).
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

FWIW, I have a headers update queued in my s390-next branch as well,
and I plan to send a pull req soonish.

