Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E575AED89
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:47:37 +0200 (CEST)
Received: from localhost ([::1]:57746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZrU-0005sY-A5
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVYMA-00066f-7R
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 09:11:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVYM2-0005Z6-Of
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 09:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662469862;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0Wy+okMJ878727zCjGwE/todZjMXlepLFItCijOmKUs=;
 b=fBXMEcWaS0S5r7annY9+/QQcmbo9tdv15v4CJ1/hX7uQkd9bv8oIyTU1BeAXvO3DXR0KGR
 1veZLLMb1WEsBMffv10QwnxuA3r+7zzbHNvxopLwZpU2kFH6zAtggKugWyzWNVGjZbLGN/
 2MR5rNODJlL0A1tixUVK+s/1ISVFumQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-Le1RyhcvNA2325TWqmngbQ-1; Tue, 06 Sep 2022 09:11:01 -0400
X-MC-Unique: Le1RyhcvNA2325TWqmngbQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1FB4299E753;
 Tue,  6 Sep 2022 13:11:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48B822166B26;
 Tue,  6 Sep 2022 13:10:59 +0000 (UTC)
Date: Tue, 6 Sep 2022 14:10:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Michael Tsirkin <mst@redhat.com>
Subject: Re: [PATCH v2 10/11] pytest: add pytest to the meson build system
Message-ID: <YxdG4LISpDFvBr0k@redhat.com>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-11-ani@anisinha.ca>
 <CAFn=p-b_uVDib7qFcy=6fsMCGrcY8hQ89ZsQAfQMuHO26WM1dg@mail.gmail.com>
 <alpine.DEB.2.22.394.2207121220420.1824593@anisinha-lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2207121220420.1824593@anisinha-lenovo>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 12, 2022 at 12:22:10PM +0530, Ani Sinha wrote:
> 
> 
> On Mon, 11 Jul 2022, John Snow wrote:
> 
> > On Sun, Jul 10, 2022 at 1:01 PM Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > Integrate the pytest framework with the meson build system. This will make meson
> > > run all the pytests under the pytest directory.
> > >
> > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > ---
> > >  tests/Makefile.include   |  4 +++-
> > >  tests/meson.build        |  1 +
> > >  tests/pytest/meson.build | 49 ++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 53 insertions(+), 1 deletion(-)
> > >  create mode 100644 tests/pytest/meson.build
> > >
> > > diff --git a/tests/Makefile.include b/tests/Makefile.include
> > > index 3accb83b13..40755a6bd1 100644
> > > --- a/tests/Makefile.include
> > > +++ b/tests/Makefile.include
> > > @@ -3,12 +3,14 @@
> > >  .PHONY: check-help
> > >  check-help:
> > >         @echo "Regression testing targets:"
> > > -       @echo " $(MAKE) check                  Run block, qapi-schema, unit, softfloat, qtest and decodetree tests"
> > > +       @echo " $(MAKE) check                  Run block, qapi-schema, unit, softfloat, qtest, pytest and decodetree tests"
> >
> > Does this mean that "make check" *requires* an internet connection?
> 
> No. My test will be skipped if it is unable to download the artifacts it
> requires due to lack of Internet connectivity.

That's not the only concern, there are also people who have metered
internet connections, or whose connections are slow and thus have
long download times. Any test that downloads should be opt-in only.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


