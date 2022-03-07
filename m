Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF964CFBEF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:51:40 +0100 (CET)
Received: from localhost ([::1]:41274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAxn-00066m-Na
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:51:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAMs-00052Q-ED
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:13:30 -0500
Received: from [2a00:1450:4864:20::32b] (port=39901
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAMq-0004Q9-VR
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:13:30 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 o18-20020a05600c4fd200b003826701f847so10415563wmq.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=79rWpr963VJk+lg9R1mhD2p10j2yYBoHlGspCnGAQpY=;
 b=abZj0anbzq3P0KEE//sn2dOp5vEeNkDtSgArgscTT/9soNTUnggvWJUMOv1+ihpHiY
 JpotHcuzhJAu/xgDzfWmC7ic7MRxCfNjg/RfQrTG0Zp2aDKc/IMCVfPZnlkI8AMF0+ox
 7HOQ0eGdv3ZOFAVsxyDrskJ8OcIOXWp/nqIbHIBN3bdg+SsctXseRKcS1eOkCGXomM+r
 92aJYKk/4GCGGnM8o845mrxE5YjrnDfWEbmjY7G0PaeCIZTxVyelVgCvKy0LFqY4x7vK
 RpAhWR5TqoVsWPE7ukK/gzlO/o6cHUw/00W9gsyEAO5nmqF/0hzHgmsDRstWv9nOPDMm
 2CpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=79rWpr963VJk+lg9R1mhD2p10j2yYBoHlGspCnGAQpY=;
 b=i29x81jhDYsJtp9ritMAHSl9/7fhGdZX/OH3Y2sqeoVapNOCSs/oKXJ4oCB/i1aGdW
 TGRClkCjqvRG/bBG4RmWGgabom6oI6OzQglhz51sNQuN+Wd2xT2fkqh3IQCzUc0XTTLs
 piiuCE1AEWkVNg8p1trGu/11TmMeLI3q+jJulMs15grL+YdLZ/b0c2wVtvdhsigyhUs7
 3hPxRJr2yy1BzpcPohhQe5+izWOrn4cgqxXtLII2fHjkJacCVxsF6dMjo4ao/bET4CFb
 pKMLsDabNHUSAe07YZyGn6Fgc+PvE1YHsOCBVV+csv5+r/OqCI2VyijL9N6ILs9331mN
 BlWw==
X-Gm-Message-State: AOAM531swVMk+U26SfG2PCY/Ac/ecy7F42OK7/V/2tJco14QjlL2iLEw
 hrLf/jQwiiEOsE41RmFnxndufGcrB4s=
X-Google-Smtp-Source: ABdhPJyUsrAk4tTxz6AE/ijQpVCvN5n0+x6wFn//Qgr/lKFVL90vIHNYeHDu2pSRFYdg7uYJGrnI/Q==
X-Received: by 2002:a7b:ce95:0:b0:386:bc81:c912 with SMTP id
 q21-20020a7bce95000000b00386bc81c912mr17575696wmj.4.1646648007427; 
 Mon, 07 Mar 2022 02:13:27 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a7bc1ca000000b00389bc87db45sm648826wmj.7.2022.03.07.02.13.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 02:13:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/16] tests/avocado/linux_ssh_mips_malta.py: add missing accel
 (tcg) tag
Date: Mon,  7 Mar 2022 11:12:07 +0100
Message-Id: <20220307101207.90369-17-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
References: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

Being explicit about the accelerator used on these tests is a good
thing in itself, but it will also be used in the filtering rules
applied on "make check-avocado".

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220225210156.2032055-6-crosa@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/avocado/linux_ssh_mips_malta.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/avocado/linux_ssh_mips_malta.py b/tests/avocado/linux_ssh_mips_malta.py
index c0f0be5ade..0179d8a6ca 100644
--- a/tests/avocado/linux_ssh_mips_malta.py
+++ b/tests/avocado/linux_ssh_mips_malta.py
@@ -23,6 +23,9 @@
 @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
 @skipUnless(ssh.SSH_CLIENT_BINARY, 'No SSH client available')
 class LinuxSSH(QemuSystemTest, LinuxSSHMixIn):
+    """
+    :avocado: tags=accel:tcg
+    """
 
     timeout = 150 # Not for 'configure --enable-debug --enable-debug-tcg'
 
-- 
2.34.1


