Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232F1467393
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 09:57:12 +0100 (CET)
Received: from localhost ([::1]:44658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt4NS-0008Bf-PK
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 03:57:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mt4MO-0006qf-4x
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 03:56:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mt4MI-0006ce-My
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 03:56:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638521757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zgsm3hezXSpNSr/791jOYuev4VF4bk7wUHXO3LhrR0U=;
 b=bjjb+PhUh1TMWJ84k8J2+2UXWeqQps1bHSNn5oZl5Ou2tQWogMZfWcUGVfvWX0ka2L9019
 Fy46PbXx8oNfdxS+u624no/vk5pgr/dpD1C9Ui4xnRZvu+ft1aBjbbza6oKhQgWFJdP/7I
 BoRovY3KUUZkHiNwgVYQWlSj5eax+Sc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-Aqk8DnydNAybj3Zsh1g2-Q-1; Fri, 03 Dec 2021 03:55:55 -0500
X-MC-Unique: Aqk8DnydNAybj3Zsh1g2-Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C6055A064
 for <qemu-devel@nongnu.org>; Fri,  3 Dec 2021 08:55:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C612B61F20;
 Fri,  3 Dec 2021 08:55:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E1C5F180038F; Fri,  3 Dec 2021 09:55:52 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Seabios 20211203 patches
Date: Fri,  3 Dec 2021 09:55:50 +0100
Message-Id: <20211203085552.347186-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit a69254a2b320e31d3aa63ca910b7aa02efcd5492=
:=0D
=0D
  Merge tag 'ide-pull-request' of https://gitlab.com/jsnow/qemu into stagin=
g (2021-12-02 08:49:51 -0800)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/seabios-20211203-pull-request=0D
=0D
for you to fetch changes up to 3bc90ac567f64fbe07b17b1174c85ec8a3e17d94:=0D
=0D
  seabios: update binaries to 1.15.0 (2021-12-03 09:54:11 +0100)=0D
=0D
----------------------------------------------------------------=0D
seabios: update from snapshot to final 1.15.0 release (no code changes).=0D
=0D
----------------------------------------------------------------=0D
=0D
Gerd Hoffmann (2):=0D
  seabios: update submodule to 1.15.0=0D
  seabios: update binaries to 1.15.0=0D
=0D
 pc-bios/bios-256k.bin             | Bin 262144 -> 262144 bytes=0D
 pc-bios/bios-microvm.bin          | Bin 131072 -> 131072 bytes=0D
 pc-bios/bios.bin                  | Bin 131072 -> 131072 bytes=0D
 pc-bios/vgabios-ati.bin           | Bin 39424 -> 39424 bytes=0D
 pc-bios/vgabios-bochs-display.bin | Bin 28672 -> 28672 bytes=0D
 pc-bios/vgabios-cirrus.bin        | Bin 39424 -> 39424 bytes=0D
 pc-bios/vgabios-qxl.bin           | Bin 39424 -> 39424 bytes=0D
 pc-bios/vgabios-ramfb.bin         | Bin 28672 -> 28672 bytes=0D
 pc-bios/vgabios-stdvga.bin        | Bin 39424 -> 39424 bytes=0D
 pc-bios/vgabios-virtio.bin        | Bin 39424 -> 39424 bytes=0D
 pc-bios/vgabios-vmware.bin        | Bin 39424 -> 39424 bytes=0D
 pc-bios/vgabios.bin               | Bin 38912 -> 38912 bytes=0D
 roms/seabios                      |   2 +-=0D
 13 files changed, 1 insertion(+), 1 deletion(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


