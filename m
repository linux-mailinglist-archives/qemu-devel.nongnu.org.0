Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877BF6EF850
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 18:21:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prhsy-0000ow-PG; Wed, 26 Apr 2023 12:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1prhsu-0000lq-Ny
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:20:49 -0400
Received: from esa9.hc2706-39.iphmx.com ([216.71.140.197])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1prhsf-0005eY-AR
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:20:48 -0400
X-IronPort-RemoteIP: 209.85.219.70
X-IronPort-MID: 276515920
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:avLob62kUv9I3C9QovbD5W9zkn2cJEfYwER7XKvMYLTBsI5bpzwFm
 DAYWGnSM6vcM2enL9EgPo7j9x4H75KBy4dmGwc4qSg9HnlHl5H5CIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv666yE6jfrSLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglYwr414rZ8Ek05Kio5mtC1rADTasjUGH2xiF94K03ePnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aLVeS8oiM+t5uK23CukhcPPpMTb5LwX6v2ZwKhxLidw
 P0V3XC5pJxA0qfkwYzxWDEBe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1tN1wnbYgmq91nBDlx5
 e40EhMKKRG60rfeLLKTEoGAh+wmJcjveZoB4zRukmmfAvEhTpTOBa7N4Le03h9q3pEITauYP
 ZNIL2U3BPjDS0Qn1lM/AZYumuuyrnPiNTBUtTp5oIJtvDaOlVEgiuCF3Nz9JIeaeeN8zkukp
 kH8xl/zWR9Bb96m1m/Qmp6rrqqV9c/hY6oLGbils/JnnlCX7moUDhIQSB28u/bRt6Klc9dWK
 khR4zR36KZtrAqkSd7yWxD+q3mB1vIBZ+dt/yQBwFnl4sLpD8yxWTNsouJpADD+iPILeA==
IronPort-HdrOrdr: A9a23:ozzFZqz5CQ/OLOuMTqGZKrPw+r1zdoMgy1knxilNoNJuA6ilfq
 eV7YgmPHrP4gr5N0tQ/+xoVJPwI080sKQFmrX5Xo3SITUOxlHYVb2KhLGKq1aQeBEWtNQtr5
 uIG5IfNDSaNykcsS+V2njcL/8QhPOqyuSHv9v/8ltaZT1WSshbnnhE48WgfnGehjMqOXP0Lv
 ShD7J81kKdkL0sAaWGOkU=
X-Talos-CUID: 9a23:pV3nLmO5dBu8X+5DWxJ65R4RJJEeYniF82fCD3WbDiFocejA
X-Talos-MUID: =?us-ascii?q?9a23=3AkmizWQxyVZn/LFxWMaacDv9E8rqaqPr1GHwruMU?=
 =?us-ascii?q?Lh8mnDxVLMWyT12+1e5Byfw=3D=3D?=
Received: from mail-qv1-f70.google.com ([209.85.219.70])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2023 12:20:09 -0400
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-5ef433ecde8so86191186d6.3
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 09:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682526008; x=1685118008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y81jYrFdHFI0h2IHDmqZGbfVAz90Pdxvxksgm9ZaytQ=;
 b=OvNI2kO24YfAOwQg3Ye3rc/amiT/WWXi8kBtDJTBr07mZoy3jdhc/+j4zs8ka45B4h
 WNMI4QgIqBYJy1Bghu+hlDJ/6W3dPLLWo/CaCbH9GgeHdR2xT1SRlrOa2rehN2ajHC17
 /S7vwfCczDEJ5TSwXfutVXBo656I1bsEnZQXvYiKXOKhX1Q0gMxlqqRoTLAvg/4GZIn9
 Y5wIrjoJ01kFpljBZLo2Gved33nGPF+POs0VwaTRL+5wYhnu2P5Jk9Bu+mSx+9aXMEfk
 x58kXJw6l6VvQ4ck62wI8uOQuGgLAeYzmlt38a7og5hRwbilRdVNWFSoypI/PWJkl5YE
 mqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682526008; x=1685118008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y81jYrFdHFI0h2IHDmqZGbfVAz90Pdxvxksgm9ZaytQ=;
 b=Ru+oKRq6odcnVIYIgsCEmyZTgUCjjT4HGZR6yGy3aU31YS9WkKxrIuiF5QSH7XM6gW
 VzW6YCNr0TMX4Pi6fe4mOjPSCR0iN3zPkJ6NaRd68qgPtsONyLLoIrWeFDzQxcgRoQ3Q
 i9wYG2qSOWxmgBBjGp7lypyGKjtRvOfP+2Yz6dBOtBMr+zZazPmNBKaDERZAEbkf6Xel
 C4ecgxU38jnWmYk+35Z0eiLAI27xpBI5qF/NAOfnd8oyeRxiZcblbrnvIzP4JZlk2Jof
 vzLNJ808eahYuE1wGa7lUNpECvwC0EyqTgQN6mEq5sSSti1cLifKFOIHsMv1ut9LexnX
 88mg==
X-Gm-Message-State: AAQBX9eZrvYmNqJSpK/Dg+5XkEa6T99bECVg7wlwRCD9kavpV/+6Jxjk
 JksFHUntGZrT0gVnecn6Wk5LAefYVTKFcc9TeAhPD9h+OnJ+cN3lmqE5MaL7Kb9bJI17NGW4n1y
 v+lDmb7M4XfY9cfkOQK3sHWjVfy457BqmFNWm6Yw35mQ=
X-Received: by 2002:a05:6214:5184:b0:5ef:83cf:91cc with SMTP id
 kl4-20020a056214518400b005ef83cf91ccmr31410659qvb.44.1682526007905; 
 Wed, 26 Apr 2023 09:20:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZZvF4BN23MesPeHsvQVLijSVmfauRkvdR2QLnuVM3FVNsqzfLeKKAzxoKfdZ4HItwSddaqNA==
X-Received: by 2002:a05:6214:5184:b0:5ef:83cf:91cc with SMTP id
 kl4-20020a056214518400b005ef83cf91ccmr31410620qvb.44.1682526007697; 
 Wed, 26 Apr 2023 09:20:07 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a0cf58f000000b005dd8b934595sm4984993qvm.45.2023.04.26.09.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 09:20:07 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH v9 3/8] checkpatch: add qemu_bh_new/aio_bh_new checks
Date: Wed, 26 Apr 2023 12:19:46 -0400
Message-Id: <20230426161951.2948996-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230426161951.2948996-1-alxndr@bu.edu>
References: <20230426161951.2948996-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.197; envelope-from=alxndr@bu.edu;
 helo=esa9.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Advise authors to use the _guarded versions of the APIs, instead.

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/checkpatch.pl | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index d768171dcf..eeaec436eb 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2865,6 +2865,14 @@ sub process {
 		if ($line =~ /\bsignal\s*\(/ && !($line =~ /SIG_(?:IGN|DFL)/)) {
 			ERROR("use sigaction to establish signal handlers; signal is not portable\n" . $herecurr);
 		}
+# recommend qemu_bh_new_guarded instead of qemu_bh_new
+        if ($realfile =~ /.*\/hw\/.*/ && $line =~ /\bqemu_bh_new\s*\(/) {
+			ERROR("use qemu_bh_new_guarded() instead of qemu_bh_new() to avoid reentrancy problems\n" . $herecurr);
+		}
+# recommend aio_bh_new_guarded instead of aio_bh_new
+        if ($realfile =~ /.*\/hw\/.*/ && $line =~ /\baio_bh_new\s*\(/) {
+			ERROR("use aio_bh_new_guarded() instead of aio_bh_new() to avoid reentrancy problems\n" . $herecurr);
+		}
 # check for module_init(), use category-specific init macros explicitly please
 		if ($line =~ /^module_init\s*\(/) {
 			ERROR("please use block_init(), type_init() etc. instead of module_init()\n" . $herecurr);
-- 
2.39.0


