Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12343370C5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:03:22 +0100 (CET)
Received: from localhost ([::1]:40268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJ69-0006Sg-OI
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:03:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKJ3T-0005A8-Qa
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:00:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKJ3R-0005eA-Jo
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:00:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615460432;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQvx53QOq/oBCMtKC1ZEnQfxdaFpHFbpF0elw9JHf3M=;
 b=f0SUcX8p+B449wTtvB9+UwrFNuOmB24Ti1RDOFNEow8Z2AiBoUw1ffmzd0ht11JMLde4Ye
 zwJDJF3D/cTT4q0ngrnNQb31BldmPl+kj1mb2AbVLxs2amF8IjopLvUM9ocezn8ITD/80t
 U4x1JvN5NWhLwTW/YWB213BxlqhBAXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-FUH9foYaMPW8pKkmPJyBYA-1; Thu, 11 Mar 2021 06:00:30 -0500
X-MC-Unique: FUH9foYaMPW8pKkmPJyBYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7642B8015BE;
 Thu, 11 Mar 2021 11:00:29 +0000 (UTC)
Received: from redhat.com (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 705D91A879;
 Thu, 11 Mar 2021 11:00:23 +0000 (UTC)
Date: Thu, 11 Mar 2021 11:00:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/3] qapi, audio: add query-audiodev command
Message-ID: <YEn4RGhbBp0zbSJq@redhat.com>
References: <20210302175524.1290840-1-berrange@redhat.com>
 <20210302175524.1290840-2-berrange@redhat.com>
 <87a6rh3gbp.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87a6rh3gbp.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 05, 2021 at 02:01:14PM +0100, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > Way back in QEMU 4.0, the -audiodev command line option was introduced
> > for configuring audio backends. This CLI option does not use QemuOpts
> > so it is not visible for introspection in 'query-command-line-options',
> > instead using the QAPI Audiodev type.  Unfortunately there is also no
> > QMP command that uses the Audiodev type, so it is not introspectable
> > with 'query-qmp-schema' either.
> 
> This is a gap that will only widen.
> 
> By design, query-qmp-schema covers just QMP.  It doesn't cover the
> QAPIfied parts of the CLI.  They have been growing slowly, and this
> trend will continue.  We need schema introspection to cover the CLI,
> too.  Observation, not demand.
> 
> Work-arounds:
> 
> 1. When a QMP command equivalent to a QAPIfied CLI option exists,
> introspect that.  Involves hardcoding the connection between the two.
> Example: -blockdev and blockdev-add.

I'd say this is the scenario that wil lapply long term. As we aim
for a world where you can run "qemu -qmp unix:/tmp/sock,server"
and then configure everything over QMP, we should cease to have
any scenarios where stuff is missing from query-qmp-schemas,
as we'll have a QMP command that covers everything.

IOW, in this case we really ought to have a 'audiodev-add'
command as a counterpart to -audiodev CLI. Not sure if there

are any dragons wrt to creating audio backends on the fly.

> 2. When a QMP query exists that returns the CLI option argument,
> introspect that.  Involves hardcoding the connection between the two.
> Example: -display and query-display-options.
>
> 3. When neither exists, create a suitable query just to enable
> introspection.  Example: query-display-options.  Commit e1ca8f7e19
> "qapi: add query-display-options command" explains this clearly:
> 
>     Add query-display-options command, which allows querying the qemu
>     display configuration.  This isn't particularly useful, except it
>     exposes QAPI type DisplayOptions in query-qmp-schema, so that libvirt
>     can discover recently added -display parameter rendernode (commit
>     d4dc4ab133b).  Works around lack of sufficiently powerful command line
>     introspection.

I figure having a 'query-foo' QMP corresponding to any 'foo-add' QMP
is useful as a general rule to allow mgmt (or human support engineers)
to inspect an running instance and understand its configuration,
especially since it won't be visible in CLI args if we move to 100%
QMP based config.

> > This introduces a 'query-audiodev' command that simply reflects back
> > the list of configured -audiodev command line options. This in turn
> > makes Audiodev introspectable via 'query-qmp-schema'.
> 
> Is the query just for enabling introspection, or does it have other
> uses?

On the libvirt side we only need it for enabling introspection.

As a general rule, being able to inspect any aspect of configuration
via QMP is useful for support purposes if nothing else.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


