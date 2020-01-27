Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E1314AB3E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 21:45:08 +0100 (CET)
Received: from localhost ([::1]:50786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwBFr-0000Ns-2k
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 15:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44221)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pkrempa@redhat.com>) id 1iwBEz-0008M2-3Q
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 15:44:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pkrempa@redhat.com>) id 1iwBEx-0000r3-LC
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 15:44:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44484
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pkrempa@redhat.com>) id 1iwBEx-0000qs-IH
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 15:44:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580157851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CYvnX5YJpn2MFw+S1CYo6/lHf/3Avhat+jfg161Bx5Q=;
 b=ApaDVUWopLpYPF5+IQPCOItKmR1xIx7che159A2yQ52/Fs6CV+AekHvgZW9hSml2YX7m0Q
 WKplxpwixbnvgGUI/0ax6ta1Wf5qfTlyCbWV1PuwjS/7FDnUqXLtSazkaRcGzQDBHyVnQn
 LfLZnLnygulZrTCQutbp81DYEsnlM9U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-Wu8vh3KQN16SXwC6mg7FzQ-1; Mon, 27 Jan 2020 15:44:05 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84BAB1082770;
 Mon, 27 Jan 2020 20:44:04 +0000 (UTC)
Received: from andariel.pipo.sk (ovpn-204-223.brq.redhat.com [10.40.204.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEF061001B2D;
 Mon, 27 Jan 2020 20:43:58 +0000 (UTC)
Date: Mon, 27 Jan 2020 21:43:55 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 00/13] RFC: [for 5.0]: HMP monitor handlers cleanups
Message-ID: <20200127204355.GE4544@andariel.pipo.sk>
References: <20200127103647.17761-1-mlevitsk@redhat.com>
 <2e885a1d-94c7-53b5-44f7-feffe70f57c3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2e885a1d-94c7-53b5-44f7-feffe70f57c3@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Wu8vh3KQN16SXwC6mg7FzQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Jan Tomko <jtomko@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 27, 2020 at 14:39:02 -0500, John Snow wrote:
>=20
>=20
> On 1/27/20 5:36 AM, Maxim Levitsky wrote:
> > This patch series is bunch of cleanups
> > to the hmp monitor code.
> >=20
> > This series only touched blockdev related hmp handlers.
> >=20
> > No functional changes expected other that
> > light error message changes by the last patch.
> >=20
> > This was inspired by this bugzilla:
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D1719169
> >=20
> > Basically some users still parse hmp error messages,
> > and they would like to have them prefixed with 'Error:'
> >=20
>=20
> HMP isn't meant to be parsed. It's explicitly *not* API or ABI. I do
> like consistency in my UIs (it's useful for human eyes, too), but I'd
> like to know more about the request.

That's true as long as there's an stable replacement ... see below.

>=20
> Is this request coming from libvirt? Can we wean them off of this
> interface? What do they need as a replacement?

There are 5 commands that libvirt still has HMP interfaces for:

drive_add
drive_del

savevm
loadvm
delvm

From upstream point of view there's no value in adding the 'error'
prefix to drive_add/drive_del as libvirt now uses blockdev-add/del QMP
command instead which have implicit error propagation.

There are no replacements for the internal snapshot commands, but they
reported the 'error' prefix for some time even before this series.

Said that, please don't break savevm/loadvm/delvm until a QMP
replacement is added.

The bug was reported at the time when libvirt didn't use blockdev yet,
but at this point it's pointless from our side. This wouldn't even fix
the scenario when old (pre-5.10) libvirt would use new qemu because the
drive-add handler never checked the error prefix.

[1] https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dblob;f=3Dsrc/qemu/qemu_mon=
itor_text.c;h=3D9135a11f0a3aae718c86bb199112fba8d16d4d80;hb=3DHEAD


