Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5B91F7A3B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 16:59:34 +0200 (CEST)
Received: from localhost ([::1]:36770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjl9Z-00032c-L5
	for lists+qemu-devel@lfdr.de; Fri, 12 Jun 2020 10:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jjl2F-0006iQ-P5
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 10:52:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53232
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jjl2D-0001Rz-HF
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 10:51:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591973516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZYtQ0BAbh8xOWcl7gyHIjsinn42K680FL50RdRd5Yvs=;
 b=f4cNADIugyTYLpfD1M0bzCcQZTTSd8Yl15lpM2mEDwmtTnKsLTvAJzD3zmufSL+t/gxKs8
 RMHk2CE2wrnk9aEPRR4C8ZeLZeywYjTPWsznBLLr2769LLCZ7rmpiA5A0DrWTJNyRjbkx2
 jMXK+8zj/YUxUvCx7u+PlwKM8aGl9vM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104--BxxY0QqN9yZXPqd1ND9qA-1; Fri, 12 Jun 2020 10:51:53 -0400
X-MC-Unique: -BxxY0QqN9yZXPqd1ND9qA-1
Received: by mail-wm1-f69.google.com with SMTP id q7so2034716wmj.9
 for <qemu-devel@nongnu.org>; Fri, 12 Jun 2020 07:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZYtQ0BAbh8xOWcl7gyHIjsinn42K680FL50RdRd5Yvs=;
 b=FS09SYbDoAAELOCpt1j0uEYsasTBIk2CdrKjrvqW5kfKH3eKNeu7zUwrC91hZkyr1l
 tQ7oi+4i7h2TABIPzHZO2qMJTsyJV4itP8WX8mfWNl3WRDTvv8YgNZhYWzuPTGZsJmZp
 HH4hK8DWqi0OiMRhGNb9Y8WPCfCjaKvcRmHIvgrcU52TFRY+ZNUGp9Pyg5Nqdy0aqhI7
 yF01fciLD9HE5iemTt8UNTKUB6kXpJ57UPmlEcAvFOr1WitzlIPw34Gx3kHL/BNi/ct4
 M6xKIcV5gKBGUkADbdxW4DUl22iG56dMNCn6c0gipBiPbnyRuiJMXEcpmbui8hEPUFE8
 LbZg==
X-Gm-Message-State: AOAM53297onmg3LGW3S8Pr9vPwqBNMJiG/9Waqd3VpkAORIlto/q2wsA
 Rmvz6VS71j12OmvcmkDKE58vJPAVLJ6PJQS1BoAwTM3m6eIsWlZImQ+CIuDkGahUx4aVpWTRDiA
 pTjQLdoVnNwOfnk0=
X-Received: by 2002:a05:6000:12c4:: with SMTP id
 l4mr16210295wrx.128.1591973510890; 
 Fri, 12 Jun 2020 07:51:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE2oIL5ufdcWqhaGQ+l2MKYc12j1LNgLewHaz/ezwQ3QXmyXYIO+lliiKuLdRCh/u8SaIkBQ==
X-Received: by 2002:a05:6000:12c4:: with SMTP id
 l4mr16210274wrx.128.1591973510636; 
 Fri, 12 Jun 2020 07:51:50 -0700 (PDT)
Received: from redhat.com (bzq-79-178-18-124.red.bezeqint.net. [79.178.18.124])
 by smtp.gmail.com with ESMTPSA id b8sm10737701wrs.36.2020.06.12.07.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 07:51:50 -0700 (PDT)
Date: Fri, 12 Jun 2020 10:51:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 21/58] bios-tables-test: Generate reference tables for
 Q35/TPM-TIS
Message-ID: <20200612141917.9446-22-mst@redhat.com>
References: <20200612141917.9446-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200612141917.9446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/12 08:00:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 LOTS_OF_MONEY=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

TPM2, DSDT tables were generated using
tests/data/acpi/rebuild-expected-aml.sh

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-Id: <20200609125409.24179-6-eric.auger@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 tests/data/acpi/q35/DSDT.tis                | Bin 0 -> 8357 bytes
 tests/data/acpi/q35/TPM2.tis                | Bin 0 -> 76 bytes
 3 files changed, 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index a2a45d1d31..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.tis",
-"tests/data/acpi/q35/TPM2.tis",
diff --git a/tests/data/acpi/q35/DSDT.tis b/tests/data/acpi/q35/DSDT.tis
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..56b6fb0c3298517d080e38fea05a748b9f1dba54 100644
GIT binary patch
literal 8357
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

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/TPM2.tis b/tests/data/acpi/q35/TPM2.tis
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..7878a6e79a6a406d99ca1f5e9a528eb392b8d793 100644
GIT binary patch
literal 76
wcmWFu@HO&bU|?V=a`Jcf2v%^42yhMoiZKGkKx`0=4A_u4U^Ym_e|8WP0Iiz{0RR91

literal 0
HcmV?d00001

-- 
MST


