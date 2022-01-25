Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3535149BA3F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 18:23:26 +0100 (CET)
Received: from localhost ([::1]:40036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCPXQ-0004JI-TX
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 12:23:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCPIA-0005fQ-Lf
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:07:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCPI6-0004Kr-HB
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:07:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643130453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YKNbCLP0hWPF3DtGe/tPCDQOSbOemyMYhaPcgxf6sy8=;
 b=Jws4gbEx5YcZC3fTdeYxt6K1hEIZDZS6BQrYEJWvE9Pc+aLkXq3JzE4fWX6CvxTJu+T4Ks
 VrYT7PwwQwydGFc3gsvMAeFaPxvImuB8cUjITc5eNogU7/hgEYosKiVDmqT/OIiGhu1LZ5
 TpCnFDDu8/+IbaA3dxK8GKHWxqacxvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-mvrRhab-MmSitl22cuakYA-1; Tue, 25 Jan 2022 12:07:32 -0500
X-MC-Unique: mvrRhab-MmSitl22cuakYA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4277318A0F1F
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 17:07:31 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0242179A1A;
 Tue, 25 Jan 2022 17:07:17 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] migration: Remove unused and deprecated load_state_old
Date: Tue, 25 Jan 2022 18:07:15 +0100
Message-Id: <20220125170716.7903-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20220118104434.4117879-1-peter.maydell@linaro.org>=0D
[PATCH] Remove unnecessary minimum_version_id_old fields=0D
=0D
After applying this patch, there is other use of load_state_old and=0D
minimum_version_id_old.  As there already were deprecated, just remove them=
.=0D
=0D
Juan Quintela (1):=0D
  migration: Remove unused minimum_version_id_old and load_state_old=0D
=0D
 docs/devel/migration.rst    | 7 +------=0D
 include/migration/vmstate.h | 2 --=0D
 migration/vmstate.c         | 6 ------=0D
 3 files changed, 1 insertion(+), 14 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


