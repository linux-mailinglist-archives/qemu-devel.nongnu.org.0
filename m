Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F125FD9DF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:06:13 +0200 (CEST)
Received: from localhost ([::1]:58296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oixue-00043o-6a
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixTE-0001dD-KN
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixTC-00047y-2O
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sjo/iqNBcEVXPD4JF40/GIwlrquR/+RWrpMJEkIzz+Q=;
 b=G3HSYXNTsIYXrFd+c7FPcxTkrcIiLZxR8AaDwjk8xPA8nOnE1zDGtLEE+iiTEMDjiiwzIP
 4NAyN+xGn/hlaLMoUOBqRZ57XDS+nuO+x1egSK06wNs0dZ88im6Itoxv+OT5w5vPyrnl/P
 Ye6mdhEKnMk5W3ebLNMydoSEzWyqsDk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-106-9acqcjbjN-2a_zDcFK1H9Q-1; Thu, 13 Oct 2022 08:37:46 -0400
X-MC-Unique: 9acqcjbjN-2a_zDcFK1H9Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 s8-20020a056402520800b0045cab560d5eso1430922edd.1
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sjo/iqNBcEVXPD4JF40/GIwlrquR/+RWrpMJEkIzz+Q=;
 b=iNB8HDYeMcwuHBnherNgt4x+ij45BCJmFf6gcVU/q9/msAA3Jhz/QmOMn5ftRHVuFX
 caaLiK2IfNbSjdvxS5OyrckP6Wp4i7oigIP6fJ5H5bDGGlKxVCjeJ1WBR75saTUO/3UN
 +tUWpE6WyJxl7F/wFjnfxKM0pnyPnZnreC9X0w5pCB5d3e/IfmucijunuwDXoe6Es70i
 Sv95nnAAdqlw1zsG0xg/tnvkAqAn7tAeP9RpXSBLmnSgONQFABW4RA2Cq72owzTAVR5c
 asUwO9mJIzCwTlq1ZJkuYhZPwtzKW8gCc1wtrN1LiomTL5StcKyvTqX8Xq7JbK1qvIuy
 3luw==
X-Gm-Message-State: ACrzQf2qQIbyeGyaL1Y00uheXGR57uw7cF0EedQ1Zz/yxZvYAwJGz95V
 iFG13gqlKolRV997Ipk7epDPOd2KswgS/LOcL0n0OHXHClZ3qm4uhKtN0eAKvtIbd7u7PYuBhK8
 cMFU2wsp6IZrarD+XpcjGjPU0vC+GR3tiKx38LH/1SVdrAWkmb67JdnKu/Fj09fsA1SY=
X-Received: by 2002:a17:906:5a60:b0:78d:b9c2:5bcf with SMTP id
 my32-20020a1709065a6000b0078db9c25bcfmr14400194ejc.602.1665664663587; 
 Thu, 13 Oct 2022 05:37:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM68HuhMophzXqHoKAiQaSCgIExU7vnMJnCUknvvoEcAINH7fMhuQlb/MMxM3+6PN8eUbP5WuA==
X-Received: by 2002:a17:906:5a60:b0:78d:b9c2:5bcf with SMTP id
 my32-20020a1709065a6000b0078db9c25bcfmr14400171ejc.602.1665664663265; 
 Thu, 13 Oct 2022 05:37:43 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 kx20-20020a170907775400b00781be3e7badsm2955077ejc.53.2022.10.13.05.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:37:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 10/24] blkdebug: add missing coroutine_fn annotation for
 indirect-called functions
Date: Thu, 13 Oct 2022 14:36:57 +0200
Message-Id: <20221013123711.620631-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013123711.620631-1-pbonzini@redhat.com>
References: <20221013123711.620631-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/blkdebug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index bbf2948703..b159a9b825 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -672,7 +672,7 @@ blkdebug_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
     return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
 }
 
-static int blkdebug_co_flush(BlockDriverState *bs)
+static int coroutine_fn blkdebug_co_flush(BlockDriverState *bs)
 {
     int err = rule_check(bs, 0, 0, BLKDEBUG_IO_TYPE_FLUSH);
 
-- 
2.37.3


