Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC40C51FAC4
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 13:04:13 +0200 (CEST)
Received: from localhost ([::1]:56152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no1BV-0006vi-0Q
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 07:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fk-0005Kt-Oj
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fj-00036b-9T
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XT/5ko8xXdFB2oZI4c5/NazeRRBkHp1p2r7GLP5NiZo=;
 b=cr0nYk2ZKgMaFj/UDN6z4hqMTRp0XdANZlVjx9ZObaoGbYNen8+IJq+L+T9S3w+pe+edGD
 tLbNeunniRdAQg3hh4mRTI0u6VvBcZsBNKEdd3XQu4/SSfM/80KZQtwCq62KiqgEzqGTnr
 bwbt+LWOrOe3RAL6VFARSbg+CHcEKRw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-MR8FWGrHPDWy-p6cEDgBKQ-1; Mon, 09 May 2022 06:31:21 -0400
X-MC-Unique: MR8FWGrHPDWy-p6cEDgBKQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 v17-20020a056000163100b0020c9b0e9039so4566309wrb.18
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XT/5ko8xXdFB2oZI4c5/NazeRRBkHp1p2r7GLP5NiZo=;
 b=Q8Pbj01jhU71lilGxB/RyQncOAeVqe0Ei11jy/VJv3w/i+p6g1lgDnJTAz/W5ATobz
 drvVxTbH7uKxAnG8ZwTjOftLtjsDwMB1c2dEuFnWokU0uqIIsCEmG7EQdeBAEa5u40Bf
 qryEhLnrGY3vUFq1UOXsT//zbEmriPt9W9nHwzpe93jVMhTK/v8R8EHdLMMPsMlO+xq7
 wcSqh1GYY3/AID22SYe8hII0goTXWd61ILVccBwQbt1i6djp/k0hwyJe3F2bhPXCKYEf
 lNWD1GuK0FmC29C5g/RtqIerdnV2V8Yb2diMrrjYR4q3wjsy6P7XkQjWq/TcQ8YI5KJ2
 Pi1Q==
X-Gm-Message-State: AOAM5332uzMjNXpb9qWTcKdBmuncbd4esdkwxmsz8lrfAMwheUcTJNdr
 Z2nIr18TqUg8U6WTM+Tu/Ebz2AWIkg2jDCqMVcWdqvxrQItMzFINvpjzrPLOArcGm8vd9lvSe4y
 Sp/IFHHf6tnbSWhEF5uartTuxo7sFH5/Vx7Zr9i2HN/W+z0RZh2QOMeBRVKM/m9AnlhE=
X-Received: by 2002:adf:ef01:0:b0:20a:8068:ca5e with SMTP id
 e1-20020adfef01000000b0020a8068ca5emr13100307wro.661.1652092279905; 
 Mon, 09 May 2022 03:31:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSLwO7abmTUoBIYZIueQSVUo46RtZCdpuowa6VUD1fiBH1hCwxuL1EPjOuk21aYgRx+/4E+w==
X-Received: by 2002:adf:ef01:0:b0:20a:8068:ca5e with SMTP id
 e1-20020adfef01000000b0020a8068ca5emr13100284wro.661.1652092279508; 
 Mon, 09 May 2022 03:31:19 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a5d530d000000b0020c5253d8fasm10677278wrv.70.2022.05.09.03.31.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:31:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/26] job: add missing coroutine_fn annotations
Date: Mon,  9 May 2022 12:30:14 +0200
Message-Id: <20220509103019.215041-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/job.h | 2 +-
 job.c              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index c105b31076..397ac39608 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -436,7 +436,7 @@ void coroutine_fn job_pause_point(Job *job);
  *
  * Yield the job coroutine.
  */
-void job_yield(Job *job);
+void coroutine_fn job_yield(Job *job);
 
 /**
  * @job: The job that calls the function.
diff --git a/job.c b/job.c
index 075c6f3a20..20f0d8b2cd 100644
--- a/job.c
+++ b/job.c
@@ -525,7 +525,7 @@ void coroutine_fn job_pause_point(Job *job)
     }
 }
 
-void job_yield(Job *job)
+void coroutine_fn job_yield(Job *job)
 {
     assert(job->busy);
 
-- 
2.35.1


