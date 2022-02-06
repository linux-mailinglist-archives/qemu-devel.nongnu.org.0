Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F214AAEBA
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 10:59:35 +0100 (CET)
Received: from localhost ([::1]:55762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGeKU-00087c-Cw
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 04:59:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdzt-0000AW-45
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdzn-0003dD-7j
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EU2zPx6JC+R5DZIlP0yKSn9BYb3OIhPFICOQQCHTxuk=;
 b=DuTUg6W/EcFU/pIfTr9tpuSQwhsSVDXsnQWmWXlBWyG1Lx4w0570Gs2os9i8f4MX1DUwd3
 rFM0pTxaQimn2nPjzd02zLK4gM0oGlYjkYxbLyb8p+Tb7wyKByPoqYDHY48pUDN2g7eToI
 ejQRwtM8XfBLlv5MNbaRZDX13anJSxo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-t7yI1fGXMqGrZ5SCDQk_kA-1; Sun, 06 Feb 2022 04:37:51 -0500
X-MC-Unique: t7yI1fGXMqGrZ5SCDQk_kA-1
Received: by mail-wm1-f69.google.com with SMTP id
 r8-20020a7bc088000000b0037bbf779d26so527468wmh.7
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:37:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EU2zPx6JC+R5DZIlP0yKSn9BYb3OIhPFICOQQCHTxuk=;
 b=G/RgEKh/wQUSvPcarFgYdC3vRXll2hfYwatK6nAOohJxUlVP/VcBHkXrikrG7DJ+q6
 RSkl3t5hlHs6JymnLSHWJ83GKfISkFZyRjQXpVHk7Rt1+AqaaMl42vmoVhrI/ac9oEQ8
 XUNdsecoTM15Rss1pCnNu8v7zg8c1MO3g4W865tzAdzxYGfhIEb4RPy1NNlVv1oVShOr
 l86DE9rF4yl2Z5SiR5UHlpTzU3b7wnFzcs/nrpkkHYHnkc0bWMbpeQ7saoO4/b0N1QFE
 bklbWg1C0wtfwa5qJskTKrwh7LOJtv6X9BBV/3Hc3aizmPoCAjABxC35BSOliL1zdOvE
 K1Ng==
X-Gm-Message-State: AOAM5311InMByGz4xj9M30nVlKZ97A2uJs0o06K3mlcjTJ+g74ePEZUp
 hnq6WdTa41D8BsjgntbCE1p+UQrWLEaD+q+/au7Aq6iEh5DGoZRo3Q+8YMtH7svSnMqpLDtXG75
 0f9VhXTYKmxokZ3NVmTYCBBkDcRQ9G5s+wwyzt3gCPImMjLjdMYLF4gVR6oVv
X-Received: by 2002:a5d:588c:: with SMTP id n12mr5934781wrf.496.1644140269945; 
 Sun, 06 Feb 2022 01:37:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhdzHuP6Xv50uPVIdzoXZeIQ+jSR57T2baOdDuIOZ9dm2teipDlOgdk2y3/o0sHvUU/sTAMQ==
X-Received: by 2002:a5d:588c:: with SMTP id n12mr5934763wrf.496.1644140269701; 
 Sun, 06 Feb 2022 01:37:49 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id 16sm5813922wmj.12.2022.02.06.01.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:37:49 -0800 (PST)
Date: Sun, 6 Feb 2022 04:37:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 01/24] cpuid: use unsigned for max cpuid
Message-ID: <20220206093702.1282676-2-mst@redhat.com>
References: <20220206093702.1282676-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220206093702.1282676-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <rth@twiddle.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

__get_cpuid_max returns an unsigned value.
For consistency, store the result in an unsigned variable.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 configure                 | 2 +-
 util/bufferiszero.c       | 2 +-
 tcg/i386/tcg-target.c.inc | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index e6cfc0e4be..dfb9019b24 100755
--- a/configure
+++ b/configure
@@ -2768,7 +2768,7 @@ cat > $TMPC << EOF
 #include <cpuid.h>
 int main(void) {
     unsigned a, b, c, d;
-    int max = __get_cpuid_max(0, 0);
+    unsigned max = __get_cpuid_max(0, 0);
 
     if (max >= 1) {
         __cpuid(1, a, b, c, d);
diff --git a/util/bufferiszero.c b/util/bufferiszero.c
index 695bb4ce28..ec3cd4ca15 100644
--- a/util/bufferiszero.c
+++ b/util/bufferiszero.c
@@ -272,7 +272,7 @@ static void init_accel(unsigned cache)
 
 static void __attribute__((constructor)) init_cpuid_cache(void)
 {
-    int max = __get_cpuid_max(0, NULL);
+    unsigned max = __get_cpuid_max(0, NULL);
     int a, b, c, d;
     unsigned cache = 0;
 
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 875311f795..4dab09f265 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -3747,7 +3747,7 @@ static void tcg_target_init(TCGContext *s)
 {
 #ifdef CONFIG_CPUID_H
     unsigned a, b, c, d, b7 = 0;
-    int max = __get_cpuid_max(0, 0);
+    unsigned max = __get_cpuid_max(0, 0);
 
     if (max >= 7) {
         /* BMI1 is available on AMD Piledriver and Intel Haswell CPUs.  */
-- 
MST


