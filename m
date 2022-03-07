Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6E24D0BC1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:10:30 +0100 (CET)
Received: from localhost ([::1]:37326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMUn-00061w-WC
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:10:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7r-0000qI-N8
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7q-0005kU-3F
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZuOy/7+HfqjI4TvmqHPnqx0Q0KWAobCs5iZB1N1AGuw=;
 b=BxL79TjvdoW9SbAaonlaOvzzD61dZrkrRMEwFouplbuwl2oRQ8pRoBAovKy25Eq8ALsHo9
 0PJgAdQC/oJ9LJbZgTE0mrZve3BGTjQXHR5krIC5CVKzpSxnbDP6K4qQxwWV2WdPblMpgw
 U9xCFsTzB0Sw26gUuefT5siyImNxnr8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-v1YFyYEUMve4lXVLenG4Dw-1; Mon, 07 Mar 2022 17:46:44 -0500
X-MC-Unique: v1YFyYEUMve4lXVLenG4Dw-1
Received: by mail-ej1-f69.google.com with SMTP id
 l24-20020a170906a41800b006da873d66b6so6384658ejz.3
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:46:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZuOy/7+HfqjI4TvmqHPnqx0Q0KWAobCs5iZB1N1AGuw=;
 b=A7cSwNwoEczEYokNq8/em1eFpAIIfVlrhb6UE/fnLYkmBH3EmRIqGuUt9ZCy2YpJXI
 qhyG9efU0CAbsUb43UbQZdu2nmvDeoSCqszMxC5E55Ro/ACM3d7zse6tZrr5kEEeI1X0
 dnfarSp9Fd7pB5JzBW8BrMLJqQRLIJqOolUMSeYMv1I9owu9heT1SJhzG2C7jhtI5zHw
 TtlHESZxF3q4FwS+4+TE0SUxeN/rXuX0C+3zWX4mGXuHG/1hG1bdJvah8WHQEMl9zuBK
 a8RZnvEHvPUdf8Okaa4hTx15SFJrIIwVUDO5Jh0rMEQ5sDhlG0xpt6gmE686vKHXfkdJ
 G2lQ==
X-Gm-Message-State: AOAM532Rz5afhWC8KWK7lfD4Unuqi/2x+L6u+rzzoe+Mrji379gT4kPi
 9Rb2D0RTEWacDj6Gxac9UUCPnQIYC5GSb+pe9mphamAxUntbfswQwrlNG9eRZJuGDrmBRhyEX6V
 ZDfZSd4/+BxG8H083fnnc4kGNfFj0OZfO+oBNkZ/32IKgj4A46t+Jpmfm4UPu
X-Received: by 2002:a17:906:4fc4:b0:6da:b4c6:fadb with SMTP id
 i4-20020a1709064fc400b006dab4c6fadbmr11463291ejw.282.1646693202973; 
 Mon, 07 Mar 2022 14:46:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJxrdn6LVQ5MkEJcavktjdArVbVUOuZ/lStNN8fdPBf6/8oKYmdFFgd7FYgsKYyNY2R+RROQ==
X-Received: by 2002:a17:906:4fc4:b0:6da:b4c6:fadb with SMTP id
 i4-20020a1709064fc400b006dab4c6fadbmr11463276ejw.282.1646693202646; 
 Mon, 07 Mar 2022 14:46:42 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 n13-20020a170906724d00b006cedd6d7e24sm5183645ejk.119.2022.03.07.14.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:46:42 -0800 (PST)
Date: Mon, 7 Mar 2022 17:46:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 40/47] event_notifier: add event_notifier_get_wfd()
Message-ID: <20220307224357.682101-41-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220304100854.14829-2-slp@redhat.com>
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


