Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D15B3B667E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:14:17 +0200 (CEST)
Received: from localhost ([::1]:54950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtto-0000MC-Iv
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lxtp5-0008BS-3a
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:09:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lxtp2-0001jO-0W
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:09:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624896558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dCP5hcEs8ysqBj2VmjFJemusUg8uPBQD8SJg/ixKg2I=;
 b=ffqxHNbBbkhF7BbZXZgbZjq45YljO/tyke7bYmVnZ/hfea97wVNLTND4I8k8ULmT7Fq6e1
 3MGbMwiB8Ahr7SpIJgxN9v89siL/pq7D4Qvubz7wb/DAEzGJdBMt/X/dAeohxkH4dLvGvF
 OKn5kJsmHmcwkKFVrPe8rrEB355neYc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-TlUE6wWhM--wFu-qZxlf-Q-1; Mon, 28 Jun 2021 12:09:17 -0400
X-MC-Unique: TlUE6wWhM--wFu-qZxlf-Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 o19-20020a05600c5113b02901ecf901808fso935436wms.6
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P1u05xIL1/bukPaI4ajb49CK9pgUwa2/sz6GXCPdmeI=;
 b=DGAN6IVSxxJKVXzdKZFhobXNcHgbhk7Gfh3Hb6JZar73eKW/FJ2OSwqLp1GnwnMuif
 cxzcMrXf/dPuNVOqFI+q8A/0+axam3OEpCL4t/s5DbFyr3W7UnOhiiJE7b+13t3hpQks
 JgLyJ4KixPxvlAnAnMS79rueIcBNkObf/GdtvuPT5UkGtsF90eUYTqdRG4CL1wUddBXf
 8GR/1kVXNmGGC02+ZbQztrnxCR+5CeP0jS3Qq90dea+UNsegi4avEkdVypWjjNrxIYNf
 PbwkToSZIyKYjF8fr92wF/zA03au9ZlKv/U8NKP8q9HfQ2t7QSfHe3dOpR70Km9j1iK8
 uGEg==
X-Gm-Message-State: AOAM533pY1RHgO+xQI+MuQdyfc/cvWycUHP/bIkn94PrD2dZcJB/Hud5
 sEyEwfetvJ++i2RAeVyDqa3QLGpJKROImkEND0JtyVXnHHhYwiH3M5pIB7Msq6vHN0aVMqWSOfn
 E70NM869KqQ73ZYSp1rrELAHefXCy/gmG0qrnrgzXCgAryaR8JGj9i8N8KZUV6D5n
X-Received: by 2002:a05:600c:2104:: with SMTP id
 u4mr11007792wml.116.1624896556409; 
 Mon, 28 Jun 2021 09:09:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyevD9N1LRDFhMvjMwQr+/ouBolpJXzeCsGB0Ic6SyCW5WGxsAy6pCXg+bOgop4EF3QASLOYw==
X-Received: by 2002:a05:600c:2104:: with SMTP id
 u4mr11007761wml.116.1624896556125; 
 Mon, 28 Jun 2021 09:09:16 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id c10sm7254387wmb.40.2021.06.28.09.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 09:09:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/7] crypto: Make QCryptoTLSCreds* structures private
Date: Mon, 28 Jun 2021 18:09:07 +0200
Message-Id: <20210628160914.2461906-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missing review: #3 (qemu-nbd)=0D
=0D
Follow Daniel suggestion to simplify qcrypto TLS implementations,=0D
aiming to solve the OSX build failure.=0D
=0D
Since v5:=0D
- Also convert qemu-nbd (Akihiko Odaki)=0D
=0D
Since v4:=0D
- Do not introduce qcrypto_tls_session_check_role (Richard, Daniel)=0D
- Added R-b tags=0D
=0D
Since v3:=0D
- Added missing @errp docstring description=0D
=0D
Since v2:=0D
- Add Error* argument (Daniel)=0D
- Move structure definitions to "tlscredspriv.h"=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  crypto/tlscreds: Introduce qcrypto_tls_creds_check_endpoint() helper=0D
  block/nbd: Use qcrypto_tls_creds_check_endpoint()=0D
  qemu-nbd: Use qcrypto_tls_creds_check_endpoint()=0D
  chardev/socket: Use qcrypto_tls_creds_check_endpoint()=0D
  migration/tls: Use qcrypto_tls_creds_check_endpoint()=0D
  ui/vnc: Use qcrypto_tls_creds_check_endpoint()=0D
  crypto: Make QCryptoTLSCreds* structures private=0D
=0D
 crypto/tlscredspriv.h              | 45 ++++++++++++++++++++++++++++++=0D
 include/crypto/tls-cipher-suites.h |  6 ----=0D
 include/crypto/tlscreds.h          | 30 ++++++++++----------=0D
 include/crypto/tlscredsanon.h      | 12 --------=0D
 include/crypto/tlscredspsk.h       | 12 --------=0D
 include/crypto/tlscredsx509.h      | 10 -------=0D
 block/nbd.c                        |  6 ++--=0D
 blockdev-nbd.c                     |  6 ++--=0D
 chardev/char-socket.c              | 18 ++++--------=0D
 crypto/tls-cipher-suites.c         |  7 +++++=0D
 crypto/tlscreds.c                  | 12 ++++++++=0D
 crypto/tlscredsanon.c              |  2 ++=0D
 crypto/tlscredspsk.c               |  2 ++=0D
 crypto/tlscredsx509.c              |  1 +=0D
 crypto/tlssession.c                |  1 +=0D
 migration/tls.c                    |  6 +---=0D
 qemu-nbd.c                         | 19 +++++--------=0D
 ui/vnc.c                           |  7 +++--=0D
 18 files changed, 108 insertions(+), 94 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


