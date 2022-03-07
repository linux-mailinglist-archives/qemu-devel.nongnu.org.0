Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A7C4CFC2A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:01:40 +0100 (CET)
Received: from localhost ([::1]:34496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRB7T-0003kR-3l
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:01:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRADE-0002ZB-AN
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRADC-0002wg-Hl
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JLZkqE9CMO9Jo/gLiHOXhp5k4vbHvwWLStgWAFhWUt4=;
 b=BfR9dc8yt86M0ZA6v4Oo4Th8PJ4W37p7AkXcCCm8fmqc4pEiD8S/GHsGAToLlkqobW16/H
 qKjZ4XKN9KBqg73QnwerGZk96/4nML3Asi1oDxtTfVpKIPtI0/yfakBxrox6G3b3ixkfNF
 UcdVJQNZL/eTNIiFpSPR34iSQAmx1og=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-qozns2zwOa-r2M094Rjpkg-1; Mon, 07 Mar 2022 05:03:28 -0500
X-MC-Unique: qozns2zwOa-r2M094Rjpkg-1
Received: by mail-ej1-f69.google.com with SMTP id
 le4-20020a170907170400b006dab546bc40so3494138ejc.15
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:03:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JLZkqE9CMO9Jo/gLiHOXhp5k4vbHvwWLStgWAFhWUt4=;
 b=pyNSCU05EwedDgJIzLQ9cTfAmIRZgbJdPX2Ae9tmAEt1VMyts7dJnnX/HMx2ZmXjdh
 zhKI4Iqvp89KgFnDO/YxdGxNgzCLPK+On21kC8RJ+reT2ManRy1G65qj9nOk/C9nOxUX
 Ogyv69hP8SE66QEaZ6CF7SrG75wpuZ/H9UrA0w+OF6kqM3aaNNS4kxnyeCMqsgG9LF4s
 0wh0p9b3om1EiE/vAq9y5I2C7rUPl36z+/kLkpOc7+FV0ULhasMnqyDefjpr5EYzhyFU
 A9C7GNTr6S8qXs4t1i/+DGimphiRnGmJE+XxrSJASfeqWsWZ80vVkuv+L/jUrwhpZlNL
 oZhQ==
X-Gm-Message-State: AOAM5317+DqzkxWm9yPRm0g+0Lm0e0thYF4xcz62KLQwLz9x6yoJeJ95
 PM8HTA4DgjiNnHEdlSchxhQMxw4xdzYsHaUUUP6EBLBhvYiwjMI/FBcnDijBHS6RFA9Noxn7Vte
 crOB9oSqL1Ht9ubTAnCFlnq4SgqHja33Iv3Wv55ph/PVEkEoE238GeF+wI06w
X-Received: by 2002:a17:907:3e12:b0:6da:f8d9:efeb with SMTP id
 hp18-20020a1709073e1200b006daf8d9efebmr8453979ejc.634.1646647407464; 
 Mon, 07 Mar 2022 02:03:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFOEjDB2cg8iQvp3MBqEC3Q6s4CCi1Z9u3LIvj5svOerORjrWDK5ddzodl/ulDalWDKfm8Jg==
X-Received: by 2002:a17:907:3e12:b0:6da:f8d9:efeb with SMTP id
 hp18-20020a1709073e1200b006daf8d9efebmr8453959ejc.634.1646647407169; 
 Mon, 07 Mar 2022 02:03:27 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 t19-20020a1709060c5300b006d582121f99sm4502229ejf.36.2022.03.07.02.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:03:26 -0800 (PST)
Date: Mon, 7 Mar 2022 05:03:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 42/47] configure, meson: allow enabling vhost-user on all
 POSIX systems
Message-ID: <20220307100058.449628-43-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sergio Lopez <slp@redhat.com>

With the possibility of using a pipe pair via qemu_pipe() as a
replacement on operating systems that doesn't support eventfd,
vhost-user can also work on all POSIX systems.

This change allows enabling vhost-user on all non-Windows platforms
and makes libvhost_user (which still depends on eventfd) a linux-only
feature.

Signed-off-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220304100854.14829-4-slp@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 configure   | 4 ++--
 meson.build | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index c56ed53ee3..daccf4be7c 100755
--- a/configure
+++ b/configure
@@ -1659,8 +1659,8 @@ fi
 # vhost interdependencies and host support
 
 # vhost backends
-if test "$vhost_user" = "yes" && test "$linux" != "yes"; then
-  error_exit "vhost-user is only available on Linux"
+if test "$vhost_user" = "yes" && test "$mingw32" = "yes"; then
+  error_exit "vhost-user is not available on Windows"
 fi
 test "$vhost_vdpa" = "" && vhost_vdpa=$linux
 if test "$vhost_vdpa" = "yes" && test "$linux" != "yes"; then
diff --git a/meson.build b/meson.build
index a5b63e62cd..28612fca36 100644
--- a/meson.build
+++ b/meson.build
@@ -2714,7 +2714,7 @@ if have_system or have_user
 endif
 
 vhost_user = not_found
-if 'CONFIG_VHOST_USER' in config_host
+if targetos == 'linux' and 'CONFIG_VHOST_USER' in config_host
   libvhost_user = subproject('libvhost-user')
   vhost_user = libvhost_user.get_variable('vhost_user_dep')
 endif
-- 
MST


