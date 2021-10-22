Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0E543769A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 14:16:41 +0200 (CEST)
Received: from localhost ([::1]:42078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdtTU-0007Xr-AU
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 08:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mdtRQ-0006jL-Sb
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 08:14:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mdtRM-0002f2-Tf
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 08:14:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634904866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=H/1dr1Er7Ym49087xel2P7SEPbPZmqHQeQopiWFlZtU=;
 b=PR/gixsSbpwdwEZNcQC46XhANrDJ6WivANi8Ui6KVD7iU8CvKMiFgGfMRK4KU+EHlFsduM
 k3paNl3OogkkEB3Vw3mfbAwQ33lHcpe8sNCjQCe89heuXLI1JJOdNtQmx/0f7wNAH/bN6N
 1TeQt4I/EdfoY/GYYImpJFMh9jsKsPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-klbDsyqbMP-gJXuZ80wfWw-1; Fri, 22 Oct 2021 08:14:25 -0400
X-MC-Unique: klbDsyqbMP-gJXuZ80wfWw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBC4180668A
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 12:14:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB1AD1B46B;
 Fri, 22 Oct 2021 12:14:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 125FD1800393; Fri, 22 Oct 2021 14:14:20 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Seabios 20211022 patches
Date: Fri, 22 Oct 2021 14:14:18 +0200
Message-Id: <20211022121420.2636991-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 4c127fdbe81d66e7cafed90908d0fd1f6f2a6cd0=
:=0D
=0D
  Merge remote-tracking branch 'remotes/rth/tags/pull-arm-20211021' into st=
aging (2021-10-21 09:53:27 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/seabios-20211022-pull-request=0D
=0D
for you to fetch changes up to 9fb3fcfce512da58cd048eaefd293e1d3f513de2:=0D
=0D
  update seabios binaries (2021-10-22 12:32:29 +0200)=0D
=0D
----------------------------------------------------------------=0D
seabios: update to master branch snapshot.=0D
=0D
----------------------------------------------------------------=0D
=0D
Gerd Hoffmann (2):=0D
  update seabios to master branch snapshot=0D
  update seabios binaries=0D
=0D
 pc-bios/bios-256k.bin             | Bin 262144 -> 262144 bytes=0D
 pc-bios/bios-microvm.bin          | Bin 131072 -> 131072 bytes=0D
 pc-bios/bios.bin                  | Bin 131072 -> 131072 bytes=0D
 pc-bios/vgabios-ati.bin           | Bin 39424 -> 39424 bytes=0D
 pc-bios/vgabios-bochs-display.bin | Bin 28672 -> 28672 bytes=0D
 pc-bios/vgabios-cirrus.bin        | Bin 38912 -> 39424 bytes=0D
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
2.31.1=0D
=0D


