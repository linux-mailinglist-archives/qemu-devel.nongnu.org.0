Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 591A2455EE1
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 16:02:42 +0100 (CET)
Received: from localhost ([::1]:34104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnivx-0003Qj-G7
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 10:02:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mniqy-0004WT-1d
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:57:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mniqv-00083U-Mj
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:57:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637247449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/HpEathA5riapQobuv/wwQs6HF4NNRoprJj+KElllXM=;
 b=NXtK2NZT46UgUns73DoJL1BMYbW75suhGssaUTgTrNNq+EtE/3jyl9qxHj+hPWkpSCTyi6
 Q13c7qcytLVyokkpbN7uQYf3v3CrgRcbSRw2A2q2wT4A8QzK8etkXoKBidZH2AM+a3lx8s
 4wYxsSM97cBs3e8xULFdiooOgaiDWGM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-gkPI-Mh9MeO2EJ_pVr0IzA-1; Thu, 18 Nov 2021 09:57:28 -0500
X-MC-Unique: gkPI-Mh9MeO2EJ_pVr0IzA-1
Received: by mail-wr1-f72.google.com with SMTP id
 o4-20020adfca04000000b0018f07ad171aso1133628wrh.20
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 06:57:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/HpEathA5riapQobuv/wwQs6HF4NNRoprJj+KElllXM=;
 b=T9v9mNq9Eu1FuCLmrDkL/3rUvl2yhiiuYqJuJix/jdMtTn2uQaoigsQ6BkLi7Bn65c
 PRSKOSjoEnI//yYiXRIwu8iYGIH49uNL7E8scdnoEvrwLhTHht4JA1pr5RtMOPM5gGBA
 KxIjaojyVmbB4jTggJSdTbvdL6ff1wReqnK3a8QrvQCg2KVifqpTx55iWmCrS2H9nG+S
 mrz/nkz+ndKFxcCSYiRgsj+p04cyZNhlTlxep0cRPrephMBT2GcXct3m8bUWIKVFSNnM
 PbCFdIweYbTaG8iq9X+jnIoKUeD9q2MZ3PmDWhCXADWv9szmigWtKjh3ljeWj2GlLzsJ
 Na8Q==
X-Gm-Message-State: AOAM531VJE/2Lyz4BbUwl61zquCkYoXnfzk7fOOKz9WrPbnn6W9IBlYo
 enl+g7c3K4wceq5ttYnlW2AZgilY6lQrrOSKb6O/t3t4vgn0yjdHz+uUy+9fxkeLV33pl162uLa
 bER7byeLstrRXkUkWabTnfXWAbZQg1AyKbz1n3RkDOm00y26cvv3xsCCnCpFLIhm3
X-Received: by 2002:adf:dd0a:: with SMTP id a10mr32197037wrm.60.1637247446720; 
 Thu, 18 Nov 2021 06:57:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9540F1z7RYJ5+NhbiHpVspcg/n+EsQJDIPIvg6LAIdPON8lY1Ry++DNhW9b/FKJUIJYSG8Q==
X-Received: by 2002:adf:dd0a:: with SMTP id a10mr32196978wrm.60.1637247446390; 
 Thu, 18 Nov 2021 06:57:26 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 38sm119011wrc.1.2021.11.18.06.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:57:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2? v2 2/5] docs/devel/style: Improve Error** functions
 rST rendering
Date: Thu, 18 Nov 2021 15:57:13 +0100
Message-Id: <20211118145716.4116731-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211118145716.4116731-1-philmd@redhat.com>
References: <20211118145716.4116731-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/devel/style.rst | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 3e519dc6ade..1a23021bc3e 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -602,16 +602,16 @@ Error handling and reporting
 Reporting errors to the human user
 ----------------------------------
 
-Do not use printf(), fprintf() or monitor_printf().  Instead, use
-error_report() or error_vreport() from error-report.h.  This ensures the
-error is reported in the right place (current monitor or stderr), and in
-a uniform format.
+Do not use ``printf()``, ``fprintf()`` or ``monitor_printf()``.  Instead, use
+``error_report()`` or ``error_vreport()`` from error-report.h.  This ensures
+the error is reported in the right place (current monitor or ``stderr``), and
+in a uniform format.
 
-Use error_printf() & friends to print additional information.
+Use ``error_printf()`` & friends to print additional information.
 
-error_report() prints the current location.  In certain common cases
+``error_report()`` prints the current location.  In certain common cases
 like command line parsing, the current location is tracked
-automatically.  To manipulate it manually, use the loc_``*``() from
+automatically.  To manipulate it manually, use the ``loc_*()`` from
 error-report.h.
 
 Propagating errors
@@ -621,7 +621,7 @@ An error can't always be reported to the user right where it's detected,
 but often needs to be propagated up the call chain to a place that can
 handle it.  This can be done in various ways.
 
-The most flexible one is Error objects.  See error.h for usage
+The most flexible one is ``Error`` objects.  See error.h for usage
 information.
 
 Use the simplest suitable method to communicate success / failure to
@@ -631,10 +631,10 @@ error, non-negative / -errno, non-null / null, or Error objects.
 Example: when a function returns a non-null pointer on success, and it
 can fail only in one way (as far as the caller is concerned), returning
 null on failure is just fine, and certainly simpler and a lot easier on
-the eyes than propagating an Error object through an Error ``*````*`` parameter.
+the eyes than propagating an Error object through an ``Error **`` parameter.
 
 Example: when a function's callers need to report details on failure
-only the function really knows, use Error ``*````*``, and set suitable errors.
+only the function really knows, use ``Error **``, and set suitable errors.
 
 Do not report an error to the user when you're also returning an error
 for somebody else to handle.  Leave the reporting to the place that
@@ -643,17 +643,17 @@ consumes the error returned.
 Handling errors
 ---------------
 
-Calling exit() is fine when handling configuration errors during
+Calling ``exit()`` is fine when handling configuration errors during
 startup.  It's problematic during normal operation.  In particular,
-monitor commands should never exit().
+monitor commands should never ``exit()``.
 
-Do not call exit() or abort() to handle an error that can be triggered
+Do not call ``exit()`` or ``abort()`` to handle an error that can be triggered
 by the guest (e.g., some unimplemented corner case in guest code
 translation or device emulation).  Guests should not be able to
 terminate QEMU.
 
-Note that &error_fatal is just another way to exit(1), and &error_abort
-is just another way to abort().
+Note that ``&error_fatal`` is just another way to ``exit(1)``, and
+``&error_abort`` is just another way to ``abort()``.
 
 
 trace-events style
-- 
2.31.1


