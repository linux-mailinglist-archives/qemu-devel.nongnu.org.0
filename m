Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D264416A8C2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 15:46:36 +0100 (CET)
Received: from localhost ([::1]:37648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6F0F-0002t6-S9
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 09:46:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53004)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1j6Eyt-0001p7-7q
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 09:45:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1j6Eyr-0007jX-JZ
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 09:45:11 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:20006
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1j6Eyr-0007jO-Et
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 09:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582555508;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zgQbu3iw1NSUlvXZeSthSMyiLqigdkaOtMU4+kjUvU4=;
 b=DA7jpGosBcwjcH6/tkN+p9oV+vqE868aW9shWsmYbGWDu+Wml8NqgjNg5mvbJ+UjEz9eh9
 BlBSxXdeOPGvZV6fkYfVNMLK7bvm5xHxgtGQtQEQ9umziGDeRh3YMUjgp+J5S+n7xGkSAm
 bPnA0zUXfdFe2awUGV/P8GLZB/YrMQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-dk2ETjfpOu2pRp2bmhVLBA-1; Mon, 24 Feb 2020 09:45:06 -0500
X-MC-Unique: dk2ETjfpOu2pRp2bmhVLBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD9F31005513;
 Mon, 24 Feb 2020 14:45:05 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3A195D9CD;
 Mon, 24 Feb 2020 14:45:04 +0000 (UTC)
Date: Mon, 24 Feb 2020 14:45:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: QAPI schema for desired state of LUKS keyslots (was: [PATCH
 02/13] qcrypto-luks: implement encryption key management)
Message-ID: <20200224144502.GS635661@redhat.com>
References: <20200114193350.10830-1-mlevitsk@redhat.com>
 <20200114193350.10830-3-mlevitsk@redhat.com>
 <87lfp36gzh.fsf_-_@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87lfp36gzh.fsf_-_@dusky.pond.sub.org>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Feb 15, 2020 at 03:51:46PM +0100, Markus Armbruster wrote:
> Review of this patch led to a lengthy QAPI schema design discussion.
> Let me try to condense it into a concrete proposal.
>=20
> This is about the QAPI schema, and therefore about QMP.  The
> human-friendly interface is out of scope.  Not because it's not
> important (it clearly is!), only because we need to *focus* to have a
> chance at success.

OK

> I'm going to include a few design options.  I'll mark them "Option:".
>=20
> The proposed "amend" interface takes a specification of desired state,
> and figures out how to get from here to there by itself.  LUKS keyslots
> are one part of desired state.
>=20
> We commonly have eight LUKS keyslots.  Each keyslot is either active or
> inactive.  An active keyslot holds a secret.
>=20
> Goal: a QAPI type for specifying desired state of LUKS keyslots.
>=20
> Proposal:
>=20
>     { 'enum': 'LUKSKeyslotState',
>       'data': [ 'active', 'inactive' ] }
>=20
>     { 'struct': 'LUKSKeyslotActive',
>       'data': { 'secret': 'str',
>                 '*iter-time': 'int } }
>=20
>     { 'struct': 'LUKSKeyslotInactive',
>       'data': { '*old-secret': 'str' } }
>=20
>     { 'union': 'LUKSKeyslotAmend',
>       'base': { '*keyslot': 'int',
>                 'state': 'LUKSKeyslotState' }
>       'discriminator': 'state',
>       'data': { 'active': 'LUKSKeyslotActive',
>                 'inactive': 'LUKSKeyslotInactive' } }
>=20
> LUKSKeyslotAmend specifies desired state for a set of keyslots.
>=20
> Four cases:
>=20
> * @state is "active"
>=20
>   Desired state is active holding the secret given by @secret.  Optional
>   @iter-time tweaks key stretching.
>=20
>   The keyslot is chosen either by the user or by the system, as follows:
>=20
>   - @keyslot absent
>=20
>     One inactive keyslot chosen by the system.  If none exists, error.
>=20
>   - @keyslot present
>=20
>     The keyslot given by @keyslot.
>=20
>     If it's already active holding @secret, no-op.  Rationale: the
>     current state is the desired state.
>=20
>     If it's already active holding another secret, error.  Rationale:
>     update in place is unsafe.
>=20
>     Option: delete the "already active holding @secret" case.  Feels
>     inelegant to me.  Okay if it makes things substantially simpler.
>=20
> * @state is "inactive"
>=20
>   Desired state is inactive.
>=20
>   Error if the current state has active keyslots, but the desired state
>   has none.
>=20
>   The user choses the keyslot by number and/or by the secret it holds,
>   as follows:
>=20
>   - @keyslot absent, @old-secret present
>=20
>     All active keyslots holding @old-secret.  If none exists, error.
>=20
>   - @keyslot present, @old-secret absent
>=20
>     The keyslot given by @keyslot.
>=20
>     If it's already inactive, no-op.  Rationale: the current state is
>     the desired state.
>=20
>   - both @keyslot and @old-secret present
>=20
>     The keyslot given by keyslot.
>=20
>     If it's inactive or holds a secret other than @old-secret, error.
>=20
>     Option: error regardless of @old-secret, if that makes things
>     simpler.
>=20
>   - neither @keyslot not @old-secret present
>=20
>     All keyslots.  Note that this will error out due to "desired state
>     has no active keyslots" unless the current state has none, either.
>=20
>     Option: error out unconditionally.
>=20
> Note that LUKSKeyslotAmend can specify only one desired state for
> commonly just one keyslot.  Rationale: this satisfies practical needs.
> An array of LUKSKeyslotAmend could specify desired state for all
> keyslots.  However, multiple array elements could then apply to the same
> slot.  We'd have to specify how to resolve such conflicts, and we'd have
> to code up conflict detection.  Not worth it.
>=20
> Examples:
>=20
> * Add a secret to some free keyslot:
>=20
>   { "state": "active", "secret": "CIA/GRU/MI6" }
>=20
> * Deactivate all keyslots holding a secret:
>=20
>   { "state": "inactive", "old-secret": "CIA/GRU/MI6" }
>=20
> * Add a secret to a specific keyslot:
>=20
>   { "state": "active", "secret": "CIA/GRU/MI6", "keyslot": 0 }
>=20
> * Deactivate a specific keyslot:
>=20
>   { "state": "inactive", "keyslot": 0 }
>=20
>   Possibly less dangerous:
>=20
>   { "state": "inactive", "keyslot": 0, "old-secret": "CIA/GRU/MI6" }
>=20
> Option: Make use of Max's patches to support optional union tag with
> default value to let us default @state to "active".  I doubt this makes
> much of a difference in QMP.  A human-friendly interface should probably
> be higher level anyway (Daniel pointed to cryptsetup).
>=20
> Option: LUKSKeyslotInactive member @old-secret could also be named
> @secret.  I don't care.
>=20
> Option: delete @keyslot.  It provides low-level slot access.
> Complicates the interface.  Fine if we need lov-level slot access.  Do
> we?
>=20
> I apologize for the time it has taken me to write this.
>=20
> Comments?

This is all fine with me. I have no strong opinion on the handful of
options listed above, so fine with any choices out of them.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


