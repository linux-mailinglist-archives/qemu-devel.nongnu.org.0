Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75456161033
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 11:37:55 +0100 (CET)
Received: from localhost ([::1]:43368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3dmk-0000qp-J6
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 05:37:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60991)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j3dm1-0000Kb-6J
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 05:37:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j3dlz-0002ya-Hv
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 05:37:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54227
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j3dlz-0002y1-D8
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 05:37:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581935826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fTpwurfX3B0AkdGbSPW+BgEtlQFKH8Z2KZ77PQxPZQ8=;
 b=ILuadbf2LFPgKwSeQjC+fFvEGz79Dr0+BtDm44FKKRqUEpMrjCC2NhMkUQhiVICcThCgb/
 urevHu2lCgZO20xqxlBMn6mbgD+Z86vAQhHx+qOWTQbK8PTqkuMdfeS8oAPyOweefCl5SZ
 q6k6go/htPJpSVoLfiCYSA/nFtRALfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-Zt-6v5iTOaeYxgTdWHpZUg-1; Mon, 17 Feb 2020 05:37:04 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FCB0101FC61;
 Mon, 17 Feb 2020 10:37:03 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-208.ams2.redhat.com [10.36.117.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B30DF6C1;
 Mon, 17 Feb 2020 10:37:01 +0000 (UTC)
Date: Mon, 17 Feb 2020 11:37:00 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: QAPI schema for desired state of LUKS keyslots (was: [PATCH
 02/13] qcrypto-luks: implement encryption key management)
Message-ID: <20200217103700.GC6309@linux.fritz.box>
References: <20200114193350.10830-1-mlevitsk@redhat.com>
 <20200114193350.10830-3-mlevitsk@redhat.com>
 <87lfp36gzh.fsf_-_@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87lfp36gzh.fsf_-_@dusky.pond.sub.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Zt-6v5iTOaeYxgTdWHpZUg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.02.2020 um 15:51 hat Markus Armbruster geschrieben:
> Review of this patch led to a lengthy QAPI schema design discussion.
> Let me try to condense it into a concrete proposal.
>=20
> This is about the QAPI schema, and therefore about QMP.  The
> human-friendly interface is out of scope.  Not because it's not
> important (it clearly is!), only because we need to *focus* to have a
> chance at success.
>=20
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

Though not arbitrary sets of keyslots, it's only a single keyslot or
multiple keyslots containing the same secret. Might be good enough in
practice, though it means that you may have to issue multiple amend
commands to get to the final state that you really want (even if doing
everything at once would be safe).

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

Works for me (without taking any of the options).

The unclear part is what the human-friendly interface should look like
and where it should live. I'm afraid doing only the QMP part and calling
the feature completed like we do so often won't work in this case.

Kevin


