Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A691327FD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 14:44:29 +0100 (CET)
Received: from localhost ([::1]:49006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iop9n-0007lG-Kt
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 08:44:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55024)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1ions6-0007ZD-HD
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:22:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1ions5-0007Ak-CR
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:22:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38849
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1ions5-0007AT-8S
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:22:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578399724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PeI52HgGfdoYKaKeA5CsC6ADKmmcbq85kw3u7jCjgZk=;
 b=QlFKobPeoixbCfQCiVVtCnw9WhplU0tg2EKr31YDlJUnpvuW7n1tsUqsZcGXw/YHHcE0+X
 baWXVJN0L/5wwlIptgnXilhW5x/+YeD89XbLigggF3nrvDR/FSvjszS1rtJk8oD5OGo6SS
 lzzHVY8hzbgOa4cnkVuSLgU0dVnFGNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-YZ4w34WjPduRS1H31__Nhg-1; Tue, 07 Jan 2020 07:22:01 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C61618A6EC0;
 Tue,  7 Jan 2020 12:22:00 +0000 (UTC)
Received: from linux.fritz.box (ovpn-116-78.ams2.redhat.com [10.36.116.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57A118208E;
 Tue,  7 Jan 2020 12:21:59 +0000 (UTC)
Date: Tue, 7 Jan 2020 13:21:57 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v1 00/59] trivial unneeded labels cleanup
Message-ID: <20200107122157.GH4076@linux.fritz.box>
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106195457.GE2886@minyard.net>
 <f71eb524-571b-54d1-1a99-95d2896f6586@gmail.com>
 <20200107061613.GB4076@linux.fritz.box>
 <ccd70c1c-790a-bdc6-0f85-379777125892@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ccd70c1c-790a-bdc6-0f85-379777125892@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: YZ4w34WjPduRS1H31__Nhg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, minyard@acm.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.01.2020 um 12:52 hat Daniel Henrique Barboza geschrieben:
> > So what is your plan for getting the series merged? Should maintainers
> > just picks patches from the series, or do you want to collect Acked-by
> > tags and then merge it through a single tree? If the latter, which one?
>=20
> The idea I had in mind was for each maintainer to pick up the patches and=
 push
> through their own trees, like David did in patches 1 and 2.

Okay, thanks.

> From qemu-trivial archives I notice that Laurent creates qemu-trivial pul=
l
> requests often, thus I believe this might also be an option. If we decide
> to go this route I'll ask David to remove patches 1 and 2 from his ppc
> tree to avoid unnecessary conflicts.

Two trees picking up the same patch doesn't result in a conflict, git
can resolve this just fine. It only gets problematic if different
versions of a patch are picked up.

Kevin


