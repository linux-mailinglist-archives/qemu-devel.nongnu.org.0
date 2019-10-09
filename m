Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E757CD17E5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 20:57:39 +0200 (CEST)
Received: from localhost ([::1]:54278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIH9W-0004BQ-H8
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 14:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57495)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iICPT-0006Nl-I1
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 09:53:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iICPS-0007BQ-Hh
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 09:53:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51150)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iICPS-00078i-CA
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 09:53:46 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DA5998E58C
 for <qemu-devel@nongnu.org>; Wed,  9 Oct 2019 13:53:44 +0000 (UTC)
Received: from redhat.com (ovpn-112-67.ams2.redhat.com [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 028215C22C;
 Wed,  9 Oct 2019 13:53:40 +0000 (UTC)
Date: Wed, 9 Oct 2019 14:53:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] trace: add --group=all to tracing.txt
Message-ID: <20191009135338.GH3981@redhat.com>
References: <20191009135154.10970-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191009135154.10970-1-stefanha@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Wed, 09 Oct 2019 13:53:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 09, 2019 at 02:51:54PM +0100, Stefan Hajnoczi wrote:
> tracetool needs to know the group name ("all", "root", or a specific
> subdirectory).  Also remove the stdin redirection because tracetool.py
> needs the path to the trace-events file.  Update the documentation.
>=20
> Fixes: 2098c56a9bc5901e145fa5d4759f075808811685
>        ("trace: move setting of group name into Makefiles")
> Launchpad: https://bugs.launchpad.net/bugs/1844814
> Reported-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Cc: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/devel/tracing.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

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

