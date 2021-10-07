Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7DE42517E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 12:50:36 +0200 (CEST)
Received: from localhost ([::1]:56232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYQyx-0007k3-EO
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 06:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYQwh-0005SZ-0t
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:48:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYQwd-0001po-LT
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:48:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633603691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FunpTIL/ax56/F1FeI9BpiYMIcTMIPBuWxuILvuFVZA=;
 b=PuW8zxsLUClN3uZhZoEFhjbfaXmxlNiPIaUI+bNBB1OGRGHe2JXZdyCv7cTzwgg/rQMDOJ
 zSWOzJOz0EMIUyTW1qKBwILqwT8La7ht4gKpDAg6Lcl3narE3FVIdujT2EalWCvDuq11vK
 asU0L7qP8eyNotcHQ932tI6nTPBfUpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-Rnw34c9jMMefKUcUPdOZEg-1; Thu, 07 Oct 2021 06:48:07 -0400
X-MC-Unique: Rnw34c9jMMefKUcUPdOZEg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B307119253C8;
 Thu,  7 Oct 2021 10:48:06 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 519E85D740;
 Thu,  7 Oct 2021 10:48:04 +0000 (UTC)
Date: Thu, 7 Oct 2021 11:48:03 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 03/25] block/block-backend.c: assertions for
 block-backend
Message-ID: <YV7QYzJCgH0SC5/q@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-4-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-4-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dlWi4tBjfdHxBGiW"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.05, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--dlWi4tBjfdHxBGiW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 10:31:53AM -0400, Emanuele Giuseppe Esposito wrote:
> All the global state (GS) API functions will check that
> qemu_in_main_thread() returns true. If not, it means
> that the safety of BQL cannot be guaranteed, and
> they need to be moved to I/O.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/block-backend.c  | 89 +++++++++++++++++++++++++++++++++++++++++-
>  softmmu/qdev-monitor.c |  2 +
>  2 files changed, 90 insertions(+), 1 deletion(-)

Modulo Eric's comment:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--dlWi4tBjfdHxBGiW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFe0GMACgkQnKSrs4Gr
c8i++QgAjhRB0UYLDiVs0z0C+4rqjWajnUjAVomj8mdQgOaaxvqa0xUTaaUVBPmJ
F4poJ7CoVx0Y1/m/E4/JiwWgWr+Mrb0DlxxitFWAWR/QIBNEHsOeFj4yjh28Swj+
R7jWZPPElLNXiKXiy/3nI5dGHn9qf66goikmmr5IrJNRbCPvdeCgGjBsA4xOfZKa
jBsk9u9A5MRrtlfRT+zPnGoYIY3UVj0ZsIzmqqfRiYnWHVTw/WOkGf36YJxh/Pay
pqSWsjrryTaa3WEbC556+QzPJyf1ITetNtvbUWbaBN6BMLVGjG1cCD5H7YefTWdJ
84LF9EDnw5rOvjeKx/3dNst45dmSeA==
=g2ty
-----END PGP SIGNATURE-----

--dlWi4tBjfdHxBGiW--


