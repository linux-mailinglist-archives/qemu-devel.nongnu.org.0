Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAA436D9E5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:53:28 +0200 (CEST)
Received: from localhost ([::1]:33374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lblZ9-0003zx-SW
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lblUG-0000LJ-Fx
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:48:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lblUE-0005Hz-2W
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619621300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Df2/ZHCMhMU2Il6G9Zb5/5HmwoyI00fxKf7xG82MF5Y=;
 b=ECL4Yc8SwaRBk8oosh6rXitlKX/uvdGXP1wsY+zxgDZSG/1z/4jXmAofqSqPvz4/H8hiCp
 HyFaNI3hEbbiU9+GFN0FsjRxkTWDVw+IDh5tHgTyxMRSgVhtFHiWhuqlcxDTUhYSduF2Fh
 m/PqoEAFpQOw1ZUEGf5PYZJ33XW1nHc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-GUrRWH-pPKydqe9vXtMx2w-1; Wed, 28 Apr 2021 10:48:17 -0400
X-MC-Unique: GUrRWH-pPKydqe9vXtMx2w-1
Received: by mail-wr1-f72.google.com with SMTP id
 a12-20020a5d6cac0000b0290109c3c8d66fso6513065wra.15
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UHZDJz4l6bk9E0hRqeZMz65tC6/ff7VBEw8e0Llu33Q=;
 b=NRqiXEmX2OkWSA/crFDXneJrmLpKHGcy/lKcS+7hLCZJT7vyLENHHnMXO56ofHb0Fm
 Wb7DJh2psyLufBWsxXXHZ/FCBGPGx7l6ES4QAPZf/Fdg05RlNkSJ72+x6xl0eevddryg
 Giw3jv8iz1dOh24u4+gAx0gN60VcXEly/+D4r0jSLb5dato+kVXcPUvebOG/cz7GV0vF
 bQeEost2SkTMg8ldG4eOIAbm6C+uY/2yMoTX5Us7IXPqfkxuWaLZepJ3CbFX67N18bc0
 NTuMlmhio80jlwWmsxjcEikSS6509SLKW1H7v+Tmil4XgECaXjzbOEIE0/ydGnZT2w1t
 t7Sw==
X-Gm-Message-State: AOAM533obEvyckr2agjYbFpKxqLNrr8P+SbafYWzjB2i1TO3e3V57FiP
 123mnOCgJOs228V5p5ZoM0lKa5b///yLflCEU6OU6PZpeXrTR5UZYlwM+twduSkUOWlfVT7X+DY
 xix00Su/+kjvkt+XyF8lGXetdasDhsYxyslluZbV40sZEWcAbd3bZfsIfopdPCCL5
X-Received: by 2002:adf:e846:: with SMTP id d6mr16709368wrn.356.1619621296018; 
 Wed, 28 Apr 2021 07:48:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNAecj0hZGsOn/VuTamXwo07K091FArvqp9F0EjFhFU8gFyaZzqUtLyXzNuu3Fx+NXnSgPNA==
X-Received: by 2002:adf:e846:: with SMTP id d6mr16709336wrn.356.1619621295772; 
 Wed, 28 Apr 2021 07:48:15 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c16sm198032wrt.83.2021.04.28.07.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 07:48:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] virtiofsd: Meson build fixes
Date: Wed, 28 Apr 2021 16:48:11 +0200
Message-Id: <20210428144813.417170-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A pair of fixes to allow building virtiofsd without sysemu/tools.=0D
=0D
Should this configuration be tested in CI?=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  meson: Check for seccomp/cap-ng libraries if virtiofsd is enabled=0D
  util/meson: Build iov/hexdump/buffer_is_zero with virtiofsd=0D
=0D
 meson.build      |  4 ++--=0D
 util/meson.build | 10 +++++++---=0D
 2 files changed, 9 insertions(+), 5 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


