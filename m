Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368333E19B2
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 18:37:10 +0200 (CEST)
Received: from localhost ([::1]:33546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBgMm-0006yt-AO
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 12:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBgM1-0006Iv-HP
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 12:36:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBgLy-0000VM-AH
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 12:36:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628181376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Inv3aoUTkvZx5xIflPXhfnIUD5iXxe7+7fChMPYR1L8=;
 b=eApO9S88Ayh0ajYSC0MUQYHhGCTcvK6phnnBrEob7pHhzqv/eynb0FE503/uOXSzEfzLi+
 JsPVjGQYcR8HTxZ5cNYNt1MYsqnrgbfI+nRoXVuzp/GG+VMdu5B8Po9TwWZ3qCqgKc3RpR
 WFP4799o5BrIKnLZVUFsH2FjGGt4oyk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-ctOSpPBxMjapIlKURJuphw-1; Thu, 05 Aug 2021 12:36:13 -0400
X-MC-Unique: ctOSpPBxMjapIlKURJuphw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D2AC19611A1;
 Thu,  5 Aug 2021 16:36:12 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20E0860CD1;
 Thu,  5 Aug 2021 16:36:12 +0000 (UTC)
Date: Thu, 5 Aug 2021 12:36:11 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH for-6.2 01/10] docs: qom: Replace old GTK-Doc #symbol
 syntax with `symbol`
Message-ID: <20210805163611.pvh4p7fkkx6b6kod@habkost.net>
References: <20210729175554.686474-1-ehabkost@redhat.com>
 <20210729175554.686474-2-ehabkost@redhat.com>
 <CAFEAcA8FdSL6YwL1GiEqc0sF087SFCzRN3QvjOeOYxWaPoTO2Q@mail.gmail.com>
 <20210804203116.nawhr7px2zhkpzxk@habkost.net>
 <CAFEAcA-cJe9NRVMJ6JFyEs+AJV6Wo8MfT+_1P4coWGVjfzLzVg@mail.gmail.com>
 <20210804210034.2dp6b2uqlfxkhjjo@habkost.net>
 <CAFn=p-bBK=LRG0u8dr_AqgMAzH3+KotRkRUZOLZP_cXFYkAa1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-bBK=LRG0u8dr_AqgMAzH3+KotRkRUZOLZP_cXFYkAa1g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 04, 2021 at 08:26:10PM -0400, John Snow wrote:
> On Wed, Aug 4, 2021 at 5:00 PM Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > On Wed, Aug 04, 2021 at 09:42:24PM +0100, Peter Maydell wrote:
> > > Is there a sensible default-role we can use as the default for the whole
> > manual,
> > > rather than only declaring it in individual .rst files ?  One of the
> > > things I don't
> > > like about the change here is that it means that `thing` in this
> > individual .rst
> > > file is different from `thing` in every other .rst file in our docs.
> >
> > I believe "any" would be a very sensible default role for all
> > documents, but I don't know how to set default-role globally.
> > I'll try to find out.
> 
> Oh, I actually fixed that issue I referenced there back in May -- I keep a
> patchset up to date whenever I work on modernizing the QAPI python code
> that actually DOES switch our default role to "any" ... I updated it just
> today, in fact. I will send it to the list if there's an appetite for it
> now.

If you already have a patch that makes it possible to change the
default role to "any" globally, I'd be glad to include it in v2
of this series.

-- 
Eduardo


