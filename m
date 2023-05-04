Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6874D6F71B9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 20:05:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pudIr-0003Ff-J9; Thu, 04 May 2023 14:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pudIl-0003F3-WC
 for qemu-devel@nongnu.org; Thu, 04 May 2023 14:03:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pudIk-0001Ho-7e
 for qemu-devel@nongnu.org; Thu, 04 May 2023 14:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683223412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lqk3+WUdIi/K/LjWRmFo4MpiOQdPQ4KQ8NjHvYUgM7M=;
 b=W3Wt5hm4fZgyf8+SCnTpBk8tmQUZ1SG1KJTahhWj52RkMBKco4D0nPvWRspAbxGHpgODYt
 Ch/leJktUfjYFDVUuWeOM8iIMaLLdITNSzaUuGAYqG3KOoucLJ56ZYUo789KzAOZAfs1Jg
 87Qvme89D1XxdeG/e8stqvJb0WKVFOc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-jHzHBwKZOl2mUNTIrE8GhA-1; Thu, 04 May 2023 14:03:29 -0400
X-MC-Unique: jHzHBwKZOl2mUNTIrE8GhA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C69F8884EC0;
 Thu,  4 May 2023 18:03:28 +0000 (UTC)
Received: from localhost (unknown [10.39.192.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35FBE63F3E;
 Thu,  4 May 2023 18:03:27 +0000 (UTC)
Date: Thu, 4 May 2023 14:03:26 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mads Ynddal <mads@ynddal.dk>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Mads Ynddal <m.ynddal@samsung.com>
Subject: Re: [PATCH v2 01/12] simpletrace: Improve parsing of sys.argv; fix
 files never closed.
Message-ID: <20230504180326.GB581920@fedora>
References: <20230502092339.27341-1-mads@ynddal.dk>
 <20230502092339.27341-2-mads@ynddal.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5lewJGDlNU/phCka"
Content-Disposition: inline
In-Reply-To: <20230502092339.27341-2-mads@ynddal.dk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--5lewJGDlNU/phCka
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2023 at 11:23:28AM +0200, Mads Ynddal wrote:
> From: Mads Ynddal <m.ynddal@samsung.com>
>=20
> The arguments extracted from `sys.argv` named and unpacked to make it
> clear what the arguments are and what they're used for.
>=20
> The two input files were opened, but never explicitly closed. File usage
> changed to use `with` statement to take care of this. At the same time,
> ownership of the file-object is moved up to `run` function. Secondary `op=
en`
> inside `process` removed so there's only one place to handle `open`.
>=20
> Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
> ---
>  scripts/simpletrace.py | 28 +++++++++++-----------------
>  1 file changed, 11 insertions(+), 17 deletions(-)
>=20
> diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
> index 1f6d1ae1f3..9211caaec1 100755
> --- a/scripts/simpletrace.py
> +++ b/scripts/simpletrace.py
> @@ -9,6 +9,7 @@
>  #
>  # For help see docs/devel/tracing.rst
> =20
> +import sys
>  import struct
>  import inspect
>  from tracetool import read_events, Event
> @@ -44,7 +45,6 @@ def get_record(edict, idtoname, rechdr, fobj):
>          try:
>              event =3D edict[name]
>          except KeyError as e:
> -            import sys
>              sys.stderr.write('%s event is logged but is not declared ' \
>                               'in the trace events file, try using ' \
>                               'trace-events-all instead.\n' % str(e))
> @@ -166,11 +166,6 @@ def end(self):
> =20
>  def process(events, log, analyzer, read_header=3DTrue):
>      """Invoke an analyzer on each event in a log."""
> -    if isinstance(events, str):
> -        events =3D read_events(open(events, 'r'), events)
> -    if isinstance(log, str):
> -        log =3D open(log, 'rb')
> -
>      if read_header:
>          read_trace_header(log)

simpletrace.py is both a command-line tool and a Python module. The
Python module has a public API that people's scripts may rely on. Let's
avoid breaking API changes unless necessary so that existing scripts
that import simpletrace continue to work.

It's not very clear what is a public API in simpletrace.py, the file
should really have __all__ =3D ['Analyzer', 'process', 'run'].
Nevertheless, Analyzer's doc comments mention process() and the
process() function itself also has doc comments, so it's a public API.

Please drop this change to avoid breaking the public API.

> =20
> @@ -223,19 +218,18 @@ def run(analyzer):
> =20
>      This function is useful as a driver for simple analysis scripts.  Mo=
re
>      advanced scripts will want to call process() instead."""
> -    import sys
> -
> -    read_header =3D True
> -    if len(sys.argv) =3D=3D 4 and sys.argv[1] =3D=3D '--no-header':
> -        read_header =3D False
> -        del sys.argv[1]
> -    elif len(sys.argv) !=3D 3:
> -        sys.stderr.write('usage: %s [--no-header] <trace-events> ' \
> -                         '<trace-file>\n' % sys.argv[0])
> +
> +    try:
> +        # NOTE: See built-in `argparse` module for a more robust cli int=
erface
> +        *no_header, trace_event_path, trace_file_path =3D sys.argv[1:]
> +        assert no_header =3D=3D [] or no_header =3D=3D ['--no-header'], =
'Invalid no-header argument'
> +    except (AssertionError, ValueError):
> +        sys.stderr.write(f'usage: {sys.argv[0]} [--no-header] <trace-eve=
nts> <trace-file>\n')
>          sys.exit(1)
> =20
> -    events =3D read_events(open(sys.argv[1], 'r'), sys.argv[1])
> -    process(events, sys.argv[2], analyzer, read_header=3Dread_header)
> +    with open(trace_event_path, 'r') as events_fobj, open(trace_file_pat=
h, 'rb') as log_fobj:
> +        events =3D read_events(events_fobj, trace_event_path)
> +        process(events, log_fobj, analyzer, read_header=3Dnot no_header)
> =20
>  if __name__ =3D=3D '__main__':
>      class Formatter(Analyzer):
> --=20
> 2.38.1
>=20

--5lewJGDlNU/phCka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRT824ACgkQnKSrs4Gr
c8hl+Qf+Nb8fQdHDdI5RwM9yR2VhuPZKcWrq/5OiJDNcQ+hvJWdj5+ND8IE9O9yL
LndbO7OxpFGPV7g3FD3xJt6LN7eqnUKEsdQVv0z4Ga1JIPAfhaiHWbZnstGdqFRh
xlkb/aswSXyNtYpu/7ILReNvm0XhDjFw4LQ3Gmcr0e3BwAghxJYus0T+mqH1z3ec
STCalyYak3rT760F/dkFnqb6IpUcx0uKvnLSwoU+NwqqshltcZo0JBUgTSQBvO0y
izYS9y6Yai6ZYsb7wAwNxywD0fnTAPxS0M2CpZ9WM4PljQsOa9x5hS1mp9TsZ0VQ
RNCqm2VtuXVc6dSftmY6hVZT/etDBg==
=RoQu
-----END PGP SIGNATURE-----

--5lewJGDlNU/phCka--


