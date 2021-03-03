Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4640132B6E8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:54:53 +0100 (CET)
Received: from localhost ([::1]:39852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHP9Y-0007G3-Ba
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:54:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lHP8M-0006np-TX
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:53:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lHP8K-0004wf-0y
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:53:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614768814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=hNAS9DYHpHiECKOLz94PWZLlUWT+U14j71aSHsQ99K8=;
 b=Mvqd6KovbiY1bkPzhjtbrLCp3gUqvJteXXhJagi+dAgDok0sh/gBnyoxK8faN1a7f4inqY
 9BFl5sBeQStI94595DMP3FiMgQyUFwnHr7NQN6jjPjj9wri3DLzl2FYUn9/YCNSg5bGZwV
 hBPE3+6a6P+wRPcUTWqbnmILFbmyS04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-AKurWPXKNAqRa8if9-6jBQ-1; Wed, 03 Mar 2021 05:53:30 -0500
X-MC-Unique: AKurWPXKNAqRa8if9-6jBQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E72F187667F
 for <qemu-devel@nongnu.org>; Wed,  3 Mar 2021 10:53:29 +0000 (UTC)
Received: from localhost (ovpn-114-24.ams2.redhat.com [10.36.114.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53A236F98F;
 Wed,  3 Mar 2021 10:53:15 +0000 (UTC)
Date: Wed, 3 Mar 2021 10:53:14 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: jasowang@redhat.com
Subject: Inconsistent virtio-net-pci MSI vector count
Message-ID: <YD9qmto5pHys+jEm@stefanha-x1.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sevZRqctcZwJHcuj"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--sevZRqctcZwJHcuj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,
I stumbled across something strange with virtio-net multi-queue today.
It doesn't seem to be a bug in practice, just an inconsistency. Here are
the details in case you think something needs to be changed:

libvirt uses the vectors = 2 * N + 2 formula from
https://www.linux-kvm.org/page/Multiqueue to calculate the number of PCI
MSI vectors, where N is the number of rx/tx queue pairs.

QEMU's virtio-net-pci device has 3 MSI vectors by default. This is
inconsistent with the formula that libvirt uses (should be 4 instead of
3).

Luckily, the Linux virtio_net.ko driver does not configure a callback
function for the control virtqueue. Therefore it can still use MSI with
only 3 vectors (config, rx, tx) instead of 4 (config, rx, tx, ctrl).

But other driver implementations might need the ctrl vq vector and would
not have enough MSI vectors.

Perhaps new QEMU machine types should set vectors to 4 by default?

Stefan

--sevZRqctcZwJHcuj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA/apoACgkQnKSrs4Gr
c8ikggf+KRfQhaEWHGzumUivnCAHZHsm1+on98/tw/vkM9Q2ZMfNWw+8ZsSp75iO
/dYC/MisLvh4r0/K6ecanVxlDNjglJVitGIg8eNf7vlkGwRKsfSYPP2w72y/+TZy
U76KT/qDevErNkC5dtUtI4NWWURfBeH/qk0JnhIc+6agAEFDmZVRbrh0cwUkeLeF
fcAsu0zEN7v932ya8C7VaT0eGVgIn2hzWflZZ3ETU4bKEtXMAf+SksZkgubxqhTj
cmNXB2HIfBpfKPEy30SDhXkLQPoK43SXOAk29PsTtzDNHZIPjxGxdcI7FOHgyWot
ojcezccv4j2Mc8fE9NPuSGCjDhq25g==
=oPXj
-----END PGP SIGNATURE-----

--sevZRqctcZwJHcuj--


