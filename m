Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E13934CD67D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:34:52 +0100 (CET)
Received: from localhost ([::1]:51676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ91A-00058j-0F
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:34:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8Cy-0006Ra-JH
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:43:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8Cx-0001MK-1R
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:43:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ii8iFMMNk7vrBv2yovLnxm6+gZzwrn+OMxMvDtJQUf8=;
 b=A8zEQMbyaJMNjH10h5AMRX9cdrMh+F8HqXZ+/i/JRrcqoFLUksCxFqaGrbYIIdcxzbwED/
 d2yiTwHr/u9GnZYPu/AgIBxK6AGFFm/BaF8qzQDnoxl/w5hWFZ0OX7eaYOWZxenDD/rDzP
 9GiO/sUK7NWKVS0QcjEisX7sJJ7TMlE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-7UVCjXHMNRurHV4AFo_hHw-1; Fri, 04 Mar 2022 08:42:57 -0500
X-MC-Unique: 7UVCjXHMNRurHV4AFo_hHw-1
Received: by mail-wm1-f69.google.com with SMTP id
 h206-20020a1c21d7000000b003552c13626cso4163540wmh.3
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:42:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ii8iFMMNk7vrBv2yovLnxm6+gZzwrn+OMxMvDtJQUf8=;
 b=1uV7k2tyeYe0NDCJKzmDzj9233/+mGlsr+bqmtC0NIi9E4Zk/e6PVQM9nAd4ODoJE7
 V82u6cDCEXvGfleEtOUYWkyV/gVZLu5UicXGwfHE3YbVKjZhroQV+aOoRoD4WGU1xTUv
 gWKWPxyKI/8eYnNuH3sV09m24yhzN40/vyEAxI/0tpzWHgTLIIo8JoTdcwz8jpHaVi0/
 h8cPmqdACdBuIow5ucl1334ShrI5EcMQwZzglbjZheS4GmD9iaJ1l5A187IpVKppKemk
 HU8fljhgYwHuAvqonAiGhQombub4UhS7HEtQnY+3UdpcTDJZHpfJ7FBmGS4mbrn4GK3I
 3fwg==
X-Gm-Message-State: AOAM531uFOV/cZHPDHK1tfADai1V9DhWLmEhcfIJGwoA5LjFQTWnWix1
 ayBZ67Mzp3sEWm/6RqoG0WWjqezHmUPLWTiwlj62hzGXm8xFLFAbbwruj5plJ1L8QbVOJ+VUgY5
 EExWbNIjT2dTeFdGJMULvRu2znPRcMSy/EGO7Ve9ak+/ndmDDcUEddPaw62NW
X-Received: by 2002:a5d:64c3:0:b0:1e5:94d3:5bf2 with SMTP id
 f3-20020a5d64c3000000b001e594d35bf2mr30202467wri.488.1646401376246; 
 Fri, 04 Mar 2022 05:42:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyW6BXjrknuE3ar7zW8Ld9scQsFhwCXO9xapF+r4JuWAfHoqjfvrd8IZMM/IpgW8Wx94e9ioQ==
X-Received: by 2002:a5d:64c3:0:b0:1e5:94d3:5bf2 with SMTP id
 f3-20020a5d64c3000000b001e594d35bf2mr30202439wri.488.1646401375849; 
 Fri, 04 Mar 2022 05:42:55 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 g2-20020a5d46c2000000b001f079ba0158sm1435444wrs.60.2022.03.04.05.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:42:54 -0800 (PST)
Date: Fri, 4 Mar 2022 08:42:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 44/45] configure, meson: allow enabling vhost-user on all
 POSIX systems
Message-ID: <20220304133556.233983-45-mst@redhat.com>
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
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
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


