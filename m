Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8296E6D46
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 22:09:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1porcs-00089z-P6; Tue, 18 Apr 2023 16:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1porcp-00088X-QS
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 16:08:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1porcn-0003Bq-Qp
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 16:08:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681848504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=jBNgQSn65TYPJeYZoHCgwqE8HpeYwFqLp6OSQG5K98A=;
 b=VPppA9pijVxrJ/SBBpsToD/0v2UsKR57ZWFgIBxDBF8kvOfyEdV/f6C8Xwuh2CnT+dMDy0
 I8kEEP8NN+K+ThclyMjbg3e4HsDJrardfunKb1vVW4PaAf0hiitYhBVy1VBiZkPdc5+YWP
 t23ZcI7Hm79oN/wvtfmtSqG3tJ7M52g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-OXfQ83jEPnqzLV9lEEukTA-1; Tue, 18 Apr 2023 16:08:20 -0400
X-MC-Unique: OXfQ83jEPnqzLV9lEEukTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91236101A5D1;
 Tue, 18 Apr 2023 20:08:20 +0000 (UTC)
Received: from localhost (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAD191121315;
 Tue, 18 Apr 2023 20:08:19 +0000 (UTC)
Date: Tue, 18 Apr 2023 16:08:18 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: eesposit@redhat.com, kwolf@redhat.com
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Status of "block: Mark drain related functions GRAPH_RDLOCK"?
Message-ID: <20230418200818.GA4093165@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="g696s5ctKfonB+ru"
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--g696s5ctKfonB+ru
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Emanuele and Kevin,
The following commit is not in qemu.git/master or Kevin's block-next
tree:
https://repo.or.cz/qemu/kevin.git/commitdiff/b4959a8028f417a269168e1570b5e502123e64ed

Do you what the status of that patch is?

Multi-queue block layer code I'm working on depends on this change to
bdrv_co_yield_to_drain():

-    replay_bh_schedule_oneshot_event(ctx, bdrv_co_drain_bh_cb, &data);
+    replay_bh_schedule_oneshot_event(qemu_get_aio_context(),
+                                     bdrv_co_drain_bh_cb, &data);

I want to ensure that .drained_begin/end/poll() callbacks always run in
the main loop thread under the BQL.

Thanks,
Stefan

--g696s5ctKfonB+ru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQ++LIACgkQnKSrs4Gr
c8g4cggAsH4VtQIY8Vp1b1t+LNR/pS35gzb94nQLZ6OKR0bgHOgYDh0+cu2Dhvci
qfkLdIhNO3RZ2435cGKNHHfeHV0ilYeXNvvES0Qn7TEAyviu7FIB6SVE2olHvFpS
3701G1sIwL7c3yZXbYM6P+CkMXA58n8ASvr/cy7Gc6Q2LArXFIRcxJISvbTAfRXp
iSrGsB8SU2VkcD94B0HQQ0JraqieqiuCx8xPFrA3c3fsLifbZltlzFZthuSi+r2w
TIKEomxXHQR8S1qH/vnIsioltHM6F0VVnhchxHkqNk7cWexuvDwVSgB00P5meQ6F
r01aaFPCsh7IJUV8ksAE+TEXRu6/ow==
=iK6y
-----END PGP SIGNATURE-----

--g696s5ctKfonB+ru--


