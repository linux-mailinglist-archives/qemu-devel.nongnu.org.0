Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1E2536619
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:42:47 +0200 (CEST)
Received: from localhost ([::1]:60992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nud2y-0004tQ-Pz
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1nucgr-0005cC-8q
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:19:54 -0400
Received: from esa15.hc2706-39.iphmx.com ([216.71.140.200]:58517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1nucgo-0000sU-9S
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:19:51 -0400
X-IronPort-RemoteIP: 209.85.219.71
X-IronPort-MID: 199688801
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ay1UI6kNm5mgYjphv+Zuir3o5gwKJERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaDGiDa//YYTTye9h/YdmwpxtTvMfcmoNjQFE+qCtkEy4T+ZvOCOrCEkqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlnS4
 YiaT/D3YzdJ5RYlagr41Ire8HuDjNyq0N/PlgVjDRzjlAa2e0g9VfrzF4noR5fLatA88tqBe
 gr25OrRElU1XvsaIojNfr7TKiXmS1NJVOSEoiM+t6OK23CuqsGuu0qS2TV1hUp/0l20c95NJ
 NplsqPoST84AYv3lrpDblp7Gi5zIOp0weqSSZS/mZT7I0zudnLtx7B3EhhzM9JBvOlwBm5K+
 LoTLzVlghKr3brnhuLmDLM114J8daEHP6tG0p1k5TjdHfAqW7jJXuPH6cIwMDIY35EfQ6aON
 5JAAdZpRCb8PDZSOkwtMZRgm8eXtnDBXCRijmvA8MLb5ECWlmSdyoPFKdfQZ5mGSNtYmm6eo
 WTJ+Xm/BQsVXOFz0hKA+3Oow/bRxGb1B9tUG7q/+fpnxlaUwwT/FSEraLdymtHh4mbWZj6VA
 xB8FvYGxUTqyHGWcw==
IronPort-HdrOrdr: A9a23:mZxhIakibsoviFtVFnunYaGo5zLpDfLK3DAbv31ZSRFFG/FwyP
 re+8jzhCWE7Ar5BktQ/OxoWJPwOk80lKQFkbX5WI3SJniahILGFvAR0WKJ+Vzd8kHFh5JgPN
 5bAuFD4b7LfClHZKTBkXaF+r8bqbHtkNHQuQrH9QYUcekBA5sQpzuRYjzrdHGeLzM2e6bReq
 Dslfauv1GbF0j+m6+AaUXtnNKvmzQIrvjbiNI9dn0aAAXnt0Lc1Fb2eyLoqCv3WVt0sMMfGW
 esqX2P2kxriZ3LqCPh6w==
Received: from mail-qv1-f71.google.com ([209.85.219.71])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 May 2022 12:19:45 -0400
Received: by mail-qv1-f71.google.com with SMTP id
 o99-20020a0c906c000000b00456332167ffso3855344qvo.13
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YqUTDRL5AON7SM5TpHkl2Z86TqFlmHGnJiZXtBYFGsg=;
 b=nfzRVvEbx9SNxc70neNwtv3U1XrR++jH9mrNoHSc0GLVIidRQIw7hediqXXyMEp5CP
 BtZaAdxyODsdbW7TzHpQDJvFP1QfAaSIrwoZARsfKCw3oRDBK6nbzu2D0aCCnSPgQK6c
 +w0xBVyogk3ZXAYvrWVxGP1cRWUvYX1VGfsJQH1Q3G82GRTtWY4h5LRvnG74v35uKLJV
 EoPn+j4EhmHjSzD6MGhZ/7soZIyvu2Gf4mMJImGbtXIUxWRf30PxtBNgHLV/JwDnbi6F
 zby5TkaRW5txUEHIrBCYna2r6bcM4ABv+66WRIJmsvkxNQhUSUQqstatfott7qO7nZS2
 LtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YqUTDRL5AON7SM5TpHkl2Z86TqFlmHGnJiZXtBYFGsg=;
 b=jmXIrClCKPbvtHR8XOh6h4KlaSJLsJG5WLbSn3LW5Bmq7PnOesgNqcWi7u/Hvb6bOX
 8SLorGe23AXv5cST46KEXoN/jbiRJ34u93P7Hc/7VnLzGt13NZI2XxSJs54+XfJLPIAy
 qMaF7s62N/rvdJrlIKq5MzbhZdbUb5UEGgHcmvyiybo3m71jyZ0TeYYYpxMCPYITD3L0
 Sj0pMyQJIni26V6DT2RxfFUib4YHKE0gHn7sLC/8Hm9P8TdKQF6mqbxsA69yvbfRsqS7
 hGERHsy4TF8lsqgfScggAHBFdI+SZgczeaJFNQ3gf2gOdGMYMybufgqpO8HW6g6HOk5f
 lZtg==
X-Gm-Message-State: AOAM5324k9n4BuQZ81wAO6qPpmvFMuslcmBpjI9MOy3yATzevWDBIgHw
 F3mqG9SLHVlzPnh2OEUysTu/nut7FIBGKD633g3f1dsbUZWb1i0IJfI0fRLLJSR9b0xk3G46gOW
 Wx0S5TNp4rCkbvRMEpiYD5RsqMKElAA==
X-Received: by 2002:ac8:5982:0:b0:2f3:b838:cdda with SMTP id
 e2-20020ac85982000000b002f3b838cddamr34350245qte.119.1653668384311; 
 Fri, 27 May 2022 09:19:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHPKPw8LG/wFUeFJ2oG7jaW309bM2XnfAafu28dswwiWtryr6jKRSPH8yJo+Tv28Q764oGZQ==
X-Received: by 2002:ac8:5982:0:b0:2f3:b838:cdda with SMTP id
 e2-20020ac85982000000b002f3b838cddamr34350217qte.119.1653668384085; 
 Fri, 27 May 2022 09:19:44 -0700 (PDT)
Received: from stormtrooper.vrmnet (pool-72-70-35-75.bstnma.fios.verizon.net.
 [72.70.35.75]) by smtp.gmail.com with ESMTPSA id
 x190-20020a3763c7000000b006a33c895d25sm2993777qkb.21.2022.05.27.09.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:19:43 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2 0/3] Fix dma-reentrancy issues
Date: Fri, 27 May 2022 12:19:34 -0400
Message-Id: <20220527161937.328754-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.200; envelope-from=alxndr@bu.edu;
 helo=esa15.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A shot at fixing dma-reentrancy issues.

Patch 1 adds a flag to track device IO activity to DeviceState.
Patch 2 Checks/sets the flag prior to invoking MemoryRegion handlers to
prevent the mmio->dma->mmio case
Patch 3 Sets the flag in dma-related calls to prevent the bh->dma->mmio
case

The related issues are tracked here: https://gitlab.com/qemu-project/qemu/-/issues/556
There is also a related whitepaper: https://qiuhao.org/Matryoshka_Trap.pdf

Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Li Qiang <liq3ea@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Bandan Das <bsd@redhat.com>
Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Cc: Darren Kenny <darren.kenny@oracle.com>
Cc: Bin Meng <bin.meng@windriver.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>

Alexander Bulekov (3):
  memory: Track whether a Device is engaged in IO
  memory: fix PIO/MMIO-initiated dma-reentracy issues
  memory: fix bh-initiated dma-reentracy issues

 include/hw/pci/pci.h   | 13 +++++++++++--
 include/hw/qdev-core.h |  3 +++
 softmmu/dma-helpers.c  | 12 ++++++++++++
 softmmu/memory.c       | 15 +++++++++++++++
 softmmu/trace-events   |  1 +
 5 files changed, 42 insertions(+), 2 deletions(-)

-- 
2.33.0


