Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F2DF446B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 11:24:44 +0100 (CET)
Received: from localhost ([::1]:51734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT1Rb-0005sG-D0
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 05:24:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47121)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iT1MG-0007iO-MG
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 05:19:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iT1MF-0006D1-Ex
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 05:19:12 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:52058
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iT1MF-0006Ci-AD
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 05:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573208350;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=st4fe5pzFa0Kv4IaGBc2Ukpw3LGWfDMOao3HR2OY6hQ=;
 b=JqzzvS6kwiEO1Fcqf+L8nolCQJ+hmdaiCr1hju8pHu4Wib+putk4R+D3gITBVCdgnn5RK4
 5/GaUkjp/wQliN14ZDK1AUrALooHlVHMbLV9Wzt6YFU6YBd8GC9KL4SyLYuM0ZUPEHGP7w
 xSNgXoZoYs+eWFnknP9Mc5obOd/bRUY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-N1d8Oc2XOMy-1pbASQV-hw-1; Fri, 08 Nov 2019 05:19:09 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BF67477;
 Fri,  8 Nov 2019 10:19:08 +0000 (UTC)
Received: from redhat.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35571600CA;
 Fri,  8 Nov 2019 10:19:02 +0000 (UTC)
Date: Fri, 8 Nov 2019 10:19:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 2/3] docs: build a global index page
Message-ID: <20191108101900.GA182396@redhat.com>
References: <20191108095942.401225-1-stefanha@redhat.com>
 <20191108095942.401225-3-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191108095942.401225-3-stefanha@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: N1d8Oc2XOMy-1pbASQV-hw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 08, 2019 at 10:59:41AM +0100, Stefan Hajnoczi wrote:
> Build docs/ in a single sphinx invocation instead of treating
> docs/{devel,interop,specs} separately.  This allows us to build a global
> index page that links to documentation across the different manuals.
>=20
> Some documentation is built outside of sphinx and is not formatted as
> reStructuredText.  Link directly to the .html files for the time being.
> If they are converted to .rst files in the future they can be included
> more elegantly.
>=20
> Sphinx wants to build all .rst files and complains if they are not
> listed in the table of contents.  We have not yet reviewed and
> categorized some of our .rst files.  Hide these files so they are always
> built (and syntax-checked from now on!) but not visible in the table of
> contents.

Ah, nice trick.

>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  Makefile       | 13 ++++---------
>  docs/index.rst | 27 ++++++++++++++++++++++++++-
>  2 files changed, 30 insertions(+), 10 deletions(-)

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


