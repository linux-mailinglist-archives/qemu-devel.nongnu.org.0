Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 047B84B5484
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:22:17 +0100 (CET)
Received: from localhost ([::1]:52648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJdBA-00049k-3s
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:22:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nJcKr-0004T0-Kh
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:28:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nJcKk-0007nJ-7T
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:28:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644848885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q2Qbp2zFaDEzg1g9E4U+ZqgVlchzPyqXwu09JShmzVI=;
 b=W5I23I11/IO/Ebd2tmFipapSRapb435PMcMvdJAKWkbsIWo/LgA8KTcqwtObOeVwRU34NF
 hXmtJdpo2/4OVcoljQGWWK6SQ6cQx7aLk4/ve5awisZIrDfMpF8aRGc39wjAVA9EpyD2IH
 9T4bYPw2e+QcUlqsE7H+nhTcVN78U2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-Wg9NwRoANUugq_b-3MFMng-1; Mon, 14 Feb 2022 09:27:57 -0500
X-MC-Unique: Wg9NwRoANUugq_b-3MFMng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A39632F46
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 14:27:56 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.32.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16966101E7E1;
 Mon, 14 Feb 2022 14:27:19 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 9591C220CE9; Mon, 14 Feb 2022 09:27:18 -0500 (EST)
Date: Mon, 14 Feb 2022 09:27:18 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2] Deprecate C virtiofsd
Message-ID: <Ygpmxqs6rN8/5aJh@redhat.com>
References: <20220210174714.19843-1-dgilbert@redhat.com>
 <20220210204404.GA22879@redhat.com> <Ygo9O7oWsImstSJu@work-vm>
MIME-Version: 1.0
In-Reply-To: <Ygo9O7oWsImstSJu@work-vm>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: berrange@redhat.com, slp@redhat.com,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 11:30:03AM +0000, Dr. David Alan Gilbert wrote:
> * Richard W.M. Jones (rjones@redhat.com) wrote:
> > On Thu, Feb 10, 2022 at 05:47:14PM +0000, Dr. David Alan Gilbert (git) wrote:
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > > 
> > > There's a nice new Rust implementation out there; recommend people
> > > do new work on that.
> > > 
> > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > ---
> > >  docs/about/deprecated.rst | 17 +++++++++++++++++
> > >  1 file changed, 17 insertions(+)
> > > 
> > > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > > index 47a594a3b6..3c73d22729 100644
> > > --- a/docs/about/deprecated.rst
> > > +++ b/docs/about/deprecated.rst
> > > @@ -454,3 +454,20 @@ nanoMIPS ISA
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
> > > +There is a new Rust implementation of ``virtiofsd`` at
> > > +``https://gitlab.com/virtio-fs/virtiofsd``;
> > > +since this is now marked stable, new development should be done on that
> > > +rather than the existing C version in the QEMU tree.
> > > +The C version will still accept fixes and patches that
> > > +are already in development for the moment, but will eventually
> > > +be deleted from this tree.
> > > +New deployments should use the Rust version, and existing systems
> > > +should consider moving to it.  The command line and feature set
> > > +is very close and moving should be simple.
> > 
> > I'm not qualified to say if the Rust impl is complete enough
> > to replace the C version, so I won't add a reviewed tag.
> 
> We believe it is a complete replacement at this point, with compatible
> command line.

I think its not a complete replacement yet. For example, POSIX_ACLs are
not supported yet. German is looking into making it work.

There might be other small things here and there, but nothing major, I
think.

Vivek
> 
> Dave
> 
> > However I want to say that from the point of view of downstream
> > packagers of qemu -- especially Fedora -- it would be helpful if we
> > could direct both upstream development effort and downstream packaging
> > into just the one virtiofsd.  So I agree in principle with this.
> > 
> > Rich.
> > 
> > -- 
> > Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
> > Read my programming and virtualization blog: http://rwmj.wordpress.com
> > virt-p2v converts physical machines to virtual machines.  Boot with a
> > live CD or over the network (PXE) and turn machines into KVM guests.
> > http://libguestfs.org/virt-v2v
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 


