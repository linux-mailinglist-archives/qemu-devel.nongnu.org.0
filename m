Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC224574FE
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:03:00 +0100 (CET)
Received: from localhost ([::1]:35212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7Hv-0007jq-T3
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:02:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mo7EN-0005LB-43
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:59:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mo7EG-000374-0Z
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637341151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ao9wdx6I6p8gRFWFOrvvGJdtsNfToaF6+klEmdsHy2A=;
 b=J+SXFX/wmFdh+N3GILWlxGpu3j58zzwR7SVD1XM2WD+SEbp1bg468Ut4Ek1TDiU7KJPlLZ
 Tpuf1uWvvthFvOqXGVC3jOpM1wDCXIZl2CgBPy4073fXjtXrXq5Fbnht8Xb5HoZ3ImwHeU
 EMBiBG3MbcPyWZ62jlP+u6sepiVHnbk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-UmBtULndNvWjU9HV0o9Jgg-1; Fri, 19 Nov 2021 11:59:10 -0500
X-MC-Unique: UmBtULndNvWjU9HV0o9Jgg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so4332713wmj.7
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:59:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ao9wdx6I6p8gRFWFOrvvGJdtsNfToaF6+klEmdsHy2A=;
 b=B3OiS3eGQy18NwA18uCI0dxCkDmTIWyz957zBa9xtRPcL9Gm4Fr4AiL7HgO4otowYu
 o6FhdUPejC0oVhuzYcFyqhS9PtSY8OzfIEZ3TfYkVJRtENpCLkAlkg8TYoyvvRAGE9WK
 XG+BrFDtAq6c315So7c4Lltxi5GROqXGbtviBm5TAWwyyK/fWogEiIDxNMWjjpN59ump
 JASEysptNNiYHT/VLiCbY2JjvmnWCmr+lRQp7P/nkiw0jBTNaqAEIlFFnSwjM+Zno6dQ
 1NWDnxSGGflH+NsSAH3GgYEohM7I8uOQSURZMce4n6gsq5hZR6K07AqVs1OIPkUdYHoV
 Q25g==
X-Gm-Message-State: AOAM5301u1kyy+k8c/eCo+tGHycFXm3Q9kDDhP7/O7zKEknMBLZ5z1kd
 F8r4qzLdPT2r3rlNeitUTBasOK22twh6FLJd6YxOOl8yyzo+vrwp5OuryZrJBUrB8sosVJAy1SI
 OzdiqVgPr/QJ+8kqGP1X3HNUwMpq4B8PVr9sEpFI4v+fkheaMSpOzjXY4FqHhoQlatmA=
X-Received: by 2002:a5d:4b0e:: with SMTP id v14mr9410578wrq.196.1637341149019; 
 Fri, 19 Nov 2021 08:59:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNct7971vGv2B8kUSYm+UF7EoC5gLAzyJsJ4ILdkQVtJ1iPUOOCJqv2oapjVZ77m6U2/cyCg==
X-Received: by 2002:a5d:4b0e:: with SMTP id v14mr9410537wrq.196.1637341148740; 
 Fri, 19 Nov 2021 08:59:08 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id q123sm12588655wma.30.2021.11.19.08.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:59:08 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/11] multifd: Fill offset and block for reception
Date: Fri, 19 Nov 2021 17:58:55 +0100
Message-Id: <20211119165903.18813-4-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119165903.18813-1-quintela@redhat.com>
References: <20211119165903.18813-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were using the iov directly, but we will need this info on the
following patch.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/migration/multifd.c b/migration/multifd.c
index 7c9deb1921..e2adcdffa1 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -364,6 +364,8 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
                        offset, block->used_length);
             return -1;
         }
+        p->pages->offset[i] = offset;
+        p->pages->block = block;
         p->pages->iov[i].iov_base = block->host + offset;
         p->pages->iov[i].iov_len = qemu_target_page_size();
     }
-- 
2.33.1


