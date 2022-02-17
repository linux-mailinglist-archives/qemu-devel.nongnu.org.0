Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B3B4BA552
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 17:03:21 +0100 (CET)
Received: from localhost ([::1]:60028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKjFY-0004Vd-3y
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 11:03:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKinL-0004dd-9O
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:34:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKinG-0002H2-Rm
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:34:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645112039;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HyEpgAKOXpklIC7tIDa4f2K4HQNqniaXDL/SWtaevYg=;
 b=W0vVJO4H7iY+CKcYEPs7AMmbHv0szmLhVFfEMiRJrtTDnOAf6yPlU8dUYIy+b4+sYfx2gT
 /lLKFPEBFBjj6KtpQFbH6NCWpu91qibJr8Su+a1vQGpkD5pC5iNeWwKCF6C0xrvQiWpC7s
 6kO6v4T6pKCMrF8JD9E79ng4G4wB/Ck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-hmMBtwOvN7ew3nUq-BrrMQ-1; Thu, 17 Feb 2022 10:33:54 -0500
X-MC-Unique: hmMBtwOvN7ew3nUq-BrrMQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCA972F45;
 Thu, 17 Feb 2022 15:33:47 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84736753C8;
 Thu, 17 Feb 2022 15:32:49 +0000 (UTC)
Date: Thu, 17 Feb 2022 15:32:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v6 08/11] s390x: topology: Adding drawers to CPU topology
Message-ID: <Yg5qnlQrcZPemm+C@redhat.com>
References: <20220217134125.132150-1-pmorel@linux.ibm.com>
 <20220217134125.132150-9-pmorel@linux.ibm.com>
 <Yg5ZpEisMK1uWqQH@redhat.com>
 <acc9b68e-a456-2136-0371-b815c8585a08@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acc9b68e-a456-2136-0371-b815c8585a08@linux.ibm.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, nrb@linux.ibm.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, david@redhat.com, philmd@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
 pasic@linux.ibm.com, seiden@linux.ibm.com, qemu-s390x@nongnu.org,
 mst@redhat.com, pbonzini@redhat.com, eblake@redhat.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 04:30:06PM +0100, Pierre Morel wrote:
> 
> 
> On 2/17/22 15:20, Daniel P. Berrangé wrote:
> > On Thu, Feb 17, 2022 at 02:41:22PM +0100, Pierre Morel wrote:
> > > S390 CPU topology may have up to 5 topology containers.
> > > The first container above the cores is level 2, the sockets,
> > > and the level 3, containing sockets are the books.
> > > 
> > > We introduce here the drawers, drawers is the level containing books.
> > > 
> > > Let's add drawers, level4, containers to the CPU topology.
> > > 
> > > Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> > > ---
> > >   hw/core/machine-smp.c      | 33 ++++++++++++++++++++++++++-------
> > >   hw/core/machine.c          |  2 ++
> > >   hw/s390x/s390-virtio-ccw.c |  1 +
> > >   include/hw/boards.h        |  4 ++++
> > >   qapi/machine.json          |  7 ++++++-
> > >   softmmu/vl.c               |  3 +++
> > >   6 files changed, 42 insertions(+), 8 deletions(-)
> > 
> > Needs to update -smp args in qemu-options.hx too.
> > 
> 
> Oh, right!
> 
> Thanks
> 
> > > 
> 
> ...snip...
> 
> > > index 73206f811a..fa6bde5617 100644
> > > --- a/qapi/machine.json
> > > +++ b/qapi/machine.json
> > > @@ -866,13 +866,14 @@
> > >   # a CPU is being hotplugged.
> > >   #
> > >   # @node-id: NUMA node ID the CPU belongs to
> > > +# @drawer-id: drawer number within node/board the CPU belongs to
> > >   # @book-id: book number within node/board the CPU belongs to
> > >   # @socket-id: socket number within node/board the CPU belongs to
> > 
> > So the lack of change here implies that 'socket-id' is unique
> > across multiple  books/drawers. Is that correct, as its differnt
> > from semantics for die-id/core-id/thread-id which are scoped
> > to within the next level of the topology ?
> 
> Hum, no I forgot to update and it needs a change.
> What about
> 
> # @book-id: book number within node/board/drawer the CPU belongs to
> # @socket-id: socket number within node/board/book the CPU belongs to
> 
> ?

Probably   drawer/node/board    and book/node/board to keep a
low -> high topology ordering

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


