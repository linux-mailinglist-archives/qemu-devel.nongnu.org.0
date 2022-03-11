Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE3E4D6226
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 14:12:31 +0100 (CET)
Received: from localhost ([::1]:37344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSf4I-0003qx-Fg
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 08:12:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nSf1P-0002tG-Rw
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 08:09:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nSf1L-00064o-KT
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 08:09:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647004166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LqZGQGsBbZf6P8kQW9Kynt9Cd0fBV25ioaDW1K5ODKA=;
 b=BN4eEqXcjHQnHa6pFj25h9exG5LtHCfKZxXjMpITaqVqc/w72EUHlswuJ4icSyHU+S/Rxz
 hQbzgR3/9QGzQlgfN3/x4qvUVfv2WHASUj7C3pvNFseK/hlHwmik08jue+9iGZtVBU9WBA
 zcVDsGbYxdt1uZKnKhguFuY1u3fXI64=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-7Vsn73OYPCindS8UcVT9gg-1; Fri, 11 Mar 2022 08:09:24 -0500
X-MC-Unique: 7Vsn73OYPCindS8UcVT9gg-1
Received: by mail-oi1-f197.google.com with SMTP id
 k26-20020a54441a000000b002da5a65fd5bso3690497oiw.22
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 05:09:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LqZGQGsBbZf6P8kQW9Kynt9Cd0fBV25ioaDW1K5ODKA=;
 b=Xl74tU7ZMsus5FLA3hgJu2nbKOZyIhonqdKNOdunQWYS3x0tdv9G7RDg6FDj5bkU5k
 U/0kCaAj+bXQk31jG5iWRl0zA9b7RXD7igWX/Ow+MDnPCohDC9JqCo6pD7J8/E6PlhNT
 JUyPrAaPm1OUCsNgFoorjBQBhJTehSYRJjuyZWYx4olTb6Dmh2y0URhzW4PNVZLOyQvi
 bSG5RQpesJVDt9XDpldEcVrniaOaqBGhfWBnF26YtOY10krRzsIYGb+HeOaCuxqyl7eR
 ySw6YPREZW6qX6d3DYjiny7XssypNW9tGjfJi9b3NJVmylH00RlF2cBTwMURifhheWWF
 2oqQ==
X-Gm-Message-State: AOAM530edgwYI4rMadQffLNvS0iRIjhR+mwjHLdIECFW8ei0WDQIFrfp
 cdyLJ/b916VRcuM6moT08F/sAaUFgVlN/afWzVMjjvm8oLi3/bKknauKRaWg8AAiyj+rfrjFsko
 xMMxP7JOaV7dLdhyxeCOXR9WGwuNDWvrtzE6KMR9lyy0pA+yx7hHFbSM4bK9wcSo=
X-Received: by 2002:aca:db03:0:b0:2da:363b:658b with SMTP id
 s3-20020acadb03000000b002da363b658bmr6636881oig.173.1647004163162; 
 Fri, 11 Mar 2022 05:09:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzC8sGMU3k6vxVCoG0QWhXt/oqj/kybwvPA2i+8qNXlqjfMdEjReoDAsCXHP85/V+Zb6CXEWQ==
X-Received: by 2002:aca:db03:0:b0:2da:363b:658b with SMTP id
 s3-20020acadb03000000b002da363b658bmr6636854oig.173.1647004162768; 
 Fri, 11 Mar 2022 05:09:22 -0800 (PST)
Received: from localhost ([191.181.58.94]) by smtp.gmail.com with ESMTPSA id
 c30-20020a056830349e00b005b272587f47sm2981226otu.38.2022.03.11.05.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 05:09:22 -0800 (PST)
From: Beraldo Leal <bleal@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/avocado: starts PhoneServer upfront
Date: Fri, 11 Mar 2022 10:09:19 -0300
Message-Id: <20220311130919.2120958-1-bleal@redhat.com>
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
 tests/avocado/avocado_qemu/__init__.py | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 9b056b5ce5..e830d04b84 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -602,9 +602,8 @@ def prepare_cloudinit(self, ssh_pubkey=None):
         self.log.info('Preparing cloudinit image')
         try:
             cloudinit_iso = os.path.join(self.workdir, 'cloudinit.iso')
-            self.phone_home_port = network.find_free_port()
-            if not self.phone_home_port:
-                self.cancel('Failed to get a free port')
+            if not self.phone_server:
+                self.cancel('Failed to get port used by the PhoneServer.')
             pubkey_content = None
             if ssh_pubkey:
                 with open(ssh_pubkey) as pubkey:
@@ -614,7 +613,7 @@ def prepare_cloudinit(self, ssh_pubkey=None):
                           password=self.password,
                           # QEMU's hard coded usermode router address
                           phone_home_host='10.0.2.2',
-                          phone_home_port=self.phone_home_port,
+                          phone_home_port=self.phone_server.server_port,
                           authorized_key=pubkey_content)
         except Exception:
             self.cancel('Failed to prepare the cloudinit image')
@@ -625,6 +624,8 @@ def set_up_boot(self):
         self.vm.add_args('-drive', 'file=%s' % path)
 
     def set_up_cloudinit(self, ssh_pubkey=None):
+        self.phone_server = cloudinit.PhoneHomeServer(('0.0.0.0', 0),
+                                                      self.name)
         cloudinit_iso = self.prepare_cloudinit(ssh_pubkey)
         self.vm.add_args('-drive', 'file=%s,format=raw' % cloudinit_iso)
 
@@ -635,7 +636,9 @@ def launch_and_wait(self, set_up_ssh_connection=True):
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


