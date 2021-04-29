Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EC836E71F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 10:36:58 +0200 (CEST)
Received: from localhost ([::1]:37058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc2AL-0002c7-G8
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 04:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc27a-0000d2-Ts
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 04:34:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc27Q-0002F5-Mi
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 04:34:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619685234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rcmO5TkRXuvwGN9pgNzzx61doLleWzjEcz3RlK2Gc/Y=;
 b=aJRNctRkTIem6bzFCUJ2A0Xu4Wm6W9xuIyNEpNZlUNFkOZyoPBxb169CVsAb0zCDlkX+f8
 SVAHOeiUL9BPzcb4uxwrEg+zuXlMTbM5A6V9sYONCkzLfhoIa2P4BTqaYc0YDfHo4wvZrt
 pbUw7on3K/F7iWMpfZzQLoh0QBLVNP0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-dwV1-yLJNECfGE8bx5rfdg-1; Thu, 29 Apr 2021 04:33:50 -0400
X-MC-Unique: dwV1-yLJNECfGE8bx5rfdg-1
Received: by mail-wm1-f72.google.com with SMTP id
 o8-20020a1c41080000b0290145d961cdc4so162976wma.6
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 01:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=trqGS6m3vz+WLll8LaGlJ38qwj/pdiUVF9aITyh1gvA=;
 b=RRrwKbQZWtv1pVFkgkH4ORFzmc/ckxWmp+6J+Rz/yLB/DHboToZc0KaVy39YPFLb/0
 XEepzlWsleevd6/EwLMBinfQMPhpQVm4M1iozKptWkLj0BdyhPnt1Yg94dz2G/fQ0oTc
 OxULfa0UF1NC7TT9Y1LRIlVNHX++Z9GOENt6Im09lS1C0w0gQr86VwiE75fJyz76rJDP
 5sOTYNCbVesd137rAXqBH/3MlWeG0F4l5LzSmHDHfQozbhiI4/VjE2FhTziKKlLEBz4S
 eNI7pNQANlGVim+9gcJKHhKe/mWoodOdieK7iAA3wYrHUigZN0atRzHpbgAP5dPpqcQo
 GpYQ==
X-Gm-Message-State: AOAM532l3DQmacd8i+eO+PlodAHjrgcfWJXT911emPajY+kt9TI4YgJS
 RIah/uubs2XBVuM7PAqINRTHKe+hG7iHg4GIJqlmAd0pvW0ylGyEJ8daT9W9GLhMcQfoESPmTHR
 Kekd+TaxfeJ/U0x11zgRzj/5lGRcrZZGRgmIL2Kl1OHee+uTxxQ8EURrikILtBxha
X-Received: by 2002:a05:600c:3581:: with SMTP id
 p1mr8838580wmq.35.1619685228848; 
 Thu, 29 Apr 2021 01:33:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQDjVTdbzbfsyXITv2CbIhEFB96tJnj0XMv7Xb2NR7ShhUODcOIGUfLRK2znHxW5XJg4Sfog==
X-Received: by 2002:a05:600c:3581:: with SMTP id
 p1mr8838554wmq.35.1619685228610; 
 Thu, 29 Apr 2021 01:33:48 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id o18sm784487wmq.20.2021.04.29.01.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 01:33:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] virtiofsd: Meson build fix
Date: Thu, 29 Apr 2021 10:33:44 +0200
Message-Id: <20210429083346.61030-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson fix to allow building virtiofsd without sysemu/tools.=0D
=0D
Since v1:=0D
- reworked meson (Richard)=0D
- added CI job (Dave)=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Supersedes: <20210428144813.417170-1-philmd@redhat.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  meson: Select 'have_system' when virtiofsd is enabled=0D
  gitlab-ci: Add a job to build virtiofsd standalone=0D
=0D
 meson.build    |  2 ++=0D
 .gitlab-ci.yml | 13 +++++++++++++=0D
 2 files changed, 15 insertions(+)=0D
=0D
--=20=0D
2.26.3=0D
=0D


