Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC7D8674E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 18:42:56 +0200 (CEST)
Received: from localhost ([::1]:54088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvlV9-0006Bv-NS
	for lists+qemu-devel@lfdr.de; Thu, 08 Aug 2019 12:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55092)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hvlTf-0004So-CT
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 12:41:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hvlTd-0007UR-Kt
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 12:41:23 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41535)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hvlTd-0007Rz-EQ
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 12:41:21 -0400
Received: by mail-wr1-x434.google.com with SMTP id c2so92354616wrm.8
 for <qemu-devel@nongnu.org>; Thu, 08 Aug 2019 09:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1gvB+brx8aoGNUz43r6/Ya3+3uUFPyvcnU6yrAo83jo=;
 b=cKL0KCnmywhdx/f2oTbYxWfMLu+NRa857pk2czdhnZkzODQzD4Tvde4hRjE1VLawkk
 QBLixHzf4wGKIS9XJLLe072v2p6wjuIm0sLKExMsX7zzX6mInj4YYMf2/hWSRVm38sEJ
 pQv2HBucNsvUQfiI7gukZdRNUFUJcfOcHk5aj0MZWBsOG0NwqjYpEmNfy5bpXuCl143T
 Pd3MKAVyI3LIji9OdcqXBeHTmoPiCzaM8LD6goOBxxRqyjTa8p8FPL6bDHK1degV7/yL
 5JpKOLUcWiJvNBC8bM4PLMVLI29MH+o3OOXUqHhu8jTA3Wkqh8a0tvGNgCo4mlJOusnz
 syTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1gvB+brx8aoGNUz43r6/Ya3+3uUFPyvcnU6yrAo83jo=;
 b=W63pGCmr7iXyx4R5+JEYH2zJT649T+aOHgpgalpiU6FqdvvdpITNremu1zqgSfg8iR
 75yl7DmZezTggwA8D2/nDiXjyE8GRXZSLG9TzsxkrANV8Hpa5mDDItMwAlu49KIsU71u
 NFK6Q2aN9p8zIYXDeAogefWpVSchetlSMdkdPVMrQaw4IWeD8cSRraLPcpDdl7kqdi0g
 RjP+M2r7WOWiV62V5Hh7NxNRS/BioKPMmY2TrlpuLgZpQKwlVLC/h5yMfCdsN97YPmsn
 HStfdgeuWMERT5EGvXmpil/LwAjrclhPWluwzNOIZD6doJgCFx1+5giigODTlVyydIjT
 CvPw==
X-Gm-Message-State: APjAAAXHp1bIM8PHobLEIMUGIR3K9Uyj+0Oz/6Pll1lvSEc/ccu3bp6v
 2SWGbJPvb+GKV8NsPs5LAPxJmg==
X-Google-Smtp-Source: APXvYqx6iLFBg1LLHOZvJcAyyycCNVZUdHzZTQL96lhzNbZWPnyybmeEM0GN8lbyU95BCUWSeuYqFA==
X-Received: by 2002:a5d:50d1:: with SMTP id f17mr16926831wrt.124.1565282480288; 
 Thu, 08 Aug 2019 09:41:20 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id g8sm2028576wme.20.2019.08.08.09.41.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 09:41:19 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 711811FF8F;
 Thu,  8 Aug 2019 17:41:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  8 Aug 2019 17:41:12 +0100
Message-Id: <20190808164117.23348-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190808164117.23348-1-alex.bennee@linaro.org>
References: <20190808164117.23348-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::434
Subject: [Qemu-devel] [PATCH v1 2/7] fpu: move inline helpers into a
 separate header
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, armbru@redhat.com,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are a bunch of users of the inline helpers who do not need
access to the entire softfloat API. Move those inline helpers into a
new header file which can be included without bringing in the rest of
the world.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/fpu/softfloat-helpers.h | 118 ++++++++++++++++++++++++++++++++
 include/fpu/softfloat.h         |  63 +----------------
 2 files changed, 119 insertions(+), 62 deletions(-)
 create mode 100644 include/fpu/softfloat-helpers.h

diff --git a/include/fpu/softfloat-helpers.h b/include/fpu/softfloat-helpers.h
new file mode 100644
index 00000000000..de90663d384
--- /dev/null
+++ b/include/fpu/softfloat-helpers.h
@@ -0,0 +1,118 @@
+/*
+ * QEMU float support - standalone helpers
+ *
+ * This is provided for files that don't need the access to the full
+ * set of softfloat functions. Typically this is cpu initialisation
+ * code which wants to set default rounding and exceptions modes.
+ *
+ * The code in this source file is derived from release 2a of the SoftFloat
+ * IEC/IEEE Floating-point Arithmetic Package. Those parts of the code (and
+ * some later contributions) are provided under that license, as detailed below.
+ * It has subsequently been modified by contributors to the QEMU Project,
+ * so some portions are provided under:
+ *  the SoftFloat-2a license
+ *  the BSD license
+ *  GPL-v2-or-later
+ *
+ * Any future contributions to this file after December 1st 2014 will be
+ * taken to be licensed under the Softfloat-2a license unless specifically
+ * indicated otherwise.
+ */
+
+/*
+===============================================================================
+This C header file is part of the SoftFloat IEC/IEEE Floating-point
+Arithmetic Package, Release 2a.
+
+Written by John R. Hauser.  This work was made possible in part by the
+International Computer Science Institute, located at Suite 600, 1947 Center
+Street, Berkeley, California 94704.  Funding was partially provided by the
+National Science Foundation under grant MIP-9311980.  The original version
+of this code was written as part of a project to build a fixed-point vector
+processor in collaboration with the University of California at Berkeley,
+overseen by Profs. Nelson Morgan and John Wawrzynek.  More information
+is available through the Web page `http://HTTP.CS.Berkeley.EDU/~jhauser/
+arithmetic/SoftFloat.html'.
+
+THIS SOFTWARE IS DISTRIBUTED AS IS, FOR FREE.  Although reasonable effort
+has been made to avoid it, THIS SOFTWARE MAY CONTAIN FAULTS THAT WILL AT
+TIMES RESULT IN INCORRECT BEHAVIOR.  USE OF THIS SOFTWARE IS RESTRICTED TO
+PERSONS AND ORGANIZATIONS WHO CAN AND WILL TAKE FULL RESPONSIBILITY FOR ANY
+AND ALL LOSSES, COSTS, OR OTHER PROBLEMS ARISING FROM ITS USE.
+
+Derivative works are acceptable, even for commercial purposes, so long as
+(1) they include prominent notice that the work is derivative, and (2) they
+include prominent notice akin to these four paragraphs for those parts of
+this code that are retained.
+
+===============================================================================
+*/
+
+#ifndef _SOFTFLOAT_HELPERS_H_
+#define _SOFTFLOAT_HELPERS_H_
+
+#include "fpu/softfloat-types.h"
+
+static inline void set_float_detect_tininess(int val, float_status *status)
+{
+    status->float_detect_tininess = val;
+}
+static inline void set_float_rounding_mode(int val, float_status *status)
+{
+    status->float_rounding_mode = val;
+}
+static inline void set_float_exception_flags(int val, float_status *status)
+{
+    status->float_exception_flags = val;
+}
+static inline void set_floatx80_rounding_precision(int val,
+                                                   float_status *status)
+{
+    status->floatx80_rounding_precision = val;
+}
+static inline void set_flush_to_zero(flag val, float_status *status)
+{
+    status->flush_to_zero = val;
+}
+static inline void set_flush_inputs_to_zero(flag val, float_status *status)
+{
+    status->flush_inputs_to_zero = val;
+}
+static inline void set_default_nan_mode(flag val, float_status *status)
+{
+    status->default_nan_mode = val;
+}
+static inline void set_snan_bit_is_one(flag val, float_status *status)
+{
+    status->snan_bit_is_one = val;
+}
+static inline int get_float_detect_tininess(float_status *status)
+{
+    return status->float_detect_tininess;
+}
+static inline int get_float_rounding_mode(float_status *status)
+{
+    return status->float_rounding_mode;
+}
+static inline int get_float_exception_flags(float_status *status)
+{
+    return status->float_exception_flags;
+}
+static inline int get_floatx80_rounding_precision(float_status *status)
+{
+    return status->floatx80_rounding_precision;
+}
+static inline flag get_flush_to_zero(float_status *status)
+{
+    return status->flush_to_zero;
+}
+static inline flag get_flush_inputs_to_zero(float_status *status)
+{
+    return status->flush_inputs_to_zero;
+}
+static inline flag get_default_nan_mode(float_status *status)
+{
+    return status->default_nan_mode;
+}
+
+#endif /* _SOFTFLOAT_HELPERS_H_ */
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index d9333eb65b8..ecb8ba01149 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -93,68 +93,7 @@ enum {
 };
 
 #include "fpu/softfloat-types.h"
-
-static inline void set_float_detect_tininess(int val, float_status *status)
-{
-    status->float_detect_tininess = val;
-}
-static inline void set_float_rounding_mode(int val, float_status *status)
-{
-    status->float_rounding_mode = val;
-}
-static inline void set_float_exception_flags(int val, float_status *status)
-{
-    status->float_exception_flags = val;
-}
-static inline void set_floatx80_rounding_precision(int val,
-                                                   float_status *status)
-{
-    status->floatx80_rounding_precision = val;
-}
-static inline void set_flush_to_zero(flag val, float_status *status)
-{
-    status->flush_to_zero = val;
-}
-static inline void set_flush_inputs_to_zero(flag val, float_status *status)
-{
-    status->flush_inputs_to_zero = val;
-}
-static inline void set_default_nan_mode(flag val, float_status *status)
-{
-    status->default_nan_mode = val;
-}
-static inline void set_snan_bit_is_one(flag val, float_status *status)
-{
-    status->snan_bit_is_one = val;
-}
-static inline int get_float_detect_tininess(float_status *status)
-{
-    return status->float_detect_tininess;
-}
-static inline int get_float_rounding_mode(float_status *status)
-{
-    return status->float_rounding_mode;
-}
-static inline int get_float_exception_flags(float_status *status)
-{
-    return status->float_exception_flags;
-}
-static inline int get_floatx80_rounding_precision(float_status *status)
-{
-    return status->floatx80_rounding_precision;
-}
-static inline flag get_flush_to_zero(float_status *status)
-{
-    return status->flush_to_zero;
-}
-static inline flag get_flush_inputs_to_zero(float_status *status)
-{
-    return status->flush_inputs_to_zero;
-}
-static inline flag get_default_nan_mode(float_status *status)
-{
-    return status->default_nan_mode;
-}
+#include "fpu/softfloat-helpers.h"
 
 /*----------------------------------------------------------------------------
 | Routine to raise any or all of the software IEC/IEEE floating-point
-- 
2.20.1


