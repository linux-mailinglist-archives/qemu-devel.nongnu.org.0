Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5753913CA08
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 17:54:55 +0100 (CET)
Received: from localhost ([::1]:57218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irlwT-0008R2-UH
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 11:54:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38998)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irluX-0006e8-TB
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 11:52:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irluT-0004AH-Jh
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 11:52:52 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57427
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irluT-00049n-GS
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 11:52:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579107168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IGiacmmsuMvdFZjM5gE21vfxb0JBz0ak8D+4clahb4c=;
 b=dmvgbRa3fng2je5aUvQ8JnsQl3Fi0Y+WsNZhUFI+2BGJkYMfC27sT5GGnIg5UDK42FW0bI
 Fyb3Ht7Q3CuD390J4jVJIY3eRUgjPelbU5Q53VKZFIdlRCfQFJhj43+D9bWnG28i99PvNg
 SxVdCZtW8P/Uf3gJzPN/qbSp5M68fZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-e8cSHBHcPL2LM4bVqv8U7w-1; Wed, 15 Jan 2020 11:52:47 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6DE614E1;
 Wed, 15 Jan 2020 16:52:45 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0FD05C219;
 Wed, 15 Jan 2020 16:52:38 +0000 (UTC)
Date: Wed, 15 Jan 2020 17:52:37 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Subject: Re: [libvirt] [PATCH v2 82/86] numa: forbid '-numa node, mem' for
 5.0 and newer machine types
Message-ID: <20200115175237.325055f3@redhat.com>
In-Reply-To: <20200115153453.GL3243410@angien.pipo.sk>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-83-git-send-email-imammedo@redhat.com>
 <20200115153453.GL3243410@angien.pipo.sk>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: e8cSHBHcPL2LM4bVqv8U7w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 libvir-list@redhat.com, mprivozn@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com, rth@twiddle.net,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Jan 2020 16:34:53 +0100
Peter Krempa <pkrempa@redhat.com> wrote:

> On Wed, Jan 15, 2020 at 16:07:37 +0100, Igor Mammedov wrote:
> > Deprecation period is ran out and it's a time to flip the switch
> > introduced by cd5ff8333a.
> > Disable legacy option for new machine types and amend documentation.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > CC: peter.maydell@linaro.org
> > CC: ehabkost@redhat.com
> > CC: marcel.apfelbaum@gmail.com
> > CC: mst@redhat.com
> > CC: pbonzini@redhat.com
> > CC: rth@twiddle.net
> > CC: david@gibson.dropbear.id.au
> > CC: libvir-list@redhat.com
> > CC: qemu-arm@nongnu.org
> > CC: qemu-ppc@nongnu.org
> > ---
> >  hw/arm/virt.c        |  2 +-
> >  hw/core/numa.c       |  6 ++++++
> >  hw/i386/pc.c         |  1 -
> >  hw/i386/pc_piix.c    |  1 +
> >  hw/i386/pc_q35.c     |  1 +
> >  hw/ppc/spapr.c       |  2 +-
> >  qemu-deprecated.texi | 16 ----------------
> >  qemu-options.hx      |  8 ++++----
> >  8 files changed, 14 insertions(+), 23 deletions(-)  
> 
> I'm afraid nobody bothered to fix it yet:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1783355

It's time to start working on it :)
(looks like just deprecating stuff isn't sufficient motivation,
maybe actual switch flipping would work out better)


