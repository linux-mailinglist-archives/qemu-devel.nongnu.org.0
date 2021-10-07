Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1359425584
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 16:34:00 +0200 (CEST)
Received: from localhost ([::1]:43274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYUTA-0005FM-08
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 10:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYURn-000348-Ts
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:32:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYURi-0004AF-2i
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:32:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633617146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z+ZcbRLB/LMJVM+NW3XI3xhBdpFXVMZ7OtSLMQwQM10=;
 b=a5Cg/a4HRx7n048rpc/DULULUgihLpHeNAwNi4n1yhbNWl0DjWiA68998aHFZb4ZoH60Tg
 42AAS1csAyREmio9uMmxjHlikxSAfKOi/dGaIimbqgKIrFprumsqKWRdSh/6rbOqdamedR
 GwZstcXBFe/URYuGRC8cTLNi5kLzufs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-W7zhfaH-ObKLDHwwRJ2gtw-1; Thu, 07 Oct 2021 10:32:23 -0400
X-MC-Unique: W7zhfaH-ObKLDHwwRJ2gtw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DA0984A5E9;
 Thu,  7 Oct 2021 14:32:22 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57C605BAE7;
 Thu,  7 Oct 2021 14:32:12 +0000 (UTC)
Date: Thu, 7 Oct 2021 15:32:11 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 16/25] block/backup-top.h: global state API +
 assertions
Message-ID: <YV8E64yOUt+Zf6vh@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-17-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-17-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3R/M+RReYJQH/Ymh"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

--3R/M+RReYJQH/Ymh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 10:32:06AM -0400, Emanuele Giuseppe Esposito wrote:
> backup-top functions always run under BQL lock.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/backup-top.c |  2 ++
>  block/backup-top.h | 11 +++++++++++
>  2 files changed, 13 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--3R/M+RReYJQH/Ymh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFfBOsACgkQnKSrs4Gr
c8hFCgf/Xn5kHeK7LxCAzfepCEhSFwVDWCcHMgNlVjt/hjJNWcbbMPnYNQhKKs3Z
fvjTG5jUsdwLckD0U6yTab1swbLAUXSV2vWRM3NTrzXnb+Q1yB65qdCrC1PUsAAS
/3x+ckFoOvjO7HZvdyPyxsBOlRF5XlSh+oyV3HWyoPtDvqENXebb5GsiIaWdMiDz
Jgpc5JoXMHK2nHMlR0K30ajNvq9VxFntC6fSl8RwRe+RHY08zZRJOZZRsHGvaUj8
5T6Eb1SHJf/Fegsdt46WuzRorLoG3n8JDdxGOY5ij0ZNztLHcbapRhaYzPtmU82c
wvf+W5G3530NnhHMXsAxvPkeAbUCSA==
=Zo1V
-----END PGP SIGNATURE-----

--3R/M+RReYJQH/Ymh--


