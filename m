Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE3A696440
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:07:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRv0D-0002Kb-G6; Tue, 14 Feb 2023 08:05:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pRv0B-0002KC-BJ
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:05:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pRv09-0008DI-8K
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:05:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676379939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E6R2XfPI8mjSF5Uq20zZV3dNQjwbH4dOnfUgs+F6wjs=;
 b=ZBagWtyciABCxLlSDBEvqsdpEFMGv6QDwbxPMNTr0fo99BIW8A6f/ZZE/bc1GjNUI/K4Uy
 d83Qx+fXP0NbbYl0FpJVzNyiN84vxcAkfbGIfRtFfUYlATnHtynWb4ROHyiWWEwcJj/SUI
 wRBEXrCLUxvEY3UV5Ru2pZp9+qb4zt4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-BcmpTudqORinGmwqN0wHNw-1; Tue, 14 Feb 2023 08:05:38 -0500
X-MC-Unique: BcmpTudqORinGmwqN0wHNw-1
Received: by mail-ej1-f69.google.com with SMTP id
 l18-20020a1709067d5200b008af415fdd80so9336216ejp.21
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:05:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E6R2XfPI8mjSF5Uq20zZV3dNQjwbH4dOnfUgs+F6wjs=;
 b=W9fhnJ2fWYeQoXnh1UZSHNYnu7tO9FccK6h9jcxosi5vszAyvoGCo97VfHgAO6WjOE
 7U6Xkjg7TLf48XH/VGRhX/lLr+HpSSfa9E3iAPUQ0rEbxo+1hT57kAiAhMIlnUSDF/8r
 IzyHEZ8BROH7kBPe6/3VtKF+M/cRHOTsPey69XC91hcQP3xKk8LiQfPqFjkRedgc5jHA
 u/XXujUx1v8BjRihnu8Ej9JwG9hV47VJAF8RcdLzC4f/5DOuFIJol0+Fko7fveYZMf5R
 DpjDR9V3xreWpo/UPH6K0G2F67qwCDxlHJGSrahYSRbJo3b4Pd4Z8rLn3xjH4uYDQJ5+
 NKdA==
X-Gm-Message-State: AO0yUKUXRr5/OoykiwopjooslyuSa8TdJ2Tq+HBsfotUw5szFlmbf17V
 tO9QPNPYytfOiUVRCHmccTXMmTDpfv+NokHQASSIjayYfmuSx4WEds65BOtOHzRpkPCYheJOrHd
 dIHO9SWhJd0Q/H0Uu7IK5rHAon1tgvBpB1QGcB3u8Zy/LQQ0QiDAF1VrbrX/ekxolX0Uhq8cl
X-Received: by 2002:a17:907:a40a:b0:88d:5043:2299 with SMTP id
 sg10-20020a170907a40a00b0088d50432299mr3563168ejc.51.1676379936831; 
 Tue, 14 Feb 2023 05:05:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8pQOxMVBYOas2kILWuLuqF8LhevbvfpxTk5z/rgEKBgMF5GBbMiKVB7NYWUSDT0HtlWj3OSA==
X-Received: by 2002:a17:907:a40a:b0:88d:5043:2299 with SMTP id
 sg10-20020a170907a40a00b0088d50432299mr3563133ejc.51.1676379936551; 
 Tue, 14 Feb 2023 05:05:36 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a1709062daa00b00889a77458dbsm8175815eji.21.2023.02.14.05.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 05:05:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: [qemu-web PATCH] revamp sponsorship page
Date: Tue, 14 Feb 2023 14:05:33 +0100
Message-Id: <20230214130533.38727-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Fosshost is mostly dead and can be removed from the page, but lately QEMU
has received important sponsorships from GNOME and Azure, so mention them.
OSUOSL also provides OpenStack virtual machines to QEMU.

Our CI resources are sponsored by WorksOnArm, the IBM LinuxOne community
cloud and GitLab.

Finally, include directions for people that want to sponsor QEMU or
donate money to the project.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 sponsors.md | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/sponsors.md b/sponsors.md
index 6db5e2f..efbec97 100644
--- a/sponsors.md
+++ b/sponsors.md
@@ -5,5 +5,21 @@ permalink: /sponsors/
 
 QEMU has sponsors!
 
-[Fosshost](https://fosshost.org/) has provided QEMU access to a dedicated
-physical compute host.
+The [Azure credits for open source projects](https://opensource.microsoft.com/azure-credits/)
+program provides QEMU and [Patchew](https://patchew.org) with virtual machines and
+other cloud resources.
+
+[Equinix](https://www.arm.com/markets/computing-infrastructure/works-on-arm?#Equinix),
+[IBM LinuxONE Community Cloud](https://developer.ibm.com/articles/get-started-with-ibm-linuxone/)
+and the [Oregon State University Open Source Labs](https://www.osuosl.org)
+also provide QEMU with access to compute hosts.
+
+Downloads are hosted by [GNOME](https://gnome.org/).
+
+QEMU is a member of the [GitLab for Open Source](https://about.gitlab.com/solutions/open-source/)
+program.
+
+You too can sponsor QEMU and be listed on this page; please contact the
+maintainers on the [QEMU mailing list](mailto:qemu-devel@nongnu.org).
+You can also [donate](https://paypal.com/donate/?hosted_button_id=YN74TZRMBBM6U)
+to the project via PayPal.
-- 
2.39.1


