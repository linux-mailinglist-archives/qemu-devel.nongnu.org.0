Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168E0161095
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 12:03:54 +0100 (CET)
Received: from localhost ([::1]:43572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3eBt-0001m3-5i
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 06:03:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35494)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j3eAg-0000kg-K3
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 06:02:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j3eAf-00041f-LW
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 06:02:38 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34149
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j3eAf-0003zq-Hn
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 06:02:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581937357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZbbQYttegt3tOjyANMeLdbMX9Eu97lfpxXt6czx+VHE=;
 b=U/G6Ngfu0k45S0deoWyhlLBFbMdHQOrOI0RWTukacb8d1oOR2iaiYuriuV+Lu9wwmKdMtC
 Mb6Db0Wc5EhqaKX0wf6BYmLCZURtH3wfqq2Cy/QvZCPSYjqcSfO8KbTgMR98aN6gN38B7+
 kQV4KJiCa8FAGnFNuisHwkmr5dUlTd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-q-I9kPf9N7-hVImAoff6Xg-1; Mon, 17 Feb 2020 06:02:33 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EDCADB6B;
 Mon, 17 Feb 2020 11:02:32 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-208.ams2.redhat.com [10.36.117.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0DA41000325;
 Mon, 17 Feb 2020 11:02:25 +0000 (UTC)
Date: Mon, 17 Feb 2020 12:02:23 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/3] block/qcow2-bitmap: Remove unneeded variable
 assignment
Message-ID: <20200217110223.GE6309@linux.fritz.box>
References: <20200215161557.4077-1-philmd@redhat.com>
 <20200215161557.4077-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200215161557.4077-2-philmd@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: q-I9kPf9N7-hVImAoff6Xg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.02.2020 um 17:15 hat Philippe Mathieu-Daud=E9 geschrieben:
> Fix warning reported by Clang static code analyzer:
>=20
>     CC      block/qcow2-bitmap.o
>   block/qcow2-bitmap.c:650:5: warning: Value stored to 'ret' is never rea=
d
>       ret =3D -EINVAL;
>       ^     ~~~~~~~
>=20
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

This isn't hw/, so I'm taking it through my tree. Thanks, applied to the
block branch.

Kevin


