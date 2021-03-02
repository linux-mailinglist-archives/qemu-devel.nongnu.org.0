Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5194329B22
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 11:55:31 +0100 (CET)
Received: from localhost ([::1]:38518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH2gc-0006PF-Q2
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 05:55:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lH2fU-0005vU-06
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:54:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lH2fS-0008AZ-Je
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:54:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614682457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6CD+vyTMqSzgnqzxSLMk78PrR42FEvSDh63up6Dtrk8=;
 b=dndmNvVKaUVxcWRYk3TCw1X5HWYBxbaqqOus8mNu5gc2qFDsmou4SiI+LK3C0m9ayCYzzf
 99s2ZsFzDO+ndxhds23axKhaKzVCs4M4lyy0GYZGcOgcXO9XQUfpCDemt1rVQvv5NzNNCs
 d6IFiQt/Ryqg7XIkHnTG3LzSdlZ26Cs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-8o7ax305OJeFO-fJmvyRfw-1; Tue, 02 Mar 2021 05:54:14 -0500
X-MC-Unique: 8o7ax305OJeFO-fJmvyRfw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0D1B10082F5;
 Tue,  2 Mar 2021 10:54:12 +0000 (UTC)
Received: from localhost (ovpn-114-138.ams2.redhat.com [10.36.114.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1410510016DB;
 Tue,  2 Mar 2021 10:54:11 +0000 (UTC)
Date: Tue, 2 Mar 2021 10:54:11 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 3/3] hw/block/pflash: use
 memory_region_init_rom_device_from_file()
Message-ID: <YD4ZU4LtM+P3IHVc@stefanha-x1.localdomain>
References: <20210301115329.411762-1-philmd@redhat.com>
 <20210301115329.411762-4-philmd@redhat.com>
 <YD0uvW+vzfQjBecY@stefanha-x1.localdomain>
 <bc4b3dee-4af4-7ce2-aeaa-70c0cfde679f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bc4b3dee-4af4-7ce2-aeaa-70c0cfde679f@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2cHnr/wu8zn7CKLJ"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Xu Yandong <xuyandong2@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, David Edmondson <david.edmondson@oracle.com>,
 haibinzhang <haibinzhang@tencent.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--2cHnr/wu8zn7CKLJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 08:04:46AM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 3/1/21 7:13 PM, Stefan Hajnoczi wrote:
> > On Mon, Mar 01, 2021 at 12:53:29PM +0100, Philippe Mathieu-Daud=E9 wrot=
e:
> > FWIW this API isn't perfect because the file could be reopened with QMP
> > and the existing mmap would remain in place.
>=20
> Can you show me a QMP example or point me at the command?

x-blockdev-change and other commands can reopen or reconfigure the
BlockDriverState graph - the mmap user would not be aware of this.

For example, block_set_io_throttle won't take effect if the guest has
the device mmapped.

> This shouldn't happen with the pflash.

It's not possible to say that because pflash has a
DEFINE_PROP_DRIVE("drive") property. The storage is backed by a
--drive/--blockdev and the user could send any QMP command that operates
on drives :(.

Users probably won't but there is nothing stopping them.

The block layer has a permission system (BLK_PERM_*). Maybe it's
possible to use it to lock a BDS while mmap is active?

Stefan

--2cHnr/wu8zn7CKLJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA+GVIACgkQnKSrs4Gr
c8i9Rgf/WVYBGb++l7R7prGxPLaoBSMlhNMCK34y+WTwv/ITkOgxLwSpWkeicRjK
sMdtFrKs7xJ29ojsbYnAcQCt1WS9fzZtsLyeN/YIbyMDi74KnDLyO0TpyY9qemeB
SD53SFIJ2QrUIgTkPBQAlH5/Z0MKndGpmopyGUSskS8NqiUGQNUz+86bVqQS+5YB
EF2bl1FqvG+2tOwaSHC3phdB28v10lgZTsGaROUVe5ih4EKfwfIvsLqU8pT0u5Td
KKgB3a7nG+9C6o8gaOitl1GEkKcqOSonw4DyZsSsZMssT6UPerqdR+xmOzhA8W4A
FhWJ1AWTcpXg8FFtSvXkHOx6zS1IgA==
=ctP8
-----END PGP SIGNATURE-----

--2cHnr/wu8zn7CKLJ--


