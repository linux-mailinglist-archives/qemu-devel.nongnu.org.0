Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CA4F92ED
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 15:46:18 +0100 (CET)
Received: from localhost ([::1]:35754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUXQv-00029c-IF
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 09:46:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58892)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crobinso@redhat.com>) id 1iUXPI-0001jl-Lu
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 09:44:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crobinso@redhat.com>) id 1iUXPH-0000ef-FM
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 09:44:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56272
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crobinso@redhat.com>) id 1iUXOp-0000Tz-An
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 09:44:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573569846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h7JVVE7L7sD63OM7pAuHUS7dRBa2HN+CBoyJXKABCAY=;
 b=AvCCICM5Il102aYMsoTNtJosWGpEkT3owVewMhqCWyiun88Ze5xPs4he0FGqE5XwrWuN/W
 sg3+B/qwW//9jBICdYx4KDQs/GOACYdEeV/qZ8dNqROkfFtJtMjfoNkUyKVc+YC2IeOC1x
 /0AkytMauHNSIA4eSHnTQnJmXzBQgo0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-hyxO3d-FOOur7ws80l71CA-1; Tue, 12 Nov 2019 09:44:03 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FE8E107ACC7;
 Tue, 12 Nov 2019 14:44:02 +0000 (UTC)
Received: from [10.18.17.238] (dhcp-17-238.bos.redhat.com [10.18.17.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F28A5DDAA;
 Tue, 12 Nov 2019 14:44:01 +0000 (UTC)
Subject: Re: [PATCH] linux-user: remove host stime() syscall
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20191112142556.6335-1-laurent@vivier.eu>
From: Cole Robinson <crobinso@redhat.com>
Message-ID: <cc44061b-542c-d639-bd5b-2b2bfbb74a9f@redhat.com>
Date: Tue, 12 Nov 2019 09:45:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191112142556.6335-1-laurent@vivier.eu>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: hyxO3d-FOOur7ws80l71CA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: "Daniel P . Berrange" <dan@berrange.com>,
 Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/19 9:25 AM, Laurent Vivier wrote:
> stime() has been withdrawn from glibc
> (12cbde1dae6f "Use clock_settime to implement stime; withdraw stime.")
>=20
> Implement the target stime() syscall using host
> clock_settime(CLOCK_REALTIME, ...) as it is done internally in glibc.
>=20
> Tested qemu-ppc/x86_64 with:
>=20
> =09#include <time.h>
> =09#include <stdio.h>
>=20
> =09int main(void)
> =09{
> =09=09time_t t;
> =09=09int ret;
>=20
> =09=09/* date -u -d"2019-11-12T15:11:00" "+%s" */
> =09=09t =3D 1573571460;
> =09=09ret =3D stime(&t);
> =09=09printf("ret %d\n", ret);
> =09=09return 0;
> =09}
>=20
>         # date; ./stime; date
>         Tue Nov 12 14:18:32 UTC 2019
>         ret 0
>         Tue Nov 12 15:11:00 UTC 2019
>=20
> Buglink: https://bugs.launchpad.net/qemu/+bug/1852115
> Reported-by: Cole Robinson <crobinso@redhat.com>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Fixes the build issue for me. Thanks Laurent!

- Cole


