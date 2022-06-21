Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35078552C9C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 10:06:50 +0200 (CEST)
Received: from localhost ([::1]:34256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3YuP-0000wP-BO
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 04:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o3YgK-0003IA-3J
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 03:52:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o3YgI-0005wK-MM
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 03:52:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655797930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vdqmLvR6JN932wcQnmiu8+mPHY+md+mV37njXiUqS3g=;
 b=BgdrMVXgrF4t78PCmgLzPB+kmJc3h/NDx7FXorod53kTcrvJ71IdgE3YqIljuhHN9HpC7Q
 5Ya3k7kMFKjzoNSWZFiy4vtX2sj5Cnp7EBhvBmrNCCp5caxF6XxRuR8YcSRtGzgDM40H/V
 TI+nv/GnaqrVnNcZZqW8Gf8sMofieao=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-ZGMlOtY7MeSSdz7ggO3hHg-1; Tue, 21 Jun 2022 03:52:00 -0400
X-MC-Unique: ZGMlOtY7MeSSdz7ggO3hHg-1
Received: by mail-ed1-f71.google.com with SMTP id
 y5-20020a056402358500b0043592ac3961so1267950edc.6
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 00:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vdqmLvR6JN932wcQnmiu8+mPHY+md+mV37njXiUqS3g=;
 b=AS+BGPrVDw85x0UVhEraGhFLA7bOmlYsfLyeO8DcfHDbz0v/GI4rA+tI1rBaaYZpvw
 6jHXxhAJb3pseKbN8iikEee5e3DCfE6HgPH/C48UIMJud1pNCkw5QsEuO6kaFEielNJ+
 QjIoJeeI+tWJ2wrnNZBXTnw25CVISVAN9KR19cyIFt7QU7YDgF8jLE6nfXipysh0Q+YJ
 62gdyqj52cbzvJTdJnrDDMU3tZrzWLqW02r6/vloUFVvxJLt7mv5KR/lXsYE1XoQPUG5
 5FZ7IsbM3O7HcAC8z4ojAyPMkgP+mi62I/zT+D0xPgGvT3R13krlssB4ZxfGus1cLSfF
 AG9g==
X-Gm-Message-State: AJIora/EuvkoMxRdL+kTnUpe/X17E0/BuQwA7BRLMa/IkVPwnLSsDZEX
 qxoPyOLmdv7Il8MCcIyzrw6lu1EqWbJV2tLVB1OjyfnwayEV+tCo6LouwjAK/zlYwrwErSSnnXw
 RIzPr3ztkEsBDUz21GaLPdpVcCwzHi5xLG3yJpiv4FmXzOkat1Lxkyk1MMbhAL4GPfxg=
X-Received: by 2002:a17:907:d15:b0:71c:9ef2:2440 with SMTP id
 gn21-20020a1709070d1500b0071c9ef22440mr20747728ejc.266.1655797918607; 
 Tue, 21 Jun 2022 00:51:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u03Q1aHWrrJPgSt9nYGv2MyjAMnl2l+7bcA+qfnp1+gylkLdU3KQwvh4eSBgalA2MXgAGjrg==
X-Received: by 2002:a17:907:d15:b0:71c:9ef2:2440 with SMTP id
 gn21-20020a1709070d1500b0071c9ef22440mr20747718ejc.266.1655797918349; 
 Tue, 21 Jun 2022 00:51:58 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 ku7-20020a170907788700b00722c4b8a3ddsm2545352ejc.64.2022.06.21.00.51.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 00:51:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] configure: allow more host/target combos to use the host
 compiler
Date: Tue, 21 Jun 2022 09:51:46 +0200
Message-Id: <20220621075147.36297-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621075147.36297-1-pbonzini@redhat.com>
References: <20220621075147.36297-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Add more pairs of bi-arch compilers, so that it is not necessary to have
e.g. both little-endian and big-endian ARM compilers.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure b/configure
index 8f3401a23e..c9feb1a924 100755
--- a/configure
+++ b/configure
@@ -2058,8 +2058,12 @@ probe_target_compiler() {
   compute_target_variable $1 target_ranlib ranlib
   compute_target_variable $1 target_strip strip
   case "$1:$cpu" in
+    aarch64_be:aarch64 | \
+    armeb:arm | \
     i386:x86_64 | \
+    mips*:mips64 | \
     ppc*:ppc64 | \
+    sparc:sparc64 | \
     "$cpu:$cpu")
       : ${target_cc:=$cc}
       : ${target_ccas:=$ccas}
-- 
2.36.1



