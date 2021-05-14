Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CD53804FE
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 10:19:56 +0200 (CEST)
Received: from localhost ([::1]:51428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhT35-0001wn-Sa
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 04:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lhT1t-0001Fk-FY
 for qemu-devel@nongnu.org; Fri, 14 May 2021 04:18:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lhT1r-0004S5-Su
 for qemu-devel@nongnu.org; Fri, 14 May 2021 04:18:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620980319;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=7hHK4T7UUFzEHf+BAQsTgqxv1ZJA06N08Vh4lOBsTZE=;
 b=faW9atdzx0iTKxJ1yyX8xKJK/h1q75XJa2q64QRj6cyu3eF7zPldQfeWhlhotdDMm8V19a
 28xoFR5PvydHWfkm97HP8q+gUnSfgywjqpxjv2pYZVZXSNSdpbE/KuNu/JYSMCWOpQZlTJ
 xrcRlSaLBW/5BaADZ6S/Dae8NS0qXoQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-W9R1hnSmOuGa-jVsUBhOXw-1; Fri, 14 May 2021 04:18:31 -0400
X-MC-Unique: W9R1hnSmOuGa-jVsUBhOXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67D696D581;
 Fri, 14 May 2021 08:18:30 +0000 (UTC)
Received: from redhat.com (ovpn-113-212.ams2.redhat.com [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A339663BA7;
 Fri, 14 May 2021 08:18:11 +0000 (UTC)
Date: Fri, 14 May 2021 09:18:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V3 06/22] vl: add helper to request re-exec
Message-ID: <YJ4yQPDEmvffAmNY@redhat.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-7-git-send-email-steven.sistare@oracle.com>
 <e1a9e3ff-6708-f0a0-6f04-d3756aa84c15@redhat.com>
 <19d18308-c52c-8b87-8deb-98faecd730f6@oracle.com>
MIME-Version: 1.0
In-Reply-To: <19d18308-c52c-8b87-8deb-98faecd730f6@oracle.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 13, 2021 at 04:19:22PM -0400, Steven Sistare wrote:
> On 5/7/2021 10:31 AM, Eric Blake wrote:
> > On 5/7/21 7:25 AM, Steve Sistare wrote:
> >> Add a qemu_exec_requested() hook that causes the main loop to exit and
> >> re-exec qemu using the same initial arguments.  If /usr/bin/qemu-exec
> >> exists, exec that instead.  This is an optional site-specific trampoline
> >> that may alter the environment before exec'ing the qemu binary.
> >>
> >> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> >> ---
> > 
> >> +static void qemu_exec(void)
> >> +{
> >> +    const char *helper = "/usr/bin/qemu-exec";
> >> +    const char *bin = !access(helper, X_OK) ? helper : argv_main[0];
> > 
> > Reads awkwardly; I would have used '...= access(helper, X_OK) == 0 ?...'
> 
> Will fix.
> 
> >> +
> >> +    execvp(bin, argv_main);
> >> +    error_report("execvp failed, errno %d.", errno);
> > 
> > error_report should not be used with a trailing dot.  
> 
> Will fix.  I was not sure because I see examples both ways, though no dot prevails.
> Perhaps it should be added to the style guide and checkpatch.
> 
> > Also, %d for errno is awkward, better is:
> > 
> > error_report("execvp failed: %s", strerror(errno));
> 
> I shy away from strerror because it is not thread safe, but I see qemu uses it
> extensively.  Will fix.

GLib provides  'g_strerror' which is threadsafe, but without
the horrible API of strerror_r.  It works by caching the
errno strings in a static table on demand.  We don't use
it much in QEMU, but I think we ought to.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


