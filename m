Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBE7554D5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 18:47:21 +0200 (CEST)
Received: from localhost ([::1]:34026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfobI-0006dw-9D
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 12:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51063)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hfoYv-0005fJ-VH
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 12:44:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hfoYt-0007p8-FW
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 12:44:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56150)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hfoYp-0007k6-PY
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 12:44:48 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 60211309175F
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 16:44:40 +0000 (UTC)
Received: from redhat.com (ovpn-112-73.ams2.redhat.com [10.36.112.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75ADA19C6F;
 Tue, 25 Jun 2019 16:44:36 +0000 (UTC)
Date: Tue, 25 Jun 2019 17:44:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190625164433.GL3139@redhat.com>
References: <20190625161629.302-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190625161629.302-1-imammedo@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 25 Jun 2019 16:44:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2] deprecate -mem-path fallback to
 anonymous RAM
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
Cc: libvir-list@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 25, 2019 at 12:16:29PM -0400, Igor Mammedov wrote:
> Fallback might affect guest or worse whole host performance
> or functionality if backing file were used to share guest RAM
> with another process.
>=20
> Patch deprecates fallback so that we could remove it in future
> and ensure that QEMU will provide expected behavior and fail if
> it can't use user provided backing file.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v2:
>  * improve text language
>     (Markus Armbruster <armbru@redhat.com>)
>=20
>  numa.c               | 6 ++++--
>  qemu-deprecated.texi | 9 +++++++++
>  2 files changed, 13 insertions(+), 2 deletions(-)

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

