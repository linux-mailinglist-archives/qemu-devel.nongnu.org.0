Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216473E0964
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 22:32:57 +0200 (CEST)
Received: from localhost ([::1]:60510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBNZQ-0001yt-59
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 16:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBNY0-0001GO-Jz
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 16:31:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBNXx-0003kf-GX
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 16:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628109079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W+/0yWz36usbGNZJnI300ylvECs1D1K/rA7X145XJjc=;
 b=Hy9R+eYe0TyQQ/yE2sz7xdN2JXTuh959dfZambQTmPSbUVQ1hEdQS5Id24cc4a5iTxwO+I
 Y5KMmsVKI5RUJpR+6jEe1niPXlgmSgCkVxuDlq6GydWOPwQIeYWL3gNsn4jmf8rY56oTUE
 Zt6ujsPGXYcsafLLymcNt7R975ed75U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-sWcJTIFEMRSohWhS5gi2Hw-1; Wed, 04 Aug 2021 16:31:18 -0400
X-MC-Unique: sWcJTIFEMRSohWhS5gi2Hw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C946190B2A7;
 Wed,  4 Aug 2021 20:31:17 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E3EE60C9F;
 Wed,  4 Aug 2021 20:31:16 +0000 (UTC)
Date: Wed, 4 Aug 2021 16:31:16 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 01/10] docs: qom: Replace old GTK-Doc #symbol
 syntax with `symbol`
Message-ID: <20210804203116.nawhr7px2zhkpzxk@habkost.net>
References: <20210729175554.686474-1-ehabkost@redhat.com>
 <20210729175554.686474-2-ehabkost@redhat.com>
 <CAFEAcA8FdSL6YwL1GiEqc0sF087SFCzRN3QvjOeOYxWaPoTO2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8FdSL6YwL1GiEqc0sF087SFCzRN3QvjOeOYxWaPoTO2Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 02, 2021 at 01:14:57PM +0100, Peter Maydell wrote:
> On Thu, 29 Jul 2021 at 19:00, Eduardo Habkost <ehabkost@redhat.com> wrote:
> >
> > Replace leftover of GTK-Doc #name syntax with `name`, and use
> > default-role:: any, so we can add references to other functions,
> > types, and macros.
> >
> > There are 3 cases that required extra care:
> > - #TypeInfo.class_init: kernel-doc doesn't generate c:member::
> >   directives, so references to C struct members are not possible
> >   yet.  This was replaced with `TypeInfo`.class_init.
> > - #CPUClass.reset and #DeviceClass.realize: cpu.h and qdev docs are not
> >   rendered using Sphinx yet, so use ``code`` syntax for those.
> >
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> >  docs/devel/qom.rst | 25 +++++++++++++------------
> >  1 file changed, 13 insertions(+), 12 deletions(-)
> >
> > diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
> > index e5fe3597cd8..9c1be5d7fc2 100644
> > --- a/docs/devel/qom.rst
> > +++ b/docs/devel/qom.rst
> > @@ -3,6 +3,7 @@ The QEMU Object Model (QOM)
> >  ===========================
> >
> >  .. highlight:: c
> > +.. default-role:: any
> >
> >  The QEMU Object Model provides a framework for registering user creatable
> >  types and instantiating objects from those types.  QOM provides the following
> > @@ -42,8 +43,8 @@ features:
> >
> >     type_init(my_device_register_types)
> >
> > -In the above example, we create a simple type that is described by #TypeInfo.
> > -#TypeInfo describes information about the type including what it inherits
> > +In the above example, we create a simple type that is described by `TypeInfo`.
> > +`TypeInfo` describes information about the type including what it inherits
> 
> I've just gone through all of docs/ finding the places where we had `foo` and
> probably meant ``foo``, so please don't add any new ones. I would suggest
> that you either use the ``double-backtick`` syntax to render as fixed-width
> font, or use an explicit role tag so readers of the rST source can tell that
> that's what you meant to use, ie avoid "default-role".

I don't understand why that would be a reason to not use
default-role.  With default-role, we get an error when misusing
`foo`.  Without default-role, misuse won't be detected at all
(except by manual inspection).

-- 
Eduardo


