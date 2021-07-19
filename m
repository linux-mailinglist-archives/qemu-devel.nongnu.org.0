Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8773CD1E3
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 12:28:56 +0200 (CEST)
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5QW7-0007a0-EW
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 06:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m5QU5-0005Vl-6Z
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:26:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m5QU3-0006z6-GR
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626690406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=INePwJBWn3MA9U8DU3XozZFxY7ZaNlO6LU+3uj1EArg=;
 b=Xv+CKrVR9xz1DcN1YJ0CFg8DKomDrPAPyztcN/r2IQGhFHA6iqIyLHMIcLlrH/WezAbQJt
 DfynoBxSPOG28l+1zjncK3XdEMV6tjZKyAGixi/YqpCkLdAvDVHY4b8D907Ho/jrCAn+dI
 tSYa42eoduVa3ImzlvNSIlj47NJ+j2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-KjM6k2GrNnG8KMVcE09O7w-1; Mon, 19 Jul 2021 06:26:44 -0400
X-MC-Unique: KjM6k2GrNnG8KMVcE09O7w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACB38800FF0;
 Mon, 19 Jul 2021 10:26:43 +0000 (UTC)
Received: from thuth.com (ovpn-112-201.ams2.redhat.com [10.36.112.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A3285D6A1;
 Mon, 19 Jul 2021 10:26:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 0/5] Misc fixes for 6.1
Date: Mon, 19 Jul 2021 12:26:35 +0200
Message-Id: <20210719102640.2610368-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.466,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Peter!

The following changes since commit fd79f89c76c8e2f409dd9db5d7a367b1f64b6dc6:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210718' into staging (2021-07-18 13:46:39 +0100)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2021-07-19

for you to fetch changes up to 9405d87be25db6dff4d7b5ab48a81bbf6d083e47:

  hw/ide: Fix crash when plugging a piix3-ide device into the x-remote machine (2021-07-19 10:08:45 +0200)

----------------------------------------------------------------
- Compile-test the Windows installer in the Gitlab-CI
- Fix endianess detection problem with LTO in "configure"
- Fix two abort()s in the vmxnet code
- Fix crash with x-remote machine and IDE devices

----------------------------------------------------------------
Gerd Hoffmann (1):
      ci: build & store windows installer

Thomas Huth (4):
      configure: Fix endianess test with LTO
      hw/net/vmxnet3: Do not abort if the guest is trying to use an invalid TX queue
      hw/net/net_tx_pkt: Fix crash detected by fuzzer
      hw/ide: Fix crash when plugging a piix3-ide device into the x-remote machine

 .gitlab-ci.d/crossbuild-template.yml               |  5 +++++
 .gitlab-ci.d/crossbuilds.yml                       |  6 ++++++
 configure                                          | 15 +++++++++------
 hw/ide/ioport.c                                    | 16 ++++++++++------
 hw/ide/piix.c                                      | 22 +++++++++++++++++-----
 hw/isa/isa-bus.c                                   | 14 ++++++++++----
 hw/net/net_tx_pkt.c                                | 12 +++++++-----
 hw/net/vmxnet3.c                                   |  9 +++++++--
 include/hw/ide/internal.h                          |  2 +-
 include/hw/isa/isa.h                               | 13 ++++++++-----
 tests/docker/dockerfiles/fedora-win64-cross.docker |  1 +
 11 files changed, 81 insertions(+), 34 deletions(-)


