Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7326E6E67E6
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 17:19:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pon66-0007Ve-O7; Tue, 18 Apr 2023 11:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pon64-0007VW-M3
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 11:18:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pon63-0005M6-80
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 11:18:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681831098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=yFIdCCY1J9iXUJqyCxzx24H0lMPLRFL6u6K0GpP+pEo=;
 b=HNTFcokCDGEkKnoeF1TKcDdJVHfAxb7kqV6DiJXsJVIpsbF+2D8MJc0DvoOJpsimUxf6VP
 ttd9Y2NKtsQ9PAiZCIjCKlXtFNavPVMaW0zQGlnQ3DbOI2WTE3hzPgPMBce15jyDZc434I
 BBN1oQg+dBxGLhYNM2TbSnu/doqALW8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-oG-xeKEWNJmMKBpnNIgRWA-1; Tue, 18 Apr 2023 11:18:13 -0400
X-MC-Unique: oG-xeKEWNJmMKBpnNIgRWA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 621B3858F09;
 Tue, 18 Apr 2023 15:18:13 +0000 (UTC)
Received: from localhost (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D60E3492B01;
 Tue, 18 Apr 2023 15:18:12 +0000 (UTC)
Date: Tue, 18 Apr 2023 11:18:11 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Cindy Lu <lulu@redhat.com>,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Yajun Wu <yajunw@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Move vhost-user SET_STATUS 0 after get vring base?
Message-ID: <20230418151811.GA4048149@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GylLp4DoEyz7va0G"
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--GylLp4DoEyz7va0G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
Cindy's commit ca71db438bdc ("vhost: implement vhost_dev_start method")
added SET_STATUS calls to vhost_dev_start() and vhost_dev_stop() for all
vhost backends.

Eugenio's commit c3716f260bff ("vdpa: move vhost reset after get vring
base") deferred the SET_STATUS 0 call in vhost_dev_stop() until after
GET_VRING_BASE for vDPA only. In that commit Eugenio said, "A patch to
make vhost_user_dev_start more similar to vdpa is desirable, but it can
be added on top".

I agree and think it's a good idea to keep the vhost backends in sync
where possible.

vhost-user still has the old behavior where QEMU sends SET_STATUS 0
before GET_VRING_BASE. Most existing vhost-user backends don't implement
the SET_STATUS message, so I think no one has tripped over this yet.

Any thoughts on making vhost-user behave like vDPA here?

Stefan

--GylLp4DoEyz7va0G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQ+tLIACgkQnKSrs4Gr
c8g4swf/cbo2STCSxmsaEGzFP+RLA/AW85yLUHw2X+U6fMCIRCmAc3F0sFvF6R+k
jYVLJSg+5UgFDqo+PyrkX0keYugLNNae0Lz/pFaVyoAtjIljp+9shd44dW0aiAHx
qXYzhCTrpe/aBQE+VKn+fYRaCyBdVqcotVPl+UEHDTQ6Hl57KiLb/G+Om77b3VY0
aZwM/N6QZLkQkn5RpNeXU3eAsmyKzDHLeKIP35IC6lBO2YExJunmlYqpasiBtGBM
2n/OqjA3kdY7NZd6cXc1uy03je+nRHd52pO0jHWKannwNbKsuNFsOjQRE0hQh4Cr
bBOY3CqX7zp93Aao2eYMxhopnwEJMQ==
=hvEE
-----END PGP SIGNATURE-----

--GylLp4DoEyz7va0G--


