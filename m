Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E3951C393
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 17:13:07 +0200 (CEST)
Received: from localhost ([::1]:33672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmdA9-00025k-TZ
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 11:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmd7H-00017W-Pf
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:10:07 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:32390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmd7F-0006KA-1Z
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651763403;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Vvyx7v5I6GhuZZb/77iSUnYUSW1H9fQ9XvbwKADugw=;
 b=amG0q/4+/OaYzWTIL5vKsYKYo+LJQ+b5losi0JL/psyThRM84ieEt3tf9v0UIX/1f5UyE3
 TFPELFCQQe1eSY23HBQ+fX4f4IBc6OjXu06V6H8MlDIIRbGuAT4vQGbXqfJdcaa5K+OvUb
 Wvp+ffpZGbqZ6Bc//nywcIf3YswZlGU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-uLoiTBmcNS2f9Sg2NbwTJQ-1; Thu, 05 May 2022 11:10:00 -0400
X-MC-Unique: uLoiTBmcNS2f9Sg2NbwTJQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13092803524;
 Thu,  5 May 2022 15:10:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7B1155BA9C;
 Thu,  5 May 2022 15:09:58 +0000 (UTC)
Date: Thu, 5 May 2022 16:09:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Yonggang Luo <luoyonggang@gmail.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] docs/about: Update the support statement for Windows
Message-ID: <YnPoxFDyW+J3al8q@redhat.com>
References: <20220505074841.406185-1-thuth@redhat.com>
 <YnOHgZWHZ3fdYXqM@redhat.com> <YnO7TUI4RV+6+WPH@redhat.com>
 <fb070833-d9d4-4842-8470-979cf7aa859d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb070833-d9d4-4842-8470-979cf7aa859d@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.74; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Thu, May 05, 2022 at 04:12:11PM +0200, Thomas Huth wrote:
> On 05/05/2022 13.55, Daniel P. Berrangé wrote:
> > On Thu, May 05, 2022 at 09:14:57AM +0100, Daniel P. Berrangé wrote:
> > > On Thu, May 05, 2022 at 09:48:41AM +0200, Thomas Huth wrote:
> > > > Our support statement for Windows currently talks about "Vista / Server
> > > > 2008" - which is related to the API of Windows, and this is not easy
> > > > to understand for the non-technical users. It might also not be quite
> > > > true anymore, since we only compile-test QEMU with recent toolchains.
> > > 
> > > We documented Vista / Server 2008 because that is what our code is
> > > declaring it wants in terms of Windows public APIs:
> > > 
> > > In osdep.h we have:
> > > 
> > >    #ifdef _WIN32
> > >    /* as defined in sdkddkver.h */
> > >    #ifndef _WIN32_WINNT
> > >    #define _WIN32_WINNT 0x0600 /* Vista */
> > >    #endif
> > > 
> > > which tells Mingw / MSys not to expose windows header file declarations
> > > that post-date Vista.
> > 
> > Of course we rely on 3rd party libraries and in particular GLib2 is
> > mandatory, and it also set _WIN32_WINNT. So our constraint is the
> > newer of the _WIN32_WINNT constraint set by QEMU and whatever version
> > of GLib2 being compiled against.
> > 
> > QEMU sets a min GLib of 2.56, and that version of GLib sets 0x0601
> > which means Windows >= 7.  So even though QEMU only asks for Vista,
> > in practice our minimum is 7.
> 
> Windows 7 does not receive any security updates since 2020 anymore, so I'd
> rather would bump it to the level of Windows 8.1 directly instead. Or
> directly go for Windows 10 to mimic the behavior that we have with most of
> the Linux distros (max. two major releases at a time).

I like the simplicity of having the same rule everywhere.

I'm a little wary of people being stuck on old versions, when I see
current articles like this showing 20% of people still on Win7, way
more than Win8 surprisingly.

https://www.statista.com/statistics/993868/worldwide-windows-operating-system-market-share/


The thing with bumping the _WIN32_WINNT version higher though is that
we're not really doing it for any compelling technical reasons. Usually
when we bump min glib, it lets us cut out compatibility hacks and/or
get access to new APIs.

Bumping _WIN32_WINNT can do that, but the interesting place where that's
useful is mostly in GLib. I'm not sure what we'd make use of in the QEMU
side from setting a newer _WIN32_WINNT. Hence my suggestion that we just
let min GLib drive our min _WIN32_WINNT setting. If someone can point
to stuff we can improve in QEMU though, thanks to new _WIN32_WINNT that
could top the balance.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


