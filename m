Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E33564F3A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 10:03:44 +0200 (CEST)
Received: from localhost ([::1]:35078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8H3X-00053t-Pt
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 04:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o8Gzt-0002EF-5A
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 03:59:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o8Gzp-0007ew-0Z
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 03:59:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656921592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T9X8uCpaGt4LkAajR7SXrttcvlXnN+TKt7zUIfAEtRE=;
 b=PPXo5b75Glfydlc9dX8+2zQ1XvQ6PKny6gseZoW400d+1Y4SV4y2fSHxPpiQvw7iXeqQnQ
 NkGqG4tH9aNV+RiQXd/xfn0kQBn/SbkSdlSsbzivMqMnZ9oPvmj9K6qyMLIQbjjPUZmFd4
 hkLt7ppnynI+DWqCzH6ckOE/TcYkfew=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-aOsF6E6OOuy07MtNxDd9YA-1; Mon, 04 Jul 2022 03:59:48 -0400
X-MC-Unique: aOsF6E6OOuy07MtNxDd9YA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AB5B18812C0;
 Mon,  4 Jul 2022 07:59:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F07B518EB7;
 Mon,  4 Jul 2022 07:59:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9733D1800627; Mon,  4 Jul 2022 09:59:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Canokeys.org" <contact@canokeys.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 Simon Sapin <simon.sapin@exyr.org>
Subject: [PULL 1/8] Rename docs/specs/fw_cfg.txt to .rst
Date: Mon,  4 Jul 2022 09:59:39 +0200
Message-Id: <20220704075946.921883-2-kraxel@redhat.com>
In-Reply-To: <20220704075946.921883-1-kraxel@redhat.com>
References: <20220704075946.921883-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

From: Simon Sapin <simon.sapin@exyr.org>

This is a separate commit in order to make reviewing the next one easier.

Signed-off-by: Simon Sapin <simon.sapin@exyr.org>
Message-Id: <20220625161455.1232954-1-simon.sapin@exyr.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/specs/{fw_cfg.txt => fw_cfg.rst} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename docs/specs/{fw_cfg.txt => fw_cfg.rst} (100%)

diff --git a/docs/specs/fw_cfg.txt b/docs/specs/fw_cfg.rst
similarity index 100%
rename from docs/specs/fw_cfg.txt
rename to docs/specs/fw_cfg.rst
-- 
2.36.1


