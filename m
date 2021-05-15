Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73589381A4E
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 19:53:41 +0200 (CEST)
Received: from localhost ([::1]:40050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhyTs-0001vy-HK
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 13:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEq-0001HJ-HG
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:38:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEn-0006RF-F0
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:38:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yMKbvRHD0VVgAl/shSsvEL3fFV0zSLsEZF6v1iEj1U8=;
 b=GecnskS1W4y3lxaZnmGbTFOL6jTM6nh82s3mCtmZdDsqUbd2gITQWaCVDGBGkTbPs9AJ8U
 24ag4/DDxk5i7LByYgArbYJVRAAQrJFXWkhgG/r8atH6D8KvlNOaWwAXnhO7BxN45DQFgx
 qrtHygs8gP5i7QPvMaDnttY37YUFYHE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-8IG5kIY9NUuQP0NneYmjsQ-1; Sat, 15 May 2021 13:38:03 -0400
X-MC-Unique: 8IG5kIY9NUuQP0NneYmjsQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 f8-20020a1c1f080000b0290169855914dfso1660522wmf.3
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yMKbvRHD0VVgAl/shSsvEL3fFV0zSLsEZF6v1iEj1U8=;
 b=OjR5TVd5ZZopwfgQcu+cfTUInOjEZvZ5I8cWqJvuIw/zp0hmmKK2RiWHAidJIu/8/i
 adrcOrQaBmRKNfVUeV6VxE+Y23zWOuFNAtGQZ1F+iNN+naWm90Hp7WRTqdtVP8S8WPqS
 ARq5oDvThWu4QZcOBjeAQln55kQyPhnOI/TiRkt0coWQPXE9Kl9f7qmdZGeolZhgFAtN
 DOKps4XWxQJOGNGcqVZAeBpvHJUyBfeeZRSl28OMC2oY8L2jtfwIdW3TMlHzmXLllj4F
 iE1DfKTAPHcqTK6DrE8bZJNd1YLo6zTLCEQyOxyGuFkIXWmgM2Ggwj8DUYGGdhoARm7J
 +FIA==
X-Gm-Message-State: AOAM532JmnhibkUhi88x0ngqmWb/uiSpgGjcyRjwJkf37FrSwMjK5LAi
 Ykrvgg+qrdG72Lm/dhlv6RYXONkq19s3CiqOGS4b36BJ78St2hD/nM+ReuZhaLMpPSUFErbhHH3
 qAW3/tw+1szdusPIDO09AOTDLyuiUQmwURtxBygoHzh5Jm4PByHAeYV1yotF534P/
X-Received: by 2002:a05:600c:4ca1:: with SMTP id
 g33mr19751674wmp.7.1621100281741; 
 Sat, 15 May 2021 10:38:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzdkdaJKsqQvEMuw/in8yhkYSzmz4ZUGj7uT9+EgpNyG/uYj5c6KEaDv2tlbB8+jf6n0nPnw==
X-Received: by 2002:a05:600c:4ca1:: with SMTP id
 g33mr19751656wmp.7.1621100281560; 
 Sat, 15 May 2021 10:38:01 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id k6sm14457835wmi.42.2021.05.15.10.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:38:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/12] hw/pci-host/Kconfig: Add missing dependency MV64361
 -> I8259
Date: Sat, 15 May 2021 19:37:13 +0200
Message-Id: <20210515173716.358295-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Looking at the MV64340 model source, there is a dependency on the
8259 interrupt controller:

  523     case MV64340_PCI_1_INTERRUPT_ACKNOWLEDGE_VIRTUAL_REG:
  524         /* FIXME: Should this be sent via the PCI bus somehow? */
  525         if (s->gpp_int_level && (s->gpp_value & BIT(31))) {
  526             ret = pic_read_irq(isa_pic);
  527         }
  528         break;

Add it to Kconfig to avoid the following build failure:

  /usr/bin/ld: libcommon.fa.p/hw_pci-host_mv64361.c.o: in function `mv64361_read':
  hw/pci-host/mv64361.c:526: undefined reference to `isa_pic'
  /usr/bin/ld: hw/pci-host/mv64361.c:526: undefined reference to `pic_read_irq'

Fixes: dcdf98a9015 ("hw/pci-host: Add emulation of Marvell MV64361 PPC system controller")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
index 79c20bf28bb..9dc0d761815 100644
--- a/hw/pci-host/Kconfig
+++ b/hw/pci-host/Kconfig
@@ -76,3 +76,4 @@ config SH_PCI
 config MV64361
     bool
     select PCI
+    select I8259
-- 
2.26.3


