Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7AE5A1C22
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:20:15 +0200 (CEST)
Received: from localhost ([::1]:58726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLCu-0004bV-Pl
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7H-0007Ub-Qr
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7C-0002hm-9z
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661465656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7fdh4fhJg5yKxKBLy8mHKHkidzeecAnzTEJLL77bgjE=;
 b=hnZPHxERzmbCnKfw5cLZZ1Tg0JaXr+bPQsv736g17WNAsd+1Pq8FWM94jXRq4blBhK6deA
 DnXuZisW1AFuEtfJRagwoCKmoCMdTqrEnTJLk5MBeXP/Io27JFYfnd7D39fPNajgVvlquO
 U7zrxAINR2ww84cIFgSUzoffLQmDBtU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-8Jcqb74ZNwe6sKC8EOM7HA-1; Thu, 25 Aug 2022 18:14:15 -0400
X-MC-Unique: 8Jcqb74ZNwe6sKC8EOM7HA-1
Received: by mail-wm1-f69.google.com with SMTP id
 j3-20020a05600c1c0300b003a5e72421c2so2984902wms.1
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=7fdh4fhJg5yKxKBLy8mHKHkidzeecAnzTEJLL77bgjE=;
 b=N/m2cXVHg1ksbxOOy0u2+rX/OLjIEihjPMQktmH3SkeKrp53FlDFJ7LqhAnXkY7vp7
 rjsdfIvTgxfnCyecAISEjKFtuG/TQcCYcSmRMwXsP4FeooQS5Mdn+oy/h3OCDv1OCyg5
 ONpEDKB0AnVGRcVSLvC2q0/d1frrOY450VEx77kzl0eF/LR33paXWw+D3QcxO2Hir3xX
 Wmo7PDJqXnYVkKs0TiS5sjOS18JyJ68cR2pq0+baCu6DS7OSzRWPdszWtPBsOF+GmJpB
 7h0rOoC2fCpOXptB2fE3TBldxJgc/EsJ9azEcXskGWDkr0sq7zSLbBiBPXql623nu2JN
 uJCQ==
X-Gm-Message-State: ACgBeo3hxTQPq/a37hhaKfMjnofuHHv9FAXhpwz4X1lP18VTNhnH+FXl
 RdUWS3quSGDE0WzCOrbpLDrxkBznUIVAD0pX2I7N2UQVtoPHlDmdtzOT1nJVRl/qPlgfklobwW/
 swjZr1lyThKObhL7+FuP+uGfsY1YIPXSn2Hk49BmVMlGBkoB75RMp2IBSnpAtk0ZRXXE=
X-Received: by 2002:a05:600c:3582:b0:3a6:9e0a:6a67 with SMTP id
 p2-20020a05600c358200b003a69e0a6a67mr2416795wmq.77.1661465653436; 
 Thu, 25 Aug 2022 15:14:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4O9SuWGJwEMjVua3ZEiZCj2m5IpsYSzQkB99PGDzDKDYyENuHWHJzsfhDXAadNuEsgM9A/5A==
X-Received: by 2002:a05:600c:3582:b0:3a6:9e0a:6a67 with SMTP id
 p2-20020a05600c358200b003a69e0a6a67mr2416783wmq.77.1661465653126; 
 Thu, 25 Aug 2022 15:14:13 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 h3-20020a05600c144300b003a5ffec0b91sm473899wmi.30.2022.08.25.15.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:14:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 00/18] target/i386: make most SSE helpers generic in the
 vector size
Date: Fri, 26 Aug 2022 00:13:53 +0200
Message-Id: <20220825221411.35122-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This is the first half of Paul's series from last April, reorganized
to have no occurrence of YMM_ONLY or SHIFT == 2---meaning it can be
committed without much fuss, even without a plan for the implementation
of AVX decoding.

In most cases this is done by using loops that apply the same code for
all of MMX/SSE/AVX, in some cases AVX needs special-casing for the two
128-bit lanes and then this code is simply missing.  The missing helper
code is just 100 lines though, so this _is_ the lion share of the work
to adapt the existing t helpers.

The full work, with the AVX parts rebased on top of these, is at branch
i386-avx of https://gitlab.com/bonzini/qemu.  The branch passes the
tests that Paul had posted, while this reduced part passes the SSE
version that I have sent earlier today.

Paolo

Based-on: <20220825164827.392942-1-pbonzini@redhat.com>

Paul Brook (18):
  i386: Rework sse_op_table1
  i386: Rework sse_op_table6/7
  i386: Add CHECK_NO_VEX
  i386: Move 3DNOW decoder
  i386: Add ZMM_OFFSET macro
  i386: Rewrite vector shift helper
  i386: Rewrite simple integer vector helpers
  i386: Misc integer AVX helper prep
  i386: Destructive vector helpers for AVX
  i386: Add size suffix to vector FP helpers
  i386: Floating point arithmetic helper AVX prep
  i386: Dot product AVX helper prep
  i386: reimplement AVX comparison helpers
  i386: Destructive FP helpers for AVX
  i386: Misc AVX helper prep
  i386: Rewrite blendv helpers
  i386: AVX pclmulqdq prep
  i386: AVX+AES helpers prep

 target/i386/ops_sse.h        | 1781 ++++++++++++++++++----------------
 target/i386/ops_sse_header.h |   68 +-
 target/i386/tcg/translate.c  |  673 +++++++------
 3 files changed, 1345 insertions(+), 1177 deletions(-)

-- 
2.37.1


