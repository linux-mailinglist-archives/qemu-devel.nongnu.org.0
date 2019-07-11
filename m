Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57F165800
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 15:43:16 +0200 (CEST)
Received: from localhost ([::1]:41876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlZLv-0006BI-Q6
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 09:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47337)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hlZL9-0005fz-22
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 09:42:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hlZL7-0007fR-W8
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 09:42:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41454)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1hlZL5-0007Vf-H0; Thu, 11 Jul 2019 09:42:23 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D4EE13084243;
 Thu, 11 Jul 2019 13:42:21 +0000 (UTC)
Received: from redhat.com (unknown [10.42.17.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A9899600CD;
 Thu, 11 Jul 2019 13:42:18 +0000 (UTC)
Date: Thu, 11 Jul 2019 14:42:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Message-ID: <20190711134216.GL11930@redhat.com>
References: <20190711132935.13070-1-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190711132935.13070-1-mreitz@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 11 Jul 2019 13:42:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] doc: Preallocation does not require
 writing zeroes
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 11, 2019 at 03:29:35PM +0200, Max Reitz wrote:
> When preallocating an encrypted qcow2 image, it just lets the protocol
> driver write data and then does not mark the clusters as zero.
> Therefore, reading this image will yield effectively random data.
>=20
> As such, we have not fulfilled the promise of always writing zeroes whe=
n
> preallocating an image in a while.  It seems that nobody has really
> cared, so change the documentation to conform to qemu's actual behavior=
.
>=20
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  qapi/block-core.json         | 9 +++++----
>  docs/qemu-block-drivers.texi | 4 ++--
>  qemu-img.texi                | 4 ++--
>  3 files changed, 9 insertions(+), 8 deletions(-)


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

