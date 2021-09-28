Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C142F41B16B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:58:53 +0200 (CEST)
Received: from localhost ([::1]:59722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVDdE-0001KX-Rc
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVDY7-0003Cx-Dk
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:53:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVDY3-0004Yw-36
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632837209;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LVh5QtbzkJIDxz3rohFb8t9ELnu1GPeeBQbw8Nb+cO8=;
 b=VOiCqJFsCI5PKAKoUjGFwsyOJCydj97zBTJVzzrLVNwJcLPZ5Grim6vQs4+H1Qintzz0np
 vver4YG9gzH4T+nWJRzYV2ErRvkc+g5PFJ2gXvEPqYGPYdh00NxLIsJahlOh6WufkZoX/A
 +ZNF8dTQnoVITjDi3vKbMoTruaCz61U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-4wR-vIn3OVGu57LciNWmnA-1; Tue, 28 Sep 2021 09:53:28 -0400
X-MC-Unique: 4wR-vIn3OVGu57LciNWmnA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 864E61923765
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 13:53:27 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02DC75C1B4;
 Tue, 28 Sep 2021 13:53:23 +0000 (UTC)
Date: Tue, 28 Sep 2021 14:53:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: QAPI sync meeting
Message-ID: <YVMeUbGdnsTpwSbD@redhat.com>
References: <CAFn=p-axq90h+UGa_R2a=LZzXTcjsua3O8xnNvonvFD4ZjwmBQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-axq90h+UGa_R2a=LZzXTcjsua3O8xnNvonvFD4ZjwmBQ@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 27, 2021 at 12:55:34PM -0400, John Snow wrote:
> Hiya,
> 
> I'd like to propose that at least the three of us arrange a time to have a
> meeting where we discuss our plans and ideas for QAPI going forward,
> including rust, python, and golang extensions to the QAPI generator, what
> we hope to accomplish with those projects, and so on.
> 
> What I am hoping to get out of this for myself is a high-level overview of
> people's plans for QAPI and to produce some notes on those plans so that I
> can have a reference that we've all acknowledged as roughly accurate to be
> able to keep the community's design goals for QAPI in mind as I continue my
> own development. Ultimately, I'd like some kind of rough draft of a "QAPI
> roadmap".
> 
> I know there was a rust meetup during KVM Forum, but I was unable to attend
> due to the timing. I'd like to expand the focus a little more broadly to
> QAPI in general and discuss our "personal" roadmaps, goals, queued work,
> etc so that we can collaboratively formulate a broader vision of our work.
> 
> I'm posting to qemu-devel in case anyone else has an interest in this area
> and would like to eavesdrop or share opinions, but we should probably come
> up with an agenda first. So:

I'd be interested in discussions

> 
> Proposed agenda:
> 
> Current projects, wishlists, and goals for QAPI:
> - Markus (~10 min)
> - Marc-Andre (~10 min) (Rust, dbus, etc?)
> - jsnow (~10 min) (Python, golang, etc)
> 
> Formulating short-term and long-term roadmaps:
> - Open discussion, ~30 min
> - Collaboratively produce a summary doc (etherpad?) outlining major work to
> be done, separated into near and long terms
> - Upload this summary to the QEMU wiki and mail it back out to qemu-devel
> - We probably won't exactly finish this bit, but we can resume on the
> mailing list afterwards perfectly well.
> 
> (Feel free to propose anything different for the meeting, this is just a
> jumping off point for discussion.)

My interest is in a roadmap for getting to a point where we have
ability to configure QEMU  VMs in a "legacy free" way. By this I
mean

   - 100% of configuration is driven by QAPI defined schemas
   - HMP and QemuOpts are banished/untangled from internals of
     QEMU, such that they are just a shim around the canonical
     QAPI and could even be done as a separate wrapper process
   - May or may not involve qemu-system-XXX vs a new "qemu-vm" binary
   - May or may not involve QMP vs a REST API taking QAPI JSON vs
     something else.

> - Any weekday after 13:00 UTC. Wednesdays, Thursdays and Fridays work
> particularly well for me at the moment.
> - bluejeans and google meeting both work well for me. Open to alternatives.

Are you suggesting a 1-off meeting or a regular meeting, or an adhoc
set of meetings ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


