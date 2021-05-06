Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E76D37511F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 10:52:41 +0200 (CEST)
Received: from localhost ([::1]:58980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leZkO-0001dY-5m
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 04:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leZhp-0007k0-N3
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:50:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leZhk-0000L3-8y
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:50:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620290995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QJ/k3HYcWTLtIPOYnXxLe7F5jEX8J1blRTZFMUh96zM=;
 b=LdfLR2umo1PoQ2rIXx9ER1nRCjaKmJTc7j9c/O/CE1bxuT7J+Z2oG7ENogq2Kj2gNMTwdo
 e9uJ/VT93u0JQ3yuehQzWdT7skexcFU6uNromr1LJr6TtvWcNJ+maL3Bp2FCjjwksjE66o
 CrCd3YRLMardB0CfgSGlK8L2nEYL9nw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-YC8JYgm9MR-A5jGw-kjoPA-1; Thu, 06 May 2021 04:49:51 -0400
X-MC-Unique: YC8JYgm9MR-A5jGw-kjoPA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C79FD80059E;
 Thu,  6 May 2021 08:49:48 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27F79687C1;
 Thu,  6 May 2021 08:49:27 +0000 (UTC)
Date: Thu, 6 May 2021 09:49:27 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Levon <john.levon@nutanix.com>
Subject: Re: [PATCH v8] introduce vfio-user protocol specification
Message-ID: <YJOtl2iMZqNWFyun@stefanha-x1.localdomain>
References: <YJK+8MrRe3ANcu7y@stefanha-x1.localdomain>
 <YJFRcdvcOlwm2bd7@stefanha-x1.localdomain>
 <20210505161942.GA1195642@sent>
MIME-Version: 1.0
In-Reply-To: <20210505161942.GA1195642@sent>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="A7V1fPU+v1S7i5sZ"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: "benjamin.walker@intel.com" <benjamin.walker@intel.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 John Levon <levon@movementarian.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "tina.zhang@intel.com" <tina.zhang@intel.com>,
 "jag.raman@oracle.com" <jag.raman@oracle.com>,
 "james.r.harris@intel.com" <james.r.harris@intel.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Kanth.Ghatraju@oracle.com" <Kanth.Ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 Christophe de Dinechin <cdupontd@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "yuvalkashtan@gmail.com" <yuvalkashtan@gmail.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "ismael@linux.com" <ismael@linux.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>,
 "tomassetti.andrea@gmail.com" <tomassetti.andrea@gmail.com>,
 "mpiszczek@ddn.com" <mpiszczek@ddn.com>, Cornelia Huck <cohuck@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "xiuchun.lu@intel.com" <xiuchun.lu@intel.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--A7V1fPU+v1S7i5sZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks, I will review the rest of the spec early next week.

Stefan

--A7V1fPU+v1S7i5sZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCTrZcACgkQnKSrs4Gr
c8hNMAf/bflEcDmQRclKqE8SzB57N5hczFCPOsKAQN+J3yHZEbMHqEYbIjLs0G0f
X8f7WCMeX1IDtRx7dlIGkbJMP2/FlPQF+xATLPqX7zmk27ff/JgR2V1Dc9+h+74Y
YE4QuR0k+EZyPSllf+o9djhWYtCGEl1hP4/aJTy5LUWDAZgPFm330ucRxQGoTVre
t2L+OLdumZdmWrSOaTG0KAQ8naDxm28fw8q7oZs8Ky42ljwpIOYwAXKBG5zQo6UV
CRL/OEBfqeWd2eV7t6K6QD86kP57q9ej5/sDQwSVPhjZqZk0Lg0yut9/NRxyy1BE
pQyNbI6H8/uDaIzZonKFDBlGKI+UCA==
=Jybo
-----END PGP SIGNATURE-----

--A7V1fPU+v1S7i5sZ--


