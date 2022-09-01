Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836925A9EEB
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:29:13 +0200 (CEST)
Received: from localhost ([::1]:51522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTowC-0004qy-6F
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTos4-0007gI-Ke
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:24:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTorx-0008In-I5
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:24:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9TGqR42IIh0W5zzAjmUJalReceOPo/hBFTgDSpAMS4E=;
 b=hk5QOJJRSrgQqKH5LMfPVp7WYKhP9pD+5LcljRsWEbgQypQnvdO2871TlPB9mEPUNxzIlw
 ZxoZW7o+/id553zS01Skc5NmtA5onPk2YN0I/HzB8MRy8Q9RAd6NP9k23Kv3inftJrEs4j
 xAAtH4b+MO4p8PNzJvYZKj9H6Pa9WOY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-447-JAOceobPOLK-PV2t9kbEHQ-1; Thu, 01 Sep 2022 14:24:47 -0400
X-MC-Unique: JAOceobPOLK-PV2t9kbEHQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 he38-20020a1709073da600b0073d98728570so7336366ejc.11
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9TGqR42IIh0W5zzAjmUJalReceOPo/hBFTgDSpAMS4E=;
 b=vQziiurgP02ZxFnOV8ZovPfXNKCwyhurBo+0rEz4AymfFQxf4e9TH144+xRCtj+Ezh
 Twsy1PPHdROVV3zH4nkP8f++vedw2dUEeW1Pw+fVlPMUeWrgBeYJkmucEmQEbS7KKzfW
 8wGz4LnTc/3iYNeF+1K5mHVpOOpeQfkdunsY9YwfnnQOPl7n72XUAq3D01VSUOEOkf8j
 fbbSHoabhaXV12wbMP7z9nm4pTsmGV/n4SnV265VfcLc+LMmn8JGlbRU0XAOyHHyios/
 28qITTAoBnCKNbdXvVPM+Zaw8g3EJUbC1LDHIDB7b9o70vgv7/0UKXkBnCHv3llggrmB
 iAtQ==
X-Gm-Message-State: ACgBeo1VW3oOY2/9MimZi0MsrNvQaCT6iO/DfQ6HSN85PjOsoTN3yGD4
 hU2G8vBNIptMtgG9DAE2Z1OVGrpJlx0Kp+57TGsbYVWgPAQvUSr/2LUvapYBsdZtQArwjSfsU4c
 rNfuhUkmk2wUkIjG+cKj3dtRjVto7MBwMb1iwRHy9vM2XDRDTyCR94xTPiMxx67yvY+E=
X-Received: by 2002:a05:6402:b74:b0:447:d664:83f6 with SMTP id
 cb20-20020a0564020b7400b00447d66483f6mr26498318edb.303.1662056685669; 
 Thu, 01 Sep 2022 11:24:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Ip4PDjF1HrqUC2+pdGLvPVW1w0Q0Pxg4ZARO6wwfY282QG3W8tBvywiRz5WG2XrKW4lOnSg==
X-Received: by 2002:a05:6402:b74:b0:447:d664:83f6 with SMTP id
 cb20-20020a0564020b7400b00447d66483f6mr26498299edb.303.1662056685340; 
 Thu, 01 Sep 2022 11:24:45 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a17090676d200b00730860b6c43sm8822137ejn.173.2022.09.01.11.24.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:24:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/39] configure: improve error for ucontext coroutine backend
Date: Thu,  1 Sep 2022 20:23:56 +0200
Message-Id: <20220901182429.93533-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Instead of using feature_not_found(), which is not a good match because
there is no "remedy" to fix the lack of makecontext(), just print a
custom error.

This happens to remove the last use of feature_not_found(), so remove
the definition and the documentation.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                   | 11 +----------
 docs/devel/build-system.rst |  5 -----
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/configure b/configure
index 72ab03f11a..575dde1c1f 100755
--- a/configure
+++ b/configure
@@ -1468,15 +1468,6 @@ if test "$tcg" = "enabled"; then
     git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
 fi
 
-feature_not_found() {
-  feature=$1
-  remedy=$2
-
-  error_exit "User requested feature $feature" \
-      "configure was not able to find it." \
-      "$remedy"
-}
-
 # ---
 # big/little endian test
 cat > $TMPC << EOF
@@ -1639,7 +1630,7 @@ else
     ;;
   ucontext)
     if test "$ucontext_works" != "yes"; then
-      feature_not_found "ucontext"
+      error_exit "'ucontext' backend requested but makecontext not available"
     fi
     ;;
   sigaltstack)
diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 431caba7aa..1894721743 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -99,11 +99,6 @@ developers in checking for system features:
    Write a minimal C program main() function to the temporary file
    indicated by $TMPC
 
-``feature_not_found $NAME $REMEDY``
-   Print a message to stderr that the feature $NAME was not available
-   on the system, suggesting the user try $REMEDY to address the
-   problem.
-
 ``error_exit $MESSAGE $MORE...``
    Print $MESSAGE to stderr, followed by $MORE... and then exit from the
    configure script with non-zero status
-- 
2.37.2



