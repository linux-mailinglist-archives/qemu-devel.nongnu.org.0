Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5F13E09B8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 23:01:48 +0200 (CEST)
Received: from localhost ([::1]:52778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBO1L-00009i-EC
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 17:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBO0I-0007jb-D9
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 17:00:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBO0F-0007HW-41
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 17:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628110837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TUdc9XPrK1mq8ODOtP2d8wtyFqOFU1Zx/9u2RoJ1bKo=;
 b=RX+wOmhah4UFcBTWP3jY90s13bk4QWWWwtYbwSOcum9gcaiM/JzudB3pd+EN3ExvsywpVI
 Y9ZXa6Sd5RuDpWp7jnir1vMMTKAvqwoZHgrWb7ZCz7/SdCRHh9zIDeLQOS6vFgEQ8t0BjG
 lXWN0AryAAjhOlV9/bOk380mc0acKBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-epDfga8_Ow-aYjRXe5dRCw-1; Wed, 04 Aug 2021 17:00:36 -0400
X-MC-Unique: epDfga8_Ow-aYjRXe5dRCw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BB641074672;
 Wed,  4 Aug 2021 21:00:35 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D5F8544F1;
 Wed,  4 Aug 2021 21:00:35 +0000 (UTC)
Date: Wed, 4 Aug 2021 17:00:34 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 01/10] docs: qom: Replace old GTK-Doc #symbol
 syntax with `symbol`
Message-ID: <20210804210034.2dp6b2uqlfxkhjjo@habkost.net>
References: <20210729175554.686474-1-ehabkost@redhat.com>
 <20210729175554.686474-2-ehabkost@redhat.com>
 <CAFEAcA8FdSL6YwL1GiEqc0sF087SFCzRN3QvjOeOYxWaPoTO2Q@mail.gmail.com>
 <20210804203116.nawhr7px2zhkpzxk@habkost.net>
 <CAFEAcA-cJe9NRVMJ6JFyEs+AJV6Wo8MfT+_1P4coWGVjfzLzVg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-cJe9NRVMJ6JFyEs+AJV6Wo8MfT+_1P4coWGVjfzLzVg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 04, 2021 at 09:42:24PM +0100, Peter Maydell wrote:
> On Wed, 4 Aug 2021 at 21:31, Eduardo Habkost <ehabkost@redhat.com> wrote:
> >
> > On Mon, Aug 02, 2021 at 01:14:57PM +0100, Peter Maydell wrote:
> > > On Thu, 29 Jul 2021 at 19:00, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > > > diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
> > > > index e5fe3597cd8..9c1be5d7fc2 100644
> > > > --- a/docs/devel/qom.rst
> > > > +++ b/docs/devel/qom.rst
> > > > @@ -3,6 +3,7 @@ The QEMU Object Model (QOM)
> > > >  ===========================
> > > >
> > > >  .. highlight:: c
> > > > +.. default-role:: any
> > > >
> > > >  The QEMU Object Model provides a framework for registering user creatable
> > > >  types and instantiating objects from those types.  QOM provides the following
> > > > @@ -42,8 +43,8 @@ features:
> > > >
> > > >     type_init(my_device_register_types)
> > > >
> > > > -In the above example, we create a simple type that is described by #TypeInfo.
> > > > -#TypeInfo describes information about the type including what it inherits
> > > > +In the above example, we create a simple type that is described by `TypeInfo`.
> > > > +`TypeInfo` describes information about the type including what it inherits
> > >
> > > I've just gone through all of docs/ finding the places where we had `foo` and
> > > probably meant ``foo``, so please don't add any new ones. I would suggest
> > > that you either use the ``double-backtick`` syntax to render as fixed-width
> > > font, or use an explicit role tag so readers of the rST source can tell that
> > > that's what you meant to use, ie avoid "default-role".
> >
> > I don't understand why that would be a reason to not use
> > default-role.  With default-role, we get an error when misusing
> > `foo`.  Without default-role, misuse won't be detected at all
> > (except by manual inspection).
> 
> Ah, I didn't realize that we got an error if we set the default-role
> to 'any'. That certainly makes it nicer than the default default
> of 'cite'.
> 
> Is there a sensible default-role we can use as the default for the whole manual,
> rather than only declaring it in individual .rst files ?  One of the
> things I don't
> like about the change here is that it means that `thing` in this individual .rst
> file is different from `thing` in every other .rst file in our docs.

I believe "any" would be a very sensible default role for all
documents, but I don't know how to set default-role globally.
I'll try to find out.

-- 
Eduardo


