Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BD5492507
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 12:38:01 +0100 (CET)
Received: from localhost ([::1]:44184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9moK-0004wy-LU
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 06:38:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n9mZo-000826-13
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:23:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n9mZl-0007rW-82
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:22:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642504976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=enZPO8Tf2IaRaKjtnL/V9Ot03BStRoDukC9IkON5NN0=;
 b=LMequO4tQNOgP42HibJZcVfp2TJVjWmXm9hHBPU/H7q00LnC19YzxN/8vAwTlQ2zuWfefE
 hnQjqMOivIAI7m+/QSQSjDsKEglXjT2O0mozUugVKCqJmdLPDgiuiuWuM4AtztyBJzXkg8
 bOmEhhrq5+ZVw6blIpD3X6NPYMerFTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-8RN4e0N6OPWrEM_1HvvOKg-1; Tue, 18 Jan 2022 06:22:55 -0500
X-MC-Unique: 8RN4e0N6OPWrEM_1HvvOKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 794BD801B0B
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 11:22:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC4EF7CAE6;
 Tue, 18 Jan 2022 11:22:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 119AA18000A6; Tue, 18 Jan 2022 12:22:32 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Seabios 20220118 patches
Date: Tue, 18 Jan 2022 12:22:30 +0100
Message-Id: <20220118112232.2396744-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: imammedo@redhat.com, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6621441db50d5bae7e34dbd04bf3c57a27a71b32=
:=0D
=0D
  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-2022011=
5' into staging (2022-01-16 20:12:23 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/seabios-20220118-pull-request=0D
=0D
for you to fetch changes up to 11bb4e968432fce4b140e2d272301d1fb025a77f:=0D
=0D
  seabios: update binaries to snapshot (2022-01-18 12:19:36 +0100)=0D
=0D
----------------------------------------------------------------=0D
seabios: update to snapshot=0D
=0D
----------------------------------------------------------------=0D
=0D
Gerd Hoffmann (2):=0D
  seabios: update submodule to snapshot=0D
  seabios: update binaries to snapshot=0D
=0D
 pc-bios/bios-256k.bin             | Bin 262144 -> 262144 bytes=0D
 pc-bios/bios-microvm.bin          | Bin 131072 -> 131072 bytes=0D
 pc-bios/bios.bin                  | Bin 131072 -> 131072 bytes=0D
 pc-bios/vgabios-ati.bin           | Bin 39424 -> 39936 bytes=0D
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
2.34.1=0D
=0D


