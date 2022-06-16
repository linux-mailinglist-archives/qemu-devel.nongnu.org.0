Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AE354DDC2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 11:01:57 +0200 (CEST)
Received: from localhost ([::1]:33706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1lO0-0004Fy-AN
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 05:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvr-0001re-Qw
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvp-0002uM-Og
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ns720VWulrkWhyB7bozvdSN9VEh7MyrdoQ2B4TQTFW4=;
 b=PJ41AUg3rAvC9oTWoybOHQuo0pAL42szaEy5yZ7FwxKV34HI7Fr7NgdPwG13uNnZgFIguq
 jyTBDxheewY62pAoSBT4PwcDMcDHjO7Qh6lotzfvoL87KLDTpTilBozi6/mt9+6xCM77aT
 hiXMsT9ho7x3aFH2rGguOAidDvBHHJ4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-X5w0d5TpNdGYrOy2PxTo-A-1; Thu, 16 Jun 2022 04:32:47 -0400
X-MC-Unique: X5w0d5TpNdGYrOy2PxTo-A-1
Received: by mail-ej1-f70.google.com with SMTP id
 kf3-20020a17090776c300b0070d149300e9so312155ejc.15
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 01:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ns720VWulrkWhyB7bozvdSN9VEh7MyrdoQ2B4TQTFW4=;
 b=Ss0LZsY2lawAFSKgRHUEGicH0VG5wdI1e1uJVRV60zDV5EJTOw0g+2lfvoTk31DkTu
 +zmbmNFaD6ymI/zGYvNHWry1sjwrOnL9rDoy/CbMvmUsWCrT8mBcVsDxuH9rRiMRyZ+E
 cpGDlCPj6mlp034bDr2Y2EOnUAAcd8aXNnNNmf2TZ839ja+OzgazIyVebZ4nS131G8H1
 A7SXyKsaVyLwGygtGNqVC0vPtl7nDnmF+gYZDK7Y1SWBpY41Aof2zBMVGZOJtjh4DRXq
 jMzBRu5N7ADvdYaxwQsUl0r5Cxal1QlJEv87Q4EQ2Xp4uGJS4IYREPcDWGDj2yP+1L5J
 WjHg==
X-Gm-Message-State: AJIora80qUuLL1SaJhuJOi51SDf91TJgm4TYnOFSkTVUZnbmFnN9MIGA
 60O60ExNCnkFJf1QIp5t7VdJhoBa6DO+vhJk17xErFVlNOZvNa4O1XeHRodldZ8fat+boXge8TT
 wPijssj66sSDOWkzD6HBA3qP+w0Ea3rIbVCRIxsEx4Sw8E6XZGCCszURFct6HmOcfkeI=
X-Received: by 2002:a17:906:7a08:b0:712:12f6:243a with SMTP id
 d8-20020a1709067a0800b0071212f6243amr3501276ejo.619.1655368365911; 
 Thu, 16 Jun 2022 01:32:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tbvgIogi3vWEyQPWi6mq2WTkqyENpCmX6yTkIYeFkLL7/AK4lrJtpX0y/k5T8jjGE1cB4EFg==
X-Received: by 2002:a17:906:7a08:b0:712:12f6:243a with SMTP id
 d8-20020a1709067a0800b0071212f6243amr3501261ejo.619.1655368365637; 
 Thu, 16 Jun 2022 01:32:45 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 la12-20020a170907780c00b007081282cbd8sm487413ejc.76.2022.06.16.01.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:32:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 16/21] configure: cleanup -fno-pie detection
Date: Thu, 16 Jun 2022 10:32:04 +0200
Message-Id: <20220616083209.117397-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616083209.117397-1-pbonzini@redhat.com>
References: <20220616083209.117397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Place it only inside the 'if test "$pie" = "no"' conditional.  Since
commit 43924d1e53 ("pc-bios/optionrom: detect -fno-pie", 2022-05-12),
the PIE options are detected independently by pc-bios/optionrom/Makefile,
and the CFLAGS_NOPIE/LDFLAGS_NOPIE variables are not used anymore.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/configure b/configure
index d41c7eddff..9fba134746 100755
--- a/configure
+++ b/configure
@@ -1346,13 +1346,6 @@ static THREAD int tls_var;
 int main(void) { return tls_var; }
 EOF
 
-# Check we support -fno-pie and -no-pie first; we will need the former for
-# building ROMs, and both for everything if --disable-pie is passed.
-if compile_prog "-Werror -fno-pie" "-no-pie"; then
-  CFLAGS_NOPIE="-fno-pie"
-  LDFLAGS_NOPIE="-no-pie"
-fi
-
 if test "$static" = "yes"; then
   if test "$pie" != "no" && compile_prog "-Werror -fPIE -DPIE" "-static-pie"; then
     CONFIGURE_CFLAGS="-fPIE -DPIE $CONFIGURE_CFLAGS"
@@ -1365,8 +1358,10 @@ if test "$static" = "yes"; then
     pie="no"
   fi
 elif test "$pie" = "no"; then
-  CONFIGURE_CFLAGS="$CFLAGS_NOPIE $CONFIGURE_CFLAGS"
-  CONFIGURE_LDFLAGS="$LDFLAGS_NOPIE $CONFIGURE_LDFLAGS"
+  if compile_prog "-Werror -fno-pie" "-no-pie"; then
+    CONFIGURE_CFLAGS="-fno-pie $CONFIGURE_CFLAGS"
+    CONFIGURE_LDFLAGS="-no-pie $CONFIGURE_LDFLAGS"
+  fi
 elif compile_prog "-Werror -fPIE -DPIE" "-pie"; then
   CONFIGURE_CFLAGS="-fPIE -DPIE $CONFIGURE_CFLAGS"
   CONFIGURE_LDFLAGS="-pie $CONFIGURE_LDFLAGS"
-- 
2.36.1



