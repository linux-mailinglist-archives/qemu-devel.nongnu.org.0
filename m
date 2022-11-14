Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669F8628F53
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:33:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouiqX-0003Ct-QO; Mon, 14 Nov 2022 18:26:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ouih6-00061f-Ia
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:16:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ouXQ2-0000uX-GB
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 06:14:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668424464;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=11krIYvPtpKwwnhDPZC3Vj+2JMx2AL9VPmkwpGUr9KY=;
 b=SNZUHXXFKUg/fgA14hrNX0Cz9wBln3S1dl+aloVWgR9dIP2xiumMd5lnsH8UEJEGOqp/h/
 zrxvIDBF1M/fuN+qwJcwRdJZwIJ/ekbJlIdIeUt8+lvPiy7EugR513k5AnlFbimj3y/55v
 IoDVfpnXhCzGPUk6YfXgwUNv8yYWST8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-gJbb__w8M4Goe18QAgspZA-1; Mon, 14 Nov 2022 06:14:21 -0500
X-MC-Unique: gJbb__w8M4Goe18QAgspZA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBA3F3C025BF;
 Mon, 14 Nov 2022 11:14:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.135])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BD7B422A9;
 Mon, 14 Nov 2022 11:14:19 +0000 (UTC)
Date: Mon, 14 Nov 2022 11:14:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] capstone: use <capstone/capstone.h> instead of
 <capstone.h>
Message-ID: <Y3IjBZ/y0AlfxY55@redhat.com>
References: <20221113200942.18882-1-mjt@msgid.tls.msk.ru>
 <Y3IDCbr/ZgsSuzkh@redhat.com>
 <be197f59-ee50-caac-ecc5-aa1398b2bad3@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be197f59-ee50-caac-ecc5-aa1398b2bad3@msgid.tls.msk.ru>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 14, 2022 at 12:13:48PM +0300, Michael Tokarev wrote:
> 14.11.2022 11:58, Daniel P. Berrangé wrote:
> ..
> > > On current systems, using <capstone/capstone.h> works
> > > now (despite the pkg-config-supplied -I/usr/include/capstone) -
> > > since on all systems capstone headers are put into capstone/
> > > subdirectory of a system include dir. So this change is
> > > compatible with both the obsolete way of including it
> > > and the only future way.
> > 
> > AFAIR, macOS HomeBrew does not put anything into the system
> > include dir, and always requires -I flags to be correct.
> 
> Does it work with the capstone-supplied --cflags and the proposed
> include path?  What does pkg-config --cflags capstone return there?

I see the QEMU build logs adding:

 -I/usr/local/Cellar/capstone/4.0.2/include/capstone

so  #include <capstone/capstone.h>   seems unlikely to work

> > > -  if capstone.found() and not cc.compiles('#include <capstone.h>',
> > > +  if capstone.found() and not cc.compiles('#include <capstone/capstone.h>',
> > >                                             dependencies: [capstone])
> > 
> > To retain back compat this could probe for both ways
> > 
> >      if capstone.found()
> >          if cc.compiles('#include <capstone/capstone.h>',
> > 	               dependencies: [capstone])
> >             ...
> >          else if cc.compiles('#include <capstone.h>',
> > 	                    dependencies: [capstone])
> >             ...
> > then, the source file can try the correct #include based on what
> > we detect works here.
> 
> I don't think this deserves the complexity really, unless there *is*
> a system out there which actually needs this.
> 
> I mean, these little compat tweaks, - it becomes twisty with time,
> and no one knows which code paths and config variables are needed
> for what, and whole thing slowly becomes unmanageable... If it's
> easy to make it unconditional, it should be done. IMHO anyway :)

Well you're proposing a change during RC time which is likely to
break builds if the assumption that its always in the system
include path is wrong. So I think the explicit compatibility is
required to reduce the risk of this creating a regression.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


