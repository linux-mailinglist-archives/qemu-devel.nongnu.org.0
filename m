Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9140136151
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 18:31:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46077 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYYoY-0004EX-9c
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 12:31:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hYYnL-0003ix-Ps
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 12:29:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hYYnK-0006yW-Qw
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 12:29:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37498)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1hYYnI-0006pu-JS; Wed, 05 Jun 2019 12:29:44 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98B7730BC58C;
	Wed,  5 Jun 2019 16:29:43 +0000 (UTC)
Received: from redhat.com (ovpn-112-70.ams2.redhat.com [10.36.112.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D2975F7C0;
	Wed,  5 Jun 2019 16:29:39 +0000 (UTC)
Date: Wed, 5 Jun 2019 17:29:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20190605162937.GO8956@redhat.com>
References: <20190605161804.118956-1-vsementsov@virtuozzo.com>
	<20190605161804.118956-2-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190605161804.118956-2-vsementsov@virtuozzo.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 05 Jun 2019 16:29:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 1/2] io/channel: add
 qio_channel_set_keepalive
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
	mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 05, 2019 at 07:18:03PM +0300, Vladimir Sementsov-Ogievskiy wr=
ote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/io/channel.h | 15 +++++++++++++++
>  io/channel-socket.c  | 20 ++++++++++++++++++++
>  io/channel.c         | 14 ++++++++++++++
>  3 files changed, 49 insertions(+)

Acked-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

