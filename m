Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5297F69AFB7
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:43:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT2rq-0004qz-PU; Fri, 17 Feb 2023 10:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pT2ro-0004qM-4S
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:41:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pT2rm-0002fP-FK
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:41:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676648501;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=hx4301BLyHK+b24mJzOODZV4dRoRaWh2EZvl3smGDcg=;
 b=jKl72QH2Ntst/iumMmbyX9s9GC80Dd6F03xb5Nu+Yh9AbYrW/CTHcFd52W5xl5dIKXfhkH
 TQP/APiZQ9hpMo0hD/kCiXtuFZAlBoh89jPexAMq4u/vB8z/epRWSOqKIEVVUtzuZ4W8/Z
 YLNs8HoPKtUx0s6RGu4ACuV4vWSO1zM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-AW9fPCBKNEOJO1FG1EgHkA-1; Fri, 17 Feb 2023 10:41:36 -0500
X-MC-Unique: AW9fPCBKNEOJO1FG1EgHkA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4674E185A7A4;
 Fri, 17 Feb 2023 15:41:36 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B0F64010E83;
 Fri, 17 Feb 2023 15:41:33 +0000 (UTC)
Date: Fri, 17 Feb 2023 15:41:31 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 0/7] Python: Drop support for Python 3.6
Message-ID: <Y++gK3NhmRaN7WdA@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <87v8k2ycjb.fsf@pond.sub.org>
 <a2783906-cad2-2d47-5bbb-66d799b2a4b8@redhat.com>
 <87zg9cirti.fsf@pond.sub.org>
 <331ac041-254e-8db8-33f3-23b36e6a431c@redhat.com>
 <CAFEAcA-JbjSSjR05_zA-g+L7G_Y2QjvEL2COxKD407y0=nUNrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-JbjSSjR05_zA-g+L7G_Y2QjvEL2COxKD407y0=nUNrg@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Feb 17, 2023 at 03:37:16PM +0000, Peter Maydell wrote:
> On Fri, 17 Feb 2023 at 09:56, Thomas Huth <thuth@redhat.com> wrote:
> >
> > On 17/02/2023 10.06, Markus Armbruster wrote:
> > > Thomas Huth <thuth@redhat.com> writes:
> > ...
> > > My view on all this is a bit more pragmatic.
> > >
> > > For a human developer, the difference between "dnf install
> > > python-sphinx" and "pip install sphinx" is, in my opinion, close to
> > > negligible.  Really no comparison to "git-clone GCC and bootstap it".
> > > You seem to disagree with that.
> >
> > Honestly, being a Python ignorant, I completely messed up my system with
> > "pip" already a couple of times, especially if the instructions forgot to
> > tell me to use the "--user" switch. So yes, I tend to disagree ;-)
> 
> Seconded. I trust my distro package manager and I know how it works,
> and I know how to uninstall a package later if I want to revert what
> I've done. I do not know or trust what the heck pip is doing or where it's
> trying to install anything, because it's not a tool I habitually
> use. I can't remember if I've managed to mess up the system with it,
> but I've definitely had the experience of "install stuff with pip,
> do a distro upgrade later, the pip installed stuff is all busted".
> 
> > > For automated builds in general, and distro packaging in particular, the
> > > difference is real, and could even be a show stopper.  But who's
> > > packaging bleeding edge QEMU on CentOS 8?  I suspect the only automated
> > > builds are our own CI, where the difference is real, but hardly a show
> > > stopper.
> >
> > If we've got the feeling that nobody out there really builds QEMU on older
> > long-term distros anymore, then why the heck are we still trying to support
> > this according to our support statement?
> 
> I don't think anybody is *packaging* new QEMU on an old distro.

I recall that at one time the openvz folks where packaging new QEMU on
RHEL-7 for a while after we had already dropped RHEL-7 as a target.
That's the trouble with enterprise distros, their usage sticks around
way longer than any of us would care to admit.

> I do think we have users who do ad-hoc from-source builds.

We'll certainly have contributors using it as a dev platform from
the corporate world.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


