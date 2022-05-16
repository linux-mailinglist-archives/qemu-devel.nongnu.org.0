Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87ED5283FE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:17:43 +0200 (CEST)
Received: from localhost ([::1]:34576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZfS-00009V-Nr
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY8H-00016t-Tg
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:39:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY8F-0005cK-MQ
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A0NLu4LYJzZO/vmTGecGB8oVWtwmF8SbX1Whz2eHDck=;
 b=IANaA1Yv8g2Fa0nB6AxU0LMAIVFGwRhIUpAMYHGeRvir+2yiYe5YAJ01LBG7TM+7nplqDu
 xFGtfhPy0GHFlUiDrmmkulGaldmcgv7nto0t/oFCYsTZfCL+XyTnN//rQuGZPZmdhdmqvz
 SmeEwAcs6i5T09yCupQ/b1c2myJIvDA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-4fEYv-rSM2K59Xn62WkwBQ-1; Mon, 16 May 2022 06:39:17 -0400
X-MC-Unique: 4fEYv-rSM2K59Xn62WkwBQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 26-20020a05600c021a00b003940660c053so6566708wmi.2
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A0NLu4LYJzZO/vmTGecGB8oVWtwmF8SbX1Whz2eHDck=;
 b=JNsO5c2c2r4R0brBI1JnqQTCeT+TiFdLyJ95BsJVu15SnoOu+wr8e0lfZbKvdkPtm6
 jBWBJQeF5Ypu2RXcbuOMzBpjhHvvbhyNMc9XtnyxG9GA+Rd0DMtRofZkmXSvaoL/UH7q
 D4OL5DZju3wsCFKY1b5cErm2rQAPDvYZyG6Aco5EwcxmBtrOYV+jTDbF2p8jsYWt17xd
 meMWXXBUVujLe+l6JEQXVKnNu2Ayhg5VPq9vRKR7q6olTBJuy4SA+pnAd6iq58mmIHk+
 O1vvbGWkN48jU2GzKL7Su4m/lkLXcicPyL7/2G2G2Ku7AU3LfJMyqpRrKVG4TQyT+p1u
 ckLQ==
X-Gm-Message-State: AOAM530ZEm2RKIbjB8VjO0t8sNfk5V5Gy2o0RG+jg1mMzuKb+ucVMlC8
 WcndQyNIoDP8YTa6hkHvLv+rZ9vqaCJ+38DXtOqGiVR7mz68puXGD/ltJn9V1vm13jERZGNUW8f
 7vZQ7wSiWzAKh2KDkOZFxzJ+Y1TAApOVS9qSgPAVKuDro3wr6sDOQ/Iq0M1Wi
X-Received: by 2002:a5d:47c9:0:b0:20c:80bb:a296 with SMTP id
 o9-20020a5d47c9000000b0020c80bba296mr13428130wrc.384.1652697556424; 
 Mon, 16 May 2022 03:39:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuOINeDPnVSVDbDOhQVbIWbhVhOyaetnINaxcSoDCVQ6KW0LiLOo+HFOPm17QQL6qKbUO8qA==
X-Received: by 2002:a5d:47c9:0:b0:20c:80bb:a296 with SMTP id
 o9-20020a5d47c9000000b0020c80bba296mr13428112wrc.384.1652697556124; 
 Mon, 16 May 2022 03:39:16 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 h16-20020adf9cd0000000b0020c5253d8casm9028208wre.22.2022.05.16.03.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:39:15 -0700 (PDT)
Date: Mon, 16 May 2022 06:39:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 62/91] docs: vhost-user: rewrite section on ring state machine
Message-ID: <20220516095448.507876-63-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Paolo Bonzini <pbonzini@redhat.com>

This section is using the word "back-end" to refer to the
"slave's back-end", and talking about the "client" for
what the rest of the document calls the "slave".

Rework it to free the use of the term "back-end", which in
the next patch will replace "slave".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210226143413.188046-3-pbonzini@redhat.com>
Message-Id: <20220321153037.3622127-6-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/interop/vhost-user.rst | 46 +++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 1039e7a34e..1151326d6f 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -332,40 +332,36 @@ bit was dedicated for this purpose::
 
   #define VHOST_USER_F_PROTOCOL_FEATURES 30
 
-Starting and stopping rings
----------------------------
+Ring states
+-----------
 
-Client must only process each ring when it is started.
+Rings can be in one of three states:
 
-Client must only pass data between the ring and the backend, when the
-ring is enabled.
+* stopped: the slave must not process the ring at all.
 
-If ring is started but disabled, client must process the ring without
-talking to the backend.
+* started but disabled: the slave must process the ring without
+  causing any side effects.  For example, for a networking device,
+  in the disabled state the slave must not supply any new RX packets,
+  but must process and discard any TX packets.
 
-For example, for a networking device, in the disabled state client
-must not supply any new RX packets, but must process and discard any
-TX packets.
+* started and enabled.
+
+Each ring is initialized in a stopped state.  The slave must start
+ring upon receiving a kick (that is, detecting that file descriptor is
+readable) on the descriptor specified by ``VHOST_USER_SET_VRING_KICK``
+or receiving the in-band message ``VHOST_USER_VRING_KICK`` if negotiated,
+and stop ring upon receiving ``VHOST_USER_GET_VRING_BASE``.
+
+Rings can be enabled or disabled by ``VHOST_USER_SET_VRING_ENABLE``.
 
 If ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been negotiated, the
-ring is initialized in an enabled state.
+ring starts directly in the enabled state.
 
 If ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, the ring is
-initialized in a disabled state. Client must not pass data to/from the
-backend until ring is enabled by ``VHOST_USER_SET_VRING_ENABLE`` with
-parameter 1, or after it has been disabled by
-``VHOST_USER_SET_VRING_ENABLE`` with parameter 0.
+initialized in a disabled state and is enabled by
+``VHOST_USER_SET_VRING_ENABLE`` with parameter 1.
 
-Each ring is initialized in a stopped state, client must not process
-it until ring is started, or after it has been stopped.
-
-Client must start ring upon receiving a kick (that is, detecting that
-file descriptor is readable) on the descriptor specified by
-``VHOST_USER_SET_VRING_KICK`` or receiving the in-band message
-``VHOST_USER_VRING_KICK`` if negotiated, and stop ring upon receiving
-``VHOST_USER_GET_VRING_BASE``.
-
-While processing the rings (whether they are enabled or not), client
+While processing the rings (whether they are enabled or not), the slave
 must support changing some configuration aspects on the fly.
 
 Multiple queue support
-- 
MST


