Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B185FCA9D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 20:26:50 +0200 (CEST)
Received: from localhost ([::1]:44738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oigRN-0000JM-Ln
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 14:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oigMG-0001wK-Ec
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:21:32 -0400
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43]:46910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oigME-0001vs-TB
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:21:32 -0400
Received: by mail-qv1-xf43.google.com with SMTP id o67so10974112qvo.13
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 11:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AceOVYAZvjJjLb8exqkdX1wLYvKvrZtVmuEiCslseZI=;
 b=aSA+pkgnYx0hMefqJq4DRwXxtfVp6jEEIMdRvTUIIIcOQgwtNm05qVnGy47UEhz9H0
 PtSBBz0M5uAszKR7TMpetKyOM8jEpIoS5t+v4PJRTshSx2YPDtI7u9FXCarJVo78mHeB
 vKYX7Lvdtp4SGfhBibmwD3Okge2sTfuBkwVD+u/UVoohu8QhiVgUACsoSbXGVWIxBZMe
 jSLIlEOjOlfe4tif1YowqL0r0XFV2swJBYN+h9+w7Mu1QRm5D0FvLkgx8gZajVIgCcHk
 iFIJ+ISudJZ1ERfD+Ap9JePwnkdXkh9wK6MKbp7Dw53UVFLUo//2Vj+zCbz1o+PBzU6Z
 /JNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AceOVYAZvjJjLb8exqkdX1wLYvKvrZtVmuEiCslseZI=;
 b=mTOBhEHOe0ru6X7uL9XKgt9e9I7SAj3hwdIyAYAIPp5VGTw4X2LveySSjjxVtdGhZV
 wVAvzp2bpfW/WtgEOpExADMdZiH3XUxj+RqLPLjNf+isrqSVIE5uH+KWPssb0EwxEFUv
 qfu7qOng4u69PcdVJMGkUwDGRIRyYYsMGua0Occ/UTQGsMNQGu1YAnd3Vn4qkeA5PEqB
 qkfOMatFhOhExqse1pHpJOStritSUEbL73kzZgLDSnhXVm4KAg/4XaJZmJ5efYFosUZ7
 2y78Ttii+I3o/HzCcJI/dYRfAK6k2Zv7IHqnb7zT7EasoEYrFYB2npMTlvTakwEXBwfX
 RBfw==
X-Gm-Message-State: ACrzQf3SEr1/feWhThczgIiRjdsBpHNTudoIt5IXbpBIA1ukAfRMNtK1
 UbXJTE8SW7RkpwE7M6uzKQ==
X-Google-Smtp-Source: AMsMyM68odWX1hmyB/gzZd0DHqyh1kSaA+x32AALjeiL/j05aQaK8OJLEIkD10wU4/i564D1glemkQ==
X-Received: by 2002:a05:6214:29ee:b0:4b1:c1d2:6635 with SMTP id
 jv14-20020a05621429ee00b004b1c1d26635mr24559769qvb.82.1665598889861; 
 Wed, 12 Oct 2022 11:21:29 -0700 (PDT)
Received: from fedora.mshome.net (pool-173-79-56-208.washdc.fios.verizon.net.
 [173.79.56.208]) by smtp.gmail.com with ESMTPSA id
 bq40-20020a05620a46a800b006ee9d734479sm920228qkb.33.2022.10.12.11.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 11:21:29 -0700 (PDT)
From: Gregory Price <gourry.memverge@gmail.com>
X-Google-Original-From: Gregory Price <gregory.price@memverge.com>
To: jonathan.cameron@huawei.com
Cc: qemu-devel@nongnu.org, linux-cxl@vger.kernel.org,
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com,
 bwidawsk@kernel.org, gregory.price@memverge.com, mst@redhat.com,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com
Subject: Re: [PATCH v7 4/5] hw/mem/cxl-type3: Add CXL CDAT Data Object Exchange
Date: Wed, 12 Oct 2022 14:21:15 -0400
Message-Id: <20221012182120.174142-1-gregory.price@memverge.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007152156.24883-5-Jonathan.Cameron@huawei.com>
References: <20221007152156.24883-5-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f43;
 envelope-from=gourry.memverge@gmail.com; helo=mail-qv1-xf43.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Included in this response is a recommended patch set on top of this
patch that resolves a number of issues, including style and a heap
corruption bug.

The purpose of this patch set is to refactor the CDAT initialization
code to support future patch sets that will introduce multi-region
support in CXL Type3 devices.

1) Checkpatch errors in the immediately prior patch
2) Flatting of code in cdat initialization
3) Changes in allocation and error checking for cleanliness
4) Change in the allocation/free strategy of CDAT sub-tables to simplify
   multi-region allocation in the future.  Also resolves a heap
   corruption bug
5) Refactor of CDAT initialization code into a function that initializes
   sub-tables per memory-region.

Gregory Price (5):
  hw/mem/cxl_type3: fix checkpatch errors
  hw/mem/cxl_type3: Pull validation checks ahead of functional code
  hw/mem/cxl_type3: CDAT pre-allocate and check resources prior to work
  hw/mem/cxl_type3: Change the CDAT allocation/free strategy
  hw/mem/cxl_type3: Refactor CDAT sub-table entry initialization into a
    function

 hw/mem/cxl_type3.c | 240 +++++++++++++++++++++++----------------------
 1 file changed, 122 insertions(+), 118 deletions(-)

-- 
2.37.3


