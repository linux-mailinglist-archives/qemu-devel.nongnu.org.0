Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680B12B5BA7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 10:21:57 +0100 (CET)
Received: from localhost ([::1]:45624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexBU-0006Jf-Ch
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 04:21:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kex8r-00021D-Ur
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:19:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kex8q-0006Pa-2D
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:19:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605604751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yB+iWwjcAdJo3aku5jv0oHVt9QpfV3gRJttPbNSWZik=;
 b=FPqa+fXBqLlnz1evzr4BAY74fBJzaFVq54YNg7k4DCkpCThB/2Tza0H+H9N5qAp18fdpTG
 Q994ddNVvKBCY1QBdmDrfwegss0Ol9Kaj6ZqNdj8INyHhy9vDKi8knr2RMvCs15CdCd+Kx
 5z9ZRkY2aopixv4bsL/aX/dQCOWd3vc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-JToRFjPPNj2lOaOmaQMqew-1; Tue, 17 Nov 2020 04:19:09 -0500
X-MC-Unique: JToRFjPPNj2lOaOmaQMqew-1
Received: by mail-wr1-f71.google.com with SMTP id e18so12700208wrs.23
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 01:19:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yB+iWwjcAdJo3aku5jv0oHVt9QpfV3gRJttPbNSWZik=;
 b=HqmBLHLBP8uFlunop+q0BxjDs25RTW+SxNTE/7u+Ri6bd1vx+mRQN0VkBCEZlhB5bU
 JgiCkA4nxwlxEUgWvB1hTFhxZVsCQLDjbEl9rVl0M22/ACs0pDMohpGa2L0pUOKSDT+U
 Ht5JH6FwnhGsuaGn27nl6R3bNOXKAlkdBs3RGYPevzuzSwj3J1EC5mFLk9l0CLtk6jT5
 EGMXbEApsbxWDVKhdyfzwTneiwH1E0iOgVsuDyMZdcnCAaCvJcnH+BRCrAz0tcfu7UOl
 P+rw7pXFMSmXph6p96OnPP65luYHrtHCmYu0j9HRP6tki7/6dcrwE5+LAlF9i0hDNrT7
 TbDw==
X-Gm-Message-State: AOAM53026tNg/1qHRD/fqf09RlsWiBA6R4cYKw2FSGjOG1Q7hxekHTu7
 4d8faN4JIvSX/qGRohTRlOFiL34xXN46nsPU8FVQyjE6EjGuo/io8LRpZNMfPxPJ9lnRGLU5LfW
 yoxGk8PxsFZxao+dnlQJ0N+Dsl42gG3+jKe1Q1e7578o1jqS1pkHPbXgFFlLa
X-Received: by 2002:adf:ea91:: with SMTP id s17mr24183394wrm.349.1605604748113; 
 Tue, 17 Nov 2020 01:19:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4CwnD/LQAUutPnCY/95mmA/mtP7BghVZduSZfnuSBQiLFFJf8KbyZ2JT3FQfE1rmjsaWgHA==
X-Received: by 2002:adf:ea91:: with SMTP id s17mr24183370wrm.349.1605604747942; 
 Tue, 17 Nov 2020 01:19:07 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id w10sm27404440wra.34.2020.11.17.01.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 01:19:07 -0800 (PST)
Date: Tue, 17 Nov 2020 04:19:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 3/7] vhost-user-blk-server: depend on CONFIG_VHOST_USER
Message-ID: <20201117091848.695370-4-mst@redhat.com>
References: <20201117091848.695370-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201117091848.695370-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

I interpreted CONFIG_VHOST_USER as controlling only QEMU's vhost-user
device frontends. However, virtiofsd and contrib/ vhost-user device
backends are also controlled by CONFIG_VHOST_USER. Make the
vhost-user-blk server depend on CONFIG_VHOST_USER for consistency.

Now the following error is printed when the vhost-user-blk server is
enabled without CONFIG_VHOST_USER:

  $ ./configure --disable-vhost-user --enable-vhost-user-blk ...
  ../meson.build:761:8: ERROR: Problem encountered: vhost_user_blk_server requires vhost-user support

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201110171121.1265142-3-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 4b789f18c1..7fd874eec7 100644
--- a/meson.build
+++ b/meson.build
@@ -751,11 +751,14 @@ statx_test = '''
 
 has_statx = cc.links(statx_test)
 
-have_vhost_user_blk_server = (targetos == 'linux')
+have_vhost_user_blk_server = (targetos == 'linux' and
+    'CONFIG_VHOST_USER' in config_host)
 
 if get_option('vhost_user_blk_server').enabled()
     if targetos != 'linux'
         error('vhost_user_blk_server requires linux')
+    elif 'CONFIG_VHOST_USER' not in config_host
+        error('vhost_user_blk_server requires vhost-user support')
     endif
 elif get_option('vhost_user_blk_server').disabled() or not have_system
     have_vhost_user_blk_server = false
-- 
MST


