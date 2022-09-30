Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D72A5F074C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 11:13:30 +0200 (CEST)
Received: from localhost ([::1]:45506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeC5I-0000Ce-9D
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 05:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeC2g-0004MW-Ks
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:10:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeC2d-0003px-BI
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:10:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664529042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/qrx24MWPOfvKYbdjGAZykWo2UfA/z2tPuWzxzS4GHo=;
 b=TnccDqnaDJFhMMIei6v8XQDsSJN5sYEKYD1BsthFelIm7ARAt+eYhTcfbN10ZJ1yShASvZ
 tKKpHfY+ah0FC7BAbXTL5AYYsM5EezqqR/QeicFDM8dopOtMQpw7ZDpX11uwPsJnx60Gyj
 PHzqEGQLVrOKBLuMmkIVluBaRWqwmHU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-241-jbYCfeGPPU21euCnEpZohg-1; Fri, 30 Sep 2022 05:10:41 -0400
X-MC-Unique: jbYCfeGPPU21euCnEpZohg-1
Received: by mail-ej1-f70.google.com with SMTP id
 sa15-20020a1709076d0f00b00781d793f51fso1580152ejc.18
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 02:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/qrx24MWPOfvKYbdjGAZykWo2UfA/z2tPuWzxzS4GHo=;
 b=4V0lNmK56YQ2/1hFlHqV31yTpwSCyRJlXQUyMEzlFRYrrWCVf/tmZRgzjoOzz4XluI
 4DwHBOT1GsaQAk5OXt0B2GqgzpFUa22tJf8n3qd7jYJDsYgq76lkjRousrNNmIbck7Ag
 tGIJXkAFpwJFtSMZwm+EYsN7AJdn0/+I7bfIJO6cNCln2NiUV3a7+7BbmxCY1BgCuhgK
 33o4XH1SlGS/kqQq7QvNCfZdBrkYXSXJ8PGPCVJxz6GhjDDB5F8f5W1YUTkxdrLaEwHJ
 /ymWuKzZcO5B5nhC/sqEu6uIc1rWTWoT97NplwT3TuwjVCo9SftPPlm2PCNvIMJ22RWp
 sTvw==
X-Gm-Message-State: ACrzQf0hx1qLXRec0EuwEV/XeOA156Qwa4H2erImSZ7ojvWnMDwB8o24
 n/n0uK+7qc79SGboSPF0HSFidKnjeuafmgUn9pxB6qrXqln2ZujfwURqqBtFwXRqAkEmPCWt5Jg
 bIfK+hGMOhLweJEtf7og8TQr8HARlf4oeSc0vKlVHkHFiPYq4XS6zCRaQnqEsj7rVtOM=
X-Received: by 2002:a17:906:eeca:b0:730:6880:c397 with SMTP id
 wu10-20020a170906eeca00b007306880c397mr5619313ejb.593.1664529039391; 
 Fri, 30 Sep 2022 02:10:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7DVaWWpoCUU1F63/DEwVaEdtjXtFYdjHdunuvZIqDXAviNKjjuwQgFV925fDRosKbpDan4dQ==
X-Received: by 2002:a17:906:eeca:b0:730:6880:c397 with SMTP id
 wu10-20020a170906eeca00b007306880c397mr5619295ejb.593.1664529039065; 
 Fri, 30 Sep 2022 02:10:39 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 lx18-20020a170906af1200b0077fc446aaf6sm823782ejb.202.2022.09.30.02.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 02:10:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL v2 09/15] meson: -display dbus and CFI are incompatible
Date: Fri, 30 Sep 2022 11:10:33 +0200
Message-Id: <20220930091033.34379-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220930091033.34379-1-pbonzini@redhat.com>
References: <20220930091033.34379-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The generated skeletons for DBus call the finalize method of the parent
type using code like

    G_OBJECT_CLASS (qemu_dbus_display1_chardev_skeleton_parent_class)->finalize (object);

However, the finalize method is defined in a shared library that is not
compiled with CFI.  Do not enable anything that uses gdbus-codegen if
--enable-cfi was specified.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 3885fc1076..ca47ecbffe 100644
--- a/meson.build
+++ b/meson.build
@@ -487,6 +487,7 @@ meson.override_dependency('glib-2.0', glib)
 
 gio = not_found
 gdbus_codegen = not_found
+gdbus_codegen_error = '@0@ requires gdbus-codegen, please install libgio'
 if not get_option('gio').auto() or have_system
   gio = dependency('gio-2.0', required: get_option('gio'),
                    method: 'pkg-config', kwargs: static_kwargs)
@@ -511,6 +512,10 @@ if not get_option('gio').auto() or have_system
                              version: gio.version())
   endif
 endif
+if gdbus_codegen.found() and get_option('cfi')
+  gdbus_codegen = not_found
+  gdbus_codegen_error = '@0@ uses gdbus-codegen, which does not support control flow integrity'
+endif
 
 lttng = not_found
 if 'ust' in get_option('trace_backends')
@@ -1676,7 +1681,7 @@ dbus_display = get_option('dbus_display') \
   .require(enable_modules,
            error_message: '-display dbus requires --enable-modules') \
   .require(gdbus_codegen.found(),
-           error_message: '-display dbus requires gdbus-codegen') \
+           error_message: gdbus_codegen_error.format('-display dbus')) \
   .require(opengl.found() and gbm.found(),
            error_message: '-display dbus requires epoxy/egl and gbm') \
   .allowed()
-- 
2.37.3


