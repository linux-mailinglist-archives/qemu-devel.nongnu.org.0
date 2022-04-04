Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001764F120D
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 11:32:40 +0200 (CEST)
Received: from localhost ([::1]:33042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbJ4i-0005IQ-2q
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 05:32:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nbJ1q-0004Cw-Fa
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 05:29:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nbJ1n-0008B7-LW
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 05:29:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649064575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A4LDBX4veM082yYaBtLWxx1y26kXxW94wd+E48y9LeQ=;
 b=hOyx/jbqXloNdcRTmm2jmkeZ9MzPAepc5ce26JQHhh3tPuFnudmtftOuJpOiU0XVlEAfPv
 ZfdE3f3FeD0inJqIYerpXEpG0XfyARRCQ3sOCAYuL5ivP3TmisY+Ss8DUBW0FdNYTiDkMf
 RRX+0W3QcMl1ubVGrYmnv03Zjq4Itx4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-UzoFOubiNV-UCPk9haaPOg-1; Mon, 04 Apr 2022 05:29:31 -0400
X-MC-Unique: UzoFOubiNV-UCPk9haaPOg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60B62100BAA3;
 Mon,  4 Apr 2022 09:29:31 +0000 (UTC)
Received: from localhost (unknown [10.39.194.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E245B404D91D;
 Mon,  4 Apr 2022 09:29:30 +0000 (UTC)
Date: Mon, 4 Apr 2022 10:29:29 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [PATCH v4 0/4] util/thread-pool: Expose minimun and maximum size
Message-ID: <Ykq6edsYQjtdEzcz@stefanha-x1.localdomain>
References: <20220401093523.873508-1-nsaenzju@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uSw1jSl4GsrPVjWS"
Content-Disposition: inline
In-Reply-To: <20220401093523.873508-1-nsaenzju@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, eduardo@habkost.net,
 hreitz@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--uSw1jSl4GsrPVjWS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 01, 2022 at 11:35:20AM +0200, Nicolas Saenz Julienne wrote:
> As discussed on the previous RFC[1] the thread-pool's dynamic thread
> management doesn't play well with real-time and latency sensitive
> systems. This series introduces a set of controls that'll permit
> achieving more deterministic behaviours, for example by fixing the
> pool's size.
>=20
> We first introduce a new common interface to event loop configuration by
> moving iothread's already available properties into an abstract class
> called 'EventLooopBackend' and have both 'IOThread' and the newly
> created 'MainLoop' inherit the properties from that class.
>=20
> With this new configuration interface in place it's relatively simple to
> introduce new options to fix the even loop's thread pool sizes. The
> resulting QAPI looks like this:
>=20
>     -object main-loop,id=3Dmain-loop,thread-pool-min=3D1,thread-pool-max=
=3D1
>=20
> Note that all patches are bisect friendly and pass all the tests.
>=20
> [1] https://patchwork.ozlabs.org/project/qemu-devel/patch/20220202175234.=
656711-1-nsaenzju@redhat.com/
>=20
> @Stefan I kept your Signed-off-by, since the changes trivial/not
> thread-pool related

Looks good to me. I will wait for Markus to review the QAPI schema changes.

Stefan

--uSw1jSl4GsrPVjWS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJKunkACgkQnKSrs4Gr
c8jE7Qf9GpbPRhLPXm9ahem5rZlbnjhZjWPsofzs1d2108ei2g0p3z9byIdJmi/c
xsvQqDsMpHk0ttUAiLi4++2TkF2O0mqRZWog1Be4ypyVC20Cne6qg78PIlkcArKE
lTsYLMabN2Qe9jONOx3avo+/rKlsA4nQAGcTl3Pkd/0DBs30VlRFQN422ZWE/cBx
yQCdJemvHHH+qH99kkbfPzwhzUXgvM01YFLvv2mlYHFXdqChtlOCa2FUV33KtE86
puOaMtyGooHdHVZ4M3UGo65TJyhMrwaGi16vLLWLuXM4cBhK73TPbfARF+gwYdTJ
BqIr//R+dtclbYxZqAnXmR9zWfvulQ==
=7xE/
-----END PGP SIGNATURE-----

--uSw1jSl4GsrPVjWS--


