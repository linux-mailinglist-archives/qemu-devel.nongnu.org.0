Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B74173EA1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 18:35:54 +0100 (CET)
Received: from localhost ([::1]:51626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7jYH-0002Pp-RK
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 12:35:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37876)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j7jV2-0005Mk-9h
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 12:32:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j7jV0-0000En-Ur
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 12:32:32 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:58568
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j7jV0-0000E6-R8
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 12:32:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582911149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Squ6pGWB11hdGkXQO1sJedXghdv/p4Sv54dlWAx6OqA=;
 b=R9LRZotArotmPwl2On5jMe131k4WCIBHYWsXapaQmC8QNtu3PIqSuTWivfMH5vS6Vd9hcr
 nKIYYuf9F2usdPfmLgq8okyW4KRXH1cnqoNI3BZc7qN1awrrHQdhBm1nktrf12nkCAKlXG
 8+7Huxp5JFtsvzBfz6Ja89Q7c2t0JcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-g9_sL8ZbO4ypWmoZdf4aPA-1; Fri, 28 Feb 2020 12:32:28 -0500
X-MC-Unique: g9_sL8ZbO4ypWmoZdf4aPA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E15B2100550E;
 Fri, 28 Feb 2020 17:32:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFB1A5C21A;
 Fri, 28 Feb 2020 17:32:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3D19211386A6; Fri, 28 Feb 2020 18:32:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] block: Remove trailing newline in format used by
 error_report API
References: <20200228123637.15160-1-philmd@redhat.com>
Date: Fri, 28 Feb 2020 18:32:24 +0100
In-Reply-To: <20200228123637.15160-1-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 28 Feb 2020 13:36:37
 +0100")
Message-ID: <8736auipnb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> The error_report API doesn't want trailing newline characters.
> Remove it, to avoid and error when moving the code around:
>
>   ERROR: Error messages should not contain newlines

Commit 312fd5f2909 has a Coccinelle script.  It should be committed and
re-run.

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  block.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/block.c b/block.c
> index 1bdb9c679d..e466d15914 100644
> --- a/block.c
> +++ b/block.c
> @@ -5994,7 +5994,7 @@ void bdrv_img_create(const char *filename, const ch=
ar *fmt,
           bs =3D bdrv_open(full_backing, NULL, backing_options, back_flags=
,
                          &local_err);
           g_free(full_backing);
           if (!bs && size !=3D -1) {
>              /* Couldn't open BS, but we have a size, so it's nonfatal */
>              warn_reportf_err(local_err,
>                              "Could not verify backing image. "
> -                            "This may become an error in future versions=
.\n");
> +                            "This may become an error in future versions=
.");
>              local_err =3D NULL;
>          } else if (!bs) {
>              /* Couldn't open bs, do not have size */

warn_reportf_err() is a convenience function to error_prepend(),
warn_report() and free @local_err.

When @local_err holds a message like "pants on fire", the code before
the patch prints something like

    qemu-system-x86_64: warning: Could not verify backing image. This may b=
ecome an error in future versions.
    pants on fire

The patch "improves" it to

    qemu-system-x86_64: warning: Could not verify backing image. This may b=
ecome an error in future versions.pants on fire

General advice: this misuse of warn_reportf_err() is an excusable
mistake, but when you *test* the error path, you can't *not* see that
the actual message is crap.  Test your errors!

Actual improvement:

               warn_reportf_err(local_err, "Could not verify backing image:=
 ");
               error_printf("This may become an error in future versions.\n=
");

This should print

    qemu-system-x86_64: warning: Could not verify backing image: pants on f=
ire
    This may become an error in future versions.


