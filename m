Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1D363D15A
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 10:04:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Izq-0000O1-UJ; Wed, 30 Nov 2022 04:03:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p0Izo-0000Ne-82
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 04:03:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p0Izm-0004x1-7p
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 04:03:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669798988;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=PDwu57uDJVq0PmawDgnKtY02b7dVQGbJttR74xx8GQ4=;
 b=RY0EAt7eh4nrp6xghS9Val5SjOprl5wvw9VgrMEl7CAxdZhAChbcvkCibRxY3LNTNLLqZ3
 Wst2X875j4GwDXLpfpW2WzA/UwY3Csp/bRQQkhZ5tqvWkbIsgWBpE1e/SxWHY/1FPyVdUf
 RqcXeHgNMS8MTME+7IxWTePqcFuH+oQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-QUq-wSV1NHqrud1-2h6MHQ-1; Wed, 30 Nov 2022 04:03:07 -0500
X-MC-Unique: QUq-wSV1NHqrud1-2h6MHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FAE087B2A0
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 09:03:07 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CD3F42220;
 Wed, 30 Nov 2022 09:03:06 +0000 (UTC)
Date: Wed, 30 Nov 2022 09:03:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: Monitor commands related to display server passwords
Message-ID: <Y4ccR2d2GUHpmHwx@redhat.com>
References: <87mt88oonj.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87mt88oonj.fsf@pond.sub.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Nov 30, 2022 at 09:02:56AM +0100, Markus Armbruster wrote:
> We have a couple of password-related commands, and I'm not sure about
> which ones should be used.  In order of appearance:
> 
> * HMP change vnc
> 
>   Change a VNC server password.  Unlike set_password below, there's no
>   way to select a display other than the first.
> 
>   Note: if change's second argument isn't "vnc", w're changing removable
>   media.  If you call your block device "vnc", you cannot change its
>   media.  Hilarious.

Note, QMP equivalent is blockdev-change-medium, which is an wrapper
around a blockdev-open-tray/remove-medium/insert-medium/close-tray
sequence.  'change <blockdev>' maps to this.

If you call your blockdev 'vnc' you're not getting sympathy
from me ;-P But seriously, I agree with your point.

>   Password prompting (with hidden user input) since commit 7084851534
>   "VNC password authentication, by Daniel P. Berrange." (v0.9.1,
>   2007-08-25).
> 
>   Password argument since commit 2569da0cb6 "Accept password as an
>   argument to 'change vnc password' monitor command (Chris Webb)"
>   (v0.10.0, 2008-12-10).
> 
>   Nowadays, this wraps around QMP change-vnc-password, discussed below.

> * HMP and QMP set_password, expire_password
> 
>   Change a VNC or Spice server password.  For Spice, can optionally fail
>   when connections exist, or disconnect them.
> 
>   HMP commands wrap around the respective QMP command, as they should.
> 
>   HMP set_password does not support password prompting like "change vnc"
>   does.
> 
>   Commands are present even when both CONFIG_VNC and CONFIG_SPICE are
>   off.  Attempts to use them are rejected manually.  Defeats
>   introspection.
> 
>   Since commit 7572150c18 "vnc/spice: add set_passwd monitor command."
>   (v0.14.0, 2010-12-09)
> 
>   Support for VNC displays other than the first since commit 675fd3c96b
>   "qapi/monitor: allow VNC display id in set/expire_password" (v7.0.0,
>   2022-03-02).
> 
> * QMP change-vnc-password
> 
>   Can only target the first VNC display, unlike set_password.
> 
>   Command present only with CONFIG_VNC.
> 
>   Since commit 270b243f91 "qapi: Introduce change-vnc-password" (v1.1,
>   2012-01-18).

IIRC, this was designed as a 1-1 mapping to replace the QMP
'change vnc' command, except it was obviously redundant
since we had already added 'set_passwd' by that point. I
vaguely recall this was all just an oversight on part of
author and reviewers. 

> Do we really need / want both set_password and change-vnc-password in
> QMP?

Nope.

> On the one hand, set_password feels outdated from a QAPI point of view:
> it violates the naming rules, and it defeats introspection.  On the
> other hand, it's more powerful.
> 
> Do we really need / want both set_password and "change vnc" in HMP?
> set_password is more powerful, but only "change vnc" supports password
> prompting.
> 
> Getting rid of "change vnc" would fix the "cannot change media for block
> device named 'vnc'" wart.

> Related: QCryptoSecret objects.

snip

> Currently used by various block backends and the tls-creds-x509 object.
> 
> Would it make sense with display servers, too?

In 6.0 I introduced support for 'password-secret' to SPICE and VNC
command line.

I don't know why, but I only deprecated 'password' in SPICE and
not in VNC.

I didn't wire up any QMP commands todo live password changes. If
the display was already configured with 'password-secret', you
could delete and re-create the existing named secret object
using object-add/object-del, since we fetch the secret value
on every auth check.

There's no way to change from password-off to password-on mode
and vica-verca.

Also no way to change other things like expiry time,

We since gained the 'display-update' command, which could be
extended to allow change expiry time, and turning on/off
use of passwords, and even changing what 'secret' they
point to.

So overall I say

 * Deprecate VNC 'password' option
 * Deprecated QMP and HMP commands for changing VNC/SPICE
   password
 * Extend 'display-update' other other misc live changes

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


