Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C56132658
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 13:37:23 +0100 (CET)
Received: from localhost ([::1]:47890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioo6r-0008F8-V0
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 07:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54975)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1ionrl-0006SM-Bb
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:21:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1ionrk-00073P-1T
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:21:45 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34680
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1ionrj-00073H-Ty
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:21:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578399703;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=19zxblTkMnQbJp/oXFHldMSmwyEM5Z9jGiPeNEeQams=;
 b=DHr3G/3/49jAJZ/dWixuGGEw1Sv1Is4jRwsiVxj/ictuWuEo+CL5p1DD00ZVojJHfMDyph
 PA6vLLTciUya643xCqXwl6b5ora/LlaJaxEWCqTj2L7o6mN4Ztpxmj/r9Vqa0H2GV89Xpz
 1zvEmvIJ7byAb2W+rN+mPqYSUjmhRUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-_Gz9hDrOO6qimj2OltMulA-1; Tue, 07 Jan 2020 07:21:41 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94D16800D4C
 for <qemu-devel@nongnu.org>; Tue,  7 Jan 2020 12:21:40 +0000 (UTC)
Received: from redhat.com (ovpn-112-61.ams2.redhat.com [10.36.112.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C695272A9;
 Tue,  7 Jan 2020 12:21:36 +0000 (UTC)
Date: Tue, 7 Jan 2020 12:21:33 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 098/104] virtiofsd: add definition of fuse_buf_writev()
Message-ID: <20200107122133.GH3368802@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-99-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191212163904.159893-99-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: _Gz9hDrOO6qimj2OltMulA-1
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

On Thu, Dec 12, 2019 at 04:38:58PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: piaojun <piaojun@huawei.com>
>=20
> Define fuse_buf_writev() which use pwritev and writev to improve io
> bandwidth. Especially, the src bufs with 0 size should be skipped as
> their mems are not *block_size* aligned which will cause writev failed
> in direct io mode.
>=20
> Signed-off-by: Jun Piao <piaojun@huawei.com>
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tools/virtiofsd/buffer.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)

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


