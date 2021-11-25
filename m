Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4A445D9C2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 13:07:53 +0100 (CET)
Received: from localhost ([::1]:55178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqDXd-00010q-2A
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 07:07:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mqDWV-0000HD-EE
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 07:06:43 -0500
Received: from [2607:f8b0:4864:20::632] (port=46646
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mqDWT-0001Xw-Ek
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 07:06:43 -0500
Received: by mail-pl1-x632.google.com with SMTP id p18so4368456plf.13
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 04:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o5WhSH/wfhxb1Ak6Trg+laOzpvY8CUsKlnhyXtDQzW4=;
 b=Jy0XWzeLmGP8+cU+8g9Ad85CS+0c+iGeN62IQgcieTRtg8phFR6VSGmv69K4StQWS9
 RNH2s+VS/hbAOe8uaE/4Mva7QQvwag1hxKVPBHW37CjcMmpca+SOjB8Urxo9I5y07hU2
 +a6mfc5YZOPwCtzp3zJKnbv9//v6vlzxkwN61CnmBNWgII2GESD8G8KVBR1eljle7ZmI
 J7dtNyRECzMSEiZbXp8HF9ZUJ/nwtAJrZUSalrqsLKrZ9vTnS4UeQgJG3bkK7v7navrV
 80Gy0Dfh7u9/q/0BKRFa6QcpTIalIbLm4PEUWIpj2ovlhauWcAeAwVhcaTG1gghbkv9v
 3igQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o5WhSH/wfhxb1Ak6Trg+laOzpvY8CUsKlnhyXtDQzW4=;
 b=k/YHb7ysn9iWO0uEA0cyGf6AsiFzxBvkPKAdAzktqdtAxvnaQVGX16civgBMp9S3xM
 srBvfjc8LNxgtaXHutszeW+9WcQFFTAPbPIYD98nzzdYRtQuCn1G/q22+W5jmA01+tPW
 XYnSBMypJg4Bj4mgksa3anr5N5k10Psu0TWMupDCx2hDgiCl4LkJKgUIpCeietIfAjlS
 SXLv3X/ZqIScTX1zkYh/SqQlLVgmmCuiSCJsqq0YIONjZEniI0lPg1muQ5+pl5cWaH7R
 J2fdh1kEkEsBBMsfYI6OfzeTX8F+UeVd96sTWpLXkVfk1C6Qb5El0mdOol3W9v12Mgtt
 gatQ==
X-Gm-Message-State: AOAM532fs+9qe+T/akmt5dpjEbe21WU+XCNaNCIT+u9Jv9nVn0hQT6z2
 BNZ3Ak9G4sdyniAALulHhRXcTA==
X-Google-Smtp-Source: ABdhPJzWmcYNDNX4YG6iZh66om5kn8hrG7DJWVX8vtVTsHSNxLMtP4mxOqcuBi0CnQ7Ttalq/aM+1A==
X-Received: by 2002:a17:90a:7004:: with SMTP id
 f4mr6280531pjk.156.1637841999052; 
 Thu, 25 Nov 2021 04:06:39 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([49.207.198.191])
 by smtp.googlemail.com with ESMTPSA id nv12sm3212738pjb.49.2021.11.25.04.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:06:38 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-6.2] docs: add a word of caution on x-native-hotplug
 property for pcie-root-ports
Date: Thu, 25 Nov 2021 17:36:29 +0530
Message-Id: <20211125120629.187014-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x632.google.com
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
Cc: Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

x-native-hotplug property, when used in order to disable HPC bit on the PCIE
root ports, can lead to unexpected results from the guest operating system.
Users are strongly advised not to touch this property in order to manipulte the
HPC bit. Add a word of caution in the pcie.txt doc file to document this.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 docs/pcie.txt | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/docs/pcie.txt b/docs/pcie.txt
index 89e3502075..e1f99f725f 100644
--- a/docs/pcie.txt
+++ b/docs/pcie.txt
@@ -262,11 +262,26 @@ PCI Express Root Ports (and PCI Express Downstream Ports).
         Port, which may come handy for hot-plugging another device.
 
 
-5.3 Hot-plug example:
+5.2 Hot-plug example:
 Using HMP: (add -monitor stdio to QEMU command line)
   device_add <dev>,id=<id>,bus=<PCI Express Root Port Id/PCI Express Downstream Port Id/PCI-PCI Bridge Id/>
 
 
+5.3 A word of caution using hotplug on PCI Express Root Ports:
+Starting Qemu version 6.2, PCI Express Root ports have a property
+"x-native-hotplug" ("native-hotplug" for Qemu version 6.1), that can be used to
+enable or disable hotplug on that port. For example:
+
+-device pcie-root-port,x-native-hotplug=off,... etc.
+
+The "x-" prefix indicates that this property is highly experimental and can
+lead to unexpected results from the guest operating system if users try to use
+it to alter the native hotplug on the port. It also means that the property
+name and its behavior is liable to change in the future and is not expected to
+be stable across Qemu versions. Therefore, end users are advised not to change
+the value of this option from its default set value or use it in the Qemu
+command line.
+
 6. Device assignment
 ====================
 Host devices are mostly PCI Express and should be plugged only into
-- 
2.25.1


