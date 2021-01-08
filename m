Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509C92EF5FD
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 17:49:32 +0100 (CET)
Received: from localhost ([::1]:48550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxux9-0005xQ-Au
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 11:49:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxuu9-0004Ce-EG
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:46:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxutu-0003fR-DK
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:46:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610124366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=53Byod/raVq1cruhMmN1Dc7/qzuu1tuV79jjDpV/HPE=;
 b=TBqSvLFhkmktQ/rLrbKAY4gtcXZ99qNyLgI2pv1QRw23IuixRjUzX5V6/fottsR1LcEBzG
 RO/nTUyCCVPsv2dPxZdpfG9NDWenjBFtkYbk7JAE91hbScJ8MD3325KFetcciEimOblWS5
 r2pxBUWwS/giJFX34J3qkAORlakR8EU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-0FFFLb7pNkWqe9e3yHGLaQ-1; Fri, 08 Jan 2021 11:46:05 -0500
X-MC-Unique: 0FFFLb7pNkWqe9e3yHGLaQ-1
Received: by mail-qv1-f69.google.com with SMTP id i20so8637811qvk.18
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 08:46:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=53Byod/raVq1cruhMmN1Dc7/qzuu1tuV79jjDpV/HPE=;
 b=fekN53JixSP6QD43dJbdJe4OHkQr73jHS98Yf1dUSJGMkULwl4P5Z4T/b9nV95Johe
 pdDkaJPAE0u1/WIAYlEOu4lzmyGwinuVBXFI4nutDP4Rs4i8E+QnDE6/gDYGqBWKH6GV
 QHedaJnNRURMbX3exwp2gQRqpC4UAWdR3uxmDLfBzuhMEHbGJc6cFKbhgYpppnbUK7No
 LU8p/tDIuNfOSd7n4TtKUrVQ7/7LirjteQjAYTEakeodTiq9YJC69CirlJr7pb16wFDb
 6Z73nDeGJPrXD9QGLBGYMJIICir8BfKLEUkRlZ7HHkXLx2+9seIw0Wl/uyrjfKox3uCu
 5oQA==
X-Gm-Message-State: AOAM530HOvqhAHYU3m+mH2lC0UzmhSf9qOCF/K8sEPlTeaaq75RjBzJ5
 AuLGYPluzhKhniqjiNifhGK73X+S2bHc01rfK7xTBZLEjiHdkDQZAD/nrmTdn7ZyfbixQoh9Tv2
 S3mamAVRtbHgCwb7LoH+ih4NB+L6U/oZp0XnMwKeRugWq+cVOwDrhnHCVAwq/8mzG
X-Received: by 2002:a0c:b989:: with SMTP id v9mr7606900qvf.42.1610124364499;
 Fri, 08 Jan 2021 08:46:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzii5MMHh4GOF+EEbY3ymFhWJMjmrNVmNmDTuGzI6EW7rfxiJVmCEiWz6aNIn0AZXevDWIdJA==
X-Received: by 2002:a0c:b989:: with SMTP id v9mr7606887qvf.42.1610124364305;
 Fri, 08 Jan 2021 08:46:04 -0800 (PST)
Received: from xz-x1.redhat.com ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id c139sm5067437qke.24.2021.01.08.08.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 08:46:03 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/13] update-linux-headers: Include const.h
Date: Fri,  8 Jan 2021 11:45:49 -0500
Message-Id: <20210108164601.406146-2-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108164601.406146-1-peterx@redhat.com>
References: <20210108164601.406146-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Farman <farman@linux.ibm.com>

Kernel commit a85cbe6159ff ("uapi: move constants from
<linux/kernel.h> to <linux/const.h>") breaks our script
because of the unrecognized include. Let's add that to
our processing.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 scripts/update-linux-headers.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index 9efbaf2f84..fa6f2b6272 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -41,6 +41,7 @@ cp_portable() {
                                      -e 'pvrdma_verbs' \
                                      -e 'drm.h' \
                                      -e 'limits' \
+                                     -e 'linux/const' \
                                      -e 'linux/kernel' \
                                      -e 'linux/sysinfo' \
                                      -e 'asm-generic/kvm_para' \
@@ -190,7 +191,9 @@ for i in "$tmpdir"/include/linux/*virtio*.h \
          "$tmpdir/include/linux/input.h" \
          "$tmpdir/include/linux/input-event-codes.h" \
          "$tmpdir/include/linux/pci_regs.h" \
-         "$tmpdir/include/linux/ethtool.h" "$tmpdir/include/linux/kernel.h" \
+         "$tmpdir/include/linux/ethtool.h" \
+         "$tmpdir/include/linux/const.h" \
+         "$tmpdir/include/linux/kernel.h" \
          "$tmpdir/include/linux/vhost_types.h" \
          "$tmpdir/include/linux/sysinfo.h"; do
     cp_portable "$i" "$output/include/standard-headers/linux"
-- 
2.26.2


