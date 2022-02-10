Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEBF4B14C8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 18:59:34 +0100 (CET)
Received: from localhost ([::1]:48660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIDjB-0001s6-L0
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 12:59:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nID5U-0001Or-Mp
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 12:18:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nID5S-0002c3-QY
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 12:18:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644513510;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q4Q1c5IO1mdzA0mB6MXswlOABxcmOmHrFNnmfy/jX+U=;
 b=bOieq9Y80hHyNV2ZxbU/5ATy57dbfpxRXKR5f57WqSkWDyq3jkOwOT+W1zfVQ+hYjUsYOX
 Creav7QMCZ+kv4vO7HFZRzPX4lJLC3a5ZbnFSyEXLeq5rHWNNZTTCNO0sDJDlaiE+jhz+L
 RynZk2FMOM2OI7FIefmDOVBNmW/B1CY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-X-0gE4E3MEOXP2L5Hp4mVA-1; Thu, 10 Feb 2022 12:18:26 -0500
X-MC-Unique: X-0gE4E3MEOXP2L5Hp4mVA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5EE98145E1
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:18:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFEEF838E5;
 Thu, 10 Feb 2022 17:18:00 +0000 (UTC)
Date: Thu, 10 Feb 2022 17:17:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] Deprecate C virtiofsd
Message-ID: <YgVIxdu3/oyp3cU8@redhat.com>
References: <20220209165040.56062-1-dgilbert@redhat.com>
 <YgTTbAWj1CGlmv/R@redhat.com> <YgVHr2zgTrPHVhez@work-vm>
MIME-Version: 1.0
In-Reply-To: <YgVHr2zgTrPHVhez@work-vm>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: virtio-fs@redhat.com, slp@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 10, 2022 at 05:13:19PM +0000, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > On Wed, Feb 09, 2022 at 04:50:40PM +0000, Dr. David Alan Gilbert (git) wrote:
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > > 
> > > There's a nice new Rust implementation out there; recommend people
> > > do new work on that.
> > > 
> > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > ---
> > >  docs/about/deprecated.rst | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > > 
> > > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > > index 47a594a3b6..3a0e15f8f5 100644
> > > --- a/docs/about/deprecated.rst
> > > +++ b/docs/about/deprecated.rst
> > > @@ -454,3 +454,17 @@ nanoMIPS ISA
> > >  
> > >  The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
> > >  As it is hard to generate binaries for it, declare it deprecated.
> > > +
> > > +Tools
> > > +-----
> > > +
> > > +virtiofsd
> > > +'''''''''
> > > +
> > > +There is a new Rust implementation of ``virtiofs`` at
> > > +``https://gitlab.com/virtio-fs/virtiofsd``;
> > > +since this is now marked stable, new development should be done on that
> > > +rather than the existing C version in the QEMU tree.
> > > +The C version will still accept fixes and patches that
> > > +are already in development for the moment.
> > 
> > Just to be clear, 'deprecation' is usually expected to turn into
> > 'deletion' a minimum of 2 releases later.  We are targetting the
> > C virtiofsd to be deleted, right ?  The last sentance here gives
> > vibes that we're expecting it to stick around despite deprecation.
> 
> I am targeting it to be deleted, but I'm expecting to give it a bit
> more time than 2 releases; how do I do that?

You can forget to remove it after 2 releases, which is what
happens with many deprecations :-)  '2' is really just the
minimum bar in practice.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


