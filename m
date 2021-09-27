Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6117B41926C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 12:44:21 +0200 (CEST)
Received: from localhost ([::1]:51316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUo7Q-0003md-Fw
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 06:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mUo1P-0007VX-9c
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:38:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mUo1J-0007hs-JK
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:38:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632739079;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tLfZfF4NlbUCuMAmzrKVYskXJxPrgZj4WRoASx1yRvQ=;
 b=NmHIMrKCcTcE4GiAkIV1Y885fgkDY3TEmD/tzVW/EYwhNGToFlusMG4Nc9D4Wl7QKQzFxi
 KTaoejGAE9g/cwMJlTiN6GyHUeqUIK//rNn1ZVPuSsG02Zm93ZQA3smiLhgNXIwvkTWvwp
 ce9Cd9EkQqPgfFSZpiGxxEiETbOYbVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-Gz-lAAHvPJKUuhV0nEhLRQ-1; Mon, 27 Sep 2021 06:37:57 -0400
X-MC-Unique: Gz-lAAHvPJKUuhV0nEhLRQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E11BB802CB6;
 Mon, 27 Sep 2021 10:37:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D72AC4F124;
 Mon, 27 Sep 2021 10:37:35 +0000 (UTC)
Date: Mon, 27 Sep 2021 11:37:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 11/11] Deprecate stable non-JSON -device and -object
Message-ID: <YVGe7AqZhPcwnkHX@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-12-kwolf@redhat.com>
 <e2d47803-87ab-f48b-0947-70d99f3996be@redhat.com>
 <YVF/DThb+Yq8/dd1@redhat.com> <YVGaH1Cf8kiT11Nh@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YVGaH1Cf8kiT11Nh@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Cc: pkrempa@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 its@irrelevant.dk, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 27, 2021 at 12:17:03PM +0200, Kevin Wolf wrote:
> Am 27.09.2021 um 10:21 hat Daniel P. Berrangé geschrieben:
> > On Mon, Sep 27, 2021 at 10:15:43AM +0200, Paolo Bonzini wrote:
> > > On 24/09/21 11:04, Kevin Wolf wrote:
> > > > We want to switch both from QemuOpts to the keyval parser in the future,
> > > > which results in some incompatibilities, mainly around list handling.
> > > > Mark the non-JSON version of both as unstable syntax so that management
> > > > tools switch to JSON and we can later make the change without breaking
> > > > things.
> > > 
> > > Maybe we need a different section for unstable syntaxes, rather than
> > > overloading deprecated.rst?
> > 
> > This case feels like it hits two scenarios - we want to declare it
> > unstable, which is something we should document in qemu-options.hx.
> 
> Actually, I think a section for unstable syntaxes or generally
> compatibility promises wouldn't hurt. When I checked, I couldn't find
> any documentation about the support status of HMP either.
> 
> Basically, I imagine HMP and non-JSON -device/-object would be on the
> same level: We don't change things without a reason, but if we do want
> to change things, compatibility isn't an argument against making the
> change.
> 
> > We want to also to warn of specific breakage when the impl changes
> > which is something suitable for deprecations.
> 
> We don't do this for HMP either for individual changes.

Well HMP as a whole is considered non-stable, so we don't need to call
out individual things. We've got a simple story that QMP == stable,
HMP == unstable.

The comparison here would be if we declared the entire QEMU CLI to be
unstable, except for JSON syntax args.

> Basically this deprecation notice was meant to make people aware that
> we're lowering the support status from a long-term stable interface to
> HMP-like.

Bearing in mind our previous discussions it feels like our goal is that
we're tending towards a world where we are only wanting to consider
JSON based configuration to be stable, and everything else non-stable.

I think that's a good long term plan, but if we're really doing that
then I think we need to big picture explain it in our docs rather
than mention it in passing against individual args.

BTW I'm also not a fan of deprecating stuff when our documentation is
still using the deprecated syntax and nothing shows the new preferred
syntax. We've got alot of results for  $ git grep -- ' -object'  



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


