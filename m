Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29E5395BE
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 21:32:13 +0200 (CEST)
Received: from localhost ([::1]:51784 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZKay-0006PU-FD
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 15:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34087)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hZIhn-0006K3-Fb
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 13:31:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hZIhm-0004xI-CN
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 13:31:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55014)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hZIhm-0004wX-6g
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 13:31:06 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 61491C1EB1F8;
 Fri,  7 Jun 2019 17:31:00 +0000 (UTC)
Received: from redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AF9F8088D;
 Fri,  7 Jun 2019 17:30:58 +0000 (UTC)
Date: Fri, 7 Jun 2019 18:30:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190607173056.GO28838@redhat.com>
References: <20190607152827.18003-1-peter.maydell@linaro.org>
 <20190607152827.18003-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190607152827.18003-3-peter.maydell@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Fri, 07 Jun 2019 17:31:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/2] qemu-tech.texi: Remove "QEMU compared
 to other emulators" section
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 07, 2019 at 04:28:27PM +0100, Peter Maydell wrote:
> The "QEMU compared to other emulators" section of our documentation
> hasn't been updated since 2015 (and parts of the text are even older).
> We're clearly not very well placed to track the evolution of a
> dozen other emulation projects, and an inaccurate or out of date
> comparison doesn't serve anybody, so we're best off just removing
> the whole documentation section.
>=20
> If anybody cares strongly about maintaining a comparison page,
> it's probably better to do that on the project's wiki where
> we can update it more dynamically.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  qemu-tech.texi | 107 -------------------------------------------------
>  1 file changed, 107 deletions(-)

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

