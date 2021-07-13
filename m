Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704DC3C7469
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:23:52 +0200 (CEST)
Received: from localhost ([::1]:54504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LCJ-0003qP-FN
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3L7u-0003g5-4e
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:19:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3L7r-0006t5-RU
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626193155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iDOsa+YZklmppSeTxiW3ulwDrygNecVSrhdB1n/I3a8=;
 b=SOoX6tMfX4k+23YLezan5iVu0l50be0AlR3zE4Q8grpofkPxXzj2aCrLuiQOhOLDc1DmX0
 3whwv/ZFO7qSw7Yzf4OE9/NoKjvvbDyfboi57dO6ntJPZb5Zd4abLV6oB3JljUhX22bo3m
 WYdjJIoPpDKE6SNnc4x5E8SBOik1I8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-B6fmKCoyNsyKmzbj52J81w-1; Tue, 13 Jul 2021 12:19:11 -0400
X-MC-Unique: B6fmKCoyNsyKmzbj52J81w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF3F0802C88;
 Tue, 13 Jul 2021 16:19:10 +0000 (UTC)
Received: from localhost (ovpn-112-172.ams2.redhat.com [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2345110016FD;
 Tue, 13 Jul 2021 16:19:06 +0000 (UTC)
Date: Tue, 13 Jul 2021 15:51:15 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 2/3] iothread: add aio-max-batch parameter
Message-ID: <YO2oY/OObOC9Io1e@stefanha-x1.localdomain>
References: <20210707150019.201442-1-sgarzare@redhat.com>
 <20210707150019.201442-3-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707150019.201442-3-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7mHlAADOAiYD8Gxb"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--7mHlAADOAiYD8Gxb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 07, 2021 at 05:00:18PM +0200, Stefano Garzarella wrote:
> diff --git a/qapi/misc.json b/qapi/misc.json
> index 156f98203e..f64bb69f74 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -86,6 +86,9 @@
>  # @poll-shrink: how many ns will be removed from polling time, 0 means t=
hat
>  #               it's not configured (since 2.9)
>  #
> +# @aio-max-batch: maximum number of requests in a bacth for the AIO engi=
ne,

s/bacth/batch/

> +#                 0 means that the engine will use its default (since 6.=
1)
> +#
>  # Since: 2.0
>  ##
>  { 'struct': 'IOThreadInfo',
> @@ -93,7 +96,8 @@
>             'thread-id': 'int',
>             'poll-max-ns': 'int',
>             'poll-grow': 'int',
> -           'poll-shrink': 'int' } }
> +           'poll-shrink': 'int',
> +           'aio-max-batch': 'int' } }
> =20
>  ##
>  # @query-iothreads:
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 652be317b8..23fd586614 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -516,12 +516,17 @@
>  #               algorithm detects it is spending too long polling withou=
t
>  #               encountering events. 0 selects a default behaviour (defa=
ult: 0)
>  #
> +# @aio-max-batch: maximum number of requests in a bacth for the AIO engi=
ne,

s/bacth/batch/

--7mHlAADOAiYD8Gxb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDtqGMACgkQnKSrs4Gr
c8hKfQf+PA6DGGJWVoSBVi10WOiix80+qL0JkIVSNyRyR7J3CricoZ9/t92MIEy0
nEjSSicXzmN6/gq5dy5+qXuqWjSSgNbIMhpfNvKPs5dgSQqB8i7n7ErkDZs1cdPu
STky2jiVPq6fsODEY1Gn35VCLUGXCrmls0CqqDCY1jeIUUjm8HHDlgqc1SnFAjol
H8jMMRtObePbfC6SkuYA8AVXtXrFL68irZjXHQ4ECvUdYThEk3d7wDddcBH5Ly0a
53Jj/wbCUpWBSyOHV/t7oTRxVwDhZ22PWbDxzcDp4czqK8TPsXi6X5x1tr54Wa+C
JwCgwe4UkkbsImz1pS5/dVSpvQu4JQ==
=ir7R
-----END PGP SIGNATURE-----

--7mHlAADOAiYD8Gxb--


