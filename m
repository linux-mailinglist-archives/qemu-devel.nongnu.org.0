Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FEA399DF1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:40:22 +0200 (CEST)
Received: from localhost ([::1]:37634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojpt-0003fX-9E
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lojow-0002yU-90
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:39:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lojou-0007BH-E0
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:39:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622713159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sRKRDDjYP57b8nHCpeThdOP672Ui6vxdL4bvIuFlG+c=;
 b=hxE2YFFUr1Broye0riAETDQgpVRDdIKAjis4uQv/G/eUFHfVwURtgA+Ww+Q2bIdGHuqdi7
 /O1lQxIRvZNARWpTbmc0ZZU3wJCFdDqoApM/uE6WfJPzkXQq57srEEQVvokb0PxnFhOpl8
 aSucZUaiXNmXkWZtVVoak9flizSVhk8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-jvM8nyGIMW21KHntX8XXBw-1; Thu, 03 Jun 2021 05:39:16 -0400
X-MC-Unique: jvM8nyGIMW21KHntX8XXBw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66F64801E70;
 Thu,  3 Jun 2021 09:39:15 +0000 (UTC)
Received: from localhost (ovpn-114-228.ams2.redhat.com [10.36.114.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBC145D74B;
 Thu,  3 Jun 2021 09:39:14 +0000 (UTC)
Date: Thu, 3 Jun 2021 10:39:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH v2 2/3] plugins: cache: Enabled parameterization and
 added trace printing
Message-ID: <YLijQSdFDdIjQFnz@stefanha-x1.localdomain>
References: <20210530063712.6832-1-ma.mandourr@gmail.com>
 <20210530063712.6832-3-ma.mandourr@gmail.com>
 <877djdddri.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <877djdddri.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PqNRNnP4CtwoP8ty"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--PqNRNnP4CtwoP8ty
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 12:18:58PM +0100, Alex Benn=E9e wrote:
> > +    if (tracefile) {
> > +        g_mutex_lock(&fmtx);
> > +        g_autoptr(GString) rep =3D g_string_new("");
> > +        bool is_store =3D qemu_plugin_mem_is_store(info);
> > +        g_string_append_printf(rep, "%c: 0x%" PRIx64,
> > +                is_store ? 'S' : 'L', effective_addr);
> > +        fprintf(tracefile, "%s\n", rep->str);
> > +        g_mutex_unlock(&fmtx);
> > +    }
>=20
> I can see this would be useful for debugging but I'm wary of adding
> ad-hoc tracing formats when QEMU already has support for a wide range of
> tracing formats. We discussed this a bit in:
>=20
>   Subject: trace_FOO_tcg bit-rotted?
>   Date: Tue, 06 Apr 2021 17:00:20 +0100
>   Message-ID: <87eefnwd0l.fsf@linaro.org>
>=20
> However I don't know how easy it would be to leverage the existing
> tracing infrastructure from inside a plugin. As I understand it QEMU
> currently builds a static list of trace points during the build so maybe
> we would need additional infrastructure for a plugin to register a trace
> point and for the final output to be use-able. For example the binary
> trace output I think still needs to reference the source trace-events
> file?
>=20
> So that's not a NACK but maybe we could spend a little time working out
> if we can come up with a cleaner solution?
>=20
> Stefan, any thoughts?

QEMU's tracing system requires knowledge of all trace events at QEMU
compilation time. If the plugins are built together with QEMU then it
should be possible to give them their own trace-events files.

If not then I'm afraid it would be tricky to integrate into QEMU's
tracing system.

Stefan

--PqNRNnP4CtwoP8ty
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmC4o0EACgkQnKSrs4Gr
c8iX8gf/Z9+maHx55rNVCkn3zagNvwXO9a2HtS6W6loyhIhEzg1BUugaLxZqUbaX
cNKTboEyH6G3dWIzKscalPO5MTHrn+b8gVOAUprTkulNtdyFxRkywtASM6YdrSL/
hECd1ewEdUB5e/cJVYJIg1bwSOjfyyGKSZToXNSpSE3ykcfKjjI1P0+7Y5yRMo6o
By68+aNqx8oBris/RHhWhUkE7DOPnnoa5iZAm/pUfXKmkKMAiqIXF5UMGBLcpGJN
KVurBJiNEd07dxlkQAO+BPAcqF3vV5MKZj1ktfqh3nmgTfGpMUTH44XAiSYfjGmT
gVuUmu3nDSckev57k9QBCm+xNquJew==
=3aS4
-----END PGP SIGNATURE-----

--PqNRNnP4CtwoP8ty--


