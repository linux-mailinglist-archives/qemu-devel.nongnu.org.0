Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1443016FB55
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 10:52:10 +0100 (CET)
Received: from localhost ([::1]:41408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6tMP-00077H-5Y
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 04:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59969)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j6tLa-0006ZC-CU
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 04:51:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j6tLW-00031J-Q5
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 04:51:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43144
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j6tLW-00030c-MX
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 04:51:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582710671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iE6mLSQBGZOcVUs0eycAMzi27bNQgTlJa0yUROcuXvM=;
 b=HDWSb4n3cwZiFrme3wEtD+cOzFGOzdNWFRS8F0k2DpNmWxzuIZzcn1/r7/oPf7uD2jAI6p
 fNi64eiVFWI9sho2MVv5RLZ1UxzhEv+eZXKDyEabJyMR2uMgX7Avd+4i6TdupIVTzZpUJ/
 k/SdxmMqfKAmx0Wmnwl7kjuYYv1gIU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-na-B67iCPtGXhQd8SDbFqA-1; Wed, 26 Feb 2020 04:51:08 -0500
X-MC-Unique: na-B67iCPtGXhQd8SDbFqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E17A08017CC;
 Wed, 26 Feb 2020 09:51:05 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-170.ams2.redhat.com [10.36.117.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22273385;
 Wed, 26 Feb 2020 09:51:03 +0000 (UTC)
Date: Wed, 26 Feb 2020 10:51:02 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: kuhn.chenqun@huawei.com
Subject: Re: [PATCH v2 01/13] block/stream: Remove redundant statement in
 stream_run()
Message-ID: <20200226095102.GA6096@linux.fritz.box>
References: <20200226084647.20636-1-kuhn.chenqun@huawei.com>
 <20200226084647.20636-2-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200226084647.20636-2-kuhn.chenqun@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Euler Robot <euler.robot@huawei.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.02.2020 um 09:46 hat kuhn.chenqun@huawei.com geschrieben:
> From: Chen Qun <kuhn.chenqun@huawei.com>
>=20
> Clang static code analyzer show warning:
>   block/stream.c:186:9: warning: Value stored to 'ret' is never read
>         ret =3D 0;
>         ^     ~
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> Reviewed-by: John Snow <jsnow@redhat.com>

Let's mention that this is unnecessary since commit 1d809098aa9.

Since the same commit, the initialisation 'int ret =3D 0;' is unnecessary
because we never read ret before overwriting the initial value. We could
clean this up in the same patch.

With or without the changes:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


