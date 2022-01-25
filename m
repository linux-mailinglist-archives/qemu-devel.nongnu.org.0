Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8359449B84E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 17:14:10 +0100 (CET)
Received: from localhost ([::1]:51858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCOSP-0007sI-Ka
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 11:14:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCOFA-0002dv-Lo
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:00:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCOF7-0007PC-Tm
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:00:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643126424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=De2AL3+n42I+H+buLzAfexSFnBymYv4/YXphsSPhNlU=;
 b=EjAv3c01/rqMOGSQTM09t03DOJt8hxrkDz0tiv77iLhAYxKwW5zYDswEDEIIs0ugeR46Ga
 6K6vDIf57H3B9SI6d+AWNQ1nSxpqC02gkGXxZF5ma+W+m74FSHcbNnJTa5x8HTcyV+FbVC
 YILdgBIx5ZAYl+rehGLpeJ1+D4KSSlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-BBfT3yffN_uc7O0BCVVALA-1; Tue, 25 Jan 2022 11:00:21 -0500
X-MC-Unique: BBfT3yffN_uc7O0BCVVALA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2367846867;
 Tue, 25 Jan 2022 16:00:19 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A2BC7DE3A;
 Tue, 25 Jan 2022 16:00:18 +0000 (UTC)
Date: Tue, 25 Jan 2022 16:00:17 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 00/18] vfio-user server in QEMU
Message-ID: <YfAekQfnC4VfSXtW@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MAKtd2Idxz9pE8FV"
Content-Disposition: inline
In-Reply-To: <cover.1642626515.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 peter.maydell@linaro.org, armbru@redhat.com, quintela@redhat.com,
 qemu-devel@nongnu.org, f4bug@amsat.org, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, kwolf@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MAKtd2Idxz9pE8FV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jag,
Thanks for this latest revision. The biggest outstanding question I have
is about the isolated address spaces design.

This patch series needs a PCIBus with its own Memory Space, I/O Space,
and interrupts. That way a single QEMU process can host vfio-user
servers that different VMs connect to. They all need isolated address
spaces so that mapping a BAR in Device A does not conflict with mapping
a BAR in Device B.

The current approach adds special code to hw/pci/pci.c so that custom
AddressSpace can be set up. The isolated PCIBus is an automatically
created PCIe root port that's a child of the machine's main PCI bus. On
one hand it's neat because QEMU's assumption that there is only one
root SysBus isn't violated. On the other hand it seems like a special
case hack for PCI and I'm not sure in what sense these PCIBusses are
really children of the machine's main PCI bus since they don't share or
interact in any way.

Another approach that came to mind is to allow multiple root SysBusses.
Each vfio-user server would need its own SysBus and put a regular PCI
host onto that isolated SysBus without modifying hw/pci/pci.c with a
special case. The downside to this is that violating the single SysBus
assumption probably breaks monitor commands that rely on
qdev_find_recursive() and friends. It seems cleaner than adding isolated
address spaces to PCI specifically, but also raises the question if
multiple machine instances are needed (which would raise even more
questions).

I wanted to raise this to see if Peter, Kevin, Michael, and others are
happy with the current approach or have ideas for a clean solution.

Stefan

--MAKtd2Idxz9pE8FV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHwHpEACgkQnKSrs4Gr
c8hfqwgArnvAw8f8BmbS9BAO3SYHvFEs5x/P3o07tixso6CiuCSvSEtxCtY7TeiV
tb668rZqL0W935zH9fK1gow+XxJL3EnLGP7QDhAZC2+7qCkQidXf1K5IenxqhzfM
FiH57Ykb4kVG1lWXuumobi7nFuQK+knJ704c+fozxhtDOPP9ustiaSDaJNgUkQX/
53COasStej30YZUGIoPnFd8jatrzV4ZxvYhtlC4XTC9+0bg4M5NFTTXzKy+92RnP
4+2o9372vW1/msGh3ncwZLDJDDSkUJnL/TN/oiVx08P3C5/UxHGAOgnX/9k1TT/+
o9BChkgPVsSwaNWLJ9yT8tAN+9UmKw==
=T6N2
-----END PGP SIGNATURE-----

--MAKtd2Idxz9pE8FV--


