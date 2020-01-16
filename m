Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DAA13D893
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 12:08:45 +0100 (CET)
Received: from localhost ([::1]:40082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is312-00087n-DA
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 06:08:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52592)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1is2zw-0007ft-5q
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 06:07:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1is2zr-0005P6-Rs
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 06:07:36 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47591
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1is2zr-0005Oa-OQ
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 06:07:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579172851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uhn/oD3CMW6zsl4nGwYu8i6ImDj9tbxNViUz8nQZ2Uo=;
 b=biP0hoevmt0GMRzQWRUlgYksJUlbuvol08pgTD59Oyj5ESArQyniJ4oQe9Eew+DvrsHcEl
 u5v6/a6aTYlAs5yIINCDccllSqZXAlQsT1w2kwlCmwE2Zz/QsgKuhxzU3v5Om7I33P1frR
 OBOgGqzgyrCqWws7eLkOWg6IxWvol+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-S16O3PQ4NiieXkiM2nT34Q-1; Thu, 16 Jan 2020 06:07:28 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCDC01137875;
 Thu, 16 Jan 2020 11:07:26 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-48.ams2.redhat.com [10.36.117.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 146F327099;
 Thu, 16 Jan 2020 11:07:22 +0000 (UTC)
Date: Thu, 16 Jan 2020 12:07:21 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Coiby Xu <coiby.xu@gmail.com>
Subject: Re: [PATCH v2 5/5] building configuration files changes
Message-ID: <20200116110721.GC9470@linux.fritz.box>
References: <20200114140620.10385-1-coiby.xu@gmail.com>
 <20200114140620.10385-6-coiby.xu@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200114140620.10385-6-coiby.xu@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: S16O3PQ4NiieXkiM2nT34Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: bharatlkmlkvm@gmail.com, qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.01.2020 um 15:06 hat Coiby Xu geschrieben:
> libvhost-user depends on sys/poll.h, sys/socket.h and eventfd. Although
> Windows has the equivalent Winsock, it doesn't have eventfd. So only
> enable this feature on Linux.
>=20
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>

This shouldn't be a separate patch at the end of the series, but each
patch should make sure that the files it adds are actually built. This
way you can apply individual patches and they still make sense. It also
helps for bisecting.

While applying the patches locally for review, I noticed that there is a
merge conflict with recent changes that moved qos test cases to a
different subdirectory. I resolved the conflict manually, but for v3 you
should rebase.

Kevin


