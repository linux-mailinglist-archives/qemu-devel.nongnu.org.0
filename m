Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AB1529E86
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 11:54:27 +0200 (CEST)
Received: from localhost ([::1]:59046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqtuM-0000xK-C7
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 05:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTq-0000Ep-Ee
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:27:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTe-0003er-VR
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:26:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652779610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hshat3Eo9CmcRJ8QLwild97BK5cAhoxPxYvBPFkFfJ4=;
 b=G1giEzwaPB107lKG1Da/dn0pgzEy7jcQUu9xtsM0niGROlcCmuk3SuFfGVUy0YQ2rG9vnU
 iUu6MAvFzRpeb7rs5litb7C+nYVn4upT032wfhYe1vax9xJ9w37tnr0hdsiz4OXrz7lK+m
 tTYTaW7lan1jZxRakr1Uk7vcze/ZaAI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-TEfnwveiOzC3hS2Y_bAqSQ-1; Tue, 17 May 2022 05:26:41 -0400
X-MC-Unique: TEfnwveiOzC3hS2Y_bAqSQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 n7-20020a05640206c700b0042aaeb9d702so3882862edy.19
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 02:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hshat3Eo9CmcRJ8QLwild97BK5cAhoxPxYvBPFkFfJ4=;
 b=hPl5sAeMwkImL8ZCX3p3nYnIGb2phK1XxvWNn99DqxcLcRrUcOIqNfod1AdRHc0ZGS
 SgiHQ4vUwCOiWoK5bXPF+z1I97ANbWM06zUJ27hOYdqWNVBXycBieueByn621hdXM6b3
 3o5EVhWIVPDOikkn2JQbG5rumTFAJVyprMwVkzPhDbdP3khQHToCMYS4jWAMDdF+qOCI
 qPwuF1vV3cYpyrYKc1meJ0Pm3l3ZDualswg5hdbgHsnVbgCpX1vUMMeKnVAF7QpYR7Pe
 m8eycWHLslJizVUjrl+w28WOuVTG4RwoYxeNNK1xjVUD9ATnrKPsJekS9ed6Zhp5FC6D
 f2hg==
X-Gm-Message-State: AOAM533GtzrW4cP6RX5XEoitQrZeQNIb58HO98x8rUbT76Igh8KrJFjn
 57aEQP0GWu932FNr4MtaICC9NhapBPyYzN8zm0Ksww3SZY7P1T1OLVgmzk/fPfvsEj+/JHnGro7
 7sUFCA3+8sXozdzmteWiRuOBVRY9GAWLrfqJ3IHgf3qTBIt/QYJW77ificVlakWQ1/oE=
X-Received: by 2002:a05:6402:741:b0:42a:8fad:8f67 with SMTP id
 p1-20020a056402074100b0042a8fad8f67mr15682005edy.285.1652779600010; 
 Tue, 17 May 2022 02:26:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTVMdKCV1Wq0+RGk3kdgnjotTKsbG1wDs8bw+xGhk6pK2gAVn8pFb1CPbCz/OkR0Ep4GwJRw==
X-Received: by 2002:a05:6402:741:b0:42a:8fad:8f67 with SMTP id
 p1-20020a056402074100b0042a8fad8f67mr15681981edy.285.1652779599738; 
 Tue, 17 May 2022 02:26:39 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a50cdc9000000b0042617ba63d5sm6699153edj.95.2022.05.17.02.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 02:26:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 08/16] configure: add missing cross compiler fallbacks
Date: Tue, 17 May 2022 11:26:08 +0200
Message-Id: <20220517092616.1272238-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220517092616.1272238-1-pbonzini@redhat.com>
References: <20220517092616.1272238-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

The arm compiler can be used for armeb, and the sparc64 compiler
can be used for sparc.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 90cb477c90..1d9d60185c 100755
--- a/configure
+++ b/configure
@@ -1840,6 +1840,7 @@ fi
 : ${cross_cc_cflags_aarch64_be="-mbig-endian"}
 : ${cross_cc_alpha="alpha-linux-gnu-gcc"}
 : ${cross_cc_arm="arm-linux-gnueabihf-gcc"}
+: ${cross_cc_armeb="$cross_cc_arm"}
 : ${cross_cc_cflags_armeb="-mbig-endian"}
 : ${cross_cc_hexagon="hexagon-unknown-linux-musl-clang"}
 : ${cross_cc_cflags_hexagon="-mv67 -O2 -static"}
@@ -1862,9 +1863,10 @@ fi
 : ${cross_cc_riscv64="riscv64-linux-gnu-gcc"}
 : ${cross_cc_s390x="s390x-linux-gnu-gcc"}
 : ${cross_cc_sh4="sh4-linux-gnu-gcc"}
-: ${cross_cc_cflags_sparc="-m32 -mcpu=supersparc"}
 : ${cross_cc_sparc64="sparc64-linux-gnu-gcc"}
 : ${cross_cc_cflags_sparc64="-m64 -mcpu=ultrasparc"}
+: ${cross_cc_sparc="$cross_cc_sparc64"}
+: ${cross_cc_cflags_sparc="-m32 -mcpu=supersparc"}
 : ${cross_cc_x86_64="x86_64-linux-gnu-gcc"}
 : ${cross_cc_cflags_x86_64="-m64"}
 
-- 
2.36.0


