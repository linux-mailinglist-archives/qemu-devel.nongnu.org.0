Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968A5572E20
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 08:27:53 +0200 (CEST)
Received: from localhost ([::1]:59156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBVqh-0000cs-Mp
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 02:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oBVm2-0005Fk-4C
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 02:23:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oBVly-0000we-9m
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 02:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657693375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g0i8rgA/ifGHZCRLtdxMgxYNeHrI04HMm6G6hzoUOMQ=;
 b=ghR7yIRtPB/t3W5lIAx+sduxXsxOaGFtndSzzLmcnpvbEYcvJA38G4jqlqKFJaEgngxf0m
 R8QfaZPTkdGmKWsxKPayj8lWZTNCdO810QhhQjAWWF4nKJhHNuwKe1yiSodqqmcQPSPWNc
 7u7p2bC+vYzjPW5mMmY+y2hIr7qmyhE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-mMiVILG0OBO47eyZlxysfw-1; Wed, 13 Jul 2022 02:22:43 -0400
X-MC-Unique: mMiVILG0OBO47eyZlxysfw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1447B801755;
 Wed, 13 Jul 2022 06:22:43 +0000 (UTC)
Received: from localhost (unknown [10.39.192.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A127B40E80E0;
 Wed, 13 Jul 2022 06:22:42 +0000 (UTC)
Date: Wed, 13 Jul 2022 07:22:41 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, dmitry.fomichev@wdc.com,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, hare@suse.de
Subject: Re: [RFC v4 1/9] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls.
Message-ID: <Ys5ksZ4eix87DEL8@stefanha-x1.localdomain>
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-2-faithilikerun@gmail.com>
 <Ys2YF9iYeicGf8xr@stefanha-x1.localdomain>
 <0effd311-26e1-3c93-3bae-0de00945a86d@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="c1hszbS9/KnAVtK5"
Content-Disposition: inline
In-Reply-To: <0effd311-26e1-3c93-3bae-0de00945a86d@opensource.wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--c1hszbS9/KnAVtK5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2022 at 07:12:17AM +0900, Damien Le Moal wrote:
> On 7/13/22 00:49, Stefan Hajnoczi wrote:
> > On Tue, Jul 12, 2022 at 10:13:37AM +0800, Sam Li wrote:
> >> @@ -1801,6 +1809,130 @@ static off_t copy_file_range(int in_fd, off_t =
*in_off, int out_fd,
> >>  }
> >>  #endif
> >> =20
> >=20
> > Are the functions below within #ifdef __linux__?
>=20
> We need more than that: linux AND blkzoned.h header present (meaning a
> recent kernel). So the ifdef should be "#if defined(CONFIG_BLKZONED)" or
> something like it, with CONFIG_BLKZONED defined for linux AND
> /usr/include/linux/blkzoned.h present.

Okay. Try adding the following to meson.build:

  config_host_data.set('HAVE_LINUX_BLKZONED_H', cc.has_header('linux/blkzon=
ed.h'))

Then:

  #ifdef HAVE_LINUX_BLKZONED_H
  ...
  #endif /* HAVE_LINUX_BLKZONED_H */

Stefan

--c1hszbS9/KnAVtK5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLOZLEACgkQnKSrs4Gr
c8iMxggAiEzKHTaWZYoLrKBTYWv0az9svMGKKdRb0hGjL4kA5hFNTQCcQ3rIa6Ai
WbjxOIGbIskJTivs6d1shb3Tfcx8SuPAXpMhr112xPBYc37lVnG/ABLSAPlifM/i
13JxO3IshlVsiY8SST79BQS7wroRUY+jUe6c8+HWUq/W0hCV4k3oYkMSdDNnCksn
egJO7bWHHDog8yHhPsVN9ABfBuSeXWIeF+VV8FtupOU7D0tZ8zXQorblYcPmYG9z
hNA2SjBOP6AgXeP9cPHRVi6vNofDx96apIOerdbzyWIJYpzTQt3rCvAGXJHaV0EK
3p5pDAqVJfLa38P6LjqeItrVWVpuhw==
=tltJ
-----END PGP SIGNATURE-----

--c1hszbS9/KnAVtK5--


