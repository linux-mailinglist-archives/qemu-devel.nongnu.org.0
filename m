Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CE43F483B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 12:07:02 +0200 (CEST)
Received: from localhost ([::1]:40464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI6r7-0005rU-9H
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 06:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI6pB-0003wv-3e
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:05:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI6p9-0004ue-F9
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629713097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=77QFoSmAj5ZisqGyClehWuoILAwepzVgMpD9XdVvZ8k=;
 b=N1nDzTwBdc9GFur3KdlOkjI4pqBcGLrGuWrvQlgZST8ji2aKM8SUOFLgBd50qNyQqzqNZV
 bdo5afsaZZG1wpPB1v0WGWxLuyN14AwqdZsgVqMpxUGAPue8kBcHp/LDr0j5GoCbQgdJn2
 v96nMd9nk5ziD8IBsl29et68tVy07ek=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-qp8j080dNz6EyWt0TN6ehw-1; Mon, 23 Aug 2021 06:04:56 -0400
X-MC-Unique: qp8j080dNz6EyWt0TN6ehw-1
Received: by mail-wr1-f69.google.com with SMTP id
 p10-20020a5d68ca000000b001552bf8b9daso4922150wrw.22
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 03:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x0N6/x5A4AKJqCOoU5XrluhDOHdj9uS1S38J010fvkU=;
 b=NCf5xmKpjtv21l90ERmRiaEcvVTWnXrPA2oURz2Hf2Qmujf6ubtVLvswblaon1p1pB
 jTad1L+m2U5jLPVqEgGpdpysqiOcPD9GUrhSHlybB2HBn0t3b4cvwRIBUsH2ZSP2w7vH
 pT1jaYhvxGGH8WLJNE+mkBW44yIc+41MTgP2yClh7mgeKPdytf0PXWEcQTSrtMQ2BU3h
 QPup/IyiDz+bCbthWeVBmfTb8qzqRSFC8vkQSrhL6Wbc02b5myLI37ucDZ46W43PtcYu
 VVUzFSIr01jtPNsxSFzMo0NqsxQh6K0YVQ6mDvEE2Yl0SIOd3lr+6krAnxW98f5wy4sk
 9ffw==
X-Gm-Message-State: AOAM532jkL6Pun4n5kZtunMnIGVubywfxFgrNBMmuonvZe5L6miLERje
 itd00ptpnAe+zvTcPEiJ0zqK/+qHTJjj42+QhN8JIDyRv75AvfQzwR/sW/+J8XZlg1A8owglNnJ
 ieKPRCR0QksG5/E5Q6AVCt24LzfpjtKWkAeFTKWzN+UqCWA1ZhnxOyQ7opJrkSjmh
X-Received: by 2002:a05:600c:4999:: with SMTP id
 h25mr495986wmp.175.1629713095447; 
 Mon, 23 Aug 2021 03:04:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR9RiQCsMUsXzlJVD2tT0wAsw8+CmJsSutgyB8goMvz/klKKNKNtWJXYFzS+OavEq92sunGQ==
X-Received: by 2002:a05:600c:4999:: with SMTP id
 h25mr495974wmp.175.1629713095263; 
 Mon, 23 Aug 2021 03:04:55 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 g21sm17993969wmk.8.2021.08.23.03.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 03:04:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] Restrict virtio-gpu-udmabuf stubs to !Linux
Date: Mon, 23 Aug 2021 12:04:52 +0200
Message-Id: <20210823100454.615816-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
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
Cc: "Maxim R ." <mrom06@ya.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Annoying problem when stubs take over module symbols.=0D
=0D
See https://gitlab.com/qemu-project/qemu/-/issues/553=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/display: Restrict virtio-gpu-udmabuf stubs to !Linux=0D
  ui/console: Restrict udmabuf_fd() to Linux=0D
=0D
 include/ui/console.h                                  |  2 ++=0D
 .../display/virtio-gpu-udmabuf-stubs.c                |  0=0D
 ui/udmabuf.c                                          | 11 -----------=0D
 hw/display/meson.build                                |  3 ++-=0D
 stubs/meson.build                                     |  1 -=0D
 ui/meson.build                                        |  6 ++++--=0D
 6 files changed, 8 insertions(+), 15 deletions(-)=0D
 rename stubs/virtio-gpu-udmabuf.c =3D> hw/display/virtio-gpu-udmabuf-stubs=
.c (100%)=0D
=0D
--=20=0D
2.31.1=0D
=0D


