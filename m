Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B939483E9C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 09:59:59 +0100 (CET)
Received: from localhost ([::1]:46228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ffi-0007rY-Bp
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 03:59:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4fap-000893-KX; Tue, 04 Jan 2022 03:54:55 -0500
Received: from [2a00:1450:4864:20::331] (port=51113
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4fak-0007qD-Gp; Tue, 04 Jan 2022 03:54:55 -0500
Received: by mail-wm1-x331.google.com with SMTP id b73so22760548wmd.0;
 Tue, 04 Jan 2022 00:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U5ZN7of/l34l2Sf8f/6H3euMQxJOF1roUgmAROhi/go=;
 b=W3Em5YHrKGlMUyrF8bJUJXMMHZG+Tu0W61tJVatf4ebQBFr2Op2V26goFiHz3/CYvX
 EV51Q+wp4HA6QnBxOqzB5jz0ACXKiKSckcTwGtewBUtKC2ap9RZN2N64hOVlTPsGB12O
 A8mEa3fTW/CMxbghJw/zrjSp8tH6cRtbqrT3ApypkAHii767CbCacJlv3R4qZpJzkxum
 Qtb4JpTXoBbhUCuQBEXKVqQFlbpSyG+fxNfjjVD06onjuTIQx8Rl564g+l2II0KtiOqR
 zdVtmn0Sfk/6aYmlsoENx6qX/C62ajmVpIlO7oF5UKRcvanL9k0tYGK0bSAjRuVayMuh
 wZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U5ZN7of/l34l2Sf8f/6H3euMQxJOF1roUgmAROhi/go=;
 b=BEIcF/wqTspqDlepm2zathSdOAYSqlovS5KOLjyAdOMbe4lJZ822Hxlw4goaBvVbNq
 9CaUQezgny8M1cLWUwMhLYqirvj6KTbZU+9F5G8KgWikM+ctOAlnhACvFliTZaDkbGZb
 68L7rolJ80OogzZ96iwUIJjLWFC8zmfI1AOz6B0xhyaXCgrUqUFf14WeMRmVNbcFT8IC
 ceX6JclSAvV8PUmQSNypt4jVqrlmGaBz0njD1bGF/ckeA0Obe0LdqzUJhv04V5qebNXE
 XeSYvoNY1xsEJAf0N5LNLZvnMp658hwHxyBUKSvXBybYFCHnB597bgHND63opx3xzcP4
 E+cw==
X-Gm-Message-State: AOAM531T7wlbAah7YkCAOzfB17kwFhWC3Dw1yDBzP46HPLSdujDHk5uW
 wWwxfsNeATN3+0As4iIOlIL0F229Kt6NaQ==
X-Google-Smtp-Source: ABdhPJxCXzCsr84h4XdRU/YKoJVUjZfQPsKZmczKt2pSGHILzDqI6ElLFpHM3VDVupA131nO9G5EEw==
X-Received: by 2002:a1c:4d0d:: with SMTP id o13mr41448660wmh.70.1641286488230; 
 Tue, 04 Jan 2022 00:54:48 -0800 (PST)
Received: from x1w.. (26.red-83-50-86.dynamicip.rima-tde.net. [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id j13sm42333500wmq.11.2022.01.04.00.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 00:54:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/9] hw/pci: Document pci_dma_map()
Date: Tue,  4 Jan 2022 09:54:25 +0100
Message-Id: <20220104085431.2122999-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104085431.2122999-1-f4bug@amsat.org>
References: <20220104085431.2122999-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/pci/pci.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 5b36334a28a..07f08aa0626 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -876,6 +876,18 @@ PCI_DMA_DEFINE_LDST(q_be, q_be, 64);
 
 #undef PCI_DMA_DEFINE_LDST
 
+/**
+ * pci_dma_map: Map device PCI address space range into host virtual address
+ *
+ * May map a subset of the requested range, given by and returned in @plen.
+ * May return %NULL and set *@plen to zero(0), if resources needed to perform
+ * the mapping are exhausted.
+ *
+ * @dev: #PCIDevice to be accessed
+ * @addr: address within that device's address space
+ * @plen: pointer to length of buffer; updated on return
+ * @dir: indicates the transfer direction
+ */
 static inline void *pci_dma_map(PCIDevice *dev, dma_addr_t addr,
                                 dma_addr_t *plen, DMADirection dir)
 {
-- 
2.33.1


