Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F86A4C9E1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 10:51:44 +0200 (CEST)
Received: from localhost ([::1]:44932 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdsnH-0001V0-5p
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 04:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36161)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hdsjL-0007Qa-3P
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:47:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hdsVw-0006F8-LU
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:33:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44748)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hdsVt-00068p-Gt
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:33:46 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 736B11556B
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 08:33:30 +0000 (UTC)
Received: from redhat.com (ovpn-112-65.ams2.redhat.com [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1BDC60605;
 Thu, 20 Jun 2019 08:33:28 +0000 (UTC)
Date: Thu, 20 Jun 2019 09:33:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190620083325.GE25448@redhat.com>
References: <20190619201050.19040-1-armbru@redhat.com>
 <20190619201050.19040-4-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190619201050.19040-4-armbru@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 20 Jun 2019 08:33:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 03/17] hmp: Move hmp.h to include/monitor/
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kwolf@redhat.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 19, 2019 at 10:10:36PM +0200, Markus Armbruster wrote:
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hmp.h =3D> include/monitor/hmp.h | 0
>  monitor/hmp-cmds.c             | 2 +-
>  monitor/misc.c                 | 2 +-
>  target/i386/monitor.c          | 2 +-
>  target/nios2/monitor.c         | 2 +-
>  target/ppc/monitor.c           | 2 +-
>  target/sh4/monitor.c           | 2 +-
>  target/sparc/monitor.c         | 2 +-
>  target/xtensa/monitor.c        | 2 +-
>  9 files changed, 8 insertions(+), 8 deletions(-)
>  rename hmp.h =3D> include/monitor/hmp.h (100%)

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

