Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4B0528A22
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:18:19 +0200 (CEST)
Received: from localhost ([::1]:42638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdQJ-0006Yg-02
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5W-0002ww-EC
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5U-0003Qv-Pr
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UD1ktUjeIsHgoVdsvsoK6vrVzweAvHuK/QoZj+edBNI=;
 b=invXjcLAEJ6XvAAR5Y8rquskM1Au61b0SNTnqijD7f63S8rx0xDCda/SGxlBNXibx+XTXQ
 bSmwggwyJveiChdiz26+s8vCXOCtfuT16c5Zdoduq8CtovuqmvI7MQE1hBwxCUgqkZsNGE
 Z4tEuqhUZ+Tcc7q4FLW2/JlN1iXncEA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-UmozlCb7MZqssOHs5gIkpA-1; Mon, 16 May 2022 11:56:46 -0400
X-MC-Unique: UmozlCb7MZqssOHs5gIkpA-1
Received: by mail-ed1-f69.google.com with SMTP id
 cz24-20020a0564021cb800b00425dfdd7768so10052970edb.2
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UD1ktUjeIsHgoVdsvsoK6vrVzweAvHuK/QoZj+edBNI=;
 b=Ge2p+4EtRZwQ1ZSjR0dTAOMn4BOagef6HjZtknIKAU8LZFVGIzNlTBJPlC5+kibwIb
 bb3u5TAdUUKWAh+IlgAvQaQrdn3vfPTbHH0h4tY2kiQSW8bc+fo/y52QCJoL5n2IczTE
 yXj/T/8SDenMTJyYlV89iX8yhuUKCon4tv3lZJUyY8ZHLOQfZN5lnGXGr4YnUony6l75
 SZYvyVLbr0vWE3mSOr3wW/9f0CrDRIMQxst13thghf5MeoaR00Uavd8wUF0WIYo/nuts
 7Ze80yT6/SgG6kPubcAU2L0898xDZchlct59gj5xPvMeopSwa34wX1QYaUnHrZgK6cVW
 Pvww==
X-Gm-Message-State: AOAM532ODFzocVwzHz77q0ne2/7F8UuS9aavqqjSEgHVNVS1JJm0vfoU
 bYGzXZSHOrTKzpR0UB9D3lOyYLVk+JB4xPF4L4QV51JICHqDI5sSMxAQdGtI1h/lUYJY65kIQr0
 VrFqgUOMzHQr09UOTjrUSlX8mnzNeYV4TGIUaMmBqJ16jLqJvW+OaIXMvKnWTWJuQnxg=
X-Received: by 2002:a17:907:72ca:b0:6f9:8675:6a2a with SMTP id
 du10-20020a17090772ca00b006f986756a2amr15998612ejc.98.1652716605474; 
 Mon, 16 May 2022 08:56:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUYrtN3uTw57gq8xdlH1z46Lc7Sj+75s45BVQVvMzWwdAGnDJBDSUNOSNYBY6DAyiyN31jNQ==
X-Received: by 2002:a17:907:72ca:b0:6f9:8675:6a2a with SMTP id
 du10-20020a17090772ca00b006f986756a2amr15998593ejc.98.1652716605233; 
 Mon, 16 May 2022 08:56:45 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a170906109400b006f3ef214e72sm15178eju.216.2022.05.16.08.56.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/23] configure: remove another dead variable
Date: Mon, 16 May 2022 17:56:02 +0200
Message-Id: <20220516155603.1234712-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516155603.1234712-1-pbonzini@redhat.com>
References: <20220516155603.1234712-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index c8b5b99532..dda25f05bf 100755
--- a/configure
+++ b/configure
@@ -1992,7 +1992,6 @@ fi
 if test "$static" = "yes" ; then
   echo "CONFIG_STATIC=y" >> $config_host_mak
 fi
-qemu_version=$(head $source_path/VERSION)
 echo "SRC_PATH=$source_path" >> $config_host_mak
 echo "TARGET_DIRS=$target_list" >> $config_host_mak
 if test "$modules" = "yes"; then
-- 
2.36.0


