Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82157A04D6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 16:26:23 +0200 (CEST)
Received: from localhost ([::1]:37038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2yty-0003Pv-61
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 10:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54568)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <skrtbhtngr@gmail.com>) id 1i2yrj-0002CA-38
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 10:24:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <skrtbhtngr@gmail.com>) id 1i2yrh-0000Ua-Oh
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 10:24:02 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:33164)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <skrtbhtngr@gmail.com>)
 id 1i2yrh-0000Tr-GO
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 10:24:01 -0400
Received: by mail-pf1-x442.google.com with SMTP id g2so1857813pfq.0
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 07:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uzWT2Ciu2/Xsydg3JQ+ZbcwkZXpsVsfJ3kWHiDcnJPc=;
 b=NNIFa0AL/tg+eRrACYqKlv4QNpBuplBEBLLcmvmmoVicJN3o8iuPkw99c0aYdmOXzu
 ZetRlh7nXQVi8CG/onb5vSZ9wGt28J+2Vux3JDgK88lyjN73oxmyV0kWffDW9JV0CSnF
 dZi1Ke+8UykcHIer5KwYFpncoB1mP7jJr1p/bqmEDUbRYUYpNwJxyVLTEgOM3r7y0FT4
 Vmh8SENkZfxDVCGMWexK1WAwQM7QVOZJnRa8x4DAZy+In8odewAfbkqgfhv/PfWK8kgB
 ZoVq7e0LjfOYs+9AqIF4UeuReVbG4AQaKR1+1cy7ffgxvIydrQK8wf8TUkL1wbaUZKle
 zJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uzWT2Ciu2/Xsydg3JQ+ZbcwkZXpsVsfJ3kWHiDcnJPc=;
 b=b0ZZ1LKpATrQoC42plIYFKcOezfmN4AISBxiFunfBiQ1210YS5weZ+2SKMrTr89NsQ
 lp7SoMkyn6LcyxIB6TFGBVQLme4jC7QJbbTMIRdYSNVXObU8Wa6xVj0vflVIyyE3u0A+
 nMMXRUcya9+3UsqgW+01aJ9zDTMcZ95upWDd6JNca/fPg1Y0+nK4G5B09sMU+OOJOzHI
 AbALq8SDHRSKv0MZnu3YPKt6ilHmuzaos5aipUKC+fT6qwIjE3TvKjpELIMmq6W+Xn8m
 K1B7/or5cYc5DQ61pLFOA6WtA2TWI+jLeIsCh7mGxn745qmm1pQY1aNKeQ7icHPfrr8f
 HfgQ==
X-Gm-Message-State: APjAAAX10SUjy8wahV2uM7WOjtTlwWX030YMpY4auY6C4iZ6wxbHRpYf
 +dqzVnV9c9fUBEmVrvWspx0Zfbr2
X-Google-Smtp-Source: APXvYqyOY9whSDxCHtu68o4lOB4mYp/seWe2a2/pYUWc4q9WZKOD2N0I+YU/G7/o5ObzXiobBP8Mlw==
X-Received: by 2002:a17:90a:be02:: with SMTP id
 a2mr4547363pjs.94.1567002239389; 
 Wed, 28 Aug 2019 07:23:59 -0700 (PDT)
Received: from beta.it.iitb.ac.in ([2405:204:2200:9180:9ba0:a3d7:637f:11ad])
 by smtp.gmail.com with ESMTPSA id g1sm3180742pgg.27.2019.08.28.07.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 07:23:58 -0700 (PDT)
From: Sukrit Bhatnagar <skrtbhtngr@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 19:53:26 +0530
Message-Id: <20190828142328.24561-1-skrtbhtngr@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-devel] [PATCH v1 0/2] Add live migration support in the
 PVRDMA device
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
Cc: Yuval Shaia <yuval.shaia@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series enables the migration of various GIDs used by the device.    
This is in addition to the successful migration of PCI and MSIX states
as well as various DMA addresses and ring page information.
    
We have a setup having two hosts and two VMs running atop them.    
Migrations are performed over the local network.    

We also have performed various ping-pong tests (ibv_rc_pingpong) in the    
guest(s) after adding GID migration support and this is the current status:    
- ping-pong to localhost succeeds, when performed before starting the    
  migration and after the completion of migration.    
- ping-pong to a peer succeeds, both before and after migration as above,    
  provided that both VMs are running on/migrated to the same host.    
  So, if two VMs were started on two different hosts, and one of them    
  was migrated to the other host, the ping-pong was successful.    
  Similarly, if two VMs are migrated to the same host, then after migration,    
  the ping-pong was successful.    
- ping-pong to a peer on the remote host is not working as of now.    
    
Our next goal is to achieve successful migration with live traffic.    
    
This is the same as the RFC v3 series posted earlier:
https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg04752.html
https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg04753.html
https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg04754.html


Sukrit Bhatnagar (2):
  hw/pvrdma: make DSR mapping idempotent in load_dsr()
  hw/pvrdma: add live migration support

 hw/rdma/vmw/pvrdma_main.c | 94 +++++++++++++++++++++++++++++++++++----
 1 file changed, 86 insertions(+), 8 deletions(-)

-- 
2.21.0


