Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5BB34028D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:57:20 +0100 (CET)
Received: from localhost ([::1]:52802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMpP5-0001V6-1o
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMpNd-0000mw-1t
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:55:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMpNa-0000w8-Vf
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:55:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616061345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iu3SEeBiTjXc7gwmJYgm4c7q8bUkvvRZGOXKSWFXeiQ=;
 b=SxOMjjaFzPPNmyRxXj7MTpCJ7X7ISVjPtHKboYec+2xUwNn9EsnCMVx0WbFoj5to7LLOsg
 jkk712lNs9nFT+f86kHQpV+lDmRzOPOa83c3YEPaWtexnpe+jeLVtCXQUyJFsATjB7eyBy
 XJpoEOxvTOLFASUahgQ17kAzV3ujDTQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-PdMPKbsnOkKBG1CBaE16BQ-1; Thu, 18 Mar 2021 05:55:44 -0400
X-MC-Unique: PdMPKbsnOkKBG1CBaE16BQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32E13A40C0;
 Thu, 18 Mar 2021 09:55:43 +0000 (UTC)
Received: from work-vm (ovpn-115-13.ams2.redhat.com [10.36.115.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AAEF5C3E6;
 Thu, 18 Mar 2021 09:55:42 +0000 (UTC)
Date: Thu, 18 Mar 2021 09:55:39 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Michael Rolnik <mrolnik@gmail.com>
Subject: Re: of AVR target page size
Message-ID: <YFMjmwZ2PgKIfDTE@work-vm>
References: <YFJjIq45ggSZz0CX@work-vm>
 <CAK4993j08YrWb4CFZ_rgiCdGQDcc7fCcL4O3VT9Zz3mGL=9+2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK4993j08YrWb4CFZ_rgiCdGQDcc7fCcL4O3VT9Zz3mGL=9+2Q@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Michael Rolnik (mrolnik@gmail.com) wrote:
> Hi Dave.
> 
> What is the smallest supported page size?

Currently 512 I think; in migration/ram.c we have:

#define RAM_SAVE_FLAG_FULL     0x01 /* Obsolete, not used anymore */
#define RAM_SAVE_FLAG_ZERO     0x02
#define RAM_SAVE_FLAG_MEM_SIZE 0x04
#define RAM_SAVE_FLAG_PAGE     0x08
#define RAM_SAVE_FLAG_EOS      0x10
#define RAM_SAVE_FLAG_CONTINUE 0x20
#define RAM_SAVE_FLAG_XBZRLE   0x40
/* 0x80 is reserved in migration.h start with 0x100 next */
#define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100

so we're already using the 0x100 (256) flag.

I spotted this yesterday because a patch tried to use the 0x200 flag.

Dave
> 
> On Wed, Mar 17, 2021 at 10:14 PM Dr. David Alan Gilbert <dgilbert@redhat.com>
> wrote:
> 
> > Hi Michael,
> >   I noticed your AVR code defines:
> >
> >   #define TARGET_PAGE_BITS 8
> >
> > and has an explanation of why.
> >
> > Note however that's not going to work with the current live
> > migration/snapshotting code, since you're a couple of bits smaller
> > than the smallest page size we had so far, and for many years
> > the RAM migration code has stolen the bottom few bits of the address
> > as a flag field, and has already used 0x100 up; see migration/ram.c
> > RAM_SAVE_FLAG_*    - and it's actually tricky to change it, because if
> > you change it then it'll break migration compatibility with existing
> > qemu's.
> >
> > Hmm.
> >
> > Dave
> >
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> >
> >
> 
> -- 
> Best Regards,
> Michael Rolnik
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


