Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 694E9B4B97
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 12:09:19 +0200 (CEST)
Received: from localhost ([::1]:43582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAAQA-0001B0-Fj
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 06:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40946)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iAALL-0005OC-UH
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:04:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iAALK-0003wR-Bn
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:04:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37704)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1iAALH-0003u3-V7; Tue, 17 Sep 2019 06:04:16 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3FC1B3CA03;
 Tue, 17 Sep 2019 10:04:15 +0000 (UTC)
Received: from redhat.com (ovpn-112-41.ams2.redhat.com [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7D7560619;
 Tue, 17 Sep 2019 10:04:10 +0000 (UTC)
Date: Tue, 17 Sep 2019 11:04:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Message-ID: <20190917100407.GG1069@redhat.com>
References: <20190912091710.21449-1-mlevitsk@redhat.com>
 <20190912091710.21449-10-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190912091710.21449-10-mlevitsk@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 17 Sep 2019 10:04:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 09/12] qcrypto-luks: extract check and
 parse header
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 12, 2019 at 12:17:07PM +0300, Maxim Levitsky wrote:
> This is just to make qcrypto_block_luks_open more
> reasonable in size.
>=20
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>  crypto/block-luks.c | 235 ++++++++++++++++++++++++--------------------
>  1 file changed, 127 insertions(+), 108 deletions(-)

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

