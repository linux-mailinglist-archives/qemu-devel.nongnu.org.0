Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5F053E54E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:09:15 +0200 (CEST)
Received: from localhost ([::1]:59246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyELz-0004cR-1c
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrO-0002bs-Vi
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrN-0000eo-Ea
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWlOYBYTglOdWdujOMoqYHm7d3tqistQmPU+kUemLe8=;
 b=iSsxIMOwIiQP1PhTvu+Iony+NGnzhgsrztfLUq0ndRUBJ6WIXKMunnjK86WEaOqSn9nWAz
 z4PIWqb0caAolvnWJrrL8w42r+heGWx8eO69zBg5+t6ZQXW1bW3cMBxyjaWfcqeNyQUsoA
 IBQ6N8ok97FvPxabvQ6olBMQZtKP1/k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-18chfRuUNReQW2360J1bKQ-1; Mon, 06 Jun 2022 10:37:35 -0400
X-MC-Unique: 18chfRuUNReQW2360J1bKQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg40-20020a05600c3ca800b00394779649b1so11305258wmb.3
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VWlOYBYTglOdWdujOMoqYHm7d3tqistQmPU+kUemLe8=;
 b=1MU1W0L7qYHzVIso+bxzQYymz2Dj2URv9E0NXKoedgpY+RCot2ELfv0SRZ6Mz2X+Zs
 rnzt6YJK1g2UTJMhq4IuUfyxXuLb4i/09pOaODlSr4HPAYiSv8W/CUJvtkazcfxLP6go
 CPexnbp0GPMa2qFVhkkE8O2IteOq6vJmnvgd+2gGSNfgNQnD2Ki+qV5G6IHTqges3AYA
 gplVJ9YCRI1uDzRVhqMR/5g/g891Crz6z85Ru5ARQiNmwP/H31yHE9rnoubLe7fmh1Ej
 TfzKWUNsjBldFY64659thHrG6kJW4SGiP8ECUs6KHOM4OXWu00/MUyKMNn5DnULYWGnV
 iNKQ==
X-Gm-Message-State: AOAM5327NVJIF7qes4+85Gil7S9dB7HeVe5upYFzyTWOQEk4bwWitNUU
 AyWgtvT4QYHnWVhc09vnpmaGAUbf+ks+OhqSFx7ur4MirhEPyiYlVk0wCuC5cfW4Ww9G5AyRWCb
 CMwJoibsYrHR5+HULgPD+jKMKGWUVsFEkjFTuW9+D8Qm+cesjKTz/2fn25BzOkZB/Wx0=
X-Received: by 2002:adf:fa03:0:b0:210:dcda:ee82 with SMTP id
 m3-20020adffa03000000b00210dcdaee82mr21906142wrr.139.1654526254481; 
 Mon, 06 Jun 2022 07:37:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnLp4HiDdNFNpD9WuBRnwpkFw9npWJkKDjjRPa+fsyX3MJzbSamonjGUASRqwfEFSITHu+4g==
X-Received: by 2002:adf:fa03:0:b0:210:dcda:ee82 with SMTP id
 m3-20020adffa03000000b00210dcdaee82mr21906115wrr.139.1654526254167; 
 Mon, 06 Jun 2022 07:37:34 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 bv18-20020a0560001f1200b002183cedbf34sm3176705wrb.73.2022.06.06.07.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>
Subject: [PULL 25/29] tests: add python3-venv to debian10.docker
Date: Mon,  6 Jun 2022 16:36:40 +0200
Message-Id: <20220606143644.1151112-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: John Snow <jsnow@redhat.com>

This is needed to be able to add a venv-building step to 'make check';
the clang-user job in particular needs this to be able to run
check-unit.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220526000921.1581503-9-jsnow@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/dockerfiles/debian10.docker | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index b414af1b9f..03be923066 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -34,4 +34,5 @@ RUN apt update && \
         python3 \
         python3-sphinx \
         python3-sphinx-rtd-theme \
+        python3-venv \
         $(apt-get -s build-dep --arch-only qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
-- 
2.36.1



