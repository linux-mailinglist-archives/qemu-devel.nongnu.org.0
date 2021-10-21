Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B687C436488
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 16:40:51 +0200 (CEST)
Received: from localhost ([::1]:56258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdZFS-00055a-Sl
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 10:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZAn-0007z0-Fp
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 10:36:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZAl-0007y9-KJ
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 10:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634826959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6/xNXDbI0drC03++bG5zvrC3j6ieOcFXeV7dD8JFj18=;
 b=K8B/XH7O3yNLdMsUnGJsRT67yyhRA+tQP3w1lC4uzcU1+1jkWYZpZXItdUsr71Z+aUgy6R
 c3RKKf79zwri7JP9+h0hzso4lFAhl/CAIfQG2Cn3uFGJo8UNFS+WuGqpvfBeFtlygepaGz
 RnEQyBf5yQ58H/pVQFByWiWfG4vuAJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-1GqE0QjzOPq5TuNpc7v35w-1; Thu, 21 Oct 2021 10:35:25 -0400
X-MC-Unique: 1GqE0QjzOPq5TuNpc7v35w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3640018D6A2A;
 Thu, 21 Oct 2021 14:35:24 +0000 (UTC)
Received: from localhost (unknown [10.39.195.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF5095F4F5;
 Thu, 21 Oct 2021 14:35:23 +0000 (UTC)
Date: Thu, 21 Oct 2021 15:35:22 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v3 11/25] include/block/blockjob.h: global state API
Message-ID: <YXF6qlPaM+DtarxT@stefanha-x1.localdomain>
References: <20211012084906.2060507-1-eesposit@redhat.com>
 <20211012084906.2060507-12-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211012084906.2060507-12-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gfyCoMUjrSEfi+PL"
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--gfyCoMUjrSEfi+PL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 12, 2021 at 04:48:52AM -0400, Emanuele Giuseppe Esposito wrote:
> blockjob functions run always under the BQL lock.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/block/blockjob.h | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--gfyCoMUjrSEfi+PL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFxeqoACgkQnKSrs4Gr
c8iM8wf8CZMH6Jnh8+FhkZPlU6/RT6ltTzl3x4wUSNWTU9yf53MWWMtIUUOBwb2Q
DXf1vHN0bNLJqbxpebSCZ05dFLJXBidXVANCX936deIUiBfMc5qJSg9YlLfmXwLn
7a2BU3XZSJBKneB34i5c4OxNObC4KvdXs53n/mU+Q5Q8WXfCDLH11m7uYSqiwYOC
iJaRfx3pvcU1Pbd5xbuAw8apukZmhVONeTCVbD1iKbzYbDZ7bI841eytEYPGjf9C
Aq8EFsf/7VFBeYviIDs/P2eqU26n3p3n8UMpdn0B74DRe3Hw94GUdKTV55wPY2+g
rfCpvUkVtT+JRUrsliYh2wCQskw/pw==
=hylr
-----END PGP SIGNATURE-----

--gfyCoMUjrSEfi+PL--


