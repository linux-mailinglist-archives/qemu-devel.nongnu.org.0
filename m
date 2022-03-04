Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11D44CD6C4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:50:57 +0100 (CET)
Received: from localhost ([::1]:60282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9Gi-0004we-RQ
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:50:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8Co-0006DP-E1
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:42:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8Cm-0001L8-St
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:42:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oz/pT6RHRd21r93UDxWq5uxTXK9PW2uGHjqtboSYYd0=;
 b=bZl8oMU5DzB5dpQc6hYZsTA+P1WYeVcmx7aGuXXAzzj8DraH6xcUXyl+arrfih7o+8qHCQ
 GxbQU+jRR+Nvld8ptYr9XFpaXJ3bwpwt3eZW76v/wgwHg316n2//iWif9BWXwuk0EzmSiA
 GjUTRV8NptEhCulk2iUqxCRkAFgOjoU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-xlEq9hlwNOikpg4lXsLItQ-1; Fri, 04 Mar 2022 08:42:47 -0500
X-MC-Unique: xlEq9hlwNOikpg4lXsLItQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so3382110wrg.19
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:42:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Oz/pT6RHRd21r93UDxWq5uxTXK9PW2uGHjqtboSYYd0=;
 b=z3mSXXKKKKlb7AWak3fpkQAXbllpVj1mcRI12O9ZhNimPU5YKveN+1BZcRv20K7Vnu
 lH91AaeX+TEswkOLAxuyrM0KxOoRcZrTGs82l7RhxqIGGESV8uPraYanGKmjuhZrrhL/
 F43ubzUi/oau42CNH0fs6OOZ2fCmu1dmFD48ENI/0U3egKLKpCQqJufvjtU6sBmCPkWo
 aYGVMWS1f0rhmKD1SRn0DWE1Wwr82p6gsdAi4IMDzgYtFlSVse0weNPFlcgdB2qgwZT1
 LCT/Ba4EP0iu/feyO6xTITKt3Hvq4EEuDBMQxtN3syZ5O8x4MF6yQf/sHrYEiYVIDB8J
 LO1Q==
X-Gm-Message-State: AOAM531Lnj4l2n+G5TjmLeUYrJsF3UzsqqZ+ep8wzaNgPHVseTyFn1Yq
 oz41LdjjTo3UrMr2xsB+8RQRtHnQp6pyEojkrrmj2nlXCRqGNhZRgyEaZ+QCjjw/sA1Kv76yVBb
 GBMBsqftLz5lU0ctGqqFAckpZJcGQohBEGQy/mS9h9XsVpWqU4KH9Bre7GzNk
X-Received: by 2002:a1c:7518:0:b0:381:c77:ceec with SMTP id
 o24-20020a1c7518000000b003810c77ceecmr7930187wmc.57.1646401365949; 
 Fri, 04 Mar 2022 05:42:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyISDMi0Og+5cEZNiudGRWUpB4gdwqeGbq3utK59Qgp26eH9aer2OThi7pM3sq5LTEieYfzDw==
X-Received: by 2002:a1c:7518:0:b0:381:c77:ceec with SMTP id
 o24-20020a1c7518000000b003810c77ceecmr7930165wmc.57.1646401365634; 
 Fri, 04 Mar 2022 05:42:45 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 m12-20020adfe0cc000000b001ede2dd604esm4502903wri.106.2022.03.04.05.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:42:42 -0800 (PST)
Date: Fri, 4 Mar 2022 08:42:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 42/45] event_notifier: add event_notifier_get_wfd()
Message-ID: <20220304133556.233983-43-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Stefan Hajnoczi <stefanha@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sergio Lopez <slp@redhat.com>

event_notifier_get_fd(const EventNotifier *e) always returns
EventNotifier's read file descriptor (rfd). This is not a problem when
the EventNotifier is backed by a an eventfd, as a single file
descriptor is used both for reading and triggering events (rfd ==
wfd).

But, when EventNotifier is backed by a pipe pair, we have two file
descriptors, one that can only be used for reads (rfd), and the other
only for writes (wfd).

There's, at least, one known situation in which we need to obtain wfd
instead of rfd, which is when setting up the file that's going to be
sent to the peer in vhost's SET_VRING_CALL.

Add a new event_notifier_get_wfd(const EventNotifier *e) that can be
used to obtain wfd where needed.

Signed-off-by: Sergio Lopez <slp@redhat.com>
Message-Id: <20220303115911.20962-2-slp@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/qemu/event_notifier.h | 1 +
 util/event_notifier-posix.c   | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/qemu/event_notifier.h b/include/qemu/event_notifier.h
index b79add035d..8a4ff308e1 100644
--- a/include/qemu/event_notifier.h
+++ b/include/qemu/event_notifier.h
@@ -38,6 +38,7 @@ int event_notifier_test_and_clear(EventNotifier *);
 #ifdef CONFIG_POSIX
 void event_notifier_init_fd(EventNotifier *, int fd);
 int event_notifier_get_fd(const EventNotifier *);
+int event_notifier_get_wfd(const EventNotifier *);
 #else
 HANDLE event_notifier_get_handle(EventNotifier *);
 #endif
diff --git a/util/event_notifier-posix.c b/util/event_notifier-posix.c
index 8307013c5d..16294e98d4 100644
--- a/util/event_notifier-posix.c
+++ b/util/event_notifier-posix.c
@@ -99,6 +99,11 @@ int event_notifier_get_fd(const EventNotifier *e)
     return e->rfd;
 }
 
+int event_notifier_get_wfd(const EventNotifier *e)
+{
+    return e->wfd;
+}
+
 int event_notifier_set(EventNotifier *e)
 {
     static const uint64_t value = 1;
-- 
MST


