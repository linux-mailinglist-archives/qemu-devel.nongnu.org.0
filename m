Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D763370CB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:06:08 +0100 (CET)
Received: from localhost ([::1]:45764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJ8p-0000Wi-8j
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKJ7Y-0008FH-V4
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:04:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKJ7X-00081X-8j
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:04:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615460686;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QbJh+6BUn83PEhnE1jwbpq0XZTGKPBO3ZlU+Nk7cb9o=;
 b=ftNeQ/lGNjr2/MpA7xh4MHqMLMCop3MWPB/drAoXwgGylMpQflmuZsHpMy5MJtrSaQjRcJ
 hM/+osufeEgSj8odTZFA22rJ/zu7D3+OY0P49bEBp8fjePy5OLeL/dR4WjWAXUtEuuu7jS
 TJ3EAkctAhUbndO792msxqyAtbVmKqM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-TNLkPOtWMvqrhQr8i1ajmw-1; Thu, 11 Mar 2021 06:04:44 -0500
X-MC-Unique: TNLkPOtWMvqrhQr8i1ajmw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98D5A26862;
 Thu, 11 Mar 2021 11:04:43 +0000 (UTC)
Received: from redhat.com (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 219711B471;
 Thu, 11 Mar 2021 11:04:38 +0000 (UTC)
Date: Thu, 11 Mar 2021 11:04:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/3] qapi, audio: respect build time conditions in audio
 schema
Message-ID: <YEn5RCpPbszAb/x1@redhat.com>
References: <20210302175524.1290840-1-berrange@redhat.com>
 <20210302175524.1290840-3-berrange@redhat.com>
 <20210303070059.sx5t3y3d76f2aflo@sirius.home.kraxel.org>
 <YD9g4WVdkTpUGyR8@redhat.com> <87czwd50oi.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87czwd50oi.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Michael Roth <michael.roth@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 05, 2021 at 11:56:13AM +0100, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Wed, Mar 03, 2021 at 08:00:59AM +0100, Gerd Hoffmann wrote:
> >> On Tue, Mar 02, 2021 at 05:55:23PM +0000, Daniel P. Berrangé wrote:
> >> > Currently the -audiodev accepts any audiodev type regardless of what is
> >> > built in to QEMU. An error only occurs later at runtime when a sound
> >> > device tries to use the audio backend.
> >> > 
> >> > With this change QEMU will immediately reject -audiodev args that are
> >> > not compiled into the binary. The QMP schema will also be introspectable
> >> > to identify what is compiled in.
> >> 
> >> Note that audio backends are modularized, so "compiled with
> >> CONFIG_AUDIO_ALSA" doesn't imply "alsa support is available".
> >
> > AFAIK, there's no way to handle this with QAPI schema reporting. We
> > can only conditionalize based on what's available at compile time,
> > not what's installed at runtime.
> 
> Correct.  The schema is fixed at compile-time.  query-qmp-schema
> reflects what we compiled into the binary or modules we built along with
> the binary.  It cannot tell which of the modules the binary can load.
> 
> I'd like the commit message to discuss how the patch interacts with
> modules, because my own memory of the details is rather uncertain :)
> 
> I guess we can configure which audio backends to build, and whether to
> build them as modules.
> 
> When not building them as modules, the patch compiles out some useless
> code.  Correct?

Yes.

> When building them as modules, the patch compiles out code for modules
> we don't build.  Correct?

Yes.

> Such code is useless, unless you somehow manage to supply the resulting
> binary with working modules from another build.  Which is probably a bad
> idea.  Compiling out the code stops this (questionable) usage cold.  No
> objection, but the commit message should at least hint at it.
> 
> > To get runtime info, we would have to introduce an explicit
> > "query-audiodev-types" command where just report the backends
> > that have been installed.
> 
> TTOCTOU.  Harmless one.  Still, the robust check for "can module M be
> loaded?" is to try loading it.

Ultimately from libvirt's POV, the introspection is merely used to
let libvirt report errors about unsupported configurations earlier.
So if we don't deal with compiled-but-not-installed modules, then
the effect is that libvirt won't report errors if user requests
'alsa', but QEMU will eventually report such an error when it
starts. So I'm not too worried about optimizing to cope with
modules.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


