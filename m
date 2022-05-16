Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF34528255
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 12:41:01 +0200 (CEST)
Received: from localhost ([::1]:41484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqY9r-0000Uf-4p
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 06:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY53-0005sJ-Tg
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY52-00053Y-9i
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQDv0kApVPCSffkCQxJdN5N32u+HR3YvehkbkpwI4WI=;
 b=YYCinREM2ZCBSOdUt6DsVfAgusAkfHkmzdAQkXd49ThCZrgQFPyrw3E5GQCyNUnPwC7h7g
 ixGDscagqfnbYC6hTjhWPPm6wly4CxqfDJxBjEJnjbLgP/GkNwp7Pch5APWF3Jf2tlUJn+
 hAEUEzqg+RuhkIPPKMISSD7gOZqO7go=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-UM2f8cq9OSqaVDoaPa-ffA-1; Mon, 16 May 2022 06:35:57 -0400
X-MC-Unique: UM2f8cq9OSqaVDoaPa-ffA-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so6564961wmr.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CQDv0kApVPCSffkCQxJdN5N32u+HR3YvehkbkpwI4WI=;
 b=MFCK426kssyIuprj4+mBsdb9fzIXJycHdAl+Ne7RLhGDoJZugeeWf62SSUUDlOaywo
 dAyTgb5Osjyr5+nrervsBlw5d9/yvuwX3IdBRc6Whxohg++SrPqnC7pqZafT++Eik7xF
 +sC4E32UkWhakmzMDeSPtey89pumUIW/hFt/8dwaWiJv9S/YOgGInx77cViPqjPuj3lL
 Snt6cSjuP5DeNny0clLlKPSs1fxkWMGKZdHeRUsl2VQJzByjfPJB2g7tSAcm9OI6J8lO
 oVbBvkpKcMuRma3jAQlg80Tv8jkAiM0XfkHz17YDWqiiMvKw3VJm47YxlAPGrZ8yhU5c
 6/OQ==
X-Gm-Message-State: AOAM533wsXgB1JbS0hNh1YgDPoqbhvHEwkv5ou0Ec0CaKrhW4M3txO2E
 iePJLf31Okp3knOH1QtEuBn167uKr50cryO+duYr6QYGzezdrtH9t4jKJY+BT5uK9jSAWiVJQ0J
 shmTxYynhSwPfYO6pgfwufMtyuwdPjvSF2hfnQuHDF4MRL/Q6XuEH4svL3cMB
X-Received: by 2002:a05:600c:2e12:b0:395:b6ae:f551 with SMTP id
 o18-20020a05600c2e1200b00395b6aef551mr16113937wmf.36.1652697356008; 
 Mon, 16 May 2022 03:35:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSqS4Md4I9jnwDTsEFBCn8F0n58Ab48IBNJbqdsglI2j6PhhTy+GBYelLUljH16I6oswbkpA==
X-Received: by 2002:a05:600c:2e12:b0:395:b6ae:f551 with SMTP id
 o18-20020a05600c2e1200b00395b6aef551mr16113914wmf.36.1652697355808; 
 Mon, 16 May 2022 03:35:55 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 k20-20020adfb354000000b0020d110bc39esm521772wrd.64.2022.05.16.03.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:35:55 -0700 (PDT)
Date: Mon, 16 May 2022 06:35:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 05/91] MAINTAINERS: Add entry for Compute Express Link Emulation
Message-ID: <20220516095448.507876-6-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Jonathan Cameron <jonathan.cameron@huawei.com>

The CXL emulation will be jointly maintained by Ben Widawsky
and Jonathan Cameron.  Broken out as a separate patch
to improve visibility.

Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-4-Jonathan.Cameron@huawei.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fbc0662627..dff0200f70 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2545,6 +2545,13 @@ F: qapi/block*.json
 F: qapi/transaction.json
 T: git https://repo.or.cz/qemu/armbru.git block-next
 
+Compute Express Link
+M: Ben Widawsky <ben.widawsky@intel.com>
+M: Jonathan Cameron <jonathan.cameron@huawei.com>
+S: Supported
+F: hw/cxl/
+F: include/hw/cxl/
+
 Dirty Bitmaps
 M: Eric Blake <eblake@redhat.com>
 M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
-- 
MST


