Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EA2EFD06
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Nov 2019 13:15:51 +0100 (CET)
Received: from localhost ([::1]:43378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iRxkT-0002DK-UN
	for lists+qemu-devel@lfdr.de; Tue, 05 Nov 2019 07:15:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54371)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iRxiz-0001R6-DE
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 07:14:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iRxix-0005Ly-IS
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 07:14:16 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20051
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iRxix-0005LO-EY
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 07:14:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572956054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Rf2aLSW9Eb5cHks++WUHXq4M4VenR8g8GUYMn8HXwQ=;
 b=OoNpVG7LnMcHQ0OrdC1ukekFhEudi4T/wvOJMQiV1ZIQi2dXTespNIme9V9Z/w6osr0Wmc
 ra5ocIElAQ8Ok90L7lM7k9t18mmPbQQ6Kd7Iw78ISf7hRACmBFjzW8HwKZmszBfUufw2av
 M5ixgtkrHpQ1IbmXttP+hH4jA0LyAU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-UQU3nn_QNJmODATmOa4tyw-1; Tue, 05 Nov 2019 07:14:09 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FE2A107ACC2;
 Tue,  5 Nov 2019 12:14:07 +0000 (UTC)
Received: from work-vm (ovpn-117-86.ams2.redhat.com [10.36.117.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF8F05C28D;
 Tue,  5 Nov 2019 12:14:01 +0000 (UTC)
Date: Tue, 5 Nov 2019 12:13:59 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] global: Squash 'the the'
Message-ID: <20191105121359.GA2781@work-vm>
References: <20191104185202.102504-1-dgilbert@redhat.com>
 <157290359988.27285.16497763825853147226@37313f22b938>
 <87ftj2kabe.fsf@linaro.org>
 <b0d5498a-1ee3-3bea-43f3-4d4d8397711a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b0d5498a-1ee3-3bea-43f3-4d4d8397711a@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: UQU3nn_QNJmODATmOa4tyw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: peter.maydell@linaro.org, sstabellini@kernel.org, qemu-trivial@nongnu.org,
 mjt@tls.msk.ru, qemu-devel@nongnu.org, laurent@vivier.eu,
 marcandre.lureau@redhat.com,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Laurent Vivier (lvivier@redhat.com) wrote:
> On 05/11/2019 09:16, Alex Benn=E9e wrote:
> >=20
> > no-reply@patchew.org writes:
> >=20
> >> Patchew URL: https://patchew.org/QEMU/20191104185202.102504-1-dgilbert=
@redhat.com/
> >>
> >>
> >>
> >> Hi,
> >>
> >> This series failed the docker-quick@centos7 build test. Please find th=
e testing commands and
> >> their output below. If you have Docker installed, you can probably rep=
roduce it
> >> locally.
> >>
> >> =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D
> >> #!/bin/bash
> >> make docker-image-centos7 V=3D1 NETWORK=3D1
> >> time make docker-test-quick@centos7 SHOW_ENV=3D1 J=3D14 NETWORK=3D1
> >> =3D=3D=3D TEST SCRIPT END =3D=3D=3D
> >>
> >>   TEST    iotest-qcow2: 009
> >>   TEST    iotest-qcow2: 010
> >> **
> >> ERROR:/tmp/qemu-test/src/tests/migration-test.c:903:wait_for_migration=
_fail: assertion failed: (!strcmp(status, "setup") || !strcmp(status, "fail=
ed") || (allow_active && !strcmp(status, "active")))
> >> ERROR - Bail out! ERROR:/tmp/qemu-test/src/tests/migration-test.c:903:=
wait_for_migration_fail: assertion failed: (!strcmp(status, "setup") || !st=
rcmp(status, "failed") || (allow_active && !strcmp(status, "active")))
> >> make: *** [check-qtest-aarch64] Error 1
> >> make: *** Waiting for unfinished jobs....
> >=20
> > That's one I've been seeing intermittently on Travis since the
> > softfreeze started. It was masked by the other regressions which are no=
w
> > fixed.
>=20
> Could it be related with my patch?
>=20
> 1bd71dce4bf2 runstate: ignore exit request in finish migrate state

Possible but unlikely I think; lets see if I can reproduce it and get a
backtrace;  (It would be very nice if I could get that assertion to tell
me what 'status' is; we know it's not setup or failed, and it may or may
not be active; but what it is ....well that's anyones guess.

Dave

> Thanks,
> Laurent
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


