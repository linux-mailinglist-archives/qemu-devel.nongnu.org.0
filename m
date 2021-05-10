Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B23B8378250
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 12:33:46 +0200 (CEST)
Received: from localhost ([::1]:52432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg3EP-0007os-RC
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 06:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lg3Cc-0006T8-C6
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:31:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lg3CU-0002DU-NA
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:31:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620642705;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=p8Bqz7QFWCpQe5fSP6URp6Q/8PtaQB732ZUvDPAjuoc=;
 b=ilXVjOC0iCJo7+bfMd8kLAqFJmQEmCNdrxdcRKkRDVVkUBaQrZxtha8iiD3uCMPGOHUypg
 CzQBcY98OPg/HTWhEGp1M+WEGZEaRhW1rW4OVgy/Af3iBG7vHUGC67HhwlMbbDbCYyRgCT
 pk1DuNU98dMcUnx3b0i3tUwhttDb3JU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-ulwW8wlNMAStavQ5JPF_RA-1; Mon, 10 May 2021 06:31:39 -0400
X-MC-Unique: ulwW8wlNMAStavQ5JPF_RA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3D84800D62;
 Mon, 10 May 2021 10:31:38 +0000 (UTC)
Received: from redhat.com (ovpn-115-206.ams2.redhat.com [10.36.115.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A76419C44;
 Mon, 10 May 2021 10:31:36 +0000 (UTC)
Date: Mon, 10 May 2021 11:31:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: qemu.org server bandwidth report (May 2021)
Message-ID: <YJkLLewVDP25TDCg@redhat.com>
References: <CAJSP0QXLcsRy8yONRyh8ZzmFJHALwRKqPa5m52TTL4h5iBZcmg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJSP0QXLcsRy8yONRyh8ZzmFJHALwRKqPa5m52TTL4h5iBZcmg@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 10, 2021 at 10:49:19AM +0100, Stefan Hajnoczi wrote:

> qemu.org bandwidth usage has been as follows:
> - Jan: 12.56 TB
> - Feb: 10.55 TB
> - Mar: 10.28 TB
> - Apr: 7.62 TB
> 
> In May qemu.org has averaged 232.25 GB/day so far putting it on track
> for 7 TB total this month.

That decrease seems to show we've had a big effect from moving to
gitlab. Not big enough yet though.

> Roughly 75% of traffic is git (https), 25% is tarball downloads, and
> the rest is wiki/web/miscellaneous traffic. Fun fact:
> qemu-4.2.0.tar.xz is the most popular download!

First git traffic...

When you say  "git (https)" are you exclusively meaning access of
git via https:// protocol URIs, or does that include git:// URIs
too ?

Or are git:/// URI traffic not accounted for at all in your 75%/25%
split there ?

For the https:// URIs should we setup a HTTP redirect ?

When git clones via https it fetches some specific paths which
I believe we have rules for in httpd conf:

  ScriptAliasMatch "^/git/(.*\.git/(HEAD|info/refs))$" \
    /usr/libexec/git-core/git-http-backend/$1
  ScriptAliasMatch "^/git/(.*\.git/git-(upload|receive)-pack)$" \
    /usr/libexec/git-core/git-http-backend/$1

If we set those URI path matches to send a HTTP 307 redirect
to gitlab, that would essentially kill off our git traffic on
qemu.org, while still allowing the qemu.org gitweb UI to
work normally. The downside is that people won't notice to
update their clone URIs. Still feels like an easy win and
we can easily remove the redirect if we use code 307.



Second tarball traffic...

The qemu-5.2.0.tar.xz file is 102 MB in size

This is quite ridiculous and is directly caused by the number of
binary blobs we're bundling and the corresponding need to bundle
their source.

In fact 66% of this is EDK2's fault - just removing the EDK2
ROMs and source code drops it to 38 MB.

Deleting capstone, dtc, slirp and meson saves 2 MB compressed.

Deleting all remaining contents or roms/ gets us down to 14 MB

Of course we likely want to provide ROMs as a convenience to
users who are not distro vendors, but we could perhaps do that
in a more flexible way.

Even users who want the ROMs likely don't need all of them.


Third, qemu 4.2.0....

I wonder why this is the most popular. Something must be linking
to this, as you would otherwise have to go out of your way to
search it out.

Do we have any stats on the referrer URLs ?

I wonder if there's some key page(s) that need updating ?

If we're unlucky there might be some CI system that hardcoded
use of qemu 4.2.0 that's frequently pulling it.

> I will send another update in 2 months so we can see where bandwidth
> usage finally settled. At that point we can decide whether more steps
> are necessary.




Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


