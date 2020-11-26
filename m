Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245EE2C5142
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 10:32:27 +0100 (CET)
Received: from localhost ([::1]:56530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiDdZ-0003u3-MZ
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 04:32:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kiDbI-0003DG-0U
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 04:30:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kiDbE-0004fp-E4
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 04:30:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606382998;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=vsZrgDurGLx4o4upeUXMIu25fprgdHpfIXdEAQawxk8=;
 b=bMmvpx20vBLoEEJ/+c/dvVNtufKkn94hbUs7awDBLXLpxTAgOHeyLFT4eug8o4+7kMuGv0
 l0WN479PPVNSj+kDMtIIJCyRWio07C+vrRzVgFDunk7nHTqObBHX2vpPMfX3krfEHWSxgu
 Kc7gMyGLVlJDAPUJ4ndJhJdKTTzzT70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-mTrAbjcGP7Kp54Mt4UaSKw-1; Thu, 26 Nov 2020 04:29:55 -0500
X-MC-Unique: mTrAbjcGP7Kp54Mt4UaSKw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10F03101AFAA;
 Thu, 26 Nov 2020 09:29:54 +0000 (UTC)
Received: from redhat.com (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07BCE19C78;
 Thu, 26 Nov 2020 09:29:48 +0000 (UTC)
Date: Thu, 26 Nov 2020 09:29:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH for-5.2] nsis: Fix build for 64 bit installer
Message-ID: <20201126092946.GA1122957@redhat.com>
References: <20201125191833.964753-1-sw@weilnetz.de>
 <CAFEAcA-oo6M8W=uX=-FSyAkioQtPLQ5fe2V1CUaj1KkiK9efig@mail.gmail.com>
 <024f86eb-c91f-6a3c-565f-4a42e3bb4eec@weilnetz.de>
MIME-Version: 1.0
In-Reply-To: <024f86eb-c91f-6a3c-565f-4a42e3bb4eec@weilnetz.de>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
 QEMU Developers <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 25, 2020 at 09:59:48PM +0100, Stefan Weil wrote:
> Am 25.11.20 um 20:28 schrieb Peter Maydell:
> 
> > On Wed, 25 Nov 2020 at 19:23, Stefan Weil <sw@weilnetz.de> wrote:
> > > Pass cpu instead of cpu_family to the NSIS installer script.
> > > 
> > > That script checks for "x86_64" which is the cpu value,
> > > while cpu_family is "x86".
> > > 
> > > Signed-off-by: Stefan Weil <sw@weilnetz.de>
> > > ---
> > >   meson.build | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > Very unfortunate that this has only surfaced after rc3,
> > which should in theory be the cutoff point for 5.2 changes.
> > Is it possible to get something into the CI/make check
> > so that we find Windows installer issues sooner?
> > 
> > thanks
> > -- PMM
> 
> 
> I am afraid there are more open issues for QEMU on Windows. They can be
> fixed in 5.2.1, so don't hesitate to finish 5.2.0.
> 
> The Meson based build sets bindir=/qemu/. which does not work correctly in
> get_relocated_path().
> 
> Finding such issues would require a CI environment which not only builds
> QEMU for Windows, but also runs the results. Some basic tests could be done
> on Linux using Wine, more advanced tests would require a real Windows host.

Even if we can't automate testing of the installer on a Windows machine,
we should definitely introduce a gitlab job that actually builds the
installer. This will ensure that we always have a valid installer exe
available, built from a well-defined set of distro packages that we
can easily download and test manually.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


