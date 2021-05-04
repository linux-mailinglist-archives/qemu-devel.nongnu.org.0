Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5882E372B8C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 16:02:00 +0200 (CEST)
Received: from localhost ([::1]:33204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldvcc-0004Cr-Ue
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 10:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1ldvbF-00039O-0o
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:00:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1ldvb8-0001MA-Lk
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620136824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T1DrDYeyVIXxAUN6OdAQIKXOVoa2ZmhLHIb7Pymo8l4=;
 b=X4d+CUxf5cMJypZUtaVuRZEBLrtJ0E2Se5J9tcCkoPJxOh3falhgojrULBFAwR0gg6UdV3
 X0r/AOpoRhiHoBsS2Dde2Cz/69iTUdSkj9s0w6Pqp/gIKeAH8zBYbyHmKC6KbtLH0Thlva
 QwrFPjCRZNLd/thYW5hi4usr2vdaEJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-Ucivsl4KNn-oXHP49_aftA-1; Tue, 04 May 2021 10:00:22 -0400
X-MC-Unique: Ucivsl4KNn-oXHP49_aftA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA37D18A87F1
 for <qemu-devel@nongnu.org>; Tue,  4 May 2021 13:59:49 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1D5E5D6B1;
 Tue,  4 May 2021 13:59:47 +0000 (UTC)
Date: Tue, 4 May 2021 15:59:44 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: Let's remove some deprecated stuff
Message-ID: <YJFTUEEfPOPPnC01@angien.pipo.sk>
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
 <ccc48bde-3e8f-3abb-f062-77bd04d6cc93@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ccc48bde-3e8f-3abb-f062-77bd04d6cc93@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "libvirt-list@redhat.com" <libvirt-list@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 03, 2021 at 13:21:47 -0500, Eric Blake wrote:
> On 4/29/21 4:59 AM, Markus Armbruster wrote:

[...]

> >     qemu-img backing file without format (since 5.1)
> >     ''''''''''''''''''''''''''''''''''''''''''''''''
> > 
> >     The use of ``qemu-img create``, ``qemu-img rebase``, or ``qemu-img
> >     convert`` to create or modify an image that depends on a backing file
> >     now recommends that an explicit backing format be provided.  This is
> >     for safety: if QEMU probes a different format than what you thought,
> >     the data presented to the guest will be corrupt; similarly, presenting
> >     a raw image to a guest allows a potential security exploit if a future
> >     probe sees a non-raw image based on guest writes.
> > 
> >     To avoid the warning message, or even future refusal to create an
> >     unsafe image, you must pass ``-o backing_fmt=`` (or the shorthand
> >     ``-F`` during create) to specify the intended backing format.  You may
> >     use ``qemu-img rebase -u`` to retroactively add a backing format to an
> >     existing image.  However, be aware that there are already potential
> >     security risks to blindly using ``qemu-img info`` to probe the format
> >     of an untrusted backing image, when deciding what format to add into
> >     an existing image.
> 
> I'm not sure how widely used these were, but I'm game for writing a
> patch to drop them.  I'm fairly certain libvirt is not using them.

This is certainly seeing some upstream "use" from random scripts and
possibly also libguestfs.

There are few limited scenarios when probing format is still safe if you
are not 100% sure what the original format of the image was.

I'm afraid that removing this will (at least when used with libvirt)
remove the potential detection of the unsafe scenarios and prompt people
to modify their code to do plainly:

1) probe format of backing file
2) use it in the new overlay without considering the implications

This is IMO less-safe because libvirt will consider the backing chain
without questioning security.

> > Kevin Wolf:
> > 
> >     ``nbd-server-add`` and ``nbd-server-remove`` (since 5.2)
> >     ''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> > 
> >     Use the more generic commands ``block-export-add`` and ``block-export-del``
> >     instead.  As part of this deprecation, where ``nbd-server-add`` used a
> >     single ``bitmap``, the new ``block-export-add`` uses a list of ``bitmaps``.
> 
> Peter, is libvirt good for this one to go?

Yes, libvirt added support for block-export-add usage in favor of
nbd-server-add in:

https://gitlab.com/libvirt/libvirt/-/commit/8c67e389d6367af2ef6dbe2f578c585e2150558d
6.8.0-379-g8c67e389d6


It was briefly disabled since qemu decided to change the design of
block-export-add-before it was really released since the change happened
around a libvirt release:

https://gitlab.com/libvirt/libvirt/-/commit/b87cfc957f57c1d9f7e5bf828ee4b23972085991
v6.9.0-rc1-7-gb87cfc957f

and then re-enabled in

https://gitlab.com/libvirt/libvirt/-/commit/42558a43f87f5a3e73bacb88baf425648415a06f
v6.9.0-8-g42558a43f8


