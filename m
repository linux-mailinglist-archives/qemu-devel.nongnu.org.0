Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69CE63F2F9
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 15:35:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0kew-0007Sc-VS; Thu, 01 Dec 2022 09:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p0kef-0007ML-1q
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 09:35:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p0keY-00029D-KA
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 09:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669905304;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3hFLlxD4LVSiVRu7I0Fp/M5MyKx61ccrjB/j7CakRLk=;
 b=Yv5ZMvLs/GIG75zs07RY7KxgeP1Umaz/YU2i6L5LjsgX2A4EgjGedEcWh9W8QFD68bGO7e
 E0iyNEtemL9HijKQscXwmSQFlHBr5X6yQzeG5r/Gg2LFIqyVgYahg/6rIgRLelMZrUJkEZ
 Y2uEOzIbwrJGJP8WVUoNh3bQp8IwMCo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-H8Sq8-j5MNyYjFzubrOkCw-1; Thu, 01 Dec 2022 09:35:02 -0500
X-MC-Unique: H8Sq8-j5MNyYjFzubrOkCw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54540101A56C
 for <qemu-devel@nongnu.org>; Thu,  1 Dec 2022 14:35:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D80340C945A;
 Thu,  1 Dec 2022 14:35:01 +0000 (UTC)
Date: Thu, 1 Dec 2022 14:34:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, dgilbert@redhat.com
Subject: Re: [PATCH 3/9] ui: Drop disabled code for SPICE_CHANNEL_WEBDAV
Message-ID: <Y4i7kZCetDvFYnCp@redhat.com>
References: <20221201061311.3619052-1-armbru@redhat.com>
 <20221201061311.3619052-4-armbru@redhat.com>
 <Y4hqiiNzcMVS0t0k@redhat.com> <87pmd3fgcu.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pmd3fgcu.fsf@pond.sub.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Dec 01, 2022 at 01:39:13PM +0100, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Thu, Dec 01, 2022 at 07:13:05AM +0100, Markus Armbruster wrote:
> >> HMP "info spice" has a bit of code to show channel type
> >> SPICE_CHANNEL_WEBDAV as "webdav", disabled since commit 7c6044a94e
> >> "hmp: info spice: take out webdav" (v2.3.0), because it compiles only
> >> with Spice versions 0.12.7 and later.  Our minimum version is 0.12.5.
> >
> > Last version bump was 4 years ago
> >
> > commit 1b63665c2c0e0d52735e0dd5217f109fe0dd2322
> > Author: Marc-André Lureau <marcandre.lureau@redhat.com>
> > Date:   Wed Nov 28 19:59:32 2018 +0400
> >
> >     configure: bump spice-server required version to 0.12.5
> >
> >     ...snip....
> >
> >     According to repology, all the distros that are build target platforms
> >     for QEMU include it:
> >     
> >           RHEL-7: 0.14.0
> >           Debian (Stretch): 0.12.8
> >           Debian (Jessie): 0.12.5
> >           FreeBSD (ports): 0.14.0
> >           OpenSUSE Leap 15: 0.14.0
> >           Ubuntu (Xenial): 0.12.6
> >
> > We moved on from Debian and RHEL since then
> >
> >    Debian 11: 0.14.3
> >    RHEL-8: 0.14.2
> >    FreeBSD (ports): 0.14.4
> >    Fedora 35: 0.14.0
> >    Ubuntu 20.04: 0.14.0
> >    OpenSUSE Leap 15.3: 0.14.3
> >
> > IOW, we can bump to 0.14.0, and then revert the
> > webdav conditional commit.
> 
> We need to bump spice-protocol, actually.

Opps, I'm getting mixed up. The commit I mentioned was spice-server,
but the new versions I've listed just were indeed spice-protocol

> Would you like me to bump spice-server as well?  To which version?

Yes, might as well, the spice-server versions are slightly different:

     Debian 11: 0.14.3
     RHEL-8: 0.14.3
     FreeBSD (ports): 0.15.0
     Fedora 35: 0.15.0
     Ubuntu 20.04: 0.14.2
     OpenSUSE Leap 15.3: 0.14.3
 
I think we might as well pick  0.14.0 for both protocol and server.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


