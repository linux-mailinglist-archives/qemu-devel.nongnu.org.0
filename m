Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741E929724A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 17:28:39 +0200 (CEST)
Received: from localhost ([::1]:40378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVyze-0003fk-Em
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 11:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kVyr0-00019W-13
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 11:19:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kVyqx-00009a-SC
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 11:19:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603466378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bg0ARfy/nreX1sEGkRPdNpsWLKtbHdvINaE794GWGps=;
 b=IinAWouyWeF2LYIdiluK7KOVLqlEGOuZxqNhiD2EPqgovHQ5KD0c4tANOpdQBTa8O1sA1K
 RRBYoAYEinHng8bWxsSRHbxXom5vhmvwJvlW06Q6TVK3dFMOS85DH+2CwjHjtKUUNZvi4Y
 EQB2RYFpd+F7lyRWUzDExB+ft/QPSXY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-YRvszuRFOEW7KcHQhVVrMw-1; Fri, 23 Oct 2020 11:19:37 -0400
X-MC-Unique: YRvszuRFOEW7KcHQhVVrMw-1
Received: by mail-wr1-f70.google.com with SMTP id t17so699715wrm.13
 for <qemu-devel@nongnu.org>; Fri, 23 Oct 2020 08:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bg0ARfy/nreX1sEGkRPdNpsWLKtbHdvINaE794GWGps=;
 b=F91lL5zDRJ/XY3Cg8bQ5ttgrRaIAcKukVcKNqLyj/gG9d1eIvQTDA+Ca0b565X80Bn
 35YiVRiwkx8+fMbhcCWZwFw4MtsSZhB7oPDp3mezrexepz2aZ/WinYZhjjajlO4vPULX
 Y4ZJVzj6+9eoeoH/jJks/EItpMo90dJ8C/1nZJq6cYUKSIWz+E3il0seHJbIkxPFblg/
 n645I03GuMSBdXM00DsztE1W1eiJu+8CMiFyptOOAFj1X/7qpBr1jp/PGP3h29vP7XKP
 3h/kLCunbCUCbPwBwJPcYaogkN/C8zw+A/Jm/YorTcdC+NuOYin+z+D3BBvgP0Hydtpz
 c9rg==
X-Gm-Message-State: AOAM533E6HfJIjX6Ftd8s/U2aPwn/1XfZEjjsY3bRA6I0mBrVeAoTW5j
 dxk82TsSMf/lQcrH3Pcvz9f4Wd1tUaCE01l3Cf2ogdyZBl1qC0y2gq3HsHyNwCh71YS/HVv9LZX
 h7jl2aJT/HmoqWOw=
X-Received: by 2002:a05:600c:1149:: with SMTP id
 z9mr3046885wmz.180.1603466375036; 
 Fri, 23 Oct 2020 08:19:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykkgTDIIxfR6ojyPbFkVPnULp6JstlvtxPH536EGvfoM2VrTaNGtmWDdXzRndSse/Y2fxJwQ==
X-Received: by 2002:a05:600c:1149:: with SMTP id
 z9mr3046868wmz.180.1603466374846; 
 Fri, 23 Oct 2020 08:19:34 -0700 (PDT)
Received: from localhost.localdomain (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id g4sm3665361wmh.13.2020.10.23.08.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 08:19:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND v3 02/10] docs/devel/loads-stores: Add regexp for DMA
 functions
Date: Fri, 23 Oct 2020 17:19:15 +0200
Message-Id: <20201023151923.3243652-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023151923.3243652-1-philmd@redhat.com>
References: <20201023151923.3243652-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 01:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/devel/loads-stores.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/devel/loads-stores.rst b/docs/devel/loads-stores.rst
index 59c1225391c..ee43f5dfee2 100644
--- a/docs/devel/loads-stores.rst
+++ b/docs/devel/loads-stores.rst
@@ -483,6 +483,8 @@ make sure our existing code is doing things correctly.
 
 Regexes for git grep
  - ``\<dma_memory_\(read\|write\|rw\)\>``
+ - ``\<ldu\?[bwlq]\(_[bl]e\)\?_dma\>``
+ - ``\<st[bwlq]\(_[bl]e\)\?_dma\>``
 
 ``pci_dma_*`` and ``{ld,st}*_pci_dma``
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.26.2


