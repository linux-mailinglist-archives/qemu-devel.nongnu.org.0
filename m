Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B231C1174
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 13:24:18 +0200 (CEST)
Received: from localhost ([::1]:48448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUTmD-0005av-FY
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 07:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42354)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jUTlT-0005Bg-0L
 for qemu-devel@nongnu.org; Fri, 01 May 2020 07:23:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jUTlS-0005hR-Ae
 for qemu-devel@nongnu.org; Fri, 01 May 2020 07:23:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35355
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jUTlR-0005fj-Qt
 for qemu-devel@nongnu.org; Fri, 01 May 2020 07:23:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588332208;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lKsWrx7lL7zyCfI83oMOaXaV39pqMjYLW1iMmWF4NfY=;
 b=PhmGKa5Z6B3CV0Gh49Yp3qIAsTfvhteQuC4h8Uv+ZdHnOczDvCa4bKthd9Me8GM0sKJkOD
 Q6/Z+zQKfrZXrb3DEfatFrvlTgDII9BUlyB/Lx0ikPZDljWH9pnAJIe5d5WFFtWB2vs9T/
 BSpT8Q1LrynTFv0xpuG8oIdSN6lTTwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-gVtPVwi1OoGM8MxNGYCIdQ-1; Fri, 01 May 2020 07:23:27 -0400
X-MC-Unique: gVtPVwi1OoGM8MxNGYCIdQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FB668005B7;
 Fri,  1 May 2020 11:23:26 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2F751001920;
 Fri,  1 May 2020 11:23:24 +0000 (UTC)
Date: Fri, 1 May 2020 12:23:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v1 0/4] testing/next updates
Message-ID: <20200501112321.GK2203114@redhat.com>
References: <20200501111505.4225-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200501111505.4225-1-alex.bennee@linaro.org>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/01 07:23:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 01, 2020 at 12:15:01PM +0100, Alex Benn=C3=A9e wrote:
> Hi,
>=20
> The following updates bring us to green across the board again. MacOSX
> has been getting continually flakey on Travis but we still have
> coverage on Cirrus. Please review.

Does anyone ever look at the cirrus jobs ?  They don't notify us
like the travis jobs so, so I feel like they're basically invisible.


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


