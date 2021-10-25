Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6E5439660
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 14:32:50 +0200 (CEST)
Received: from localhost ([::1]:52102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mez9k-0000Fe-Sm
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 08:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mez5Y-0005hF-N1
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:28:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mez5U-0007oe-Cq
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:28:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635164903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bfhf29acjme6BH0zjt9s6qlowp7e49X8VBRS0hQbG6k=;
 b=cv6lojQCc8rjCD0HVJaEtSfQdjQ4Q1ZIeqCGgtAqsxPWL5mlXnhfYCXDjJQpWorkxZqu+w
 g+obPSbhi5e5vU4s132lZSLkSeLnw3Zrxm2oRT4MRZulRwTW7wLM9P28y9xIxjclVnB0Ls
 kz9o5/RZRXxUG5cixZDeJgQIyKjIX4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-cAJxSkp7P0-AscVZthX19Q-1; Mon, 25 Oct 2021 08:28:20 -0400
X-MC-Unique: cAJxSkp7P0-AscVZthX19Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA214100CCC1;
 Mon, 25 Oct 2021 12:28:18 +0000 (UTC)
Received: from localhost (unknown [10.39.192.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58EC3694B5;
 Mon, 25 Oct 2021 12:28:06 +0000 (UTC)
Date: Mon, 25 Oct 2021 13:28:05 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 0/5] trace: inroduce qmp: trace namespace
Message-ID: <YXai1V5L/lVB3IL0@stefanha-x1.localdomain>
References: <20210923195451.714796-1-vsementsov@virtuozzo.com>
 <87czoa8nul.fsf@dusky.pond.sub.org>
 <9b6f4ade-7be4-6dd0-7b14-950de92d2cc5@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <9b6f4ade-7be4-6dd0-7b14-950de92d2cc5@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qApJvWpCGOsz+sju"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
Cc: libvir-list@redhat.com, michael.roth@amd.com,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--qApJvWpCGOsz+sju
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 06:22:32PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> 12.10.2021 14:49, Markus Armbruster wrote:
> > Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> >=20
> > > Hi all!
> > >=20
> > > We have handle_qmp_command and qmp_command_repond trace points to tra=
ce
> > > qmp commands. They are very useful to debug problems involving
> > > management tools like libvirt.
> > >=20
> > > But tracing all qmp commands is too much.
> > >=20
> > > Here I suggest a kind of tracing namespace. Formally this series adds=
 a
> > > trace points called qmp:<some-command> for every command, which may b=
e
> > > enabled in separate like
> > >=20
> > >    --trace qmp:drive-backup
> > >=20
> > > or by pattern like
> > >=20
> > >    --trace qmp:block-job-*
> > >=20
> > > or similarly with help of qmp command trace-event-set-state.
> > >=20
> > > This also allows to enable tracing of some qmp commands permanently
> > >   (by downstream patch or in libvirt xml). For example, I'm going to
> > > enable tracing of block job comamnds and blockdev-* commands in
> > > Virtuozzo. Qemu logs are often too empty (for example, in comparison
> > > with Libvirt), logging block jobs is not too much but will be very
> > > helpful.
> >=20
> > What exactly is traced?  Peeking at PATCH 5... looks like it's input
> > that makes it to qmp_dispatch() and command responses, but not events.
> >=20
> > Fine print on "input that makes it to qmp_dispatch()":
> >=20
> > * You trace right before we execute the command, not when we receive,
> >    parse and enqueue input.
> >=20
> > * Corollary: input with certain errors is not traced.
> >=20
> > * You don't trace the input text, you trace the unparsed parse tree.
> >=20
> > All fine, I presume.
> >=20
> > Existing tracepoints in monitor/qmp.c, and what information they send
> > (inessential bits omitted for clarity):
> >=20
> > * handle_qmp_command
> >=20
> >    Handling a QMP command: unparsed parse tree
> >=20
> >    Fine print, safe to ignore:
> >=20
> >    - Out-of-band commands will be executed right away, in-band commands
> >      will be queued.  Tracepoints monitor_qmp_in_band_enqueue and
> >      monitor_qmp_in_band_dequeue provide insight into that.
> >=20
> >    - This also receives and queues parse errors, without tracing them.
> >      Tracepoint monitor_qmp_err_in_band traces them as they are dequeue=
d.
> >=20
> > * monitor_qmp_cmd_in_band
> >=20
> >    About to execute in-band command: command ID, if any
> >=20
> > * monitor_qmp_cmd_out_of_band
> >=20
> >    About to execute out-of-band command: command ID, if any
> >=20
> > * monitor_qmp_respond
> >=20
> >    About to send command response or event: QObject
> >=20
> > For input, --trace qmp:* is like --trace handle_qmp_command, except it
> > traces late rather than early.
> >=20
> > For output, --trace qmp:* is like --trace monitor_qmp_respond less
> > events.
> >=20
> > The main improvement over existing tracepoints seems to be the ability
> > to filter on command names.
> >=20
> > To get that, you overload the @name argument of QMP command
> > trace-event-set-state.  In addition to the documented meaning "Event
> > name pattern", it also has an alternate, undocumented meaning "QMP
> > command name pattern".  The "undocumented" part is easy enough to fix.
> > However, QMP heavily frowns on argument values that need to be parsed.
>=20
> Still, pattern is parsed anyway, as pattern. But yes, this patch adds
> rather specific and tricky logic, which a lot more than just a pattern
> to search through the list.
>=20
> Another possible way is to update QAPI code generator to insert a persona=
l
> trace point for each qmp command.. That seems more complicated to impleme=
nt,
> but I can try.

That's what came to mind when I saw this series too. The QAPI generator
can create a trace event for each QMP command. That way each command has
a dedicated trace event that can be enabled/disabled in the usual way
(e.g. built-in "trace" monitor command, SystemTap scripts, etc) without
introducing special syntax.

Stefan

--qApJvWpCGOsz+sju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF2otUACgkQnKSrs4Gr
c8hKEgf/XaxAEljJADDJj6PhotepKP0D9ia5KrVWRZVFX0xxWiXrtZz0pKPcKGBj
7Ou689Bpp+jW6llzOmU2yWBh8ceRa8dU9Iyb5N57QUsi76XED4BPmSuT0Wn6c9cT
aCyGgPjYHDU/WSeqoN4sS+itjbBJgeJxXS09mBEKahGUkFi7Yri26yRZcsbhD4cY
pLrnDuxIGQWi9LdrPCV34aZJCfn7o1tQL1//r4yysstAG+GEyojsD9gXoqPbFH05
+Le7gCKpBU60wDlFvuhvlgK0AYLjkaCJpZ6H3ahq0o1x1z651uRs7renlSHuyS35
lpDQgZJ5+8Mi1oOjSGgypffSX5Q0sQ==
=zony
-----END PGP SIGNATURE-----

--qApJvWpCGOsz+sju--


