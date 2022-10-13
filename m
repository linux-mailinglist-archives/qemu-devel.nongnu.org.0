Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D985FD9AF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 14:57:45 +0200 (CEST)
Received: from localhost ([::1]:33720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oixmS-0004DE-GD
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 08:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixSs-0001Tg-Aq
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixSo-00040M-VV
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nvPbeyR3iC5ZpngBtqEB9ftpVEgqxKy5BhkU02l0abI=;
 b=Uqy/wrCLsTZrh7FJkJY2sSG06tLV/EJ6Fa6sW7vek9Ougjsxlf89JKisKy3UfAuDVbMuwH
 ZJRjcUu6xtrddf249epDdwZ+MdMmlmfLcC68Y2586lq+ZKiFE/XSlck3GfF20VngRDA6ob
 2GP2JwvftZDX8B8x7K8jefqZhDD05vM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-96-IUsnCF-TPXuHuU2YIRSahQ-1; Thu, 13 Oct 2022 08:37:19 -0400
X-MC-Unique: IUsnCF-TPXuHuU2YIRSahQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 y6-20020a056402358600b0045932521633so1415825edc.17
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nvPbeyR3iC5ZpngBtqEB9ftpVEgqxKy5BhkU02l0abI=;
 b=NmIvK21r7gN0fUKkQijyQ7PaYANI0Mi0MjTP1uvmteylhzWD0SAV+cFA4E3sLN/apR
 Onk+U+zinQ4E+q4qYhHVgPBSZr/YyI13ftDqqLoL9bi/t38kkviBnMeey4PTJQEfu03s
 XokzPUlpQi2b0ge4Lhs4Lz0jakGbvWxAfIdte4PpFZ1OKu4XB7bJUN7imKioaH7NJjPv
 YERKHWlxZuUvyjJBMSAnABVEknhHfePh5aFiuO7bZc/dh5ZBxoXz/Y4y19iaEpo4wL7t
 qTQLCgpnHyGGPGRDnpyilRKvNRwvjncQgxHyQhwNJmepB2o2EKYp+V9ET7JY7Kh715Zl
 +Vlg==
X-Gm-Message-State: ACrzQf2/HoGV5JaBiHDsPn6F01Ee7k8hqt78pTJiGS/Gwz9n1h7jMNQh
 mgSxY9ANSWwwQ3YDEx6VM73VMatf0+4L1EClpvvfKKAKeOVNU/MbP7MOKaWRAp4JqnTVizm0baB
 TEW0WSiXIhRYm+5Pv1hgflv032DfvRb11YdMLfP8cigRxxUXkNz2ybbO9ipkHWnM3MjU=
X-Received: by 2002:aa7:c144:0:b0:459:f897:793e with SMTP id
 r4-20020aa7c144000000b00459f897793emr32145158edp.8.1665664637423; 
 Thu, 13 Oct 2022 05:37:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7/FwaBrabrjGHsBugl8llV0etFYA+JNOkVHbFEwX/XYPEn4ebz2/gUkPdXxrAqlUHrEzSx2A==
X-Received: by 2002:aa7:c144:0:b0:459:f897:793e with SMTP id
 r4-20020aa7c144000000b00459f897793emr32145134edp.8.1665664637227; 
 Thu, 13 Oct 2022 05:37:17 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 k20-20020a17090632d400b00772061034dbsm2939260ejk.182.2022.10.13.05.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:37:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 01/24] backup: remove incorrect coroutine_fn annotation
Date: Thu, 13 Oct 2022 14:36:48 +0200
Message-Id: <20221013123711.620631-2-pbonzini@redhat.com>
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

From: Alberto Faria <afaria@redhat.com>

The .set_speed callback is not called from coroutine.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/backup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/backup.c b/block/backup.c
index b2b649e305..6a9ad97a53 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -309,7 +309,7 @@ static void coroutine_fn backup_pause(Job *job)
     }
 }
 
-static void coroutine_fn backup_set_speed(BlockJob *job, int64_t speed)
+static void backup_set_speed(BlockJob *job, int64_t speed)
 {
     BackupBlockJob *s = container_of(job, BackupBlockJob, common);
 
-- 
2.37.3


