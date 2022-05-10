Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA665210BE
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 11:22:58 +0200 (CEST)
Received: from localhost ([::1]:47272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noM53-00044d-Hu
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 05:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noLcK-0005nk-9e
 for qemu-devel@nongnu.org; Tue, 10 May 2022 04:53:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noLcG-0003RZ-DC
 for qemu-devel@nongnu.org; Tue, 10 May 2022 04:53:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652172791;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+HYGZNVv+quDPnKozACLmXoi7JzdZoNVafZbPAdavq8=;
 b=Vb2mSA5lGvLiiM0iflHrKNpP9RgHrZxmaHLQJb6qlociBJk1jwufvNpEp9UyL8mTM60aP5
 O850zKx7RbTJSh5nM0rE7SJi+DgKHLSS1gaObbMPvxZIzEU+L/Dvts4iMkphDl9f86n6Ch
 LXUgHR97V7ZUEoI+tGX2try3ABxwG1U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-ttVOjdTkOl2405T_FbGPoA-1; Tue, 10 May 2022 04:53:10 -0400
X-MC-Unique: ttVOjdTkOl2405T_FbGPoA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2334E80A0AD
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 08:53:10 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70AFBC27E89;
 Tue, 10 May 2022 08:53:08 +0000 (UTC)
Date: Tue, 10 May 2022 09:53:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Victor Toso <victortoso@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <Ynon8Y8uwfL1bDyN@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87bkwonlkb.fsf@pond.sub.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 26, 2022 at 01:14:28PM +0200, Markus Armbruster wrote:
> Victor Toso <victortoso@redhat.com> writes:
> 
> > Hi,
> >
> > Happy 1st April. Not a joke :) /* ugh, took me too long to send */
> >
> > This series is about adding a generator in scripts/qapi to produce
> > Go data structures that can be used to communicate with QEMU over
> > QMP.
> >
> >
> > * Why Go?
> >
> > There are quite a few Go projects that interact with QEMU over QMP
> > and they endup using a mix of different libraries with their own
> > code.
> >
> >
> > ** Which projects?
> >
> > The ones I've found so far:
> >
> > - podman machine
> >   https://github.com/containers/podman/tree/main/pkg/machine/qemu
> >
> > - kata-containers (govmm)
> >   https://github.com/kata-containers/kata-containers/tree/main/src/runtime/pkg/govmm
> >
> > - lxd
> >   https://github.com/lxc/lxd/tree/master/lxd/instance/drivers
> >
> > - kubevirt (plain json strings)
> >   https://github.com/kubevirt/kubevirt
> >
> > (let me know if you know others)
> >
> >
> > * But Why?
> >
> > I'm particularly interested in 3 out of 4 of the projects above and
> > only Kubevirt uses libvirt to handle QEMU. That means that every
> > QEMU releases where a QMP command, event or other data struct is
> > added, removed or changed, those projects need to check what changed
> > in QEMU and then address those changes in their projects, if needed.
> >
> > The idea behind generating Go data structures is that we can keep a
> > Go module which can have releases that follow QEMU releases.
> 
> We need to look at "following the QEMU releases" a bit more closely.
> 
> Merging your patches gives us the capability to generate a Go interface
> to HEAD's version of QMP.
> 
> The obvious way for an out-of-tree Go program to use this generated Go
> interface is to build with a specific version of it.  It can then talk
> QMP to any compatible QEMU version.
> 
> Compatibility with older QEMUs is not assured: stuff added since is
> present on the Go QMP client end, but not on the QEMU QMP server end.
> 
> Compatibility with newer QEMUs is subject to our deprecation policy:
> 
>     In general features are intended to be supported indefinitely once
>     introduced into QEMU.  In the event that a feature needs to be
>     removed, it will be listed in this section.  The feature will remain
>     functional for the release in which it was deprecated and one
>     further release.  After these two releases, the feature is liable to
>     be removed.
> 
> So, if you stay away from deprecated stuff, you're good for two more
> releases at least.
> 
> Does this work for the projects you have in mind?

It might work for some projects, but in the general case I find it pretty
unappealing as a restriction. Mixing and matching new QEMU with old libvirt,
or vica-verca has been an incredibly common thing todo when both developing
and perhaps more importantly debugging problems. For example I have one
libvirt build and I use it against any QEMU from Fedora / any RHEL-8.x
update, which spans a great many QEMU releases. 

I like the idea of auto-generating clients from the QAPI schema, and
would like it if we were able to use this kind of approach on the libvirt
side, but for that we need to be more flexible in version matching.

Our current approach to deprecation features and subsequently removing
them from the QAPI schema works fine when the QAPI schema is only used
internally by QEMU, not when we we expand usage of QAPI to external
applications. 

I think we need to figure out a way to make the QAPI schema itself be
append only, while still allowing QEMU to deprecation & remove features.

For a minimum viable use case, this doesn't feel all that difficult, as
conceptually instead of deleting the field from QAPI, we just need to
annotate it to say when it was deleted from the QEMU side.  The QAPI
generator for internal QEMU usage, can omit any fields annotated as
deleted in QAPI schema. The QAPI generator for external app usage,
can (optionally) be told to include deleted fields ranging back to
a given version number. So apps can chooses what degree of compat
they wish to retain.

Apps that wish to have version compat, would of course need to write
their code to be aware of which fields they need to seend for which
QEMU version.


> > * Status
> >
> > There are a few rough edges to work on but this is usable. The major
> > thing I forgot to add is handling Error from Commands. It'll be the
> > first thing I'll work on next week.
> >
> > If you want to start using this Today you can fetch it in at
> >
> >     https://gitlab.com/victortoso/qapi-go/
> >
> > There are quite a few tests that I took from the examples in the
> > qapi schema. Coverage using go's cover tool is giving `28.6% of
> > statements`
> >
> > I've uploaded the a static generated godoc output of the above Go
> > module here:
> >
> >     https://fedorapeople.org/~victortoso/qapi-go/rfc/victortoso.com/qapi-go/pkg/qapi/
> >
> >
> > * License
> >
> > While the generator (golang.py in this series) is GPL v2, the
> 
> I'd make it v2+, just to express my displeasure with the decision to
> make the initial QAPI generator v2 only for no good reason at all.

Our policy is that all new code should be v2+ anyway, unless it was
clearly derived from some pre-existing v2-only code. Upto Victor to
say whether the golang.py is considered clean, or was copy+paste
in any parts from existin v2-only code

> > generated code needs to be compatible with other Golang projects,
> > such as the ones mentioned above. My intention is to keep a Go
> > module with a MIT license.
>
> Meh.  Can't be helped, I guess.

This does make me wonder though whether the license of the QAPI input
files has a bearing on the Go (or other $LANGUAGE) ouput files. eg is
the Go code to be considered a derived work of the QAPI JSON files. I'm
not finding a clearly articulated POV on this question so far.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


