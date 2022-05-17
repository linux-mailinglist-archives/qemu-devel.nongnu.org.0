Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B58529E7F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 11:52:31 +0200 (CEST)
Received: from localhost ([::1]:53970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqtsU-0005sy-S2
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 05:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTt-0000Pa-9F
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:27:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTq-0003gt-52
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652779619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lPqzLngiTYE10M8Yb8SVUVOVe5bHTL/ubSAO0mPwohU=;
 b=TyCpLXI+becD40g4T6vZi2CLNR7ZMRnyRKTa0nwfj1WxQQ7l+h+NgQKIdNPmDCs9vQnJKE
 twQM37wyiQVxtxVxpHoMKe5kem0IiX5hmXChqhWAr0v7/tIgE/aTvvGR0agDrT/Z+9zYpr
 Cifa2JvEiGchhD/N1fjp7QcQnVsQxmE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-wy3z96aeP2Sv214tv8ScYA-1; Tue, 17 May 2022 05:26:58 -0400
X-MC-Unique: wy3z96aeP2Sv214tv8ScYA-1
Received: by mail-ed1-f71.google.com with SMTP id
 b3-20020aa7d483000000b004282ca95814so11381458edr.9
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 02:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lPqzLngiTYE10M8Yb8SVUVOVe5bHTL/ubSAO0mPwohU=;
 b=QjVp8xAOF2DCDCtZJCWk5Y7cvLCWmUnzbGJuvGuKou03JxG60SVI5WjJytxbcGJsFB
 9G0b2GJX6TfvluFP+PW53Dv54wb6uzv5dB+HQMVE9W0Q7ZSqig7ORUu4lXj80a8oebSl
 W44uon3d5xtst/BqUiaGh8BPzVbMsyf911ggkDgexIsNOH3V9dlKCjV+OAM7QJ4cNnNW
 Z9jvOcoVWo+0geStfFRtGjhLlTnWPPYTzg++0zpIva7gask5M4CsadFxC5PrFMPoHehE
 pYf2BUnoZKw4CYCRwHM3O7Ip2D1JZWX09xYLWZc8ZtK5LNJHnLjuDNTekr0BUXBmUqNS
 Y4Dg==
X-Gm-Message-State: AOAM531rKKnwhBljv5lUd3ga3mX6PrMein4l/Gr4M9Qyj0oOv5cqAPRE
 refxQSdPjPI16j8XPeJU+WND+nHSC2N5xArvGbqeXbHOiZBzQJmq7qJvvGbNIcW65ytlDZZDjH+
 fhok6q3POpi9TvP2aJvDpeDI+a0CvlbbvFORHH6Zdc4Us5Qn8+GEj9oermwOFtF8EVs0=
X-Received: by 2002:a17:906:e202:b0:6fe:478b:7c1 with SMTP id
 gf2-20020a170906e20200b006fe478b07c1mr6993786ejb.419.1652779617060; 
 Tue, 17 May 2022 02:26:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzz/0cTbw29QL8GwZJWi85HA+v6EMB5I2+7cVkxCDEV5vbwaln6m7XKz09uneoTYI805TrQrg==
X-Received: by 2002:a17:906:e202:b0:6fe:478b:7c1 with SMTP id
 gf2-20020a170906e20200b006fe478b07c1mr6993762ejb.419.1652779616785; 
 Tue, 17 May 2022 02:26:56 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 jy10-20020a170907762a00b006f3ef214df6sm811692ejc.92.2022.05.17.02.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 02:26:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 16/16] configure: remove unused variables from config-host.mak
Date: Tue, 17 May 2022 11:26:16 +0200
Message-Id: <20220517092616.1272238-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220517092616.1272238-1-pbonzini@redhat.com>
References: <20220517092616.1272238-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

The only compiler variable that is still needed is $(CC), for
contrib/plugins/Makefile.  All firmware builds have their own
config-host.mak file.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/configure b/configure
index 5b7b4e2cca..8cdec79f1a 100755
--- a/configure
+++ b/configure
@@ -2412,11 +2412,6 @@ echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
 echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
-echo "AR=$ar" >> $config_host_mak
-echo "AS=$as" >> $config_host_mak
-echo "CCAS=$ccas" >> $config_host_mak
-echo "OBJCOPY=$objcopy" >> $config_host_mak
-echo "LD=$ld" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
 echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
 echo "QEMU_OBJCFLAGS=$QEMU_OBJCFLAGS" >> $config_host_mak
@@ -2424,7 +2419,6 @@ echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
 echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
 echo "GLIB_VERSION=$(pkg-config --modversion glib-2.0)" >> $config_host_mak
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
-echo "STRIP=$strip" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 
 # use included Linux headers
-- 
2.36.0


