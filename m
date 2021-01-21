Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E062FE819
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 11:53:39 +0100 (CET)
Received: from localhost ([::1]:46390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Xat-0000sl-0W
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 05:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2XZf-00082C-P1
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 05:52:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2XZd-0008PF-3m
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 05:52:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611226339;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ss90X5p+MAzE2S/2aSDVBo+OeqvGFeHnlznxUVoZSlU=;
 b=Wthpe9cPjJfotDloRUj4+S1RT/Caok18XxMNg4GwIQfUZ4dykNyEl56aJ4a9KGjgJVxrzc
 kuF0DBdlcxVihcWetvtj92BeoPBuDCv8YyCu1VSKRTAdsaWGOPvPXM37yulN41AJ/E1eVa
 KQqXqgh2FBSkhfHJ3AA/rzMK7f9gj50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-hQfjNpESNfiBMP4RZNV9lg-1; Thu, 21 Jan 2021 05:52:15 -0500
X-MC-Unique: hQfjNpESNfiBMP4RZNV9lg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B138E743
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 10:52:14 +0000 (UTC)
Received: from redhat.com (ovpn-115-126.ams2.redhat.com [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FB85669FC;
 Thu, 21 Jan 2021 10:52:07 +0000 (UTC)
Date: Thu, 21 Jan 2021 10:52:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/3] vnc: remove "change vnc TARGET" and QMP change
 command, support "-vnc help"
Message-ID: <20210121105204.GI3125227@redhat.com>
References: <20210120144235.345983-1-pbonzini@redhat.com>
 <20210121103831.pb22ib52z5g5onjq@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210121103831.pb22ib52z5g5onjq@sirius.home.kraxel.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 21, 2021 at 11:38:31AM +0100, Gerd Hoffmann wrote:
> On Wed, Jan 20, 2021 at 03:42:32PM +0100, Paolo Bonzini wrote:
> > The real driver for these patches is to send all QemuOpts user input
> > to qemu_opts_parse_noisily, for consistency in the command line
> > parsing code and to effectively outlaw "help" and "?" QemuOpts
> > suboptions.  vnc_parse is the only function that is still using
> > qemu_opts_parse.
> 
> Should we maybe move vnc to qapi cmd line parsing instead?
> 
> > In order to remove the non-command-line callers of vnc_parse,
> > I am removing the deprecated QMP change command but also its HMP
> > veneer "change vnc TARGET", whose usecase is somewhat unclear to
> > me.
> 
> Hmm.  It's been a few years ...
> 
> IIRC back when this was added the main use case was having a way to
> enable/disable the vnc server.  Not sure this is still needed/useful.
> These days you can effectively disable vnc access by expiring the
> password (or not setting one in the first place) without re-configuring
> the vnc server.  Also the race where qemu allowed passwordless connects
> between start and password being set via monitor is long gone.

Yep, it was my patch back here:

  https://lists.gnu.org/archive/html/qemu-devel/2007-08/msg00151.html

The original justification or design was not especially compelling
and somewhat hackish in retrospect.

These days we really ought to change VNC so that it integrates with
"-object secret" for getting its password.

Being able to live add/remove display backends is somewhat
interesting, but if we want that it should be done generically
and use qapi modelling, and covering at least SPICE and VNC.

> So, all in all I feel a bit uncomfortable dropping this without the
> usual deprecation period.  No strong objections though.

Well we did deprecate the "change" command in general in 2.5.0.

  https://qemu.readthedocs.io/en/latest/system/deprecated.html#change-since-2-5-0

We gave illustrations for replacement for vnc password and CD
media change, but no replacement was provided for changing
VNC server config.  That's ok though, as there's no requirement
that we provide a replacement when deprecating stuff. It would
have been nice if we explicitly mentioned we were dropping the
vnc target change funcitonality, but we have none the less
followed deprecation process for the 'change' command and so
can remove it now if desired.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


