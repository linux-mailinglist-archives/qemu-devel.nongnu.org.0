Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279A63D4104
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 21:41:46 +0200 (CEST)
Received: from localhost ([::1]:49732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m713J-00038L-69
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 15:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70wq-0006Vx-L5
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:35:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70wo-0002RR-WD
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:35:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627068902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QMg0qB0xoJcBQNJ7ML75cem+ABD+BhEtcoCp8aunrsI=;
 b=N1s+SFWecTTaUAcTmPmnubtzHqltAA7M4v/nKO9fxO5HFwAm9s2ExF5Ko+tK/+mKNbhbzu
 eqeLtWpD5p28ulxVqWIxDtk0d9bZFJko0iPqffelEWakYI1CNS4wfIoppTnbIVCycls8mP
 3ROqiHDrX/IR8mugdh3JP5aArxWoB7M=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-oFh2Ztc3OgKNCx-mA8wOSQ-1; Fri, 23 Jul 2021 15:35:01 -0400
X-MC-Unique: oFh2Ztc3OgKNCx-mA8wOSQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 e16-20020ac867100000b0290257b7db4a28so1719407qtp.9
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 12:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QMg0qB0xoJcBQNJ7ML75cem+ABD+BhEtcoCp8aunrsI=;
 b=PjFtMCDyomvqEOMEHIYYlhok3ICnIaYdtW5NvQVQ8gRcLph8s65S5NWluMw4mYwZej
 /kvD/Ueb2RlUR1QybxcRmgotleqBUNqm891OtU+akgtRpXquUl3X5ONW66o41NVafRKT
 q13TzTJsD7WdEoxitI0XIZK6qEu8tsYbsa041dg03Aek8mTD2g3qjgRvJYEL1rFfauku
 ogMEGoiR9nPB2R01zQXlcCQJdD6muUb/CbXKIiZuARSN79z6DrOhUO7RlBo6UCVh6JQD
 3k3ez6J+G6xdXShWPuaiyle4Eex+2+mK27oCv/YqBG91jUibqKMm+ODlFK+JfjGGr5aN
 lC+A==
X-Gm-Message-State: AOAM532O8YNCDXtQ9QDf6TsGcDtiS729JHOqUSB4D78kLn/U4pbtULIY
 4LkDUsdUypzmX+5oI6yXjXOdJcLBF8uGKveXpEiJJ2GpMplvM4vsA9ae5iEpeydwHCuDu+gH1E4
 RzeJsrZftt9P9+oc7M+HDdrDsRWyADh0SSUAvExUEOFeZ3hBOL9CnZti3jVNGMNxK
X-Received: by 2002:a37:af84:: with SMTP id y126mr6244203qke.448.1627068900297; 
 Fri, 23 Jul 2021 12:35:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwU4kG86Sfik4q0KCkLzzZF61DSrf2SX8hJegsv3o89r0TgiQhJrBiHqC89+clAOdS3KQiG5g==
X-Received: by 2002:a37:af84:: with SMTP id y126mr6244175qke.448.1627068900020; 
 Fri, 23 Jul 2021 12:35:00 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id o2sm12659104qkm.109.2021.07.23.12.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 12:34:59 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/9] cpus: Introduce qemu_mutex_unlock_iothread_prepare()
Date: Fri, 23 Jul 2021 15:34:42 -0400
Message-Id: <20210723193444.133412-8-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723193444.133412-1-peterx@redhat.com>
References: <20210723193444.133412-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 peterx@redhat.com, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The prepare function before unlocking BQL.  There're only three places that can
release the BQL: unlock(), cond_wait() or cond_timedwait().

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/cpus.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 9131f77f87..6085f8edbe 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -66,6 +66,10 @@
 
 static QemuMutex qemu_global_mutex;
 
+static void qemu_mutex_unlock_iothread_prepare(void)
+{
+}
+
 bool cpu_is_stopped(CPUState *cpu)
 {
     return cpu->stopped || !runstate_is_running();
@@ -523,16 +527,19 @@ void qemu_mutex_unlock_iothread(void)
 {
     g_assert(qemu_mutex_iothread_locked());
     iothread_locked = false;
+    qemu_mutex_unlock_iothread_prepare();
     qemu_mutex_unlock(&qemu_global_mutex);
 }
 
 void qemu_cond_wait_iothread(QemuCond *cond)
 {
+    qemu_mutex_unlock_iothread_prepare();
     qemu_cond_wait(cond, &qemu_global_mutex);
 }
 
 void qemu_cond_timedwait_iothread(QemuCond *cond, int ms)
 {
+    qemu_mutex_unlock_iothread_prepare();
     qemu_cond_timedwait(cond, &qemu_global_mutex, ms);
 }
 
-- 
2.31.1


