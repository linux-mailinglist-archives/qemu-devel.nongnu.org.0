Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FCDF2BD4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 11:07:59 +0100 (CET)
Received: from localhost ([::1]:40362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSehq-0001or-EC
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 05:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33820)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iSegV-0000i1-F3
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 05:06:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iSegM-00076x-R9
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 05:06:27 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24513
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iSegL-0006sP-Gf
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 05:06:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573121183;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c97abqlCnc2veAFi2hyDrl0o1LayM2l9sdaJoyNgXQw=;
 b=XFEtvQwoEaTgFv3dhfBbh7382y6V35n1vqoijv6IHabkG5HtqRvtC3Hzdwvnj2/9Uz+Gyn
 KYc7QHUzOVhYFutAv/4H5jzq2KFvnVIz6I+ZHGsmICoOITMPD+zpeLAM2GSyxwoVRthI0k
 Xe1JxaTsLXhDreUvo57+fMjFYAVt1hs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-DJkKa4eKNfWDWZ2prsEhMA-1; Thu, 07 Nov 2019 05:06:19 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECC3A8017DD;
 Thu,  7 Nov 2019 10:06:18 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8167060BFB;
 Thu,  7 Nov 2019 10:06:08 +0000 (UTC)
Date: Thu, 7 Nov 2019 10:06:06 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: QEMU HTML documentation now on qemu.org
Message-ID: <20191107100606.GA120292@redhat.com>
References: <20191106161928.GA353373@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20191106161928.GA353373@stefanha-x1.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: DJkKa4eKNfWDWZ2prsEhMA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 06, 2019 at 05:19:28PM +0100, Stefan Hajnoczi wrote:
> Hi,
> You can now access the latest QEMU HTML documentation built from
> qemu.git/master nightly at:
>=20
>   https://wiki.qemu.org/docs/qemu-doc.html
>   https://wiki.qemu.org/docs/qemu-qmp-ref.html
>   https://wiki.qemu.org/docs/qemu-ga-ref.html
>   ...as well as interop/ and specs/
>=20
> Feel free to link to the documentation from the QEMU website and/or
> wiki!

What's the reason for putting on wiki.qemu.org URL ? It feels like
having it under www.qemu.org would be a more natural home, especially
if we can then make it pick up the jekyll theme around the pages.=20

Ideally we should publish the docs under versioned URL when we
make a release. eg  /docs/latest/....  for current GIT master
which I presume the above is tracking, and then a /docs/$VERSION/...
for each major release we cut.

That way users can get an accurate view of features in the QEMU
they are actually using.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


