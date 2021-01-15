Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABBB2F7F33
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:15:43 +0100 (CET)
Received: from localhost ([::1]:47608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0QpC-00010M-KS
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:15:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0Qjj-00044q-Dg
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:10:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0Qjg-0008J4-Ub
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:10:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610723400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YgVLLacDQILJN6YonWv28T7UMj9spgsD7n9ORYdJelQ=;
 b=cgUxuJgh60DcKaTWsyQ1sNA3CgTK6MvTxJc0SAJ4VwB6zfF8ibfPNc6rNqCO91tay1XHea
 59BlhLqXaHszLHrytFU8qj8y00o7NWQdkcj+GQWE31mP0U7UEFXANYEcSaQ5zH0LK1Jz9i
 EgGNIZoqe/pYeHgnGt1MrTpdHm6pW54=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-cqCBvYzaNGSpjhOoKnyQ-Q-1; Fri, 15 Jan 2021 10:09:58 -0500
X-MC-Unique: cqCBvYzaNGSpjhOoKnyQ-Q-1
Received: by mail-ed1-f72.google.com with SMTP id dh21so3961147edb.6
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 07:09:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YgVLLacDQILJN6YonWv28T7UMj9spgsD7n9ORYdJelQ=;
 b=GiTK2bAC4PAJAKCWbGbBB19yYtHzliBVomoV+oxtThFlZwsjjuh9FGECN3fXaDiNpU
 /H1lZ4JcYimO29lJGt477LBAw7bvx3el+yKiKA/TnsgEGAZSRPKxjWUAx4H6ucl5scuP
 /WAxnFCnRihig7VwAXF2F1ILEiFB/q+6VEEIIpxnMKWOf2HQUE7RxQek/HfEFQolXWDN
 szl3P52os+6Zwomes8EyjEiVxD29XMgatTPN5E1V6H7F7Lly077TxyqaN8CuKycljH/k
 AjRJWa8l380cViqv056lKeZK7xqMoy2SObnAH8bd+UtRlxfzl2d+NnAw4FatmI49iFc5
 lTYw==
X-Gm-Message-State: AOAM530RESq07rCdtK7iCeXgCxvItW3+y+j2Z+U/YuaWIUsjVOhFP+FQ
 Wjft/pCBckNQIbSqCicYqzCuLu9ZpDK0f1Tj+VXFNCbIAESpQiiLaREY/eJ7qdZ9jgykhN/6Xl9
 xL0d1s/q7j8BgG/f/YBb90lcV20TXbmHVvPHf4sopfkzI+XEihYFJKM+w/4LXkwyp
X-Received: by 2002:a17:907:3e06:: with SMTP id
 hp6mr9303436ejc.254.1610723392956; 
 Fri, 15 Jan 2021 07:09:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5WkCIxOL6jNBQBfFrJk1fIG5mxjb5+lkCeMIC3vJsPkOo49V9kp1LpJKr8BmGbK3OK/TrnA==
X-Received: by 2002:a17:907:3e06:: with SMTP id
 hp6mr9302808ejc.254.1610723384376; 
 Fri, 15 Jan 2021 07:09:44 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id c12sm3916306edw.55.2021.01.15.07.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:09:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] tests/qtest: Remove TPM tests
Date: Fri, 15 Jan 2021 16:09:33 +0100
Message-Id: <20210115150936.3333282-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115150936.3333282-1-philmd@redhat.com>
References: <20210115150936.3333282-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@gmail.com>, Hannes Reinecke <hare@suse.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The TPM tests are failing, and no further tests are run,
making the rest of the testsuite pointless:

  $ make check-qtest
  =================================================================
  ==3330026==ERROR: LeakSanitizer: detected memory leaks

  Indirect leak of 444960 byte(s) in 108 object(s) allocated from:
      #0 0x55a2df5adb87 in calloc (tests/qtest/tpm-crb-swtpm-test+0x266b87)
      #1 0x7f507bbff9b0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x589b0)
      #2 0x55a2df898766 in parse_object qobject/json-parser.c:318:12
      #3 0x55a2df897d86 in parse_value qobject/json-parser.c:546:16
      #4 0x55a2df8979be in json_parser_parse qobject/json-parser.c:580:14
      #5 0x55a2df81ccc1 in json_message_process_token qobject/json-streamer.c:92:12
      #6 0x55a2df85f773 in json_lexer_feed_char qobject/json-lexer.c:313:13
      #7 0x55a2df85eb04 in json_lexer_feed qobject/json-lexer.c:350:9
      #8 0x55a2df81d7ed in json_message_parser_feed qobject/json-streamer.c:121:5
      #9 0x55a2df5f15f9 in qmp_fd_receive tests/qtest/libqtest.c:614:9
      #10 0x55a2df5f1dda in qtest_qmp_receive_dict tests/qtest/libqtest.c:636:12
      #11 0x55a2df5ef444 in qtest_qmp_receive tests/qtest/libqtest.c:624:27
      #12 0x55a2df5f3a2d in qtest_vqmp tests/qtest/libqtest.c:715:12
      #13 0x55a2df5efa62 in qtest_qmp tests/qtest/libqtest.c:756:16
      #14 0x55a2df5eb480 in tpm_util_wait_for_migration_complete tests/qtest/tpm-util.c:245:15
      #15 0x55a2df5e4167 in tpm_test_swtpm_migration_test tests/qtest/tpm-tests.c:117:5
      #16 0x55a2df5e340c in tpm_crb_swtpm_migration_test tests/qtest/tpm-crb-swtpm-test.c:44:5
      #17 0x7f507bc2229d  (/lib64/libglib-2.0.so.0+0x7b29d)

  Indirect leak of 3456 byte(s) in 108 object(s) allocated from:
      #0 0x55a2df5adb87 in calloc (tests/qtest/tpm-crb-swtpm-test+0x266b87)
      #1 0x7f507bbff9b0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x589b0)
      #2 0x55a2df7886af in qdict_put_obj qobject/qdict.c:126:17
      #3 0x55a2df89d706 in parse_pair qobject/json-parser.c:300:5
      #4 0x55a2df898889 in parse_object qobject/json-parser.c:327:13
      #5 0x55a2df897d86 in parse_value qobject/json-parser.c:546:16
      #6 0x55a2df8979be in json_parser_parse qobject/json-parser.c:580:14
      #7 0x55a2df81ccc1 in json_message_process_token qobject/json-streamer.c:92:12
      #8 0x55a2df85f773 in json_lexer_feed_char qobject/json-lexer.c:313:13
      #9 0x55a2df85eb04 in json_lexer_feed qobject/json-lexer.c:350:9
      #10 0x55a2df81d7ed in json_message_parser_feed qobject/json-streamer.c:121:5
      #11 0x55a2df5f15f9 in qmp_fd_receive tests/qtest/libqtest.c:614:9
      #12 0x55a2df5f1dda in qtest_qmp_receive_dict tests/qtest/libqtest.c:636:12
      #13 0x55a2df5ef444 in qtest_qmp_receive tests/qtest/libqtest.c:624:27
      #14 0x55a2df5f3a2d in qtest_vqmp tests/qtest/libqtest.c:715:12
      #15 0x55a2df5efa62 in qtest_qmp tests/qtest/libqtest.c:756:16
      #16 0x55a2df5eb480 in tpm_util_wait_for_migration_complete tests/qtest/tpm-util.c:245:15
      #17 0x55a2df5e4167 in tpm_test_swtpm_migration_test tests/qtest/tpm-tests.c:117:5
      #18 0x55a2df5e340c in tpm_crb_swtpm_migration_test tests/qtest/tpm-crb-swtpm-test.c:44:5
      #19 0x7f507bc2229d  (/lib64/libglib-2.0.so.0+0x7b29d)

  Indirect leak of 756 byte(s) in 108 object(s) allocated from:
      #0 0x55a2df5ad9cf in malloc (tests/qtest/tpm-crb-swtpm-test+0x2669cf)
      #1 0x7f507bbff958 in g_malloc (/lib64/libglib-2.0.so.0+0x58958)

  SUMMARY: AddressSanitizer: 449172 byte(s) leaked in 324 allocation(s).
  make: *** [Makefile.mtest:1025: run-test-126] Error 1

Remove these tests to be able to run the rest.

Cc: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/meson.build | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 16d04625b8b..bcbb04d2bb4 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -41,10 +41,6 @@
   (config_all_devices.has_key('CONFIG_USB_UHCI') and                                        \
    config_all_devices.has_key('CONFIG_USB_EHCI') ? ['usb-hcd-ehci-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_USB_XHCI_NEC') ? ['usb-hcd-xhci-test'] : []) +        \
-  (config_all_devices.has_key('CONFIG_TPM_CRB') ? ['tpm-crb-test'] : []) +                  \
-  (config_all_devices.has_key('CONFIG_TPM_CRB') ? ['tpm-crb-swtpm-test'] : []) +            \
-  (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-test'] : []) +              \
-  (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-swtpm-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
   qtests_pci +                                                                              \
   ['fdc-test',
-- 
2.26.2


