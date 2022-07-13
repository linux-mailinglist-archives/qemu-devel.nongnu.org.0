Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7EB57342B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 12:29:32 +0200 (CEST)
Received: from localhost ([::1]:44810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBZcZ-0005rr-71
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 06:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oBZSi-00061P-6W
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 06:19:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oBZSe-0007fi-D4
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 06:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657707555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Yyd8e4Ea/hcvuc+f6cNrgV9sgpXBz4hcaYaCOl7hloo=;
 b=NtlffCpmbRRExgcX0MvuubV20okScpoKiYIodw+CbcVeOEbq2kVItX9WU1SRvZGopXDeQ/
 Ri+s39QG9G/u+icmIqGBt5aQKLVMo4Ug8fczIIrfDmI1HHNcnApC5oTzJXnId0lxy3FbFF
 X514WApfDGkrB/VBqolu4G2+ZVv6Xm8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-GTTFLYQsNgeUW54XzJ3iJw-1; Wed, 13 Jul 2022 06:19:12 -0400
X-MC-Unique: GTTFLYQsNgeUW54XzJ3iJw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCE2585A581;
 Wed, 13 Jul 2022 10:19:11 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.40.194.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D78AE1121314;
 Wed, 13 Jul 2022 10:19:10 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 0/3] Guest Agent patches 2022-07-13
Date: Wed, 13 Jul 2022 13:19:05 +0300
Message-Id: <20220713101908.2212307-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 08c8a31214e8ca29e05b9f6c3ee942b28ec58457:

  Merge tag 'pull-tcg-20220712' of https://gitlab.com/rth7680/qemu into staging (2022-07-12 11:52:11 +0530)

are available in the Git repository at:

  git@github.com:kostyanf14/qemu.git tags/qga-win32-pull-2022-07-13

for you to fetch changes up to 1db8a0b0ea2fb72ecab36bd3143a9715c083d5d3:

  qga: add command 'guest-get-cpustats' (2022-07-13 12:19:18 +0300)

----------------------------------------------------------------
qga-win32-pull-2022-07-13

----------------------------------------------------------------
Konstantin Kostiuk (1):
      MAINTAINERS: Add myself as Guest Agent reviewer

Zhenwei Pi (2):
      qapi: Avoid generating C identifier 'linux'
      qga: add command 'guest-get-cpustats'

 MAINTAINERS            |  1 +
 qga/commands-posix.c   | 89 ++++++++++++++++++++++++++++++++++++++++++++++++++
 qga/commands-win32.c   |  6 ++++
 qga/qapi-schema.json   | 81 +++++++++++++++++++++++++++++++++++++++++++++
 scripts/qapi/common.py |  2 +-
 5 files changed, 178 insertions(+), 1 deletion(-)


--
2.25.1


