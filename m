Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C4153E41D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 12:52:45 +0200 (CEST)
Received: from localhost ([::1]:56620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyALk-0002Jc-AV
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 06:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyAGM-0007f2-Le
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 06:47:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyAGJ-0001ca-R8
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 06:47:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654512426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qGkxBUipSzfB6+E2sZAGdDLFTlTNb1Nue4FDrBmMfFQ=;
 b=JJqxlQ13MT2TUqd6Ndy+dth2A43qk0wFIdLh/zCYTiXd908Z+WsWsmF/+0HX/GnFU0vtKN
 9h8jkdZ68rLCV8TKUR8FX6qrRrRS0t0ORBIarLVSYyov0zB48P+yocOvdD48gjTF816sHj
 6uLK/hzbUCwYUzwNUgluktWUidlGi/M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-Plab0sLLPMG0tarlkubS9g-1; Mon, 06 Jun 2022 06:47:05 -0400
X-MC-Unique: Plab0sLLPMG0tarlkubS9g-1
Received: by mail-wr1-f71.google.com with SMTP id
 d9-20020adfe849000000b00213375a746aso2184529wrn.18
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 03:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qGkxBUipSzfB6+E2sZAGdDLFTlTNb1Nue4FDrBmMfFQ=;
 b=BpW3zoW7DjjWa7kGg/2T/v5Dmnrnjnu/LvKiZuittZKIwKPWo334X7C+rzMO5NAfqt
 ZUjjEoXcVGiO8xBpiQQcR1IigI0QZWEmSTbY+8skIwG+otrJQytZVesX2kXS6CFVaKXg
 dMam9ioaAHnLv92xmvlhZ9rorL5k7cHhuXRal7n/eHQ3p60oOr52q9x9HJvxax7w2n4M
 7/n38gXpw+HGEnwnrC9QYh+CqD/BkGdvEGHE58P0kI4WIEkLGQ2dJ5VRgUQzE1Y4coIw
 uf6Br/cNRYhB+CMQzSByM8u5X7hjFPk8YwBrzE1jIq8/qh4zET3Hbh4Qg6f4f5094cmD
 nUxw==
X-Gm-Message-State: AOAM53394PyahpS2Q8Yt92sPXa3y3qU3R1AZ3+epdHAT1CgbpSmpJGvs
 f9Ff71lXvGhjZ8m1l5iOjy2JnJz/QFv89R9DQxNsL9A3Z/zQ2ne0dbRGr+9SS954c4/elNh2H4q
 OO6+nv/g6UEeBWh6qdwnNcCT7AS6p4s9Q1ALlQD95rRK4Gz9SJvAj5kleNW+SKvnQj8I=
X-Received: by 2002:adf:f00c:0:b0:210:3430:5fdd with SMTP id
 j12-20020adff00c000000b0021034305fddmr20813431wro.448.1654512423712; 
 Mon, 06 Jun 2022 03:47:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXGa95xmZzH3YroJbHLs5HQOpm+nB/36E2rwl/6krhxZlaDVRYFK31ibXv5MyZpr4ACnogXA==
X-Received: by 2002:adf:f00c:0:b0:210:3430:5fdd with SMTP id
 j12-20020adff00c000000b0021034305fddmr20813409wro.448.1654512423368; 
 Mon, 06 Jun 2022 03:47:03 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 t10-20020a5d460a000000b0021552eebde6sm8773197wrq.32.2022.06.06.03.47.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 03:47:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: remove reference to removed option
Date: Mon,  6 Jun 2022 12:47:01 +0200
Message-Id: <20220606104701.1107015-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index b9ccff9067..ac18ed4f3a 100755
--- a/configure
+++ b/configure
@@ -1035,7 +1035,6 @@ Advanced options (experts only):
   --with-git-submodules=ignore   do not update or check git submodules (default if no .git dir)
   --static                 enable static build [$static]
   --bindir=PATH            install binaries in PATH
-  --efi-aarch64=PATH       PATH of efi file to use for aarch64 VMs.
   --with-suffix=SUFFIX     suffix for QEMU data inside datadir/libdir/sysconfdir/docdir [$qemu_suffix]
   --without-default-features default all --enable-* options to "disabled"
   --without-default-devices  do not include any device that is not needed to
-- 
2.36.1


