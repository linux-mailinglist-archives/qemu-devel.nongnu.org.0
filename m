Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5A11313E0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 15:41:18 +0100 (CET)
Received: from localhost ([::1]:52604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioTZG-0004EC-1n
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 09:41:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41979)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1ioTYT-0003j0-5p
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:40:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1ioTYR-0006og-Ue
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:40:29 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37871
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1ioTYR-0006o7-Qc
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:40:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578321627;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YU/p65HQK9Om0Nsn7EIR3p1p0KEu9cyAU43sqp3eSTM=;
 b=aVR/Vcji4aI/0GkfvnwNhR2Mfp7Bs/fmmJBtw24Q+JFTI+WGJga+7487jPM3KU2vHAnIFQ
 EgDUW9Mf1sKLelYmGQqWwDZ6NAcp77dbj5Ov3tsW0w7hB5AZhQe8701C6a9jcHMfDbENA2
 qh8XLaobQ7JSo9trco1gu+M05SwJhno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-8uMf0UCgNqmnZdlP3nhDVg-1; Mon, 06 Jan 2020 09:40:26 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12F12800D55
 for <qemu-devel@nongnu.org>; Mon,  6 Jan 2020 14:40:25 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF3FC7BE7E;
 Mon,  6 Jan 2020 14:40:21 +0000 (UTC)
Date: Mon, 6 Jan 2020 14:40:21 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 049/104] virtiofsd: move to a new pid namespace
Message-ID: <20200106144021.GO2930416@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-50-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191212163904.159893-50-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 8uMf0UCgNqmnZdlP3nhDVg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 12, 2019 at 04:38:09PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> virtiofsd needs access to /proc/self/fd.  Let's move to a new pid
> namespace so that a compromised process cannot see another other
> processes running on the system.
>=20
> One wrinkle in this approach: unshare(CLONE_NEWPID) affects *child*
> processes and not the current process.  Therefore we need to fork the
> pid 1 process that will actually run virtiofsd and leave a parent in
> waitpid(2).  This is not the same thing as daemonization and parent
> processes should not notice a difference.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 134 ++++++++++++++++++++-----------
>  1 file changed, 86 insertions(+), 48 deletions(-)

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


