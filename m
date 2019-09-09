Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B69ADAD8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Sep 2019 16:11:54 +0200 (CEST)
Received: from localhost ([::1]:57242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7KOY-0008J1-2H
	for lists+qemu-devel@lfdr.de; Mon, 09 Sep 2019 10:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38142)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1i7KNm-0007uT-7G
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 10:11:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1i7KNl-0006zh-0j
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 10:11:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:61395)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1i7KNk-0006zW-O6
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 10:11:04 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E4DD250F63;
 Mon,  9 Sep 2019 14:11:03 +0000 (UTC)
Received: from redhat.com (unknown [10.42.17.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB9D61001938;
 Mon,  9 Sep 2019 14:11:02 +0000 (UTC)
Date: Mon, 9 Sep 2019 15:11:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Message-ID: <20190909141100.GK24509@redhat.com>
References: <20190909135842.25469-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190909135842.25469-1-alex.bennee@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Mon, 09 Sep 2019 14:11:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [qemu-web PATCH v2] add support page
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
Cc: pbonzini@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 09, 2019 at 02:58:42PM +0100, Alex Benn=C3=A9e wrote:
> This is intended to be a useful page we can link to in the banner of
> the IRC channel explaining the various support options someone might
> have.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> ---
> v2
>   - add cleanups suggested by Stefan
> ---
>  support.md | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 support.md

I would have expected some other file to be modified to link to this
page from elsewhere on the website too.

>=20
> diff --git a/support.md b/support.md
> new file mode 100644
> index 0000000..9174bbb
> --- /dev/null
> +++ b/support.md
> @@ -0,0 +1,40 @@
> +---
> +title: Support
> +permalink: /support/
> +---
> +
> +If you have a support question that is not answered by our
> +[documentation](/documentation) you have a number of options available
> +to you.
> +
> +If the question is specifically about the integration of QEMU with the
> +rest of your Linux distribution you may be better served by asking
> +through your distribution's support channels. This includes questions
> +about a specifically packaged version of QEMU. The QEMU developers are
> +generally concerned with the latest release and the current state of
> +the [master branch](https://git.qemu.org/?p=3Dqemu.git) and do not
> +provide support for QEMU binaries shipped by Linux distributions.
> +
> +Questions about complex configurations of networking and storage are
> +usually met with a recommendation to use management tools like
> +[virt-manager](https://virt-manager.org/) from the [libvirt
> +project](https://libvirt.org/) to configure and run QEMU. Management
> +tools handle the low-level details of setting up devices that most
> +users should not need to learn.
> +
> +* There is a
> +[qemu-discuss@nongnu.org](https://lists.nongnu.org/mailman/listinfo/qe=
mu-discuss)
> +mailing list for user focused questions<br>
> +If your question is more technical or architecture specific you may
> +want to send your question to another of [QEMU's mailing
> +lists](https://wiki.qemu.org/MailingLists)
> +
> +* A lot of developers hang around on IRC (network: irc.oftc.net,
> +channel #qemu)<br> QEMU developers tend to hold normal office hours
> +and are distributed around the world. Please be patient as you may
> +have to wait some time for a response. If you can't leave IRC open and
> +wait you may be better served by a mailing list.
> +
> +* If you think you have found a bug you can report it on [our bug
> +  tracker](https://bugs.launchpad.net/qemu/)<br>
> +Please see our guide on [how to report a bug](/contribute/report-a-bug=
/)

For this content though:

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

