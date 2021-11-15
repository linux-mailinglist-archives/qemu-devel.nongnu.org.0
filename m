Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8EF450671
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:14:14 +0100 (CET)
Received: from localhost ([::1]:57032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmckP-0001zJ-Ii
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:14:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mmcjC-0001AF-VO
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:12:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mmcjA-0001XV-4W
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:12:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636985573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wxGTFLuJdJWkKNFL+gf27eRLI7ITSz+D5hrH7ULJ5mM=;
 b=GGWuctG3qZMRtIs2Oc//Ec+pJ6DNQ4WIWNmkKikAIGVpe77oN0gWfOvm7faSpS1wpceQOV
 W7ij7oTmXEJJ/PEyNkrrPrh2x3HsKB/0DKGe5yFwJ2bi7WYTAoixOmevXblq0MW1mXfAEp
 L0s9msAQTFAEPIZ368DL8UZ/2UGXCPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-47NBIMrSOkiXLIqlPj8ghA-1; Mon, 15 Nov 2021 09:12:51 -0500
X-MC-Unique: 47NBIMrSOkiXLIqlPj8ghA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63DFD8799EB;
 Mon, 15 Nov 2021 14:12:50 +0000 (UTC)
Received: from localhost (unknown [10.39.194.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C539960BD8;
 Mon, 15 Nov 2021 14:12:49 +0000 (UTC)
Date: Mon, 15 Nov 2021 14:12:48 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: yadong.qi@intel.com
Subject: Re: [PATCH 1/2] block:hdev: support BLKSECDISCARD
Message-ID: <YZJq4E92zYQeqMy7@stefanha-x1.localdomain>
References: <20211115045200.3567293-1-yadong.qi@intel.com>
 <20211115045200.3567293-2-yadong.qi@intel.com>
MIME-Version: 1.0
In-Reply-To: <20211115045200.3567293-2-yadong.qi@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QmJayWdvAkWOKIFS"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, qemu-block@nongnu.org, mst@redhat.com,
 luhai.chen@intel.com, qemu-devel@nongnu.org, kai.z.wang@intel.com,
 hreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--QmJayWdvAkWOKIFS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 15, 2021 at 12:51:59PM +0800, yadong.qi@intel.com wrote:
> From: Yadong Qi <yadong.qi@intel.com>
>=20
> Add a new option "secdiscard" for block drive. Parse it and
> record it in bs->open_flags as bit(BDRV_O_SECDISCARD).
>=20
> Add a new BDRV_REQ_SECDISCARD bit for secure discard request
> from virtual device.
>=20
> For host_device backend: implement by ioctl(BLKSECDISCARD) on
> real host block device.
> For other backend, no implementation.
>=20
> E.g.:
>     qemu-system-x86_64 \
>     ... \
>     -drive file=3D/dev/mmcblk0p2,if=3Dnone,format=3Draw,discard=3Don,secd=
iscard=3Don,id=3Dsd0 \
>     -device virtio-blk-pci,drive=3Dsd0,id=3Dsd0_vblk \
>     ...

I'm curious why there is explicit control over this feature (-drive
secdiscard=3Don|off). For example, is there a reason why users would want
to disable secdiscard on a drive that supports it? I guess there is no
way to emulate it correctly so secdiscard=3Don on a drive that doesn't
support it produces an error?

--QmJayWdvAkWOKIFS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGSauAACgkQnKSrs4Gr
c8iHawgAu0aOTRpGwhiDyoMhyOK5lh6wxZN3nP1dgk3YD0YAfyUHu/kaFFkNR4AM
clCtxstN0KYT4RXgBpBpaK5LsHot/M08rP1NNVx8Ip3R5ULn7QG5cocUwZ4JMBzm
1moRoX/AgozY3h/V9NpkqxQT9S2eRIBc1+O+SYLZ0zsJ+rT/c0u4Pj5xkJ/iXgiV
ci4BC5TQzl9Zcs6dqR6wrQL6By4mf51GAhy8mWV92u53c799yeO6S8I5FsGZ8EMQ
CjUVAP8m0pFs6g4JdognB+UPoZetVl0ZjBru0h/eCq7yQ56+SsJhjc3NCaRMUYep
6RZvpUDLMfj2mIFle/HhsErpy0Hcmw==
=6iic
-----END PGP SIGNATURE-----

--QmJayWdvAkWOKIFS--


