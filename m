Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 029F9464906
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 08:44:47 +0100 (CET)
Received: from localhost ([::1]:41200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msKIH-0008KR-90
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 02:44:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1msKGP-0007cd-Gh
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 02:42:49 -0500
Received: from [2607:f8b0:4864:20::1032] (port=47072
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1msKGO-0003bq-4T
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 02:42:49 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so651163pjb.5
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 23:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UP0hfIWP8jDgh5um475p8JBgirstjgVgcmz6IWlqyso=;
 b=NL7e2YqNN5Bzc5H7IfsebNlPoMY6+7cRzRgaWfZmshur2lCz30zklhXJPulyVYqUso
 LUtL+lAcGvTklT+t1VxtwsM9xr4fIotRWGWJIiAXGlb8MLyViffnCNwEhY5XoR2hEt9R
 Y4k86USEzAcpAHeKs82TyTmnqHfyr+BMQFC2bnvs95YAfP9vZ2abFNbKZI2fq8RzzUFG
 stjMt0FlpXVoNzYUv7GoIH0I/vYyZ2p/oEwFr0AWCNJikYwxcOKTXrKQFVfE7StLIdpB
 WWh5Ii3Ox+skVMAG04EyXmi3BTn3nsNiNAQEGWodtFlwGwMJh+RbkQdHJwF1A3PfWbmT
 ApMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UP0hfIWP8jDgh5um475p8JBgirstjgVgcmz6IWlqyso=;
 b=ekdVlD4es9ew8BnA1ttCWHI4QXRRYX1cHlF3LwKncc1k0Uq8oWZdzctY/gLtYH0sJ5
 vrf9yMDSbYml034npeDCive0e5p5ONnPDGUzZEI5shgqSucxmjQLgA2OEwZ7rpQFxkC7
 U+lgqkRx3gRTu3CohSc/q+YzmvOqn/zjhXcUPo3rQXX3TC3ETi/ezkS/jgNVj/dUt6Hc
 fmOCx6M6t+4+IhdEIPG3kSak/ebp8yYekd/hBRRiSCXKLLUMr10Eafkq3zvfjrNXve/j
 TiC61TcDhg3Jl3jQ2O00yCScan1j1S62Ae1TBcmN9Ev4ruypS16rTQbNsJ7HUr3M3Ikg
 94Yw==
X-Gm-Message-State: AOAM5336CKeDkfrV4ZzXboUac93r4GqsFIwQsUHqViOmPYjft4pNiDmB
 EHBLexzyQsFFqdpErheiVhrwZtoDP/Xb/Q==
X-Google-Smtp-Source: ABdhPJx039iYHIWWeoMszZOluOMXu8R8fR9qXk52dUXgrI/8ZWqhFVa/SQxs26KCCfZ+8UsjEoZe3Q==
X-Received: by 2002:a17:902:ab47:b0:141:95b2:7eaf with SMTP id
 ij7-20020a170902ab4700b0014195b27eafmr5541094plb.40.1638344566485; 
 Tue, 30 Nov 2021 23:42:46 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([49.207.225.199])
 by smtp.googlemail.com with ESMTPSA id
 y18sm27246170pfa.142.2021.11.30.23.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 23:42:46 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2] docs: fix section numbering in pcie.txt
Date: Wed,  1 Dec 2021 13:12:26 +0530
Message-Id: <20211201074226.109287-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Liu Yi L <yi.l.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no 5.2 section. Section 5.3 should really be 5.2. Fix it.

fixes: 453ac8835b0022 ("docs: add PCIe devices placement guidelines")

Reviewed-by: Liu Yi L <yi.l.liu@intel.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 docs/pcie.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/pcie.txt b/docs/pcie.txt
index 89e3502075..90310b0c5e 100644
--- a/docs/pcie.txt
+++ b/docs/pcie.txt
@@ -262,7 +262,7 @@ PCI Express Root Ports (and PCI Express Downstream Ports).
         Port, which may come handy for hot-plugging another device.
 
 
-5.3 Hot-plug example:
+5.2 Hot-plug example:
 Using HMP: (add -monitor stdio to QEMU command line)
   device_add <dev>,id=<id>,bus=<PCI Express Root Port Id/PCI Express Downstream Port Id/PCI-PCI Bridge Id/>
 
-- 
2.25.1


