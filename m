Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710A238E73E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:18:06 +0200 (CEST)
Received: from localhost ([::1]:58586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llAT7-0004ka-Ho
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llAQw-0003II-FV
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:15:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llAQt-0007Pj-DK
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621862146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z7Kqe9pyJLy1k4Cu1EECoxFVDKaXE7wylCehcXX31DI=;
 b=UAcYPSMMfxNueXijfK5dkpzKXKDfLjMw7KU1wvurhi7gErGGY0y5+MiaMeHp/oBEhheOyj
 gw3RecdC+fo8sNTDPRP4p0zR3SDwZWDStAKwyZzWjg7lN39Aqm6W8zFPtlgG7VZUHH7S75
 do+B+mPyIr/r+Uu/SrH9EI9i8t9qqag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-2R7qwGjLO76Pq5PyjsjInA-1; Mon, 24 May 2021 09:15:42 -0400
X-MC-Unique: 2R7qwGjLO76Pq5PyjsjInA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98B4E108C309;
 Mon, 24 May 2021 13:15:40 +0000 (UTC)
Received: from localhost (ovpn-113-244.ams2.redhat.com [10.36.113.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 725FE19D9D;
 Mon, 24 May 2021 13:15:36 +0000 (UTC)
Date: Mon, 24 May 2021 14:15:35 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL for-6.0 0/8] Block patches
Message-ID: <YKum90NO/Lv3eDVG@stefanha-x1.localdomain>
References: <20210524130024.50651-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210524130024.50651-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7ZoBWjW2Hktyd8UC"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--7ZoBWjW2Hktyd8UC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Please ignore. I resent the pull request with the proper subject line
and CC list.

Stefan

--7ZoBWjW2Hktyd8UC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCrpvcACgkQnKSrs4Gr
c8iqEggAlyzdvOzvC6gI4F5RTqcOSsGT9jL3gApbGmmX9c0sin8hXg/6gZkhDAs/
Qmdg097xbwH0P24hMvPKjQOSKbP9zwYLbGvEPAQm6NgHXSgdC7CnQBduTqMe2UVm
0ibAnrRh0EMONb7dsi7Jk9DSjU6pSCiTlHWny8zMyVrr/BhbkBabvQvkOUMU/Hpd
v4fkd3w55WeOT22VCz4GF0OX8AghcTeV0sK06dTLpCjnP666BlgUWw/HGc+WV6za
hFFhPgx/zPhyRti42fIiz5Kdv63A+/UEKK0k0+3TOaraXF/8vQVMM2ZvfOodjxcF
93/OveJpwdRg9RR8ewupZ+sXYtgwAg==
=EKWG
-----END PGP SIGNATURE-----

--7ZoBWjW2Hktyd8UC--


