Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3655815AAFC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 15:29:53 +0100 (CET)
Received: from localhost ([::1]:38840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1t1U-0005XB-9p
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 09:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46676)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1j1t0N-0004cO-3M
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 09:28:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1j1t0L-0004ZI-Sp
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 09:28:43 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36180
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1j1t0L-0004Xe-Oj
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 09:28:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581517721;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nCw19yzJ0/bVQuEZZXmGluvbsKg7sdbBFe9iMhpuHs8=;
 b=QRwXXhuqQGUza0FQfoywvQ+eUBE4YAwokGTI2HFBGNUE9LPue0tk5gUSIDyuReXcPEU3xp
 yOOaQvZU1n8/nsru1j+YMAaDzUM1Uqml+JTe7l8QdgCFHYQNDmZUCSmsiApRjiWqzK9SlI
 GP9kWiR+KTLe7liFnBvH3qJfT/DRkiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-9j7rjSAuMF2eKBbglAoRrw-1; Wed, 12 Feb 2020 09:28:39 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72F5B10054E3;
 Wed, 12 Feb 2020 14:28:38 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0522810027A9;
 Wed, 12 Feb 2020 14:28:34 +0000 (UTC)
Date: Wed, 12 Feb 2020 14:28:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] docs: Fix virtiofsd.1 location
Message-ID: <20200212142832.GC434563@redhat.com>
References: <1908428819.7192207.1581512184275.JavaMail.zimbra@redhat.com>
 <1608747495.7195569.1581513386780.JavaMail.zimbra@redhat.com>
 <CAFEAcA-F-F1C4si7OXNkMnzE+9DHXtNnvCYv1eTx-nEpb4_OZw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-F-F1C4si7OXNkMnzE+9DHXtNnvCYv1eTx-nEpb4_OZw@mail.gmail.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 9j7rjSAuMF2eKBbglAoRrw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Miroslav Rezanina <mrezanin@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 12, 2020 at 02:18:19PM +0000, Peter Maydell wrote:
> On Wed, 12 Feb 2020 at 13:16, Miroslav Rezanina <mrezanin@redhat.com> wro=
te:
> >
> > Patch 6a7e2bbee5 docs: add virtiofsd(1) man page introduced new man
> > page virtiofsd.1. Unfortunately, wrong file location is used as
> > source for install command. This cause installation of docs fail.
> >
> > Fixing wrong location so installation is successful.
> >
> > Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
>=20
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>=20
> I noticed this in review of v1 of the patch
> https://patchew.org/QEMU/20200127162514.56784-1-stefanha@redhat.com/
> but missed that it hadn't been fixed in v2/v3.

How come the mistake didn't break any of our CI ?  Looks like it
should have failed due to non-existing source file


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


