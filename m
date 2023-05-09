Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6CF6FC945
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:41:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOWQ-0007Ww-Sa; Tue, 09 May 2023 10:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pwOWN-0007Ns-7d
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:40:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pwOWL-0000nD-B7
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:40:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683643252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OFb6MU4VWIZg91LVYtec+Jbi7KtmBaVAzpeQsKK0cDE=;
 b=Y6c1mtrVZieQxsSImXivEIBh2Gc26wMEiiDfgWKFhj7YxjIhVMl68k5lS+PjSPKHwBvskz
 WCJ3xh+vfmJMfNsMEpLSAZf9JF9B46pz/pK9aJyocILKZNODZk45S2ZUbOhR2PeacwCdBD
 jAGTv4ftmKTXVrTl2WW44pO1hMxRaXw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-hAV8_nmUPp-d2E5Frj3_NA-1; Tue, 09 May 2023 10:40:49 -0400
X-MC-Unique: hAV8_nmUPp-d2E5Frj3_NA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F2BC18A6463;
 Tue,  9 May 2023 14:40:48 +0000 (UTC)
Received: from localhost (unknown [10.39.195.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F71C2026D16;
 Tue,  9 May 2023 14:40:46 +0000 (UTC)
Date: Tue, 9 May 2023 10:40:45 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mads Ynddal <mads@ynddal.dk>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Mads Ynddal <m.ynddal@samsung.com>
Subject: Re: [PATCH v2 06/12] simpletrace: Simplify construction of tracing
 methods
Message-ID: <20230509144045.GI1008478@fedora>
References: <20230502092339.27341-1-mads@ynddal.dk>
 <20230502092339.27341-7-mads@ynddal.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WqCZwgTgs/MPQ860"
Content-Disposition: inline
In-Reply-To: <20230502092339.27341-7-mads@ynddal.dk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--WqCZwgTgs/MPQ860
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2023 at 11:23:33AM +0200, Mads Ynddal wrote:
> From: Mads Ynddal <m.ynddal@samsung.com>
>=20
> By moving the dynamic argument construction to keyword-arguments,
> we can remove all of the specialized handling, and streamline it.
> If a tracing method wants to access these, they can define the
> kwargs, or ignore it be placing `**kwargs` at the end of the
> function's arguments list.
>=20
> Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
> ---
>  scripts/simpletrace.py | 84 ++++++++++++++++--------------------------
>  1 file changed, 32 insertions(+), 52 deletions(-)

This is nice but breaking existing analysis scripts should be avoided.

I suggest preserving the Analyzer class the way it is and adding a new
Analyzer2 class that follows the new method signature for trace event
methods.

>=20
> diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
> index 10ca093046..f6b40d56f6 100755
> --- a/scripts/simpletrace.py
> +++ b/scripts/simpletrace.py
> @@ -131,16 +131,25 @@ class Analyzer:
>      If a method matching a trace event name exists, it is invoked to pro=
cess
>      that trace record.  Otherwise the catchall() method is invoked.
> =20
> +    The methods are called with a set of keyword-arguments. These can be=
 ignored
> +    using `**kwargs` or defined like any keyword-argument.
> +
> +    The following keyword-arguments are available:
> +        event: Event object of current trace
> +        event_id: The id of the event in the current trace file
> +        timestamp_ns: The timestamp in nanoseconds of the trace
> +        pid: The process id recorded for the given trace
> +
>      Example:
>      The following method handles the runstate_set(int new_state) trace e=
vent::
> =20
> -      def runstate_set(self, new_state):
> +      def runstate_set(self, new_state, **kwargs):
>            ...
> =20
> -    The method can also take a timestamp argument before the trace event
> -    arguments::
> +    The method can also explicitly take a timestamp keyword-argument wit=
h the
> +    trace event arguments::
> =20
> -      def runstate_set(self, timestamp, new_state):
> +      def runstate_set(self, new_state, *, timestamp, **kwargs):
>            ...
> =20
>      Timestamps have the uint64_t type and are in nanoseconds.
> @@ -148,7 +157,7 @@ def runstate_set(self, timestamp, new_state):
>      The pid can be included in addition to the timestamp and is useful w=
hen
>      dealing with traces from multiple processes::
> =20
> -      def runstate_set(self, timestamp, pid, new_state):
> +      def runstate_set(self, new_state, *, timestamp, pid, **kwargs):
>            ...
>      """
> =20
> @@ -156,7 +165,7 @@ def __enter__(self):
>          """Called at the start of the trace."""
>          return self
> =20
> -    def catchall(self, event, rec):
> +    def catchall(self, *rec_args, event, timestamp_ns, pid, event_id):
>          """Called if no specific method for processing a trace event has=
 been found."""
>          pass
> =20
> @@ -189,34 +198,11 @@ def process(events, log, analyzer_class, read_heade=
r=3DTrue):
>          for event_id, event in enumerate(events):
>              event_id_to_name[event_id] =3D event.name
> =20
> -    def build_fn(analyzer, event):
> -        if isinstance(event, str):
> -            return analyzer.catchall
> -
> -        fn =3D getattr(analyzer, event.name, None)
> -        if fn is None:
> -            return analyzer.catchall
> -
> -        event_argcount =3D len(event.args)
> -        fn_argcount =3D len(inspect.getfullargspec(fn)[0]) - 1
> -        if fn_argcount =3D=3D event_argcount + 1:
> -            # Include timestamp as first argument
> -            return lambda _, rec: fn(*(rec[1:2] + rec[3:3 + event_argcou=
nt]))
> -        elif fn_argcount =3D=3D event_argcount + 2:
> -            # Include timestamp and pid
> -            return lambda _, rec: fn(*rec[1:3 + event_argcount])
> -        else:
> -            # Just arguments, no timestamp or pid
> -            return lambda _, rec: fn(*rec[3:3 + event_argcount])
> -
>      with analyzer_class() as analyzer:
> -        fn_cache =3D {}
> -        for rec in read_trace_records(event_mapping, event_id_to_name, l=
og):
> -            event_num =3D rec[0]
> -            event =3D event_mapping[event_num]
> -            if event_num not in fn_cache:
> -                fn_cache[event_num] =3D build_fn(analyzer, event)
> -            fn_cache[event_num](event, rec)
> +        for event_id, timestamp_ns, record_pid, *rec_args in read_trace_=
records(event_mapping, event_id_to_name, log):
> +            event =3D event_mapping[event_id]
> +            fn =3D getattr(analyzer, event.name, analyzer.catchall)
> +            fn(*rec_args, event=3Devent, event_id=3Devent_id, timestamp_=
ns=3Dtimestamp_ns, pid=3Drecord_pid)
> =20
> =20
>  def run(analyzer):
> @@ -240,24 +226,18 @@ def run(analyzer):
>  if __name__ =3D=3D '__main__':
>      class Formatter(Analyzer):
>          def __init__(self):
> -            self.last_timestamp =3D None
> -
> -        def catchall(self, event, rec):
> -            timestamp =3D rec[1]
> -            if self.last_timestamp is None:
> -                self.last_timestamp =3D timestamp
> -            delta_ns =3D timestamp - self.last_timestamp
> -            self.last_timestamp =3D timestamp
> -
> -            fields =3D [event.name, '%0.3f' % (delta_ns / 1000.0),
> -                      'pid=3D%d' % rec[2]]
> -            i =3D 3
> -            for type, name in event.args:
> -                if is_string(type):
> -                    fields.append('%s=3D%s' % (name, rec[i]))
> -                else:
> -                    fields.append('%s=3D0x%x' % (name, rec[i]))
> -                i +=3D 1
> -            print(' '.join(fields))
> +            self.last_timestamp_ns =3D None
> +
> +        def catchall(self, *rec_args, event, timestamp_ns, pid, event_id=
):
> +            if self.last_timestamp_ns is None:
> +                self.last_timestamp_ns =3D timestamp_ns
> +            delta_ns =3D timestamp_ns - self.last_timestamp_ns
> +            self.last_timestamp_ns =3D timestamp_ns
> +
> +            fields =3D [
> +                f'{name}=3D{r}' if is_string(type) else f'{name}=3D0x{r:=
x}'
> +                for r, (type, name) in zip(rec_args, event.args)
> +            ]
> +            print(f'{event.name} {delta_ns / 1000:0.3f} {pid=3D} ' + ' '=
=2Ejoin(fields))
> =20
>      run(Formatter())
> --=20
> 2.38.1
>=20

--WqCZwgTgs/MPQ860
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRaW20ACgkQnKSrs4Gr
c8gs/QgAikGy/W2aJjnMP5xoH0SU7jccBQQh4fcTDhlUjfWAXZPtyICYALN7xovl
4NVYybQnUqidPNGbYbXE2ZHl/pJ8nQ5Xeh8Bm3+DNgPbG31YoBh6uf+46zoTd8Rp
wU8eciu0qvaDB4dKPLeJ5yowW2k6KZuw6sSnIISlHqxK058NW7fjD0l0kNFNLe+/
YuWGKVn6XvJ0j03FEcocFhbTe4tdCDhjifHAFbIe9g7DrDj4T/AanDwzsVXIMFDp
GnyYgNuVFuVpSBMCAcQwlRAdMWF9YoJ+Pp3xkqCVIhbn4Rkp6EUd8PAHGr22dcmC
+coWlQh+4tJb6YmnWcg19u4NhAjpHA==
=5Kk/
-----END PGP SIGNATURE-----

--WqCZwgTgs/MPQ860--


