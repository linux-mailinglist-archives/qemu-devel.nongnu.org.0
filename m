Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF29139304
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 15:03:35 +0100 (CET)
Received: from localhost ([::1]:50864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir0JZ-00043A-K6
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 09:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58391)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ir0HU-0001SE-Vi
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 09:01:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ir0HS-0005RF-6P
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 09:01:23 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40710
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ir0HS-0005Ot-2O
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 09:01:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578924079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+OlXmCyHM8qaID/xyM3EIxvNpUljj1CQmqzm5Fc4Zpc=;
 b=J/RaWLOwpRWfNGdUl6dqtoXXa4OnYu+LG+UdVWuSGbg3cokDOI2MK8s5Mc0RG0slQEFcnM
 +yUCGO2eSoGs/j0HMmL0vD9B/5t0Db6JGPTVhqBTrioKrRa+HaypMtTgw1Rj0SZo0C2dSv
 BlF/10jYABhoHoxRO2HX9X+u1i6+02Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-gFKJ2tMkPSCcxT1tURwHsA-1; Mon, 13 Jan 2020 09:01:15 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EB028024DA
 for <qemu-devel@nongnu.org>; Mon, 13 Jan 2020 14:01:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-131.ams2.redhat.com
 [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9531E100164D;
 Mon, 13 Jan 2020 14:01:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 18E9E1138600; Mon, 13 Jan 2020 15:01:10 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH] qapi: Incorrect attempt to fix building with
 MC146818RTC=n
References: <20191231184916.10235-1-philmd@redhat.com>
Date: Mon, 13 Jan 2020 15:01:10 +0100
In-Reply-To: <20191231184916.10235-1-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 31 Dec 2019 19:49:16
 +0100")
Message-ID: <875zhfzc9l.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: gFKJ2tMkPSCcxT1tURwHsA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> When configured with --without-default-devices and setting
> MC146818RTC=3Dn, the build fails:
>
>     LINK    x86_64-softmmu/qemu-system-x86_64
>   /usr/bin/ld: qapi/qapi-commands-misc-target.o: in function `qmp_marshal=
_rtc_reset_reinjection':
>   qapi/qapi-commands-misc-target.c:46: undefined reference to `qmp_rtc_re=
set_reinjection'
>   /usr/bin/ld: qapi/qapi-commands-misc-target.c:46: undefined reference t=
o `qmp_rtc_reset_reinjection'
>   collect2: error: ld returned 1 exit status
>   make[1]: *** [Makefile:206: qemu-system-x86_64] Error 1
>   make: *** [Makefile:483: x86_64-softmmu/all] Error 2
>
> This patch tries to fix this, but this is incorrect because QAPI
> scripts only provide TARGET definitions, so with MC146818RTC=3Dy we
> get:
>
>   hw/rtc/mc146818rtc.c:113:6: error: no previous prototype for =E2=80=98q=
mp_rtc_reset_reinjection=E2=80=99 [-Werror=3Dmissing-prototypes]
>     113 | void qmp_rtc_reset_reinjection(Error **errp)
>         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
>   make[1]: *** [rules.mak:69: hw/rtc/mc146818rtc.o] Error 1
>
> Any idea? :)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  qapi/misc-target.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index a00fd821eb..8e49c113d1 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -41,7 +41,7 @@
>  #
>  ##
>  { 'command': 'rtc-reset-reinjection',
> -  'if': 'defined(TARGET_I386)' }
> +  'if': 'defined(TARGET_I386) && defined(CONFIG_MC146818RTC)' }
> =20
> =20
>  ##

The generated qapi-commands-misc-target.h duly has

    #if defined(TARGET_I386) && defined(CONFIG_MC146818RTC)
    void qmp_rtc_reset_reinjection(Error **errp);
    void qmp_marshal_rtc_reset_reinjection(QDict *args, QObject **ret, Erro=
r **errp);
    #endif /* defined(TARGET_I386) && defined(CONFIG_MC146818RTC) */

mc146818rtc.c includes it.  But since it doesn't include
config-devices.h, CONFIG_MC146818RTC remains undefined, and the
prototype gets suppressed.

Crude fix: make mc146818rtc.c #include "config-devices.h".


