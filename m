Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 600421313CF
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 15:37:39 +0100 (CET)
Received: from localhost ([::1]:52576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioTVi-00028w-6f
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 09:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40450)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1ioTUu-0001jD-Aq
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:36:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1ioTUs-0004cu-Pz
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:36:47 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31050
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1ioTUs-0004cS-MZ
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:36:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578321405;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6cH0E1Fwlc3EzTWYB2tktluLvFIuxPXCvaikfSxI7qQ=;
 b=diw087O7jsQjnLH9nV01PYbeOIAC9A04+Junb48FJGSg852W+88ziGA6vyqur3n1YHYmXe
 hYtCmD+KQQWLlnRIMl47zlrkTT2Fe1LdafCjwCAirdNIsF3NKMBBpZh2ph1KF+ppyrPMXq
 h3if1VqwmHc9jzzoeO8ZQ6otdsj/QfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-qe69mUdqNnayYyysOFNWIw-1; Mon, 06 Jan 2020 09:36:44 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A9BE800D41
 for <qemu-devel@nongnu.org>; Mon,  6 Jan 2020 14:36:43 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A758100164D;
 Mon,  6 Jan 2020 14:36:40 +0000 (UTC)
Date: Mon, 6 Jan 2020 14:36:40 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 047/104] virtiofsd: sandbox mount namespace
Message-ID: <20200106143640.GM2930416@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-48-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191212163904.159893-48-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: qe69mUdqNnayYyysOFNWIw-1
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

On Thu, Dec 12, 2019 at 04:38:07PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> Use a mount namespace with the shared directory tree mounted at "/" and
> no other mounts.
>=20
> This prevents symlink escape attacks because symlink targets are
> resolved only against the shared directory and cannot go outside it.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Peng Tao <tao.peng@linux.alibaba.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 89 ++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)

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


