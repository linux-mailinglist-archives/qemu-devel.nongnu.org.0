Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 681FE5A54B1
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 21:46:38 +0200 (CEST)
Received: from localhost ([::1]:46622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSkiS-00037n-6s
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 15:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oSkg3-0000Q1-Ji
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 15:44:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oSkg0-0001LR-B8
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 15:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661802243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Emz/zFKpFtWMvdotZ2I0zQRAuDuX2CYhNcUNsqqeipc=;
 b=bQ+MNUMZTa2yAkZRDptzBFBTAiw2b2EJhP4tisRCtHeMDHmlouM7eM7ZuU8FKSprLsol13
 c6ni24T3528qCaVNVZdXS0OT4VX6odppUpNkuWhYW+MbP+XlBA3wu54vO5E8zMYWpH3q5T
 FzqQFA3+ZXphFqq2GtgZAzzIqp20w1Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-Is7O9YThMjq-t4U7zC_vjg-1; Mon, 29 Aug 2022 15:44:00 -0400
X-MC-Unique: Is7O9YThMjq-t4U7zC_vjg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3B851C06ECF;
 Mon, 29 Aug 2022 19:43:59 +0000 (UTC)
Received: from localhost (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 488881415133;
 Mon, 29 Aug 2022 19:43:59 +0000 (UTC)
Date: Mon, 29 Aug 2022 15:43:57 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, damien.lemoal@opensource.wdc.com,
 Dmitry.Fomichev@wdc.com, hare@suse.de, qemu-block@nongnu.org,
 hreitz@redhat.com, eblake@redhat.com, armbru@redhat.com,
 fam@euphon.net, kwolf@redhat.com
Subject: Re: [PATCH v8 0/7] Add support for zoned device
Message-ID: <Yw0W/VdybcXXhPn0@fedora>
References: <20220826151529.6601-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O0q9OanloqZmU7yl"
Content-Disposition: inline
In-Reply-To: <20220826151529.6601-1-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--O0q9OanloqZmU7yl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2022 at 11:15:29PM +0800, Sam Li wrote:
> Zoned Block Devices (ZBDs) devide the LBA space to block regions called z=
ones
> that are larger than the LBA size. It can only allow sequential writes, w=
hich
> reduces write amplification in SSD, leading to higher throughput and incr=
eased
> capacity. More details about ZBDs can be found at:
>=20
> https://zonedstorage.io/docs/introduction/zoned-storage
>=20
> The zoned device support aims to let guests (virtual machines) access zon=
ed
> storage devices on the host (hypervisor) through a virtio-blk device. This
> involves extending QEMU's block layer and virtio-blk emulation code.  In =
its
> current status, the virtio-blk device is not aware of ZBDs but the guest =
sees
> host-managed drives as regular drive that will runs correctly under the m=
ost
> common write workloads.
>=20
> This patch series extend the block layer APIs with the minimum set of zon=
ed
> commands that are necessary to support zoned devices. The commands are - =
Report
> Zones, four zone operations and Zone Append (developing).
>=20
> It can be tested on a null_blk device using qemu-io or qemu-iotests. For
> example, the command line for zone report using qemu-io is:
> $ path/to/qemu-io --image-opts -n driver=3Dzoned_host_device,filename=3D/=
dev/nullb0
> -c "zrp offset nr_zones"
>=20
> v8:
> - address review comments
>   * solve patch conflicts and merge sysfs helper funcations into one patch
>   * add cache.direct=3Don check in config

Hi Sam,
I have left a few comments.

Stefan

--O0q9OanloqZmU7yl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMNFv0ACgkQnKSrs4Gr
c8gKvwgAgCxUZ6PHrezqkY250y6bW7J/gI9c11oQP2jpyFrIwf+BYPY5dXxTy/eX
owbEjdCYmTtigsX6FCUh1Im7xKb9LuePpPpCDM928+5VbFPD4Vsj+MotrTTJ7xJ+
MKIM8/MKx6KvZK9B3kZ96xpRR533+vTnE39kt5rV0qL8YZI8gGJmcA9t3REJ8FzA
WYa8zgtcizbbkDBJSCZ5kjl1NSRXMCA4q5wpbbrXBO7huKCNKopil2m/lk9X1D3u
wUCPgZayMJp08b9AOuYOU0ERckhGY/qtcVBHN7z2Vynf9AZuUYpHKgTANZXR3MLH
ta43ugqdEoozrJgwXdkc34/h1LiC1g==
=Qqfr
-----END PGP SIGNATURE-----

--O0q9OanloqZmU7yl--


