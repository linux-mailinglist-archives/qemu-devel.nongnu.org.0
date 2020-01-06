Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343E6131384
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 15:21:29 +0100 (CET)
Received: from localhost ([::1]:52356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioTG4-0002EA-6L
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 09:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34155)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1ioTEq-0001SS-Jt
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:20:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1ioTEm-0003pW-18
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:20:12 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:30110
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1ioTEl-0003pB-Sx
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578320407;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CqSqEckoI3VOkPxXctQd3vS2VD1/OEaP9LRcI4sDHUU=;
 b=bn3nQnh8ZFvOtM2dBsi0k0ARvBO04OkDA1PmnELOZe4Y7yBNLytk47HK6okSfQ9yq3agvn
 I7HE2zLxGXaU4civBKYTVsNVrFh+7O1aAmNXLBDn+E8JASEtpzg7qarn8O+ZlFmMVVSJoa
 3f+NPgYawU8xjuXwHTqwYI/kK3HKa+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-e-X0QsfsPhOvndGSfKr_yQ-1; Mon, 06 Jan 2020 09:20:04 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E06CD8F0406
 for <qemu-devel@nongnu.org>; Mon,  6 Jan 2020 14:20:03 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BCC85E1AD;
 Mon,  6 Jan 2020 14:19:57 +0000 (UTC)
Date: Mon, 6 Jan 2020 14:19:58 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 029/104] virtiofsd: add vhost-user.json file
Message-ID: <20200106141958.GH2930416@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-30-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191212163904.159893-30-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: e-X0QsfsPhOvndGSfKr_yQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 12, 2019 at 04:37:49PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> Install a vhost-user.json file describing virtiofsd.  This allows
> libvirt and other management tools to enumerate vhost-user backend
> programs.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  .gitignore                                | 1 +
>  Makefile                                  | 1 +
>  tools/virtiofsd/50-qemu-virtiofsd.json.in | 5 +++++
>  3 files changed, 7 insertions(+)
>  create mode 100644 tools/virtiofsd/50-qemu-virtiofsd.json.in

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
=20

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


