Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928382DFD1E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 15:59:52 +0100 (CET)
Received: from localhost ([::1]:51126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMf9-0004mA-IW
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 09:59:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQo-0004ls-Fb
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:04 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQl-0007fD-IH
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:01 -0500
Received: by mail-wm1-x334.google.com with SMTP id 3so11167145wmg.4
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tqrxEsSWBSau0TovEg18afzdUGT7IHMYP0M414V/PPY=;
 b=jt+2kJQwbess4Wit9WbW9STJaRl7DtucVKLnXW0BmhRdMtq4sj4tYFwkuyf8/et943
 pHAWOOA6VeMpKS6xr+AxbIitdDBg1stL99smGlTacg0cBYdDFdHv+tdhjMX31XMpRqSW
 z0jAmZMLZGV6KfU4AxSz6J3zHp7T68Vcx4mQXCiQ+I4vndRmlvwtLcalWyf3B1D8TlSJ
 RJS0TveXccf2M/h8Ykn6Xc7AL3uC1ry3Dm1REwIdIlhgOwKc7EjLlEDlFgqtG0UEeyxb
 mKqw8wVksuoOscCWd3BmMHSoN+WoRuo/GEzXZjiFZVd5QmSNYZH5n8dPgukukjWZP6PH
 1ZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tqrxEsSWBSau0TovEg18afzdUGT7IHMYP0M414V/PPY=;
 b=dEJCIbJ+G73Tg838kdWh7nMaNqSXaCquArBniURc8xq+I/RjRY6R71BTFc/hMZjexU
 hnEBuT7zoNC5LnoFMVDwPXU+UAq8xvc+rSmPWPU74HNRM7eyUY5kJru94Mc1/XTMDeL8
 zOC2SeWJKeSk5gXudAYU1LxaToThlztUsTwE9RYlcmb/faaTk2bT2d6xxGUr5xms5qzs
 20hnDlsgzsgZUhvWHLYIO9yAW9Onc99xesiRAhHKzszp3pDNohOdnMeE+W3megnTBe5B
 Zlq9oOVmSrJmRHKPEWUuwWMIeEMB91Rlj6BNXb4Mbdds4IbLPJJXFajJ373uxLdhMGU8
 CkNg==
X-Gm-Message-State: AOAM531SnA57nzMN7hf0klTr5M+5X+GhMihBpWjAD9/QhhTxjTTPrtPF
 LVIvgvdSN3jwIV/KKpTyiLgDGguJOsE=
X-Google-Smtp-Source: ABdhPJzURNCX5e528svwq0uwrgJfUi9v67HRJe2DkFSs8xLehsRDx+S/wA4983Rj5+H9sVMGWrEFxw==
X-Received: by 2002:a7b:cc0f:: with SMTP id f15mr17137821wmh.29.1608561897464; 
 Mon, 21 Dec 2020 06:44:57 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:44:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/55] tests/docker: Remove the remainders of debian9
 containers from the Makefile
Date: Mon, 21 Dec 2020 15:44:01 +0100
Message-Id: <20201221144447.26161-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The Debian 9 containers have been removed a while ago, so we can
delete the corresponding entries in the Makefile, too.

Fixes: e3755276d1 ("tests/docker: Remove old Debian 9 containers")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20201215083318.92205-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 02ec92830b..c254ac38d0 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -11,8 +11,7 @@ HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
 DOCKER_SUFFIX := .docker
 DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
 # we don't run tests on intermediate images (used as base by another image)
-DOCKER_PARTIAL_IMAGES := debian9 debian10 debian11
-DOCKER_PARTIAL_IMAGES += debian9-mxe debian-bootstrap
+DOCKER_PARTIAL_IMAGES := debian10 debian11 debian-bootstrap
 DOCKER_IMAGES := $(sort $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker))))
 DOCKER_TARGETS := $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
 # Use a global constant ccache directory to speed up repetitive builds
@@ -96,7 +95,6 @@ docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debian-bootstrap.docker
 endif
 
 # Enforce dependencies for composite images
-docker-image-debian9-mxe: docker-image-debian9
 ifeq ($(HOST_ARCH),x86_64)
 docker-image-debian-amd64: docker-image-debian10
 DOCKER_PARTIAL_IMAGES += debian-amd64-cross
@@ -104,8 +102,6 @@ else
 docker-image-debian-amd64-cross: docker-image-debian10
 DOCKER_PARTIAL_IMAGES += debian-amd64
 endif
-docker-image-debian-win32-cross: docker-image-debian9-mxe
-docker-image-debian-win64-cross: docker-image-debian9-mxe
 
 # For non-x86 hosts not all cross-compilers have been packaged
 ifneq ($(HOST_ARCH),x86_64)
-- 
2.29.2



