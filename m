Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 283A130BC5C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 11:50:42 +0100 (CET)
Received: from localhost ([::1]:57464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6tGb-00024W-7d
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 05:50:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6tFJ-0001XE-O3
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:49:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6tFG-0004nG-RX
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:49:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612262957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=810wxp/9K6X+ioRQSFDs4FbQGo2HFJmLTPYdgC9Myro=;
 b=A5h1HXRNSBp+mfxVjV+xMwZjINj+Mnpl5p1y5QBW+ewnivWjkBTBPBscN3ymY9pe/fABJ5
 L2LdAKHvjWyFVDd/x5YqTNoiTa7y9Hk7wloV1HChKrxHQxC9BZMnUyo4vwJhVkHhyaXUda
 IX79ZEtgqWLw4NkDPcnxsGf8tNla1L8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-UDfVP7_lM4GcQyHO8Aki9Q-1; Tue, 02 Feb 2021 05:49:15 -0500
X-MC-Unique: UDfVP7_lM4GcQyHO8Aki9Q-1
Received: by mail-wm1-f69.google.com with SMTP id y9so1243111wmi.8
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 02:49:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=810wxp/9K6X+ioRQSFDs4FbQGo2HFJmLTPYdgC9Myro=;
 b=puIfAc0J+Cxked931l/pAGi3YIfca1qkORLr1r2WoqKB/Db5kMF5o6uvEQWUhtRkKZ
 vz6GzK115mNRPN17FEVarKb7ksikehbJyblDwD1X00eftheXJub1a40tVeMyVKigy4Ny
 g5SOaT8quwpBCCXI87h/lUDGfY4ahrQTd2oHpzCmuU8UuurRTP+RyLI12g9XezJS6Yiq
 epxh4gwuv88QadFX5EX9BnHi0t6/92SaBHCRkgIGyQikXVcd22y5xGDK6sZys69Lz3lD
 /Jv9iPGqv7C1/odZKzj3doQTDmS34cFtTNPbKJA6Aa3tcwZP7cDPAx9U7upOtZFPboj/
 KNYA==
X-Gm-Message-State: AOAM5326U03xn7FJXvx6B6CrZKXEpKZ6WnfybfpQhqwI2fyuxX1zpTzm
 NHEbP+WEUUwpG6x6LEKodYaPW/AYLpjMoV2/l5ckFamNwc65judJBcTVhTL3aDuTPg7akb2qZI4
 5Ao9Bmf7aE8whV/l+73jW2Ktl5ld6k6vgqje3HKtgUz3NfzjcyrizuclBUWQ95Cxc
X-Received: by 2002:adf:e404:: with SMTP id g4mr22753045wrm.416.1612262954135; 
 Tue, 02 Feb 2021 02:49:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQxPqTSDYwGVplBMIqLnkYUj8GUcId3gYNhdRUrynVDOH+BZvSLM6qal70AIANGssvgKvbvQ==
X-Received: by 2002:adf:e404:: with SMTP id g4mr22753011wrm.416.1612262953816; 
 Tue, 02 Feb 2021 02:49:13 -0800 (PST)
Received: from x1w.redhat.com (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id l11sm29712075wrt.23.2021.02.02.02.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 02:49:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: Escape non-numbers in version_ge()
Date: Tue,  2 Feb 2021 11:49:11 +0100
Message-Id: <20210202104911.879393-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Red Hat based distributions, the configure script emits various
warnings:

  # ./configure
  Using './build' as the directory for build output
  ./configure: line 212: test: 2-15: integer expression expected
  ./configure: line 213: test: 2-15: integer expression expected
  ./configure: line 212: test: el8: integer expression expected
  ./configure: line 213: test: el8: integer expression expected

This is produced by the gdb version check introduced in commit
b1863ccc957 ("configure: gate our use of GDB to 8.3.1 or above"):

    gdb_version=$($gdb_bin --version | head -n 1)
    if version_ge ${gdb_version##* } 8.3.1; then
        echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
    fi

Because on RHEL/Fedora the minor version is not a plain number:

  $ gdb --version | head -n 1
  GNU gdb (GDB) Fedora 9.1-7.fc32

  $ gdb --version | head -n 1
  GNU gdb (GDB) Red Hat Enterprise Linux 8.2-15.el8

Fix by only using the leading numbers, stripping the rest.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index e85d6baf8f8..21f6530a812 100755
--- a/configure
+++ b/configure
@@ -205,7 +205,7 @@ version_ge () {
         local_first=${2-0}
         # 'shift 2' if $2 is set, or 'shift' if $2 is not set
         shift ${2:+2}
-        local_ver1=$*
+        local_ver1=$(echo $* | sed -E 's/(^[0-9]+).*/\1/')
         set x $local_ver2
         # the second argument finished, the first must be greater or equal
         test $# = 1 && return 0
-- 
2.26.2


