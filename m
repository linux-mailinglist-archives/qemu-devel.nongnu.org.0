Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD506FC941
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:41:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOVw-0006Du-Hq; Tue, 09 May 2023 10:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pwOVo-00064H-Oz
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:40:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pwOVe-0000RJ-5C
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:40:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683643208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yRGdnBrikD5zWXjOu9JsNKjklL6n2i81Q1Bg9k0ULUc=;
 b=cMTVQZl6mSk/mSaazTu+X/hMGi83gsVvaXHgIDnJFVhxoLUHW+f/XBR0//DQLh2B1x2XOs
 GATBVO0FURyDvACQG/VBdXewO780vPLHfBVmW8qlzfpxd/Jd8zvNVDMEHQjrms3YwbRxMg
 MYlfyVg/4RMo2PCkvxxCgmFDJYYHvjc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-u0IoEXHIPiCBCG3Xb2kN3A-1; Tue, 09 May 2023 10:40:07 -0400
X-MC-Unique: u0IoEXHIPiCBCG3Xb2kN3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B220A885628;
 Tue,  9 May 2023 14:40:06 +0000 (UTC)
Received: from localhost (unknown [10.39.195.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1775263F84;
 Tue,  9 May 2023 14:40:05 +0000 (UTC)
Date: Tue, 9 May 2023 10:40:04 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mads Ynddal <mads@ynddal.dk>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Mads Ynddal <m.ynddal@samsung.com>
Subject: Re: [PATCH v2 05/12] simpletrace: Changed Analyzer class to become
 context-manager
Message-ID: <20230509144004.GH1008478@fedora>
References: <20230502092339.27341-1-mads@ynddal.dk>
 <20230502092339.27341-6-mads@ynddal.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HaUXuIZmA7wrgRZO"
Content-Disposition: inline
In-Reply-To: <20230502092339.27341-6-mads@ynddal.dk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


--HaUXuIZmA7wrgRZO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2023 at 11:23:32AM +0200, Mads Ynddal wrote:
> From: Mads Ynddal <m.ynddal@samsung.com>
>=20
> Instead of explicitly calling `begin` and `end`, we can change the class
> to use the context-manager paradigm. This is mostly a styling choice,
> used in modern Python code. But it also allows for more advanced analyzers
> to handle exceptions gracefully in the `__exit__` method (not
> demonstrated here).
>=20
> Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
> ---
>  scripts/simpletrace.py | 40 +++++++++++++++++++++++-----------------
>  1 file changed, 23 insertions(+), 17 deletions(-)
>=20
> diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
> index 7444a6e090..10ca093046 100755
> --- a/scripts/simpletrace.py
> +++ b/scripts/simpletrace.py
> @@ -121,12 +121,12 @@ def read_trace_records(event_mapping, event_id_to_n=
ame, fobj):
> =20
>              yield rec
> =20
> -class Analyzer(object):
> +class Analyzer:
>      """A trace file analyzer which processes trace records.
> =20
> -    An analyzer can be passed to run() or process().  The begin() method=
 is
> -    invoked, then each trace record is processed, and finally the end() =
method
> -    is invoked.
> +    An analyzer can be passed to run() or process().  The __enter__() me=
thod is
> +    invoked when opening the analyzer using the `with` statement, then e=
ach trace
> +    record is processed, and finally the __exit__() method is invoked.

Bearing in mind compatibility with existing simpletrace analysis
scripts, how about the following default method implementations?

  def __enter__(self):
      self.begin()

  def __exit__(self, exc_type, exc_val, exc_tb):
      if exc_type is None:
          self.end()
      return False

Now simpletrace.py can switch to using the context manager and new
scripts can implement __enter__()/__exit__(), while old scripts continue
to work.

> =20
>      If a method matching a trace event name exists, it is invoked to pro=
cess
>      that trace record.  Otherwise the catchall() method is invoked.
> @@ -152,19 +152,25 @@ def runstate_set(self, timestamp, pid, new_state):
>            ...
>      """
> =20
> -    def begin(self):
> +    def __enter__(self):
>          """Called at the start of the trace."""
> -        pass
> +        return self
> =20
>      def catchall(self, event, rec):
>          """Called if no specific method for processing a trace event has=
 been found."""
>          pass
> =20
> -    def end(self):
> +    def __exit__(self, _type, value, traceback):
>          """Called at the end of the trace."""
>          pass
> =20
> -def process(events, log, analyzer, read_header=3DTrue):
> +    def __call__(self):
> +        """Fix for legacy use without context manager.
> +        We call the provided object in `process` regardless of it being =
the object-type or instance.
> +        With this function, it will work in both cases."""
> +        return self
> +
> +def process(events, log, analyzer_class, read_header=3DTrue):

Please don't change the function signature since this is a public method
and we should avoid breaking existing callers when possible.

Instead of:

  with analyzer_class() as analyzer:

we can use:

  with analyzer:
      ...

--HaUXuIZmA7wrgRZO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRaW0QACgkQnKSrs4Gr
c8hZiAgAvbQmHjIzu4I0OHHhSJUL9XqXrkO+2irnc1HRV5EEOpe+zk+B8OO+Uq10
2w8Hsg3ONlnADFyPkvTQQJZFep8j2TEUvWyo5t6pxyr3fGr7Gn4A7vdgo3rSKfrx
S/LIIRfnV6HLN9wudy8GkAjb1tCzASyAD59v113CxA5PO5BmYqInap+qZReCBs9k
lZffTGOBJMGd2Te2PejPcCamv3oQqlXpc7bShmmmy2QYDOYPTIcP0fS1Tr62FYP6
azu5zr8BIthvawp8ZtT6gNqj1bC4tLzcsdgyAzGR02nIomxZ79QqE4IczY6/sgjc
qkiqssSPgntxrHMU9hV3SNV92/88DQ==
=AEE9
-----END PGP SIGNATURE-----

--HaUXuIZmA7wrgRZO--


