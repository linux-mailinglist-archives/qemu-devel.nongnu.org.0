Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090296DAFBB
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 17:34:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pko5X-0007e7-H2; Fri, 07 Apr 2023 11:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pko5U-0007cd-GB
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:33:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pko5T-0003bR-3E
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:33:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680881594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xdBI/pFdJ1vkZw1lAkV8/V3VCAkQCpljxYC4IS2P4yc=;
 b=PfFSC1NtVdBWUJ/lTogD/6U244gLS5qAnD6J/0Hchq5gN8ckecaLZ63qjIK3qqJXDxcXW8
 XwpJh/k8OUI6kKsx3ow97WN9aWxlE8Ta6N6KM3+SZ4AUtrVr32RCzZkFf0taTtLFbT3K/j
 gJnf3jLKwC9I+RcJOGKpVEF27WZOduU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-a0uS7LdQNy-FAqdL8a8UfA-1; Fri, 07 Apr 2023 11:33:13 -0400
X-MC-Unique: a0uS7LdQNy-FAqdL8a8UfA-1
Received: by mail-wm1-f69.google.com with SMTP id
 p10-20020a05600c358a00b003edf7d484d4so19881974wmq.0
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 08:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680881592; x=1683473592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xdBI/pFdJ1vkZw1lAkV8/V3VCAkQCpljxYC4IS2P4yc=;
 b=Yb2RfqjgO3WQAHE5aDpRr0xEHNRlXst+lb3DrLEufCfS6anhNTpjLRe62MPwUj+jDM
 i4vWcJTGR0/6EQZUhlNIBriAWNBx/PTLUM3W2pjTr91lcNoqzuRazAVzbisoauA4S5Kt
 6sCNrFgoUgn30tko/Gj9LJgAL5MBvME+YxxwkN7J2ekmdPe4yx38arAm3Ul+ZOa38Agc
 qAwayLrtqoCrmLXaGK7AzrQChwys6+10jwdcA1J3ftWQngt9SkRgEVqRaCaOSsqWLehy
 UTlnsVL7TuVT7C4hr+6cf8LT8R/ewZuP21vxzO14DoGyndNOEeYlVYZrSnUFseSWo4LE
 6lKQ==
X-Gm-Message-State: AAQBX9cDOGUaTNN+ti8fTMcZHgmuT52x7RZ2n7TG+ZX6uH81NYkIrzql
 vST0X3sMU+lNOAJGjSokKRAEgTozHyEwPCnNp1N4Z2JR3gtoSNyCkI9DhpiTHu8yAQ+g4RkPCnF
 ZH5juT+O7s5y6MEn9NAVRPq1mHuo9I80F9O6boP8vbvHjqbAVhVmWMgYEwISLjoXpRvxRHANL5Z
 E=
X-Received: by 2002:a05:600c:2294:b0:3f0:7f7f:c886 with SMTP id
 20-20020a05600c229400b003f07f7fc886mr120999wmf.35.1680881592030; 
 Fri, 07 Apr 2023 08:33:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y5xj/V1fSWzfQa1LO01JIweN/wzlJ77CJptjR4r7dytAaiX+3becfOfkrvK1iTE9inDWw3ZQ==
X-Received: by 2002:a05:600c:2294:b0:3f0:7f7f:c886 with SMTP id
 20-20020a05600c229400b003f07f7fc886mr120982wmf.35.1680881591713; 
 Fri, 07 Apr 2023 08:33:11 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 a6-20020adfdd06000000b002da76acfee1sm4793332wrm.28.2023.04.07.08.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 08:33:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, kwolf@redhat.com, qemu-block@nongnu.org,
 hreitz@redhat.com
Subject: [PATCH 3/8] block: refresh bs->total_sectors on reopen
Date: Fri,  7 Apr 2023 17:32:58 +0200
Message-Id: <20230407153303.391121-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230407153303.391121-1-pbonzini@redhat.com>
References: <20230407153303.391121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

After reopening a BlockDriverState, it's possible that the size of the
underlying file has changed.  This for example is covered by test 171.

Right now, this is handled by the raw driver's has_variable_length = true
setting.  Since this will be removed by the next patch, handle it on
reopen instead, together with the existing bdrv_refresh_limits.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block.c b/block.c
index b1b7c7efe036..9de50ac7c811 100644
--- a/block.c
+++ b/block.c
@@ -4918,6 +4918,7 @@ static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
     qdict_del(bs->options, "backing");
 
     bdrv_refresh_limits(bs, NULL, NULL);
+    bdrv_refresh_total_sectors(bs, bs->total_sectors);
 }
 
 /*
-- 
2.39.2


