Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2EF10D781
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Nov 2019 15:53:55 +0100 (CET)
Received: from localhost ([::1]:59918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iahec-0005hK-CE
	for lists+qemu-devel@lfdr.de; Fri, 29 Nov 2019 09:53:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54148)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iahXM-0001Fm-Cg
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 09:46:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iahXC-0008F1-QU
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 09:46:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47641
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iahXC-00081G-Bm
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 09:46:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575038771;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Di7uQA2HHyg73uxLQJ8zPwLIciX+YCP4JngFAPEOks=;
 b=C+ZHFF29M4UQj5rHRGaQCmQ6Vf58VMtw+u+C3v+YhnUVri2sCYzZh4mYkz+/nZC4xCApas
 nUDa3pJ7sCBNh8IHDyLdG3IMSYc4i9/G1zzHgpzMcinJyGuZ5bhta4PcIcbSIOsn1IcEmY
 QxE9WhuWbq+5Z1dBc3yU9z8ym7aRonU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-eGsKxySJMQepwR6SVusXeQ-1; Fri, 29 Nov 2019 09:46:07 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C6E5800D41
 for <qemu-devel@nongnu.org>; Fri, 29 Nov 2019 14:46:07 +0000 (UTC)
Received: from redhat.com (ovpn-112-31.ams2.redhat.com [10.36.112.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47F6F5D6D2;
 Fri, 29 Nov 2019 14:46:05 +0000 (UTC)
Date: Fri, 29 Nov 2019 14:46:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH] ci: Use libcap-ng
Message-ID: <20191129144602.GJ2260471@redhat.com>
References: <20191129142126.32967-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191129142126.32967-1-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: eGsKxySJMQepwR6SVusXeQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: pbonzini@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 29, 2019 at 02:21:26PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> We currently enable libcap-dev in build-clang to pick up the 9p proxy
> helper.  Paolo's patch changes that to use libcap-ng, so switch to using
> it.  This also means we'll be testing the scsi pr manager and the bridge
> helper.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  .gitlab-ci.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index be57c6a454..62a9609798 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -59,7 +59,7 @@ build-user:
> =20
>  build-clang:
>   script:
> - - apt-get install -y -qq clang libsdl2-dev libattr1-dev libcap-dev
> + - apt-get install -y -qq clang libsdl2-dev libattr1-dev libcap-ng-dev
>        xfslibs-dev libiscsi-dev libnfs-dev libseccomp-dev gnutls-dev libr=
bd-dev
>   - ./configure --cc=3Dclang --cxx=3Dclang++ --enable-werror
>        --target-list=3D"alpha-softmmu arm-softmmu m68k-softmmu mips64-sof=
tmmu

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


