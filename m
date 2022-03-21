Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 020374E2CAA
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:45:04 +0100 (CET)
Received: from localhost ([::1]:54652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKDO-0001vn-Pj
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:45:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzg-0005Ez-BF
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:31:01 -0400
Received: from [2a00:1450:4864:20::636] (port=39534
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzd-0004vd-E7
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:30:52 -0400
Received: by mail-ej1-x636.google.com with SMTP id dr20so30199586ejc.6
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 08:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XbcWSssYk6QdE7UVxwLH6Hg2RAiDXd9rzEmuOJA5Mmo=;
 b=G/+qunrzbhGlmfY7MYY1Ox8c2qjtf4UKBmsJd8EWWwMCSeEP3rAV0VcmaxQLSQGKgJ
 MWJNP+qtxjGP/EMmA0elvRdN83y78a7J3Imh2jAwNI5PoapkS9YcR4NzP5plXSlcZWly
 uhz+8pDmUBTZJzxN4/a9Fz0BtjBDnLu3jSULP3/ycE1PIggA46rua0OaUaI9mzqAimER
 sxtBDr8491tJRhBbl+P/AeusXEfMiY0U2u5I+ZHMydtUbTVGmHYodENnjqpzzwhJRJiC
 BvDUR55ae320ZckbJ+PPl65XVmII+J1aMufzZIh3Vd3C19wuYoaV7axKLVgaSG5MGdgi
 7Ipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XbcWSssYk6QdE7UVxwLH6Hg2RAiDXd9rzEmuOJA5Mmo=;
 b=ZH0ENJgt5Tzs1Frq9IQAqy0XSedGETCvrdTj5R15tKmPF//+MtiYignA0a6w+kPo0J
 CmkpkEktmfQ4xH7NJqto8uaOVKkyMo1HU9Om8DK9CdYUGV7BEUOqKtrTupbbxkJQUMRK
 aSDjtFZbJw/mOPJV60p9w4npTv1zeTppvV+GQXqs1TmGM31JAT9OOTmOlncG6PV3oi0q
 r0FsKOaTjKgLZDkNC+uvl2JQoQl9xAAwRJbglnka9SI/OF9gpRqtkzu9NSK/3+XgZgaw
 e4D/dWtM0fL9k3XYOcEi+WAlA2HvtXKMYpV53IX0qbP+9T4auepQkV7qf9TthjD2H559
 hwNw==
X-Gm-Message-State: AOAM533epsAwJGacqosSDWQxw5eN5ehwFlTS/Shtj84WhM0L6WlPRC2J
 hCN91M6tGsvlIrfbjihwPM92BQ==
X-Google-Smtp-Source: ABdhPJxUqfv+z2J1hNKZHTUdoOAnrVPuy3SZ9DvE8A8sWxRB29RGEeJN6AaORLt5vNTewQNLGCoEeA==
X-Received: by 2002:a17:906:f956:b0:6df:d816:264b with SMTP id
 ld22-20020a170906f95600b006dfd816264bmr10643895ejb.354.1647876647709; 
 Mon, 21 Mar 2022 08:30:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 do8-20020a170906c10800b006dfe680dbfcsm2628881ejc.43.2022.03.21.08.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 08:30:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 20FDD1FFBD;
 Mon, 21 Mar 2022 15:30:38 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 05/13] docs: vhost-user: rewrite section on ring state
 machine
Date: Mon, 21 Mar 2022 15:30:29 +0000
Message-Id: <20220321153037.3622127-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220321153037.3622127-1-alex.bennee@linaro.org>
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: slp@redhat.com, mathieu.poirier@linaro.org, mst@redhat.com,
 viresh.kumar@linaro.org, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, marcandre.lureau@redhat.com
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
---
 docs/interop/vhost-user.rst | 46 +++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index bb588c66fc..694a113e59 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -331,40 +331,36 @@ bit was dedicated for this purpose::
 
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
 
-If ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been negotiated, the
-ring is initialized in an enabled state.
+Each ring is initialized in a stopped state.  The slave must start
+ring upon receiving a kick (that is, detecting that file descriptor is
+readable) on the descriptor specified by ``VHOST_USER_SET_VRING_KICK``
+or receiving the in-band message ``VHOST_USER_VRING_KICK`` if negotiated,
+and stop ring upon receiving ``VHOST_USER_GET_VRING_BASE``.
 
-If ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, the ring is
-initialized in a disabled state. Client must not pass data to/from the
-backend until ring is enabled by ``VHOST_USER_SET_VRING_ENABLE`` with
-parameter 1, or after it has been disabled by
-``VHOST_USER_SET_VRING_ENABLE`` with parameter 0.
+Rings can be enabled or disabled by ``VHOST_USER_SET_VRING_ENABLE``.
 
-Each ring is initialized in a stopped state, client must not process
-it until ring is started, or after it has been stopped.
+If ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been negotiated, the
+ring starts directly in the enabled state.
 
-Client must start ring upon receiving a kick (that is, detecting that
-file descriptor is readable) on the descriptor specified by
-``VHOST_USER_SET_VRING_KICK`` or receiving the in-band message
-``VHOST_USER_VRING_KICK`` if negotiated, and stop ring upon receiving
-``VHOST_USER_GET_VRING_BASE``.
+If ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, the ring is
+initialized in a disabled state and is enabled by
+``VHOST_USER_SET_VRING_ENABLE`` with parameter 1.
 
-While processing the rings (whether they are enabled or not), client
+While processing the rings (whether they are enabled or not), the slave
 must support changing some configuration aspects on the fly.
 
 Multiple queue support
-- 
2.30.2


