Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A58D20B805
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 20:20:06 +0200 (CEST)
Received: from localhost ([::1]:58424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1josxJ-0006wy-8H
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 14:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1josrk-0007Sm-Vy
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 14:14:21 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1josrg-0001JZ-UO
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 14:14:20 -0400
Received: by mail-wr1-x436.google.com with SMTP id h5so10349777wrc.7
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 11:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5xSn2L6kzBKcKjTR8zPwxbT757SBhdGuGZ/3k/jBdz8=;
 b=XrDg1n0PjAQT78IkjIUyr+ccwBzU3p7Nwprz9mjAFr4Q/47+kfrGvrnRqZnQ1P4cSU
 26dBXNoyEzc42mO4a0SVTbZ+lNE4p65eEOZ+BDOGDc/B+aJBSf30a9irhhWPpoHgaTgg
 2GWz92w+vMthbopZOH7J0OkIRNP1mPcOaOozWx65aO+SL9b81hRdCDNE7weJHfyJ9q20
 +sMG3owew+bMLA+DwG8okzHlFPsqFWWxwSdE+jibo3HqvQsHwztjippbCBOwzwOtKLHH
 Ad3Te2Bgvfq/pB9/VPoVrFaO1P04DXLsBC/mrUA7wUM4QMMaBtedtqYDLN8DOCy/iu7+
 Faog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5xSn2L6kzBKcKjTR8zPwxbT757SBhdGuGZ/3k/jBdz8=;
 b=qkkVezgM6L/ub8or6qEWpE7rij2BmQ7yiqm63okjnF2jGcNPb9UgAt/c1pXSAzl3ee
 aVCm+w5T2aioTHGw9jhbpOBjaJtVf1f16Lkoo+v8tCqFfiuzjiFCSG0VePxQdxAZxwPg
 HRnKnTho84HdaxiAsHJAi4ugEa1arTDY0KM6euE2bUC3Xs6GkCegxAMuK3qc3Q17/gyA
 rI6r8PDZr3cijof3pbUqZum7UIZdOk6L8hGmRpZqyOdpg9KH0hRG+j9rGJ291oyE3AwA
 Knv5Ppobv05L39803ExkVJhEJvZKHVwEqw/ifQ5ECTW9q7mG5qGKRSPwk80xcajrrwBQ
 1BEg==
X-Gm-Message-State: AOAM531xdPWr/tjywqW9Te60EDUCcK78btVdX46ioff3kwAG1SLLMI9B
 Q+sLlYg6dMw5kuWBQOgvnWCQzA==
X-Google-Smtp-Source: ABdhPJwJo+iBW26KPYUL8AJmby8+zjFPrluq+Zg1Wip9Gav3911xRLX+Fq4V5OgNlc8vFvJkh1xZrw==
X-Received: by 2002:adf:e9c4:: with SMTP id l4mr5248339wrn.9.1593195255648;
 Fri, 26 Jun 2020 11:14:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r10sm20651346wrm.17.2020.06.26.11.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 11:14:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E489B1FF7E;
 Fri, 26 Jun 2020 19:13:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 11/30] tests/vm: Add workaround to consume console
Date: Fri, 26 Jun 2020 19:13:38 +0100
Message-Id: <20200626181357.26211-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626181357.26211-1-alex.bennee@linaro.org>
References: <20200626181357.26211-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, berrange@redhat.com, Robert Foley <robert.foley@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 Peter Puhov <peter.puhov@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Robert Foley <robert.foley@linaro.org>

This adds support to basevm.py so that we always
drain the console chars.  This makes use of
support added in an earlier commit that allows
QEMUMachine to use the ConsoleSocket.

This is a workaround we found was needed since
there is a known issue where QEMU will hang waiting
for console characters to be consumed.

We also added the option of logging the console to a file.
LOG_CONSOLE=1 will now log the output to a file.

Signed-off-by: Robert Foley <robert.foley@linaro.org>
Reviewed-by: Peter Puhov <peter.puhov@linaro.org>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200601211421.1277-10-robert.foley@linaro.org>
---
 tests/vm/Makefile.include |  4 ++++
 tests/vm/basevm.py        | 21 +++++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index 39f918a430a..f21948c46a5 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -49,6 +49,7 @@ endif
 	@echo '    EXTRA_CONFIGURE_OPTS="..."'
 	@echo "    J=[0..9]*            	 - Override the -jN parameter for make commands"
 	@echo "    DEBUG=1              	 - Enable verbose output on host and interactive debugging"
+	@echo "    LOG_CONSOLE=1        	 - Log console to file in: ~/.cache/qemu-vm "
 	@echo "    V=1				 - Enable verbose ouput on host and guest commands"
 	@echo "    QEMU_LOCAL=1                 - Use QEMU binary local to this build."
 	@echo "    QEMU=/path/to/qemu		 - Change path to QEMU binary"
@@ -75,6 +76,7 @@ $(IMAGES_DIR)/%.img:	$(SRC_PATH)/tests/vm/% \
 		$(if $(GENISOIMAGE),--genisoimage $(GENISOIMAGE)) \
 		$(if $(QEMU_LOCAL),--build-path $(BUILD_DIR)) \
 		$(if $(EFI_AARCH64),--efi-aarch64 $(EFI_AARCH64)) \
+		$(if $(LOG_CONSOLE),--log-console) \
 		--image "$@" \
 		--force \
 		--build-image $@, \
@@ -91,6 +93,7 @@ vm-build-%: $(IMAGES_DIR)/%.img
 		$(if $(V),--verbose) \
 		$(if $(QEMU_LOCAL),--build-path $(BUILD_DIR)) \
 		$(if $(EFI_AARCH64),--efi-aarch64 $(EFI_AARCH64)) \
+		$(if $(LOG_CONSOLE),--log-console) \
 		--image "$<" \
 		$(if $(BUILD_TARGET),--build-target $(BUILD_TARGET)) \
 		--snapshot \
@@ -114,6 +117,7 @@ vm-boot-ssh-%: $(IMAGES_DIR)/%.img
 		$(if $(V)$(DEBUG), --debug) \
 		$(if $(QEMU_LOCAL),--build-path $(BUILD_DIR)) \
 		$(if $(EFI_AARCH64),--efi-aarch64 $(EFI_AARCH64)) \
+		$(if $(LOG_CONSOLE),--log-console) \
 		--image "$<" \
 		--interactive \
 		false, \
diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index f716798b405..04d083409a5 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -117,6 +117,11 @@ class BaseVM(object):
              "w").write(self._config['ssh_pub_key'])
 
         self.debug = args.debug
+        self._console_log_path = None
+        if args.log_console:
+                self._console_log_path = \
+                         os.path.join(os.path.expanduser("~/.cache/qemu-vm"),
+                                      "{}.install.log".format(self.name))
         self._stderr = sys.stderr
         self._devnull = open(os.devnull, "w")
         if self.debug:
@@ -271,7 +276,13 @@ class BaseVM(object):
         args += self._data_args + extra_args + self._config['extra_args']
         logging.debug("QEMU args: %s", " ".join(args))
         qemu_path = get_qemu_path(self.arch, self._build_path)
-        guest = QEMUMachine(binary=qemu_path, args=args)
+
+        # Since console_log_path is only set when the user provides the
+        # log_console option, we will set drain_console=True so the
+        # console is always drained.
+        guest = QEMUMachine(binary=qemu_path, args=args,
+                            console_log=self._console_log_path,
+                            drain_console=True)
         guest.set_machine(self._config['machine'])
         guest.set_console()
         try:
@@ -285,6 +296,8 @@ class BaseVM(object):
             raise
         atexit.register(self.shutdown)
         self._guest = guest
+        # Init console so we can start consuming the chars.
+        self.console_init()
         usernet_info = guest.qmp("human-monitor-command",
                                  command_line="info usernet")
         self.ssh_port = None
@@ -296,7 +309,9 @@ class BaseVM(object):
             raise Exception("Cannot find ssh port from 'info usernet':\n%s" % \
                             usernet_info)
 
-    def console_init(self, timeout = 120):
+    def console_init(self, timeout = None):
+        if timeout == None:
+            timeout = self.socket_timeout
         vm = self._guest
         vm.console_socket.settimeout(timeout)
         self.console_raw_path = os.path.join(vm._temp_dir,
@@ -578,6 +593,8 @@ def parse_args(vmcls):
     parser.add_option("--efi-aarch64",
                       default="/usr/share/qemu-efi-aarch64/QEMU_EFI.fd",
                       help="Path to efi image for aarch64 VMs.")
+    parser.add_option("--log-console", action="store_true",
+                      help="Log console to file.")
     parser.disable_interspersed_args()
     return parser.parse_args()
 
-- 
2.20.1


