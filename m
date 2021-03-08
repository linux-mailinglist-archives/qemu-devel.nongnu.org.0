Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D624A330D31
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:17:53 +0100 (CET)
Received: from localhost ([::1]:33724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJEpc-0008I9-T3
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:17:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJEnF-0006Af-LN
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 07:15:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJEn5-0003Fa-VR
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 07:15:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615205714;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9U3ZRJuFH2eXgqDShYY/TNBUoFCB8qFFg+bnlUu6ZwM=;
 b=HFeobMLUIvqlRnUKOO5C6c4jfT1rEbljhUiqoCC0CT5dB0IrtWHg8AEGYR22X4XTmcU1s/
 nzXMsUrrpP8zwvOacGo2x1RHS72CPR+6y0XKFrawbFrN/7YAYttHMt6zGRManH8+Z9zNR6
 AyssORW/Xx+at5lq4KfgoFWd1iO9x+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-ulc2u-xrPAOICfqTrm6FiA-1; Mon, 08 Mar 2021 07:15:01 -0500
X-MC-Unique: ulc2u-xrPAOICfqTrm6FiA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E214107466E;
 Mon,  8 Mar 2021 12:15:00 +0000 (UTC)
Received: from redhat.com (ovpn-114-69.ams2.redhat.com [10.36.114.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 409F65C5FC;
 Mon,  8 Mar 2021 12:14:57 +0000 (UTC)
Date: Mon, 8 Mar 2021 12:14:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: RESEND [PATCH v2] bsd-user: Add new maintainers
Message-ID: <YEYVPsRcE1S9vuo3@redhat.com>
References: <20210307155654.993-1-imp@bsdimp.com>
 <f1045149-077f-e3cd-cad9-42eb3a2e2516@redhat.com>
 <CAFEAcA-kuUEYC7ovT4CELNDjGxnf_Y1scSb_dCmWQfvSeaOXjw@mail.gmail.com>
 <f6665ee9-e279-6a4d-687f-b94579d71b8d@redhat.com>
 <376579a6-091d-b923-4aca-b69ca942bada@redhat.com>
MIME-Version: 1.0
In-Reply-To: <376579a6-091d-b923-4aca-b69ca942bada@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Ed Maste <emaste@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 08, 2021 at 12:55:10PM +0100, Thomas Huth wrote:
> On 08/03/2021 12.16, Philippe Mathieu-Daudé wrote:
> > Hi Peter,
> > 
> > +Markus/Paolo/Laurent/Richard
> > 
> > On 3/8/21 11:24 AM, Peter Maydell wrote:
> > > On Mon, 8 Mar 2021 at 10:09, Thomas Huth <thuth@redhat.com> wrote:
> > > > 
> > > > On 07/03/2021 16.56, Warner Losh wrote:
> > > > > The FreeBSD project has a number of enhancements to bsd-user. Add myself
> > > > > as maintainer and Kyle Evans as a reviewer. Also add our github repo.
> > > > > 
> > > > > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > > > > Signed-off-by: Kyle Evans <kevans@freebsd.org>
> > > > > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > > > > ---
> > > > >    MAINTAINERS | 5 ++++-
> > > > >    1 file changed, 4 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > index 26c9454823..ec0e935038 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -2896,9 +2896,12 @@ F: thunk.c
> > > > >    F: accel/tcg/user-exec*.c
> > > > > 
> > > > >    BSD user
> > > > > -S: Orphan
> > > > > +M: Warner Losh <imp@bsdimp.com>
> > > > > +R: Kyle Evans <kevans@freebsd.org>
> > > > > +S: Maintained
> > > > >    F: bsd-user/
> > > > >    F: default-configs/targets/*-bsd-user.mak
> > > > > +T: git https://github.com/qemu-bsd-user/qemu-bsd-user bsd-user-rebase-3.1
> > > > 
> > > > BSD is not really my home turf, but since nobody else picked this up and I
> > > > plan to send a pull request for a bunch of patches anyway this week, I can
> > > > also put it into my queue.
> > > 
> > > Fine with me. (The v1 was in my to-review queue, but I'm currently
> > > running somewhat behind on processing patches.)
> > 
> > This is a patch for mainstream QEMU, I'm having hard time
> > understanding the point of it. This is some official way
> > to say that BSD-user is not maintained in mainstream but
> > has to be used in the referred fork which is way different
> > that mainstream...
> > 
> > I'd rather wait for more mainstream contributions from Warner
> > and Kyle, or blow the current orphan/dead code and import
> > bsd-user-rebase-3.1 adding the maintainer entries along, but
> > certainly not mark this dead code as maintained.
> > 
> > Please convince me why I'm wrong, because I'd prefer NAck this
> > patch...
> 
> The idea has been discussed here:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01399.html
> 
> So this is not about declaring that bsd-user is maintained in a different
> repository, but about giving Warner et al. a chance to finally upstream
> their work.

Yep, I think this change in MAINTAINERS file is primarily about signalling
intent for future.

Marking the subsystem as maintained isn't saying the current code is great,
just that there is someone committed to improving it hereafter.

If we want to warn people that the current impl isn't great, that's goes
back to the topic of having a way to classify QEMU features into quality
levels Tier 1/2/3. 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


