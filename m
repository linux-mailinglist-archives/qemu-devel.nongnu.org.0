Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 422744DB3D0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 16:00:20 +0100 (CET)
Received: from localhost ([::1]:43918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUV8M-0001Ti-TO
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 11:00:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nUV5o-00081a-EB
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:57:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nUV5m-0003yA-Mz
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:57:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647442657;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GR7Oa955lwQOB7qi3rdguWHY/Eijm0/peW0XEYjrl7Q=;
 b=cgSrkiwE9LAS43COHWpbbxQKUidJErxQ8mHS35g4CRenWfK5s99UJKRajzPzWjXaIlgQvP
 dRH2vYejMFo3TOeRrJCuxNREdWyn9vTB+HOEH2mk83eowMHalFfmxBP+qQzdXz7KQHsq2A
 BVXJGlaoThHFKjeE5uD8RuZOiAgBeMg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-of9E1BR4N3mPFWPT19XYfw-1; Wed, 16 Mar 2022 10:57:35 -0400
X-MC-Unique: of9E1BR4N3mPFWPT19XYfw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 867248039D6;
 Wed, 16 Mar 2022 14:57:34 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 420EC40D1B9A;
 Wed, 16 Mar 2022 14:57:32 +0000 (UTC)
Date: Wed, 16 Mar 2022 14:57:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 05/12] compiler.h: drop __printf__ macro MinGW/glib
 workaround
Message-ID: <YjH62Isl70BAai9w@redhat.com>
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
 <20220224183701.608720-6-marcandre.lureau@redhat.com>
 <CAFEAcA9FDt0Y6W4zBLG3ciGe8M7TERimzD_4gX-y7pAv2G+=ag@mail.gmail.com>
 <CAJ+F1CJiQRn+5VXtfZgmVAKuA2wUdCXv=5hToiwfRQPX4qXUKg@mail.gmail.com>
 <CAFEAcA-NN=L2iL=17jgg03iixisdVxL=HOZv1JbUsQh0VsgGHg@mail.gmail.com>
 <YjHpxc6WxB3GrzZi@redhat.com>
 <CAFEAcA8qeebt1OWenyUc1dfFjT8Q3ut8ZUxgp4uu71qH48vOUA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8qeebt1OWenyUc1dfFjT8Q3ut8ZUxgp4uu71qH48vOUA@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16, 2022 at 02:41:41PM +0000, Peter Maydell wrote:
> On Wed, 16 Mar 2022 at 13:44, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Thu, Feb 24, 2022 at 08:14:47PM +0000, Peter Maydell wrote:
> > > On Thu, 24 Feb 2022 at 19:50, Marc-André Lureau
> > > <marcandre.lureau@gmail.com> wrote:
> > > > On Thu, Feb 24, 2022 at 11:23 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > > >> You're probably building with a newer glib, and possibly also
> > > >> a newer mingw.
> > > >>
> > > >> I've cc'd Stefan Weil who might know whether we can drop this
> > > >> workaround as far as the mingw part is concerned.
> > > >
> > > >
> > > > Probably safer to keep it until we bump glib dependency to >=2.58.
> > > >
> > > > I would move it to glib-compat.h though, and leave a note there, as it is (or should be ) an old glib specific workaround.
> > >
> > > We can only move it to glib-compat if we confirm that only the
> > > glib-related part of the workaround is still relevant and the
> > > mingw side is now no longer needed, though.
> >
> > We know glib uses the GNU printf semantics for all its APIs.
> >
> > We know QEMU code will use the GNU printf annotation for all its
> > APIs where it knows it has GNU printf, due to delegating to
> > GLib.
> >
> > For 3rd party libraries, we can have no confidence about whether
> > they expect GNU or native printf format, unless we're doing
> > something to override the printf family of functions at link
> > time. IIRC, we're not doing that, so we can't assume 3rd party
> > stuff expects GNU format, and so the sooner we get rid of
> > the #define __printf__ __gnu_printf__ the better IMHO. The
> > proof of course would be to see a CI test run with the define
> > removed proving that no code we call relies on it.
> 
> Yes, the workaround is definitely correct for QEMU's own
> code and for glib itself. We don't care about 3rd party
> libraries because we don't use any of those which take
> format-string arguments AFAIK. The 'mingw' part AIUI is
> purely for mingw itself, ie the standard library. What
> I'm asking is "what were the versions of mingw that were
> affected by this, and are they all old enough we don't need
> to care from that point of view?".

I've no idea about affected versions, but if they're more than
2 years old I'd say we don't need to care. The various places
you get mingw prebuilt all tend to stay close to the cutting
edge.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


