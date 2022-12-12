Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE5564A0D7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:31:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iga-0006XH-PN; Mon, 12 Dec 2022 08:17:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4igD-0006UV-T7
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:17:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4igB-0004HS-Dw
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:17:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670851029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3T7NE5ADzP+LXMbObkmVqPbSzEVuJYphIL0eUSwJbzg=;
 b=cF9wbTMgzno/zRPuWVa/M3WrPwKkBQVaBSE0VfLb11J8M3d3+rglsEytqhu6f6Le35JZVa
 3VmQpjJUjt2SD2yoGIrvAUqn+2mQtGwNduqNSj2e7A86c6uk90+3/F+jZ1OJGjB1ARLWul
 szFecngdzEBUUuEo3zI1Xzfp06RaTU8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-470-bL307gYJPHKse-Q16VVJaA-1; Mon, 12 Dec 2022 08:17:08 -0500
X-MC-Unique: bL307gYJPHKse-Q16VVJaA-1
Received: by mail-wr1-f70.google.com with SMTP id
 i25-20020adfaad9000000b002426945fa63so2224528wrc.6
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 05:17:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3T7NE5ADzP+LXMbObkmVqPbSzEVuJYphIL0eUSwJbzg=;
 b=LioAjxwLmSP6OsNrTAGPvYAMCuLAGBjNoZcrcun9UByd0psfn4lAzcDL4DMDan5le7
 aM5FltcdVdrwCZ4Uo4Uyy5tMV9JGUr2SKKWnEHJweqpvbBp8ED+5yVXNry977zhdtlGN
 xggF0T50UEhWj7ZqxOufARhE/6RqRYPX35Vd31xQEEIKpUeDDXGTv2O8MxhVy8ipwiRD
 ZNLBOXD1QHdgeu73o31x0GIBE1VVDKQbpZU/4B8NKo+SAyXDQZ16qGKjW6xV+8Yj21ee
 1LSh+WVZqWNyelLtxoftMYXpDG66EHyRW/5LOC6DZ7/lp8Ot2Z+kTSGwyW9oXLicvAJ0
 UP8w==
X-Gm-Message-State: ANoB5pnD0TfjXJ5/K1IeRI8QYRhBWrSsBtO6dVNtCjborhc7/xX8Nsdr
 9/6XDk1KtNk010RCVItcFOZ1+rCnHf3jU2Uz8c0uacQ5S/p5mcdtKb41HErfTTqgUdlP3X9qebf
 EH+EVtCvqgvpiazFDsNfOJwCoi9c9tE/ARrP1uH7XPesqJGJtTt79JzjCsRENXhRKcis=
X-Received: by 2002:a05:600c:1da2:b0:3cf:5fd2:87a0 with SMTP id
 p34-20020a05600c1da200b003cf5fd287a0mr11810564wms.40.1670851027034; 
 Mon, 12 Dec 2022 05:17:07 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5git3X/ODv2ldp0fRwdTl22XV3ys/zQafA0iy02Baklyv00abl9SLv7rBNA/ohM+d62qCB2g==
X-Received: by 2002:a05:600c:1da2:b0:3cf:5fd2:87a0 with SMTP id
 p34-20020a05600c1da200b003cf5fd287a0mr11810541wms.40.1670851026692; 
 Mon, 12 Dec 2022 05:17:06 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a1c5402000000b003c6c182bef9sm11254563wmb.36.2022.12.12.05.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 05:17:06 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	kwolf@redhat.com
Subject: [PATCH 1/3] block: apply assertion more widely
Date: Mon, 12 Dec 2022 14:16:58 +0100
Message-Id: <20221212131700.250209-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212131700.250209-1-pbonzini@redhat.com>
References: <20221212131700.250209-1-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

.bdrv_needs_filename is only set for drivers that also set bdrv_file_open,
i.e. protocol drivers.

So we can make the assertion always, it will always pass for those drivers
that use bdrv_open.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 676bbe0529b0..0a625a489a6e 100644
--- a/block.c
+++ b/block.c
@@ -1617,8 +1617,8 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
     bs->drv = drv;
     bs->opaque = g_malloc0(drv->instance_size);
 
+    assert(!drv->bdrv_needs_filename || bs->filename[0]);
     if (drv->bdrv_file_open) {
-        assert(!drv->bdrv_needs_filename || bs->filename[0]);
         ret = drv->bdrv_file_open(bs, options, open_flags, &local_err);
     } else if (drv->bdrv_open) {
         ret = drv->bdrv_open(bs, options, open_flags, &local_err);
-- 
2.38.1


