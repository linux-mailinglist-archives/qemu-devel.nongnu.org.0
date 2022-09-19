Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891AA5BD424
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 19:53:07 +0200 (CEST)
Received: from localhost ([::1]:60774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaKx8-0005w9-Kc
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 13:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfp-0002yj-Nd
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfo-000352-8k
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/a8Z/fd6v4qVrfdXABaUXuskf6QxOskpZwRQIxIWPYQ=;
 b=cQmyW7RDs+WViYDDP1eyKYJLsnxLkdtd53LwX1EyP//FeubVU2cVGMoqUsIvPb8YXh+sWI
 6xXzwt1NQI70AkU8XU30y86Z5TYdjdPFUXfDvrYi5JEvxNiOjQiitXGro/OWfLmhBgXXwj
 j61ingdLPlz80XarVB5rfA0tQfljzqY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-154-HM-ai2ppNKeGJd0y7CDncw-1; Mon, 19 Sep 2022 13:35:09 -0400
X-MC-Unique: HM-ai2ppNKeGJd0y7CDncw-1
Received: by mail-wr1-f72.google.com with SMTP id
 e18-20020adfa452000000b00228a420c389so34872wra.16
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/a8Z/fd6v4qVrfdXABaUXuskf6QxOskpZwRQIxIWPYQ=;
 b=WSOfyyAeCCjMjzJO69SJS2LMJuRke1sGKnwGGqxQnKsRtdIuJkjP4TBpZwgPqghA5G
 jApI+8yBsw5Ss9eaI4iNalfT35pJRW784PMPT6qFZg4TKpRJsZcx/5VJXjyUtQ4iZ7n5
 IPGkgdHclyWU8wX0VbGoTJv0fCEmM2BQd0xOlisvryj1OSI1kAJ3k19TRpQxgLYu5MNx
 h+VFwcHpaVY0eQE/QBO1w/bkvqpJVRiVIKjic/mRmPd6C/Evtu0TfvlJm4zdnVPiN/hJ
 +jtgHkMFVQRoE5R641Na1IW8ay7Ct+Aq4BTie/aUXY7uQUCrxkVI9GorvwGr8xmC+/lr
 X9eQ==
X-Gm-Message-State: ACrzQf1yMj0kurHiDSZfhNVfp8+YlTj01280qSKtdrKbxnYUG+xTn/jM
 KK5ovwPgAcyAKCkDVxnHA6iCD1mvvWELar+5XrMXV29zjVkN4fr7zfXhuxFpgDu1RhMFPlT0WNe
 HdcaHGhgKT1jQZN+h2X+iQd7uyz8fs8DjfLDkHMN3uKwYct9tSZVvqDjdzXaS9GPTQdQ=
X-Received: by 2002:a5d:6d03:0:b0:22a:4509:2143 with SMTP id
 e3-20020a5d6d03000000b0022a45092143mr11297641wrq.185.1663608907765; 
 Mon, 19 Sep 2022 10:35:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4g9qY4exKaNaXQHCLS0TJT55z7WHXXTxBmsJmv047hvRun/t8AQF59SSVlRP8Gz7X7B6qN4w==
X-Received: by 2002:a5d:6d03:0:b0:22a:4509:2143 with SMTP id
 e3-20020a5d6d03000000b0022a45092143mr11297624wrq.185.1663608907350; 
 Mon, 19 Sep 2022 10:35:07 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 a5-20020adffb85000000b0022a2f4fa042sm14304760wrr.103.2022.09.19.10.35.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:35:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/21] tests: test-qga: close socket on failure to connect
Date: Mon, 19 Sep 2022 19:34:37 +0200
Message-Id: <20220919173449.5864-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919173449.5864-1-pbonzini@redhat.com>
References: <20220919173449.5864-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Reported by Coverity as CID 1432543.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-qga.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index a05a4628ed..d27ff94d13 100644
--- a/tests/unit/test-qga.c
+++ b/tests/unit/test-qga.c
@@ -32,6 +32,7 @@ static int connect_qga(char *path)
             g_usleep(G_USEC_PER_SEC);
         }
         if (i++ == 10) {
+            close(s);
             return -1;
         }
     } while (ret == -1);
-- 
2.37.2


