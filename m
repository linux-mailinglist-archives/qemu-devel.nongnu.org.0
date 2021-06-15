Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C1E3A86D8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:49:22 +0200 (CEST)
Received: from localhost ([::1]:32984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCFd-0006DX-33
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCEJ-0003nW-UX
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:47:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCEF-0003F0-Sh
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623775675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C7k3EU4FZpv29t5tC83C950k3BouCoxMWAVvHx6pwwI=;
 b=bQrvkL6LY/pdr7BwP9IvHFz+fZ6US9DIg3FtkEkySSEakuGo23BkwXq5D3IgdfesJ3stuW
 PxuXWeX43bPlLCX9rSPs0ZZUgPhKrKz2eQVxMvBLANHswXFU3hwYpg7pJ9xfpm79oufANH
 jF2hYEx6Gk61S+CfQxncW1fobXhpwpk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-0ZHj0GH1Nfi-fiEJRBVc6Q-1; Tue, 15 Jun 2021 12:47:54 -0400
X-MC-Unique: 0ZHj0GH1Nfi-fiEJRBVc6Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 k5-20020a05600c1c85b02901ac8b854c50so1753144wms.5
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sv7W2M/U/nkx85hvnF/LmaZe3sY6F//EQtsypUDthww=;
 b=JTwudher37Q0rWN4iV56Agk/kUSE9WBUOoL0YSHEFIUoTYZxGZiKCwrM44WyziOd/8
 hqdi/E2DLgnuv0wukjtMdo5H4b9YpoFNpiXFtSNj6kZ0BJHovD0ci4PFAo1ctOIb4fjk
 Lwin8Y/uHBNKrhMxVpS3fqR8bXSgXTR578a3mKcH6eCcRiw9MGwz0SD4qY5JcCRbFaC2
 VvJ68qXudXISW6Tw7Cm76ClfvZC1fgwXZgvbwDsWOMXg0aS35w9A2+j7AG6qMmQPyaao
 MRPXyPFnbwBPdZA91EBzFRESnACKWO+RRC9sDh2pGIrwCnpVkaeEF6SokkDv/Ue0j4Ju
 NuDg==
X-Gm-Message-State: AOAM532ByvV6GPdtCtfbniNAhrcFsS17z1/PJZ6bHYbjsaIgdBnvakIr
 jRGRWI4jHugle0KIuizTD9BNt0h1rzU0/sOyOnRIOw3rz+RHWBgDoWTAu2RWmPDoPoaklglOdGr
 0MhHmP2MWEyzXOVdB/zI2Pc3Teu5RUlAdBAM1qPhEmpCF3nnIDL5GxqJgqyHcS50c
X-Received: by 2002:adf:ee46:: with SMTP id w6mr26837987wro.345.1623775672755; 
 Tue, 15 Jun 2021 09:47:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0BstGcSio39NVA7EjA0WXe7LVfawy91s/vWqJMiWoRFRdG4znkMPFkyROr7iLRdEeLck1+g==
X-Received: by 2002:adf:ee46:: with SMTP id w6mr26837961wro.345.1623775672465; 
 Tue, 15 Jun 2021 09:47:52 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l13sm20221064wrz.34.2021.06.15.09.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 09:47:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] crypto: Make QCryptoTLSCreds* structures private
Date: Tue, 15 Jun 2021 18:47:44 +0200
Message-Id: <20210615164751.2192807-1-philmd@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Leonardo Bras <leobras.c@gmail.com>, Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow Daniel suggestion to simplify qcrypto TLS implementations,=0D
aiming to solve the OSX build failure.=0D
=0D
Supersedes: <20210614052623.1657103-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  crypto/tlscreds: Introduce qcrypto_tls_creds_check_endpoint() helper=0D
  block/nbd: Use qcrypto_tls_creds_check_endpoint()=0D
  chardev/socket: Use qcrypto_tls_creds_check_endpoint()=0D
  migration/tls: Use qcrypto_tls_creds_check_endpoint()=0D
  crypto/tlssession: Introduce qcrypto_tls_creds_check_endpoint() helper=0D
  ui/vnc: Use qcrypto_tls_session_check_role()=0D
  crypto: Make QCryptoTLSCreds* structures private=0D
=0D
 crypto/tlscredspriv.h         | 15 +++++++++++++++=0D
 include/crypto/tlscreds.h     | 28 ++++++++++++----------------=0D
 include/crypto/tlscredsanon.h | 12 ------------=0D
 include/crypto/tlscredspsk.h  | 12 ------------=0D
 include/crypto/tlscredsx509.h | 10 ----------=0D
 include/crypto/tlssession.h   | 13 +++++++++++++=0D
 block/nbd.c                   |  3 ++-=0D
 blockdev-nbd.c                |  3 ++-=0D
 chardev/char-socket.c         |  6 ++++--=0D
 crypto/tlscreds.c             |  5 +++++=0D
 crypto/tlscredsanon.c         | 13 +++++++++++++=0D
 crypto/tlscredspsk.c          | 14 ++++++++++++++=0D
 crypto/tlscredsx509.c         | 16 +++++++++++++---=0D
 crypto/tlssession.c           |  6 ++++++=0D
 migration/tls.c               |  2 +-=0D
 ui/vnc.c                      |  3 ++-=0D
 16 files changed, 102 insertions(+), 59 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


