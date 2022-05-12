Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6C25253BE
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 19:34:51 +0200 (CEST)
Received: from localhost ([::1]:50840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npCiA-0005n1-Ji
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 13:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZ4-0004vG-Ns
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZ1-00055l-1j
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gEDD5oFIVt6h6UD/wNZ8p021ml7rtZI2Tu/KBv66GSM=;
 b=WV3rha6iqSp2HMebwtpjI5fS1b9X6DxahXe/vwH0fw/eXb97TSLz5IflcVG35Csk09gwOu
 PP7lLg/t6XHotr1MEQer7cpfEh7meHQlvTTafnY1OOreGAzt+ZylrXj6Hno6oNJju/9YG9
 mKn3ziCB+2Lgzg0UWSUyOTyfFHSxQqE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-mYB919b7M3WdsfUTIEjb1Q-1; Thu, 12 May 2022 13:25:19 -0400
X-MC-Unique: mYB919b7M3WdsfUTIEjb1Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 s29-20020a50ab1d000000b00427e495f00cso3476440edc.14
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gEDD5oFIVt6h6UD/wNZ8p021ml7rtZI2Tu/KBv66GSM=;
 b=KpHVDrWSeFhEptPQIpGlyLYkPfM/L6D+vecp4dwaNrCDpsKKVjGpZjk2GTO0P5eaIu
 vBPh9CA0vAW6B8RTW0u3mSQ0Jd8TDqEtJI2yRHBmZcTcoEk/uclbFSKBwIf13NyrBcfM
 21/wQnFAvkz2Qh2cpEd2gQ4XmtxLYXRJW2obRAdJi5BLxAlU2F8wC2pEqXv7Ag5rVUN8
 N0x4dY6LKrEL2O4Nv6mqKB+qR8VriNB6n98HyjdpH20O34roPD7r1O0amGAJPjBZVWlQ
 9J5mtGl8LUAZq7o8x016YmFrzvI7KZnl1pxnG3zeD4QK12ObBz5s3q4I0LGSF5u9hjmj
 rClg==
X-Gm-Message-State: AOAM531kSxIgzYx61LbKTB2jQGaS68KaEuWHz6zhHUCdW5P0L+P5Bm81
 rZ2hhUrIgiGckXRc+eqNBAwRNGcHCEiSE+1wVT1qhiKU4nnhn/GQ/RPp/b2PO73KvA5MSPN8LnX
 DiLzV6XoK1f9NsRqyWV6LJ91H2/jAk0qtktSbNRD09aTkt2S2TTl73IVHOp8QP8HEItM=
X-Received: by 2002:aa7:c0c4:0:b0:425:c776:6f17 with SMTP id
 j4-20020aa7c0c4000000b00425c7766f17mr35696235edp.131.1652376317948; 
 Thu, 12 May 2022 10:25:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRt0FIBV3RtMIUU6kz+trc2o3GzYLlE3M9gJ5iLJW/gE+gixWjrMIXjHZftMNWeGobjXpoYA==
X-Received: by 2002:aa7:c0c4:0:b0:425:c776:6f17 with SMTP id
 j4-20020aa7c0c4000000b00425c7766f17mr35696210edp.131.1652376317694; 
 Thu, 12 May 2022 10:25:17 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a170906489100b006f3ef214dd4sm2235283ejq.58.2022.05.12.10.25.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/27] checkpatch: fix g_malloc check
Date: Thu, 12 May 2022 19:24:42 +0200
Message-Id: <20220512172505.1065394-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
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

Use the string equality operator "eq", and ensure that $1 is defined by
using "(try|)" instead of "(try)?".  The alternative "((?:try)?)" is
longer and less readable.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/checkpatch.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4763d02ae7..d900d18048 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2831,8 +2831,8 @@ sub process {
 		}
 
 # check for pointless casting of g_malloc return
-		if ($line =~ /\*\s*\)\s*g_(try)?(m|re)alloc(0?)(_n)?\b/) {
-			if ($2 == 'm') {
+		if ($line =~ /\*\s*\)\s*g_(try|)(m|re)alloc(0?)(_n)?\b/) {
+			if ($2 eq 'm') {
 				ERROR("unnecessary cast may hide bugs, use g_$1new$3 instead\n" . $herecurr);
 			} else {
 				ERROR("unnecessary cast may hide bugs, use g_$1renew$3 instead\n" . $herecurr);
-- 
2.36.0


