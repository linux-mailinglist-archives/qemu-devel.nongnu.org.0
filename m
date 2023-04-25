Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AD46EDD99
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 10:05:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDf6-00038J-Ll; Tue, 25 Apr 2023 04:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDf5-000388-47
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 04:04:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDf3-0001QJ-Ge
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 04:04:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682409868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zdUptC3OUS5/gVIT/clyQf+DzMu7cp2cXJXaS2I+boY=;
 b=TtXmVV8xwazcNIphRqZGhtv75xj6R/0R1A3bkIBrEvlop4vuEQce04gwXZ1jYH6/DXYuBo
 fsF3yuIES81U2SHznGwfJz7fhdVANnPDezfDLUyqeUU9aWLCBl0OLXxwj2JQMty93VzK6T
 ATOFszaEfe40GqUhfr9Y9uNWAXqXxoQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-tA_7pyCeN4CSl2g0ojB5dQ-1; Tue, 25 Apr 2023 04:04:26 -0400
X-MC-Unique: tA_7pyCeN4CSl2g0ojB5dQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f191fc08b7so15869265e9.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 01:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682409865; x=1685001865;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zdUptC3OUS5/gVIT/clyQf+DzMu7cp2cXJXaS2I+boY=;
 b=HPj+5Vgc7y/ay3GBE7wS6RLiLshZ17qeqbkTiw4h1obvHsq/eWR5ZtHtb7fVXw+kf0
 YmZfqiDLcsHRgUCGPPaDrt0Jxvex1ix6skSHXB7YxJj+1moeD3wq6rvkZ3MRs/7CWAxQ
 k4Hjdvu8s26TPU+BbAr7bjj0QAGBi15Ge8/phWdprbaQDH29riCsDp3ZPWmF28bBXY+F
 WMX+KRQQlgVaB1tRni3R0F1yzF7P+N3uKoKeyeeLyshYfhXVs+AGXMUDz06yiO1ET2Io
 OPbYO7h0dU8l4wYxGD6wjOtjtrg2EHJufR7qH5kOGOeGCOdywW/DSOiMQ0o9TKWuYFbA
 DdYA==
X-Gm-Message-State: AAQBX9fMQ4141E0mm78dnPeLxb5hjILmX7Y35Xat5LPlZfFui+2gUHKX
 AOC3eIN1+AT1nYNlpIEfSHld9D/wD8B4keRfZZExDx5R30/O+GFH/pmuuxxlMb1Qw58sK0mPW7v
 kzyZVdRv3aVEwGHMTVCJBWVwoiPsteHHtmyRPfxoC/s5itKoGLCJd2Q0StbiFbYCQ39v7
X-Received: by 2002:a5d:6d4d:0:b0:2ef:c0cf:c72b with SMTP id
 k13-20020a5d6d4d000000b002efc0cfc72bmr11584816wri.29.1682409865361; 
 Tue, 25 Apr 2023 01:04:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350YY0Sbf24aCoaZiHiR4zrg68icFRkbS6074lX1IIbB0wNH9Z/7YPCW5HdnyAlPVufLUaUkj/A==
X-Received: by 2002:a5d:6d4d:0:b0:2ef:c0cf:c72b with SMTP id
 k13-20020a5d6d4d000000b002efc0cfc72bmr11584795wri.29.1682409864997; 
 Tue, 25 Apr 2023 01:04:24 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 p17-20020a056000019100b002fda1b12a0bsm12579122wrx.2.2023.04.25.01.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 01:04:24 -0700 (PDT)
Date: Tue, 25 Apr 2023 04:04:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 24/31] docs: Remove obsolete descriptions of SR-IOV support
Message-ID: <2a3f8b333b6efbc0ccaacb318fb9c9d53f25bcfd.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

The documentation used to say there is no device implemented with
SR-IOV, but igb and nvme support SR-IOV today.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20230414090441.23156-1-akihiko.odaki@daynix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/pcie_sriov.txt | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/docs/pcie_sriov.txt b/docs/pcie_sriov.txt
index 11158dbf88..7eff7f2703 100644
--- a/docs/pcie_sriov.txt
+++ b/docs/pcie_sriov.txt
@@ -9,10 +9,7 @@ virtual functions (VFs) for the main purpose of eliminating software
 overhead in I/O from virtual machines.
 
 QEMU now implements the basic common functionality to enable an emulated device
-to support SR/IOV. Yet no fully implemented devices exists in QEMU, but a
-proof-of-concept hack of the Intel igb can be found here:
-
-git://github.com/knuto/qemu.git sriov_patches_v5
+to support SR/IOV.
 
 Implementation
 ==============
-- 
MST


