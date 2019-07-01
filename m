Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3D42629B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 12:58:29 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40152 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTOx2-0005WT-9R
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 06:58:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33040)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hTOvF-0004e6-NF
	for qemu-devel@nongnu.org; Wed, 22 May 2019 06:56:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hTOvE-0008KB-Lb
	for qemu-devel@nongnu.org; Wed, 22 May 2019 06:56:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52006)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hTOvE-0008Jq-FA
	for qemu-devel@nongnu.org; Wed, 22 May 2019 06:56:36 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C85B28666F;
	Wed, 22 May 2019 10:56:35 +0000 (UTC)
Received: from redhat.com (unknown [10.42.17.248])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEC4728563;
	Wed, 22 May 2019 10:56:34 +0000 (UTC)
Date: Wed, 22 May 2019 11:56:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20190522105632.GE32359@redhat.com>
References: <20190517023924.1686-1-richard.henderson@linaro.org>
	<20190517023924.1686-3-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190517023924.1686-3-richard.henderson@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 22 May 2019 10:56:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v8 02/25] build: Link user-only with crypto
 random number objects
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 16, 2019 at 07:39:01PM -0700, Richard Henderson wrote:
> For user-only, we require only the random number bits of the
> crypto subsystem.  Rename crypto-aes-obj-y to crypto-user-obj-y,
> and add the random number objects, plus init.o to handle any
> extra stuff the crypto library requires.
>=20
> Move the crypto libraries from libs_softmmu and libs_tools to
> LIBS, so that they are universally used.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  Makefile             |  4 ++--
>  Makefile.objs        |  2 +-
>  Makefile.target      |  4 ++--
>  configure            |  9 +++------
>  crypto/Makefile.objs | 11 ++++++-----
>  5 files changed, 14 insertions(+), 16 deletions(-)

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

