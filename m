Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A39C4D674E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 18:12:53 +0100 (CET)
Received: from localhost ([::1]:46140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSiou-0006st-11
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 12:12:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nSinj-00060Q-3E
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 12:11:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nSing-0002zL-1B
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 12:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647018694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sOX3OAVBe1PnWWF/6wVItB5sOHqpDF9FGMk76+1MJms=;
 b=M8FFlhBbHuw52UgPbzb5FFjb6bgvYq0mOIRA1DcNAxFMYm+/uJHUkUVbhBxm1uvI2soMI0
 Lr7RuCbfve2ERkdHjTvOC30Thd5EHtu+obIOTX9kzePnJaKePJrJq4GDpzsPPC78/rHwhc
 zT6kdO3BuplGqHdbKDhV3ztpMRi4wq4=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-mg5ovoaWM1quP3FNKo_LFw-1; Fri, 11 Mar 2022 12:11:33 -0500
X-MC-Unique: mg5ovoaWM1quP3FNKo_LFw-1
Received: by mail-ot1-f70.google.com with SMTP id
 b19-20020a056830105300b005b23d3eb1daso6512733otp.14
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 09:11:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sOX3OAVBe1PnWWF/6wVItB5sOHqpDF9FGMk76+1MJms=;
 b=74jB6M1QOeDukdR7HdBJkG5mHfpq25m3TnDJJBk4W7Lnyz58mDn+BXlape04JHD/Z5
 lnyFQhfhch6oGRVmc56q5SPu9W8EtSlv7xaDL+L1ZsNL5AX8ShG3AVvQzpbNJgS/Xpxw
 CL7heI6sGPimxF3EnF6nZXOPJPQK8Sr0g21Ak/1snFVpFDvq/gbgVLI8q5YXGmLjq/77
 lqoB6orihErySO34jnCIRGxnoDTaCGm2ioAROmP57AD8XB4kR5Km6GpK1/4kWN0slccY
 qtPQjzL/1czkeZ1VWGoRUkzH3KGuUYRERcL+Zkoh63LT/BKPRHxXoLYocSV7FuYcE/SP
 tJug==
X-Gm-Message-State: AOAM530yL9wuqsQsJ3EVQF9FpYGeebA1onGSWghh7Hm1yU7kv1M6u4/L
 ykHd0jiTwEUlmQWICEZmwf3nCJkebLQd+K6xmq36tUTQMlhNSgB62UQvKAFA3sFI70oWK/56wbo
 lTTnye8a+bETB0XtbElNk3kHJUM5MO3hFl1IKLM5y4FIQH2WNHJAnyYqnQdLuPSY=
X-Received: by 2002:a05:6808:158f:b0:2da:3b72:f19f with SMTP id
 t15-20020a056808158f00b002da3b72f19fmr7227171oiw.290.1647018692190; 
 Fri, 11 Mar 2022 09:11:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJze9NBNaPCS2rwSrnXtTPeGUmDDgbmysekzMSOGUzPx5ziJY1WP1CnEnOcAK8lZAQfNl+C6qw==
X-Received: by 2002:a05:6808:158f:b0:2da:3b72:f19f with SMTP id
 t15-20020a056808158f00b002da3b72f19fmr7227155oiw.290.1647018691906; 
 Fri, 11 Mar 2022 09:11:31 -0800 (PST)
Received: from localhost ([191.181.58.94]) by smtp.gmail.com with ESMTPSA id
 s24-20020a056808209800b002da3b9bf8e0sm3525472oiw.32.2022.03.11.09.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 09:11:31 -0800 (PST)
From: Beraldo Leal <bleal@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] tests/avocado: starts PhoneServer upfront
Date: Fri, 11 Mar 2022 14:11:27 -0300
Message-Id: <20220311171127.2189534-1-bleal@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01,
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
Cc: thuth@redhat.com, berrange@redhat.com, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Race conditions can happen with the current code, because the port that
was available might not be anymore by the time the server is started.

By setting the port to 0, PhoneServer it will use the OS default
behavior to get a free port, then we save this information so we can
later configure the guest.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Beraldo Leal <bleal@redhat.com>
---
 tests/avocado/avocado_qemu/__init__.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 9b056b5ce5..ac85e36a4d 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -18,7 +18,7 @@
 import uuid
 
 import avocado
-from avocado.utils import cloudinit, datadrainer, network, process, ssh, vmimage
+from avocado.utils import cloudinit, datadrainer, process, ssh, vmimage
 from avocado.utils.path import find_command
 
 #: The QEMU build root directory.  It may also be the source directory
@@ -602,9 +602,6 @@ def prepare_cloudinit(self, ssh_pubkey=None):
         self.log.info('Preparing cloudinit image')
         try:
             cloudinit_iso = os.path.join(self.workdir, 'cloudinit.iso')
-            self.phone_home_port = network.find_free_port()
-            if not self.phone_home_port:
-                self.cancel('Failed to get a free port')
             pubkey_content = None
             if ssh_pubkey:
                 with open(ssh_pubkey) as pubkey:
@@ -614,7 +611,7 @@ def prepare_cloudinit(self, ssh_pubkey=None):
                           password=self.password,
                           # QEMU's hard coded usermode router address
                           phone_home_host='10.0.2.2',
-                          phone_home_port=self.phone_home_port,
+                          phone_home_port=self.phone_server.server_port,
                           authorized_key=pubkey_content)
         except Exception:
             self.cancel('Failed to prepare the cloudinit image')
@@ -625,6 +622,8 @@ def set_up_boot(self):
         self.vm.add_args('-drive', 'file=%s' % path)
 
     def set_up_cloudinit(self, ssh_pubkey=None):
+        self.phone_server = cloudinit.PhoneHomeServer(('0.0.0.0', 0),
+                                                      self.name)
         cloudinit_iso = self.prepare_cloudinit(ssh_pubkey)
         self.vm.add_args('-drive', 'file=%s,format=raw' % cloudinit_iso)
 
@@ -635,7 +634,9 @@ def launch_and_wait(self, set_up_ssh_connection=True):
                                                  logger=self.log.getChild('console'))
         console_drainer.start()
         self.log.info('VM launched, waiting for boot confirmation from guest')
-        cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port), self.name)
+        while not self.phone_server.instance_phoned_back:
+            self.phone_server.handle_request()
+
         if set_up_ssh_connection:
             self.log.info('Setting up the SSH connection')
             self.ssh_connect(self.username, self.ssh_key)
-- 
2.31.1


