Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F53946EA76
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 15:59:13 +0100 (CET)
Received: from localhost ([::1]:47466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvKt6-0005Oe-F5
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 09:59:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvKqe-0002XU-T6
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:56:41 -0500
Received: from [2a00:1450:4864:20::42c] (port=37616
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvKqd-0001Xb-2x
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:56:40 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d9so10163011wrw.4
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 06:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g4gFnI92APB9JNXKvvn3fcRzbuIPz7UahWTPyQnD0ok=;
 b=diloo+98qc02fYIj5z1V9B75In1JJ6oB0Ig1lhV/LhohW8lnREB3uOkk7iodJK23zS
 1Iy7hmsZ8OqUFlZ8yj/T6tAyK29pt63f4RTNS9vNVU5Dx9KfU29JcguHVr5Whi+r5Uot
 1RXwCeVZD3BTDucQfmWrlZYqTi0S7VoimOXokoxDCmzNJab9D3OEWaWu5+CMgEvgYJ1c
 4j34X+VZ+7DTV5CPzaeHKhPl4X+WzPfir529dpwx8o+jTkWKmjxcO6ixBFBaaXnVFCLi
 jno6R9ZEatUm9qdpLXcqKGU+1c88Y6ehSGLkBuRJnfCYq5ldY4x2bniw7E21j6HmaIsu
 i1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g4gFnI92APB9JNXKvvn3fcRzbuIPz7UahWTPyQnD0ok=;
 b=pgu2TH5DaXG/dG3ghcWp0s3DMSeW/xOvEUAokUabr22OUVRpZzrdxkF4B/8qmjM16p
 pfmtKYd2k9Sb2xaHxFfZTwgSyPtjLdYdbFYQIvABNwaHP3F9K61H/WgNKw1BtnAg3Vtk
 4Dh3f+Atb1KmqLT3Gdx/B+La0fy6lXdjRe7IirXmn3bwEvv/QzEmeyoyjkO6SsOR6gkc
 pPCsO/Q+eYSEhHlptuthCNuvF0zElGqskeLKIFgw5E1kpWhd7OCuv/PhJDgrDGM8fDCa
 axo2t7FHQlrm1rBh4OnvMRrWMLjaApkukFegk/CdmCoqhL2G5axsb3M5evK7jKxyPYsV
 ikQw==
X-Gm-Message-State: AOAM5308S7g4k6/Anv963UbW7F/gFKlJwC/iQa5jjuOcV65cqGn+5sdq
 c6801g4paJQkV6TWN0jbyIziDA==
X-Google-Smtp-Source: ABdhPJznwbMzq39OuuwgywtQfdO6SK6Rvg7SgEPSB5U0OmiqmTtuojRw31rcoMIMpjvhGbexmHK5mQ==
X-Received: by 2002:a5d:4411:: with SMTP id z17mr6946508wrq.59.1639061797834; 
 Thu, 09 Dec 2021 06:56:37 -0800 (PST)
Received: from xps15-9570.lan (host-92-16-105-103.as13285.net. [92.16.105.103])
 by smtp.gmail.com with ESMTPSA id y142sm30845wmc.40.2021.12.09.06.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 06:56:37 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: marcandre.lureau@redhat.com,
	mst@redhat.com,
	alex.bennee@linaro.org
Subject: [PATCH 2/8] MAINTAINERS: Add virtio-video section
Date: Thu,  9 Dec 2021 14:55:55 +0000
Message-Id: <20211209145601.331477-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209145601.331477-1-peter.griffin@linaro.org>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.griffin@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Griffin <peter.griffin@linaro.org>, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add myself as maintainer of the virtio-video files added
in this series.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7543eb4d59..43c53aded8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2012,6 +2012,14 @@ F: hw/virtio/vhost-user-rng-pci.c
 F: include/hw/virtio/vhost-user-rng.h
 F: tools/vhost-user-rng/*
 
+virtio-video
+M: Peter Griffin <peter.griffin@linaro.org>
+S: Supported
+F: hw/display/vhost-user-video.c
+F: hw/display/vhost-user-video-pci.c
+F: include/hw/virtio/vhost-user-video.h
+F: tools/vhost-user-video/*
+
 virtio-crypto
 M: Gonglei <arei.gonglei@huawei.com>
 S: Supported
-- 
2.25.1


