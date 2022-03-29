Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014634EAB11
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 12:11:25 +0200 (CEST)
Received: from localhost ([::1]:35234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ8ot-0006V3-R4
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 06:11:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZ8mA-0004RR-Kn
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:08:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZ8m6-0004uo-2C
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:08:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648548508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6IRoSvNC8AeOMJv/FhjAl4lAaB80oKxQCOHAmyUIC6U=;
 b=AIxSQXLRraDeSw29UEZwr1cfLgZFvAoDzzUa2B+nZuImTdM1YQU3sUikdZQrE2vU+aPYe3
 rrckGs2yliYrY37ZjfgLQRzQ/OdxODY5g3K8OG3MNkg0HE55HgHOhr1QFWduj0++O9Gs9v
 mb6TZH3E5ygYT5aXpjJSzihXszeM5Jo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-9H7zmllZORWBWUHXQWaYcg-1; Tue, 29 Mar 2022 06:08:24 -0400
X-MC-Unique: 9H7zmllZORWBWUHXQWaYcg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E5F01C05AFD;
 Tue, 29 Mar 2022 10:08:23 +0000 (UTC)
Received: from localhost (unknown [10.39.195.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C45F4010A2D;
 Tue, 29 Mar 2022 10:08:22 +0000 (UTC)
Date: Tue, 29 Mar 2022 11:08:21 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v7 02/17] qdev: unplug blocker for devices
Message-ID: <YkLalT2O1YE/KDWM@stefanha-x1.localdomain>
References: <cover.1648234157.git.jag.raman@oracle.com>
 <5526cf86f18a08f8228e602cf12eaae6f39e74aa.1648234157.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xrWVIo/aei3ZuyLc"
Content-Disposition: inline
In-Reply-To: <5526cf86f18a08f8228e602cf12eaae6f39e74aa.1648234157.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--xrWVIo/aei3ZuyLc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 25, 2022 at 03:19:31PM -0400, Jagannathan Raman wrote:
> Add blocker to prevent hot-unplug of devices
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/hw/qdev-core.h | 29 +++++++++++++++++++++++++++++
>  hw/core/qdev.c         | 24 ++++++++++++++++++++++++
>  softmmu/qdev-monitor.c |  4 ++++
>  3 files changed, 57 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--xrWVIo/aei3ZuyLc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJC2pUACgkQnKSrs4Gr
c8hv3Qf/deMVsqDQV2gHKnRl1poBELElyAp8Ho+wQqCdGxkId7mpoQc5WWK1nUX1
qPW6/dQTZh/SiqKwV40D05yKkylQ8WT54Y2rYNws17LkBXMiANXZfvYJuYNKEO2r
gDtfuZp0lszLtBt4gKIxKUpKHQg7iKzTjuQHfyMRi6BnPgPq85wrtsZb2bXYoCHJ
wqetGNcqv4XqxK2JAqrD1FL9FdXKaDMq4fzJs9Z9UWxk3eHhYqjweT6yQjVIdC2F
7IWoB8Jx8srLy7EhTysowW4PxHyTiZfrcKcNdV6lYa/8BVW9SBoECoxNurKoNHVI
yiLE5OIzMRji51rllZLLCqVRKXXBGw==
=bkiz
-----END PGP SIGNATURE-----

--xrWVIo/aei3ZuyLc--


