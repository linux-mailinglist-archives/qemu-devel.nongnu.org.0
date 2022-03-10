Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94784D452E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 11:57:28 +0100 (CET)
Received: from localhost ([::1]:60784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGU3-0002Jj-Kg
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 05:57:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSGT6-0001fI-B0
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 05:56:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSGT3-0002rl-K0
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 05:56:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646909784;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fqS9wh2wEANKM5xoxFBlDe8N8NJ7Oic577RTdyQ9r3s=;
 b=iet1KLmHuYD2VXVwVDpwsoe18dXHPaJCatIiwxOTr4vd9za1mdQVn5W8EArl5SVxHr+io9
 ZPubKjKaj+TORLrBbVdIZ5diyd68nAtveZ8Zt8zlMX/61EIjdsy+P0gWL8S6Zc9pvoaLdO
 sSzWTC3LZuhhw4ixsklou0yrAW121Cg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-MbS9TDysNgyiPovO62ja2g-1; Thu, 10 Mar 2022 05:56:19 -0500
X-MC-Unique: MbS9TDysNgyiPovO62ja2g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A74F28066F3
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 10:56:18 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E80726F80E;
 Thu, 10 Mar 2022 10:55:43 +0000 (UTC)
Date: Thu, 10 Mar 2022 10:55:40 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 04/18] tests: print newline after QMP response in qtest
 logs
Message-ID: <YinZLBo77h9X9kvX@redhat.com>
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-5-berrange@redhat.com>
 <YiWra21XaVV9Fdv/@xz-m1.local> <YiXZLzqenrNT/uKg@redhat.com>
 <57b8b146-a197-2f46-bf56-6ab80122e9bd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <57b8b146-a197-2f46-bf56-6ab80122e9bd@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 07, 2022 at 11:09:37AM +0100, Thomas Huth wrote:
> On 07/03/2022 11.06, Daniel P. Berrangé wrote:
> > On Mon, Mar 07, 2022 at 02:51:23PM +0800, Peter Xu wrote:
> > > On Wed, Mar 02, 2022 at 05:49:18PM +0000, Daniel P. Berrangé wrote:
> > > > The QMP commands have a trailing newline, but the response does not.
> > > > This makes the qtest logs hard to follow as the next QMP command
> > > > appears in the same line as the previous QMP response.
> > > > 
> > > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > > > ---
> > > >   tests/qtest/libqtest.c | 3 +++
> > > >   1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> > > > index a85f8a6d05..79c3edcf4b 100644
> > > > --- a/tests/qtest/libqtest.c
> > > > +++ b/tests/qtest/libqtest.c
> > > > @@ -629,6 +629,9 @@ QDict *qmp_fd_receive(int fd)
> > > >           }
> > > >           json_message_parser_feed(&qmp.parser, &c, 1);
> > > >       }
> > > > +    if (log) {
> > > > +        g_assert(write(2, "\n", 1) == 1);
> > > > +    }
> > > 
> > > Drop the g_assert() to remove side effect of G_DISABLE_ASSERT?
> > 
> > You need to check the return value of write() otherwise you'll get a
> > compile failure due to a warn_unused_result attribute annotation.
> > 
> > I don't think G_DISABLE_ASSERT is a problem as we're not defining
> > that in our code.
> 
> You could use g_assert_true() - that's not affected by G_DISABLE_ASSERT.

I don't think we need to do that, per existing common practice:

$ git grep '\bg_assert('  | wc -l
2912

$ git grep '\bg_assert(' tests | wc -l
2296

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


