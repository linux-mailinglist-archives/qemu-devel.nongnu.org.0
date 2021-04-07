Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820403571B9
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 18:07:52 +0200 (CEST)
Received: from localhost ([::1]:47090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUAic-0007Vc-Oi
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 12:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lUAez-00066t-9P
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 12:04:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lUAeu-0003Od-Ho
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 12:04:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617811439;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E9uOBfGkGaqzK8CVuhP9UKf9jaxQZXmSnOMBYvCRvug=;
 b=f0aStjBgeVDmgIinAFah3OhbqP3Eq/pLvV+kLNWOeTFqdYL7fjXu7PL83wAHu3OIR8FA/p
 JsOHmEvwb5G3aQ3bCQVz+A+YURTRc/NtygnOz5S3s9dxnxZ6FnSY7wDBf9nRkDFhYqWl6G
 UpWFnKelFDnPfAeQ8LwDIu6amkLo+sY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-nVzQCk57OOycZfMVgy_0mg-1; Wed, 07 Apr 2021 12:03:52 -0400
X-MC-Unique: nVzQCk57OOycZfMVgy_0mg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 572AD87A841;
 Wed,  7 Apr 2021 16:03:51 +0000 (UTC)
Received: from redhat.com (ovpn-115-28.ams2.redhat.com [10.36.115.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 446461007604;
 Wed,  7 Apr 2021 16:03:45 +0000 (UTC)
Date: Wed, 7 Apr 2021 17:03:42 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] docs: Add a QEMU Code of Conduct and Conflict Resolution
 Policy document
Message-ID: <YG3X3kZk8HUglqp/@redhat.com>
References: <20210331150527.14857-1-pbonzini@redhat.com>
 <YG2ILNrmn0+vVVKJ@merkur.fritz.box> <87wnteus7k.fsf@linaro.org>
 <YG3SyTLha8a9Itlo@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <YG3SyTLha8a9Itlo@merkur.fritz.box>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, agraf@csgraf.de, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, afaerber@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 07, 2021 at 05:42:01PM +0200, Kevin Wolf wrote:
> Am 07.04.2021 um 15:35 hat Alex Bennée geschrieben:
> > Kevin Wolf <kwolf@redhat.com> writes:
> > > Am 31.03.2021 um 17:05 hat Paolo Bonzini geschrieben:
> > >> +respectful.  Examples of unacceptable behavior by participants include:
> > >> +
> > >> +* The use of sexualized language or imagery
> > >> +
> > >> +* Personal attacks
> > >> +
> > >> +* Trolling or insulting/derogatory comments
> > >> +
> > >> +* Public or private harassment
> > >> +
> > >> +* Publishing other's private information, such as physical or electronic
> > >> +addresses, without explicit permission
> > >
> > > "Electronic addresses"? No more Cc: in emails without asking for
> > > explicit permission first in each case, especially when looping in
> > > people who are not subscribed to the list? And the same for attribution
> > > in commits (turning informal statements into Reported-by, Acked-by
> > > etc.)? Links to git repositories of other people?
> > >
> > > I'm sure that this is not what was intended, but it's pretty clearly the
> > > implication of what is written here.
> > 
> > I'm pretty sure emails used to post to public mailing lists (or used
> > in a dco tag) are considered public pieces of information. I read the
> > above as covering things that are not public such as private email
> > addresses or chat ids and the likes.
> 
> Yes, it's pretty clear that I'm not publishing new information about
> people when I'm keeping them in Cc: when replying to a thread, or even
> when they posted in another thread on the list recently. It becomes much
> less clear for adding people who aren't usually part of the QEMU
> community.
> 
> > > (This kind of "bugs" is one of the reasons why I'm not a huge fan of
> > > written rules instead of trusting the judgement of community leaders.
> > > In the communities I am involved in, I can't remember many cases where
> > > they actually helped to resolve conflicts, but I can remember many
> > > unproductive discussions about how to interpret the written text and
> > > what it does and doesn't cover.)
> > 
> > Well we don't have to start here ;-)
> > 
> > We explicitly try to avoid rules lawyering with the very next statement:
> > 
> >   This isn't an exhaustive list of things that you can't do. Rather, take
> >   it in the spirit in which it's intended: a guide to make it easier to
> >   be excellent to each other.
> 
> Right, though it doesn't make any of the above rules any less strict. It
> just tells me that I'm still in danger even if I follow the explicitly
> mentioned things.
> 
> This might be the worst of both worlds: We explicitly threaten people
> with consequences if they don't keep the rules, but then we don't tell
> them what the rules even are and say they should use common sense
> ("you'll find out what the rules were when we punish you for breaking
> them").
> 
> I _think_ I'm usually not misbehaving, but how can I know for sure that
> others have the same impression? For me, this creates a situation of
> uncertainty, and uncertainty makes me feel uneasy. Maybe I'm the only
> one, though, and the benefits outweigh my uneasiness.

I think you need to bear in mind that we're not using some crude AI
to apply blind enforcement of rules. The people responsible for any 
enforcement have the ability to apply common sense to situation and so
aren't likely to take action if someone complains about "publishing" an
email address by adding it to a CC on a thread / git commit message.

Similarly if you think you are not misbehaving, then almost always
that will indeed be the case. If someone did happen to disagree though,
then the CoC sets out a process for resolving the situation and that
process doesn't have to result in action being taken. It could easily
simply be a case of explaining a mis-understanding between two people,
and hopefully that would even be the common case.


If we don't have any CoC then that creates much worse uncertainty because
people who are on the receiving end of bad behaviour will have no idea
whether the QEMU project as a whole even cares about it, or whether it
is the kind of thing that will lead to action being taken, or whom to
talk to about it.

A CoC isn't going to magically stop all bad behaviour, but it does give
the victims clarity of what the expected standards of decency are, and
how to handle the situations. It also gives QEMU community members in
general confidence in speaking up if they see bad behaviour, instead of
having to wait for some senior project member to see the issue and take
action. We've been lucky in the past that when bad situations have arisen
on qemu-devel, the right senior people happened to be online and dealt
with it, but I would rather we had had a CoC then, that made it clearer.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


