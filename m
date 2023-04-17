Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33F66E4837
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 14:48:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poOGK-0005Lf-Dy; Mon, 17 Apr 2023 08:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1poOGA-0005L7-UB
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:47:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1poOG6-0001WH-J4
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:47:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681735620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6P9Gahfl/3rKMdjo0NbC0OP4ZmCY4AcefHef9c+6lMg=;
 b=SYvaUhHFrOt/JjtvicEKV/IAaXlpfQpuuGyFi1imMxBPhv7J1k5KfJC/cC1pXsno+W2z8B
 M51SZna5WdvH7+FAEHUhRAzPcPuYtq9EQGsxwpuLjxyrg868qDxqmZe7TIjbu+g3JUERvZ
 QNSrkGh0yduWLns2XBUivBq30yUHs/w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-jJkAX4-oMtqgLTpJwhaeAg-1; Mon, 17 Apr 2023 08:46:56 -0400
X-MC-Unique: jJkAX4-oMtqgLTpJwhaeAg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D6A7185A790;
 Mon, 17 Apr 2023 12:46:56 +0000 (UTC)
Received: from speedmetal.redhat.com (unknown [10.45.242.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2812492B0F;
 Mon, 17 Apr 2023 12:46:54 +0000 (UTC)
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 0/2] tests: lcitool: Switch to OpenSUSE Leap 15.4
Date: Mon, 17 Apr 2023 14:46:52 +0200
Message-Id: <cover.1681735482.git.pkrempa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

v2:
 - update 'libvirt-ci' submodule first
 - fix forgotten explicit mappings for 15.4


Peter Krempa (2):
  tests: libvirt-ci: Update to commit '51dad419'
  tests: lcitool: Switch to OpenSUSE Leap 15.4

 .gitlab-ci.d/cirrus/freebsd-12.vars           |  16 ++
 .gitlab-ci.d/cirrus/freebsd-13.vars           |  16 ++
 .gitlab-ci.d/cirrus/macos-12.vars             |  16 ++
 tests/docker/dockerfiles/alpine.docker        | 127 +++++++++++++
 tests/docker/dockerfiles/centos8.docker       | 141 +++++++++++++-
 .../dockerfiles/debian-amd64-cross.docker     | 174 +++++++++++++++++-
 tests/docker/dockerfiles/debian-amd64.docker  | 148 +++++++++++++++
 .../dockerfiles/debian-arm64-cross.docker     | 173 ++++++++++++++++-
 .../dockerfiles/debian-armel-cross.docker     | 172 ++++++++++++++++-
 .../dockerfiles/debian-armhf-cross.docker     | 173 ++++++++++++++++-
 .../dockerfiles/debian-mips64el-cross.docker  | 170 ++++++++++++++++-
 .../dockerfiles/debian-mipsel-cross.docker    | 170 ++++++++++++++++-
 .../dockerfiles/debian-ppc64el-cross.docker   | 172 ++++++++++++++++-
 .../dockerfiles/debian-s390x-cross.docker     | 171 ++++++++++++++++-
 .../dockerfiles/fedora-win32-cross.docker     | 106 ++++++++++-
 .../dockerfiles/fedora-win64-cross.docker     | 106 ++++++++++-
 tests/docker/dockerfiles/fedora.docker        | 153 ++++++++++++++-
 tests/docker/dockerfiles/opensuse-leap.docker | 142 +++++++++++++-
 tests/docker/dockerfiles/ubuntu2004.docker    | 149 +++++++++++++++
 tests/docker/dockerfiles/ubuntu2204.docker    | 148 +++++++++++++++
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/mappings.yml                    |  36 ++--
 tests/lcitool/refresh                         |   2 +-
 ...use-leap-153.yml => opensuse-leap-154.yml} |   0
 24 files changed, 2634 insertions(+), 49 deletions(-)
 rename tests/lcitool/targets/{opensuse-leap-153.yml => opensuse-leap-154.yml} (100%)

-- 
2.39.2


