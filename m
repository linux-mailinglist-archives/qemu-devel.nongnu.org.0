Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DE835E3A6
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:18:21 +0200 (CEST)
Received: from localhost ([::1]:37830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLk4-00010j-7j
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWLax-0006zP-Mu
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:55 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:41680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWLav-0007Fr-Fq
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:55 -0400
Received: by mail-ej1-x62a.google.com with SMTP id mh2so5264314ejb.8
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 09:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TMjm3yOL3+S+S2Xfiii8KMIk0YlnnQEWdaH7R2RZVQo=;
 b=u59o9dT4QQmFSKuTiJJazzoJgHVnbTsZgspRPPwiwCpqYd4IuYitjJ4G97CxaL5D6E
 SF9gzczSWwf5I1S/H1PwosLBMIb8X1lyk1QG2NcgTAKw1c4S5dbaYG3duUcY3Mh1vcHY
 CpJzPgbx84jooASWuOAhVDlwjq0iC0zf9ltQxUsoBKmuQFKTv7w46lL0rnoVRhgtMYL3
 1UxM/w1GT+rVAEkTQmQfGpJG4JhI3cYc9D0lX3LiJd/3GDhlkIxHkNjf/ZHfECRhFgg5
 tQbnpNX+SUWZdmzmv94Wqve5GbpkWsF4w4phmtSf2jG7sZVJX4VXZB7zPcYVDQWahMnX
 F99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=TMjm3yOL3+S+S2Xfiii8KMIk0YlnnQEWdaH7R2RZVQo=;
 b=FQifNinu5IUAbhYVjRBpZh+07XfagTW5znkJtEdaAlHkHk/hyMDsxAR2o9fUMCIGZY
 i8QAA0nUfyYwMcNHKqWB71yzEh+x3hD0l6kHD6yMOWgozQvDFRYZVmJJKoGIc+aIWz7/
 eHcZsT0QxE3PBZylXui3SyM4A3LhK2EnFZPIFyPQr8aCSLATtTwI+IykDXO1UdcSrz5U
 mqWsAYiGh5i6+B+OpKMJBddgEuoBJ7C6nToZGo4XPNrokA4ZSLdRjFj2N7zEaXBUmxQ+
 vqqIxb39x47CeDkB6qiXuArNGC/qRjV5cjwsypllq/pULrsyfa3X30Kv+vVIvS4tpcGN
 Ml7w==
X-Gm-Message-State: AOAM533SbGXVw1ox2j6eoStQ98aV7x9c/qbqPQJ1D7K38J0/pycHTKJc
 RbmaFl7kcfBGIEyT+2+jpytQTn5w++0=
X-Google-Smtp-Source: ABdhPJziLnvCE6QSmG2GgcAS8EXWA79BeF7OZBfbjTYaaAtDgIhHbXqwkRw7EvSJ+IpfzfwuJSFI/A==
X-Received: by 2002:a17:907:1b20:: with SMTP id
 mp32mr33135551ejc.495.1618330132150; 
 Tue, 13 Apr 2021 09:08:52 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 u19sm9897670edy.23.2021.04.13.09.08.51 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 0/3] osdep.h + QOM changes for QEMU 6.0-rc3
Date: Tue, 13 Apr 2021 18:08:47 +0200
Message-Id: <20210413160850.240064-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c1e90def01bdb8fcbdbebd9d1eaa8e4827ece620:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210412' into staging (2021-04-12 12:12:09 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 1a0b186eaf3d1ce63dc7bf608d618b9ca62b6241:

  qapi/qom.json: Do not use CONFIG_VIRTIO_CRYPTO in common code (2021-04-13 18:04:23 +0200)

----------------------------------------------------------------
* Fix C++ compilation of qemu/osdep.h.
* Fix -object cryptodev-vhost-user

----------------------------------------------------------------
Paolo Bonzini (2):
      osdep: include glib-compat.h before other QEMU headers
      osdep: protect qemu/osdep.h with extern "C"

Thomas Huth (1):
      qapi/qom.json: Do not use CONFIG_VIRTIO_CRYPTO in common code

 disas/nanomips.cpp      |  2 +-
 include/qemu/compiler.h |  6 ++++++
 include/qemu/osdep.h    | 13 +++++++++++--
 qapi/qom.json           |  4 ++--
 4 files changed, 20 insertions(+), 5 deletions(-)
-- 
2.30.1


