Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA85A4198BA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:16:30 +0200 (CEST)
Received: from localhost ([::1]:55548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUtIr-0006dq-Oj
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mUtDS-0001k3-Cr
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:10:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mUtDN-0002F7-8D
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:10:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632759047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DMvOnmiov6uBhGSfaZ4CbDmyOb+5ArtxODfNtxG1Z0Y=;
 b=HmjsOmzYmwo0YSR9DUOw+U2w6Le0bOJ+//3fWmhbnkIWulxfvXpVi+52RxhMKgP717zrEX
 6+iadBJ3mBzaMVLMrt0DH7QYIjMDl7NcfhUGoUiQc/j0pO0gT509htM6qth0i6sTPBVCs5
 OT9SiHYQhEvbMeh7XBa+6CHoey7kOkw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-OBIEvnFKMLiSFSSs-2CIHQ-1; Mon, 27 Sep 2021 12:10:46 -0400
X-MC-Unique: OBIEvnFKMLiSFSSs-2CIHQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50F51835DE1;
 Mon, 27 Sep 2021 16:10:45 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 007D71972E;
 Mon, 27 Sep 2021 16:10:42 +0000 (UTC)
Date: Mon, 27 Sep 2021 18:10:41 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 11/11] Deprecate stable non-JSON -device and -object
Message-ID: <YVHtAVhzKjoaCGBz@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-12-kwolf@redhat.com>
 <CAFEAcA-Paf0+BvdFrT=B_jfzCNzGB6w4-7hjBeXWt0sJJYJs-Q@mail.gmail.com>
 <YVGqptZGZ6PhqixP@redhat.com>
 <CAFEAcA_B1SpqaoZxJtuX4y5Gcafe-AeA4KNOgZkysuAgEWu_6Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_B1SpqaoZxJtuX4y5Gcafe-AeA4KNOgZkysuAgEWu_6Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Cc: Peter Krempa <pkrempa@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Libvirt <libvir-list@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.09.2021 um 14:52 hat Peter Maydell geschrieben:
> On Mon, 27 Sept 2021 at 12:27, Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > Am 27.09.2021 um 11:00 hat Peter Maydell geschrieben:
> > > On Fri, 24 Sept 2021 at 10:14, Kevin Wolf <kwolf@redhat.com> wrote:
> > > >
> > > > We want to switch both from QemuOpts to the keyval parser in the future,
> > > > which results in some incompatibilities, mainly around list handling.
> > > > Mark the non-JSON version of both as unstable syntax so that management
> > > > tools switch to JSON and we can later make the change without breaking
> > > > things.
> > > >
> > > > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > >
> > > > +Stable non-JSON ``-device`` and ``-object`` syntax (since 6.2)
> > > > +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> > > > +
> > > > +If you rely on a stable interface for ``-device`` and ``-object`` that doesn't
> > > > +change incompatibly between QEMU versions (e.g. because you are using the QEMU
> > > > +command line as a machine interface in scripts rather than interactively), use
> > > > +JSON syntax for these options instead.
> > > > +
> > > > +There is no intention to remove support for non-JSON syntax entirely, but
> > > > +future versions may change the way to spell some options.
> > >
> > > As it stands, this is basically saying "pretty much anybody
> > > using the command line, your stuff may break in future, instead
> > > use some other interface you've never heard of, which doesn't
> > > appear to be documented in the manual and which none of the
> > > documentation's examples use".
> >
> > The documentation is a valid criticism. We need to document the JSON
> > interfaces properly (which will really mostly be a pointer to the
> > existing QMP documentation at least for -object, but it's important to
> > tell people where to look for the details).
> >
> > > Is there some more limited deprecation we can do rather than "the
> > > entire commandline for almost all users" ?
> >
> > I don't think "almost all" users is true.
> 
> > I see three groups of users
> 
> ...all of whom "rely on a stable interface for -device and -object",
> and only two of whom it's reasonable to say "use the JSON version" to.

I'm not sure that the human interactive case requires unchanged syntax
as strictly as the other cases do.

After each distro upgrade (or even a browser upgrade within the same
distro), some UI changes somewhere and I have to adapt. I don't think
anyone ever makes promises like "this button is going to stay in the
exact same place forever". And our policy is already that we're not
making such promises for HMP either.

> > 1. Using a management tool that is probably using libvirt. This is
> >    likely the vast majority of users. They won't notice a difference
> >    because libvirt abstracts it away. libvirt developers are actively
> >    asking us for JSON (and QAPI) based interfaces because using the same
> >    representation to describe configurations in QMP and on the CLI makes
> >    their life easier.
> 
> Yes, absolutely we should be recommending that libvirt and
> other management interfaces use the JSON.
> 
> > 2. People starting QEMU on the command line manually. This is
> >    essentially the same situation as HMP: If something changes, you get
> >    an error message, you look up the new syntax, done. Small
> >    inconvenience, but that's it. This includes simple scripts that just
> >    start QEMU and are only used to store a long command line somewhere.
> 
> It's a small inconvenience that we seem to be imposing on our
> users on a pretty frequent basis. Moreover, each one of these
> really needs to be its own deprecation, so that users actually
> can have some advance notice if they need it and look up the
> new syntax. We shouldn't hide them all under this umbrella
> "we might break anything at any time" entry, which I think
> will pretty much encourage breaking compatibility more often
> because you don't have to think about "oh, we should deprecate
> this and maybe print warnings about use of deprecated syntax
> and then drop it later", you can just break things and point
> to this "we said -device wasn't going to be stable" entry.

Are you suggesting bringing back stricter compatibility rules for HMP
then?

The problem with the deprecation period is that you need to have a time
where both options work. But when you have two different parsers, you
can't just magically have the union of their accepted syntaxes. Unless
you invest a lot of time and effort, you have a flag day where the
syntax changes. And I think this is perfectly reasonable for interactive
use.

Deprecations are the wrong tool for human interfaces. You don't need to
know months in advance that something will change in the UI (you'll
forget it again anyway until the change happens and the information
becomes relevant), but this is a case for the changelog.

If you do need to know months in advance, JSON is probably better suited
for your use case.

> As a concrete example, the commit message for this patch vaguely
> mentions some issues "around list handling", which gives me no
> idea at all about what syntax is going to break in future or
> whether it is likely to affect scripts I've written.

The one known incompatible case for -object is the 'host-nodes' property
of memory-backend, which is a list. QemuOpts doesn't support lists at
all, but the string visitor allows using a comma separated list of
integer ranges. (By the way, the existing syntax of it seems to be
undocumented, so not sure how many users even know about how to use this
list support.)

For -device, who knows. I'm positive that the string visitor list
support isn't used there and a patch in this series removes the string
visitor from -device therefore.
What other incompatibilities and hacks there are in some devices, we'll
find out when we actually try to describe devices in QAPI. I'm not even
entirely sure yet that there will be incompatibilities. But if we do
find a case, I don't want to have to stop and delay work for another
year to have a deprecation period for interactive human interfaces.

Another similar case is -drive: We only still have it in its current
form because even figuring out what the exact cases are that would be
incompatible is hard enough to stop us from even trying to deprecate
them individually. But actually it would seem reasonable enough to me to
just change -drive because that makes sense as a convenient option for
interactive use, while -blockdev is more verbose and covers the stable
API part.

> > 3. People writing more complex scripts or applications that invoke QEMU
> >    manually instead of using libvirt. They may actually be hurt by such
> >    changes. They should probably be using a proper machine interface,
> >    i.e. JSON mode, so the deprecation notice is for them to change
> >    their code. This is probably a small minority and not "almost all
> >    users".
> 
> Yeah, this group is kind of similar to group 1 (well, at one
> end it shades into group 1 and at the other into group 2).
> 
> More generally, I think I'd rather see the deprecation of
> the old approach appear after some period when the JSON
> command line version has been available to users and adopted
> by major consumers like libvirt, not as a patch in the same
> series which is introducing the JSON syntax in the first plaec.

Okay, that can be done. So I can post this final patch separately and
only for -object for now, and we'll do -device separately once libvirt
uses JSON for it.

Kevin


