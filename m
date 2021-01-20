Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3DB2FCDCD
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 11:23:05 +0100 (CET)
Received: from localhost ([::1]:40152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Adk-0003BV-0l
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 05:23:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l2Abo-0001zI-It
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:21:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l2Abk-0006yx-KB
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:21:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611138057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wTvexddPrHhUQi2Klqi27RMroADuDH8G3G6zddBffXM=;
 b=PzIzz5CBurd/7ogK3IDTZ2DuxXUG1yW49Lb8gk7AHWPTYE8q2zYE3ZHI3k6XyTWteC2aqv
 8OZEarLLScBci9snuWDo3CZ/eJ5W4eVBUNazs0q0IJWQH67r+HSzvdaxwwd83JTytVqv2Y
 ffHWoWUdF7MO2dytJylVtn0TS0k4oyk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-yTGQwljuNC6957lsSTCFmw-1; Wed, 20 Jan 2021 05:20:54 -0500
X-MC-Unique: yTGQwljuNC6957lsSTCFmw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7ECE11800D41
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 10:20:53 +0000 (UTC)
Received: from localhost (unknown [10.40.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2946D60C6C;
 Wed, 20 Jan 2021 10:20:51 +0000 (UTC)
Date: Wed, 20 Jan 2021 11:20:50 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v2] machine: add missing doc for memory-backend option
Message-ID: <20210120112050.2eecf7c4@redhat.com>
In-Reply-To: <d3bb0b7d-6c1f-90d9-1bd9-a89eef994462@redhat.com>
References: <20210114234612.795621-1-imammedo@redhat.com>
 <d3bb0b7d-6c1f-90d9-1bd9-a89eef994462@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: pbonzini@redhat.com, pkrempa@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 10:36:05 +0100
Michal Privoznik <mprivozn@redhat.com> wrote:

> On 1/15/21 12:46 AM, Igor Mammedov wrote:
> > Add documentation for '-machine memory-backend' CLI option and
> > how to use it.
> > 
> > And document that x-use-canonical-path-for-ramblock-id,
> > is considered to be stable to make sure it won't go away by accident.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > v2:
> >   - add doc that x-use-canonical-path-for-ramblock-id is considered stable,
> >     (Peter Krempa <pkrempa@redhat.com>)
> > ---
> >   backends/hostmem.c | 10 ++++++++++
> >   qemu-options.hx    | 28 +++++++++++++++++++++++++++-
> >   2 files changed, 37 insertions(+), 1 deletion(-)
> >   
> 
> 
> > @@ -96,6 +97,31 @@ SRST
> >       ``hmat=on|off``
> >           Enables or disables ACPI Heterogeneous Memory Attribute Table
> >           (HMAT) support. The default is off.
> > +
> > +     ``memory-backend='id'``
> > +        An alternative to legacy ``-mem-path`` and ``mem-prealloc`` options.
> > +        Allows to use a memory backend as main RAM.
> > +
> > +        For example:
> > +        ::
> > +        -object memory-backend-file,id=pc.ram,size=512M,mem-path=/hugetlbfs,prealloc=on,share=on
> > +        -machine memory-backend=pc.ram
> > +        -m 512M
> > +
> > +        Migration compatibility note:
> > +        a) as backend id one shall use value of 'default-ram-id', advertised by
> > +        machine type (available via ``query-machines`` QMP command)
> > +        b) for machine types 4.0 and older, user shall
> > +        use ``x-use-canonical-path-for-ramblock-id=on`` backend option
> > +        (this option must be considered stable, as if it didn't have the 'x-'
> > +        prefix including deprecation period, as long as 4.0 and older machine
> > +        types exists),
> > +        if migration to/from old QEMU (<5.0) is expected.
> > +        For example:
> > +        ::
> > +        -object memory-backend-ram,id=pc.ram,size=512M,x-use-canonical-path-for-ramblock-id=on
> > +        -machine memory-backend=pc.ram
> > +        -m 512M  
> 
> Igor, this doesn't correspond with your comment in bugzilla:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1836043#c31
> 
> In fact, we had to turn the attribute OFF so that canonical path is not 
> used. Isn't ON the default state anyway?

indeed, it should be 'off',

> 
> Michal
> 
> 


