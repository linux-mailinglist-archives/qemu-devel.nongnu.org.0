Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88C82C6908
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:58:50 +0100 (CET)
Received: from localhost ([::1]:46270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kig93-0001Pz-Ut
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kig49-0004Tw-Js
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:53:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kig47-0001g9-4k
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:53:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606492421;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=yXMbhqvDJwC9MYF5yV+qP8pLeE0j4dBkxLUCh9UUaks=;
 b=aZa2SrWCfVlSLa9KfThPB1J47StdkV9/BfMXI40MN+JgWWzilxGIb4zU1fK0qHq8K+qXqT
 6vQ+Ga256pOyh3Ldus6FXzzuNCyVwe4ytAkPnnBIWp8mfNd4Cgw4ETvYyx5H4956wQCaCX
 sm9jewp8R/b5jZh3C9Mms56Wteuo+J8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-LQ7yZ9UJPVSoCf7Jn-DWMQ-1; Fri, 27 Nov 2020 10:53:26 -0500
X-MC-Unique: LQ7yZ9UJPVSoCf7Jn-DWMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E292A1E7E0;
 Fri, 27 Nov 2020 15:53:24 +0000 (UTC)
Received: from redhat.com (ovpn-113-125.ams2.redhat.com [10.36.113.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8876A19C66;
 Fri, 27 Nov 2020 15:53:19 +0000 (UTC)
Date: Fri, 27 Nov 2020 15:53:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Subject: Re: [PATCH for-6.0 6/6] qapi: Deprecate 'query-kvm'
Message-ID: <20201127155316.GG1596141@redhat.com>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-7-r.bolshakov@yadro.com>
 <20201127105059.GC1596141@redhat.com>
 <20201127112154.GA105758@angien.pipo.sk>
 <20201127114512.GE67322@SPB-NB-133.local>
 <20201127121809.GB105758@angien.pipo.sk>
MIME-Version: 1.0
In-Reply-To: <20201127121809.GB105758@angien.pipo.sk>
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
Cc: libvir-list@redhat.com, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 01:18:09PM +0100, Peter Krempa wrote:
> On Fri, Nov 27, 2020 at 14:45:12 +0300, Roman Bolshakov wrote:
> > On Fri, Nov 27, 2020 at 12:21:54PM +0100, Peter Krempa wrote:
> > > On Fri, Nov 27, 2020 at 10:50:59 +0000, Daniel Berrange wrote:
> > > > Copying libvir-list for the deprecation warning.
> > > > 
> > > > 
> > > > On Mon, Nov 16, 2020 at 04:10:11PM +0300, Roman Bolshakov wrote:
> > > > > 'query-accel' QMP command should be used instead.
> > > > > 
> > > > > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > > > > ---
> 
> [...]
> 
> > > We try hard to stay on top of such changes by using the new interface as
> > > soon as possible, but that is very hard if the replacement changes
> > > during the dev cycle.
> > > 
> > 
> > I see, thanks for the explanation! Perhaps I'll drop deprecation from
> > the series to avoid the issue.
> > 
> > Then as soon as libvirt gets support for queyring accels we might
> > consider deprecation again.
> 
> I don't want to imply that it's entirely necessary to postpone it, but
> in such cases the new API which was added to replace the old one needs
> to be considered a bit more strongly until the release.
> 
> The main reason for this is that libvirt has tests whether it uses any
> deprecated interface. If anything is marked as deprecated and our tests
> flag it, we add an override. Usually the override is added in the same
> patchset which actually implements the new approach.
> 
> We obviously can add an override and then wait for the supported
> interface, but once the override is added there's nothing to remind us
> later on, so I generally like to have everything in one series.

IIUC, this all relies on us importing a dump of the latest QEMU
capabilities into the libvirt test suite.

Most of the capabilities we import are the release version, but
we also periodically import the git snapshot capabilities and
will refresh them until GA of QEMU.

Could we arrange it so that libvirt only reports an error for use
of deprecated interfaces when testing against the GA capabilities
dump. If testing against QEMU git snapshot capabilities, we can
emit a warning only.

That way, we'll have a grace period in which libvirt can see the
warning from tests, and we would only need to add an override
to silence it once we import the GA capabilities, at which time
it is safe to implement the new solution too.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


