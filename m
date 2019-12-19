Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9818A125C91
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 09:27:01 +0100 (CET)
Received: from localhost ([::1]:37148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihr9A-0007YV-Du
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 03:27:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56214)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1ihr8D-00071l-Mk
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 03:26:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1ihr86-0007lo-Q4
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 03:26:00 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38335
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1ihr86-0007hF-0q
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 03:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576743950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qISaBh54X1ZnbJuvBX7qNlW1hOWfjmF/DPMb6Esqz+w=;
 b=GY3cP8tUEAANg6zVpDn9jbnCFcJ3hIi1w3Vi3ErD5JNARS8xwwD4NdmUlPflHepMR6GmNx
 NcTLMP0gMR5CMnqKo39DarMPm1FAXHQSQ0VCJGf/QxItWtcUnY7bwDecko6DbXFvZwSA0l
 Du0pVId58L5b32kquoJ8bkOGg5V/o78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-nr3dWG5cMqSyce4myScmrg-1; Thu, 19 Dec 2019 03:25:47 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF23E1086717;
 Thu, 19 Dec 2019 08:25:46 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-53.ams2.redhat.com [10.36.117.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEA7360C18;
 Thu, 19 Dec 2019 08:25:45 +0000 (UTC)
Date: Thu, 19 Dec 2019 09:25:44 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/4] qapi: Create module 'monitor'
Message-ID: <20191219082544.GA5230@linux.fritz.box>
References: <20191218161952.10202-1-kwolf@redhat.com>
 <20191218161952.10202-3-kwolf@redhat.com>
 <87eex1zbiq.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87eex1zbiq.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: nr3dWG5cMqSyce4myScmrg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.12.2019 um 20:20 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
>=20
> > misc.json contains definitions that are related to the system emulator,
> > so it can't be used for the storage daemon. This patch moves basic
> > functionality that is related to the monitor itself into a new
> > monitor.json, which could be used in tools as well.
> >
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>

> > +##
> > +# @query-version:
> > +#
> > +# Returns the current version of QEMU.
> > +#
> > +# Returns:  A @VersionInfo object describing the current version of QE=
MU.
> > +#
> > +# Since: 0.14.0
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "query-version" }
> > +# <- {
> > +#       "return":{
> > +#          "qemu":{
> > +#             "major":0,
> > +#             "minor":11,
> > +#             "micro":5
> > +#          },
> > +#          "package":""
> > +#       }
> > +#    }
> > +#
> > +##
> > +{ 'command': 'query-version', 'returns': 'VersionInfo',
> > +  'allow-preconfig': true }
>=20
> Borderline.  I guess you move query-version (along with VersionInfo,
> VersionTriple) because qmp_greeting() uses it.

Also because if querying the version makes sense for QEMU, it probably
also makes sense for any other tool.

> > +##
> > +# @quit:
> > +#
> > +# This command will cause the QEMU process to exit gracefully.  While =
every
> > +# attempt is made to send the QMP response before terminating, this is=
 not
> > +# guaranteed.  When using this interface, a premature EOF would not be
> > +# unexpected.
> > +#
> > +# Since: 0.14.0
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "quit" }
> > +# <- { "return": {} }
> > +##
> > +{ 'command': 'quit' }
>=20
> Borderline.
>=20
> Perhaps it's just a matter of naming.  monitor.json suggests it's about
> the monitor.  It's in fact about QMP, plus whatever else any program
> sporting a QMP monitor has.  Can we find a name for that?  Hmm...
> control.json?

As this is what should make sense for every tool implementing QMP, how
about something like base.json or core.json?

Kevin


