Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ADF4253B2
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:08:34 +0200 (CEST)
Received: from localhost ([::1]:52978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYT8T-0003Gn-Av
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mYT31-0006Rr-59
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:02:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mYT2z-0005xI-40
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:02:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633611771;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=SNfBvZQRLox7D10eTN6guslCx0Z18YCXoxJ18m0PDuY=;
 b=K/x9k2sfnfYY4jG0HTtAggIghhT0LdtLeWTw41Gui0ZeNgyUjB88W3OezQm2OYLCLmBT2T
 x5BdulZGzgmaNx+F5NajXKUrFDZT0Y0xRRCCwH1xc5ExXDnvNhAo08/inR6OTdUh4ejf4K
 0toY7v1GbYoerZZXi6KHII4a9jMsgHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-4UncS15qNgmI7qulqdKF2A-1; Thu, 07 Oct 2021 09:02:37 -0400
X-MC-Unique: 4UncS15qNgmI7qulqdKF2A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93CE784A607
 for <qemu-devel@nongnu.org>; Thu,  7 Oct 2021 13:02:36 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A4E96D9AE;
 Thu,  7 Oct 2021 13:02:35 +0000 (UTC)
Date: Thu, 7 Oct 2021 14:02:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: QAPI sync meeting
Message-ID: <YV7v6K45m9RcZyBx@redhat.com>
References: <CAFn=p-axq90h+UGa_R2a=LZzXTcjsua3O8xnNvonvFD4ZjwmBQ@mail.gmail.com>
 <YVMeUbGdnsTpwSbD@redhat.com>
 <CAFn=p-ZG6SAVDz-cOtviekvMvibw+ukhYmSOqH7UTrcH-9fCNA@mail.gmail.com>
 <87ee97y3q5.fsf@dusky.pond.sub.org> <YV7Fh2DihM65rgnN@redhat.com>
 <3abc4e8e-5657-14bb-ba89-5b7669c01201@redhat.com>
 <YV7tv9t7FznwRbdw@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YV7tv9t7FznwRbdw@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 07, 2021 at 02:53:19PM +0200, Kevin Wolf wrote:
> Am 07.10.2021 um 12:23 hat Paolo Bonzini geschrieben:
> > On 07/10/21 12:01, Kevin Wolf wrote:
> > > 
> > >    * -chardev: I have patches that QAPIfy the option based on aliases,
> > >      getting rid of the old handwritten parser that is inconsistent with
> > >      QMP in non-obvious ways and replacing it with translation to QMP
> > >      (both using aliases and a little C code) that makes the differences
> > >      obvious.
> > > 
> > >      First posted in November 2020, more details in the cover letter:
> > >      https://patchew.org/QEMU/20201112175905.404472-1-kwolf@redhat.com/
> > > 
> > >      Later versions (not yet posted as a series because I'm waiting for
> > >      aliases) also make -chardev accept JSON syntax, which is what
> > >      libvirt really wants to use.
> > 
> > I'm still not sure about this...  It's an awful lot of code if the aliases
> > are only used by -chardev, and I'd rather use -object/object-add for
> > chardevs if that's at all possible.
> 
> The important part for me there is getting rid of the second parser that
> is inconsistent with QAPI - and people add to it without fully realising
> that it's a separate implementation, so they test -chardev and leave
> chardev-add behind broken.
> 
> My approach keeps the existing command line syntax and still makes sure
> that inputs from both the CLI and QMP go through a single code path,
> making sure that they are consistent.
> 
> Aliases are a helpful tool to achieve this, but the series can be
> rewritten a bit if people are fundamentally against having aliases.
> Aliases do nothing that C code can't do.
> 
> I don't think that aliases are a lot of code, or even complicated code.
> Current v4 looks like a lot of lines of code because Markus made me add
> big comments everywhere and tons of tests. The actual code additions are
> rather small. But I also notice that there is resistance against having
> multiple ways to specify the same thing (which is the essence of
> aliases), so if people hate them, let's throw them away. The only part I
> really dislike with this scenario is that I could have been told almost
> a year ago...
> 
> Anyway, your approach provides a different solution to the goal of
> getting rid of the second parser if you extend it: Add -object support
> to all chardev backends, then deprecate -chardev wholesale and drop it
> two releases later. This feels contentious, but I'm not opposed.

If we were thinking about QEMU from new ignoring existing design,
I could even imagine that all of -chardev, -netdev, -device, etc
would actually be -object. So from my POV I don't think it is
unreasonable to take this direction.

> Timeline: My series could be done for 6.2. Yours could have the
> replacement in 6.2 the earliest if we start working on it right now,
> then libvirt starts using it, deprecation in 7.0 or 7.1, then drop the
> old interface two releases later, i.e.  December next year or March
> 2023.

Are the two approaches mutually exclusive rather than complementary ?
eg is Kevin's work a worthwhile incremental step forward, even if we
eventually get to replacing -chardev with -object ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


