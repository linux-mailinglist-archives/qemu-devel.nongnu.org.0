Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C881C17A173
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 09:33:27 +0100 (CET)
Received: from localhost ([::1]:44942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9lwc-00011d-8k
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 03:33:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46821)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9lux-0007ob-7Y
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 03:31:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9luv-0007jP-W4
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 03:31:42 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:27983
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9luv-0007iV-SJ
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 03:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583397101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O4iQQjy4D4akCOlCulm4m8ygpvU2g8WYcN7MY/95Rds=;
 b=JCJJKNn3ESEEKR4uk25YyzAiIV9VFeOB2n2K3O60kGIpDLS8RW1IaAtCVh4VJZUA97FUCv
 W1u4g6PIJK9OtKs+jkUa2Kn1KF7XqX5J32P/ZKoJGXuVQDvLbmwAkDLorXS2MVSLR6IjUl
 FfjIXV8apkE2UQIMHD1q5daw79PDwsY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-kNfsN-LaMtG5P3rIXOVsfQ-1; Thu, 05 Mar 2020 03:31:39 -0500
X-MC-Unique: kNfsN-LaMtG5P3rIXOVsfQ-1
Received: by mail-wm1-f70.google.com with SMTP id w3so1284859wmg.4
 for <qemu-devel@nongnu.org>; Thu, 05 Mar 2020 00:31:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nEuNDstq4T4xdPsg5GZKVHSVdO9lleyxbCGmA8ta4CI=;
 b=b9VswPK5CLTxFhQLMb8cWGZAxOG/E4llfMkYWJmerrTUcLG1dDwQ2b6seN61J7I0rC
 t58g+gPst/ilrJaXItE8GrAAoA/FclatSGcWwKYa+Z7Buwn35xuc4UoUt3JbqTylx4PA
 gxStDNBmcJIHGXEyhOLkZUydbp+6Alv1rXx4aiy4rQnW+NZ1qiyrGyQKBQsuSEBi6y9Q
 u5/Nl6MHlvn5d6XVUKkEZRGifLfZMoZuKemKUi+bzQfZgxTUN9PvnjiDaTmJPxKGxfsm
 35b3RbcNhgcpuicis3JpREtVxhUb7l4pXgmjg3C2LAJzRtwV8ty00VwSvvpL+aEUMXre
 sR9Q==
X-Gm-Message-State: ANhLgQ3MDM2lLb8b+5WSLLzjW4GKxZmoEHPxgzSUDC1hnLWBdBDz9pRi
 AfJL9hxGookKgjqC7YCjLOWfAy0cM0rvvZTGXoVhnBKEetCh1t/krROFmMYLTt4HUTOj1x1nmlU
 InVg1w/Xgz2fACE8=
X-Received: by 2002:a7b:c183:: with SMTP id y3mr8178303wmi.0.1583397098264;
 Thu, 05 Mar 2020 00:31:38 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtAWvdmWQSnY5pTGxOyemADJKStOksOBOgcRtHIhDfWUSuuG7fPDzXQfya+r9r691zYujjGOA==
X-Received: by 2002:a7b:c183:: with SMTP id y3mr8178275wmi.0.1583397097869;
 Thu, 05 Mar 2020 00:31:37 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id d7sm9140811wmc.6.2020.03.05.00.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 00:31:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] hw/scsi/spapr_vscsi: Fix time bomb zero-length array
 use
Date: Thu,  5 Mar 2020 09:31:30 +0100
Message-Id: <20200305083135.8270-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Fam Zheng <fam@euphon.net>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fixes a dangerous zero-length array use.
Simples patches first to clean the issue in the last patch:
dissociate the buffer holding DMA requests with pointer to
SRP Information Unit packets.

v2: Addressed David Gibson review comments

Philippe Mathieu-Daud=C3=A9 (5):
  hw/scsi/viosrp: Add missing 'hw/scsi/srp.h' include
  hw/scsi/spapr_vscsi: Use SRP_MAX_IU_LEN instead of sizeof flexible
    array
  hw/scsi/spapr_vscsi: Simplify a bit
  hw/scsi/spapr_vscsi: Introduce req_iu() helper
  hw/scsi/spapr_vscsi: Do not mix SRP IU size with DMA buffer size

 hw/scsi/viosrp.h      |  3 ++-
 hw/scsi/spapr_vscsi.c | 59 ++++++++++++++++++++++++-------------------
 2 files changed, 35 insertions(+), 27 deletions(-)

--=20
2.21.1


