Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9936F58521D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 17:09:29 +0200 (CEST)
Received: from localhost ([::1]:42192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHRcG-0002G0-Nl
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 11:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHRXr-0003eI-5s
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:04:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHRXp-0005a7-Nu
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659107093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ORLqmTavrpmFCjM97zE9EOvvemvokaHihzrA+oOsJbE=;
 b=ByplzipHq0vf5t/Y7FdqKDi2+tNGmIIEhpNhZt+gFP+rjA76ozN8IkO7sWjm4YRl+1RpwA
 SfZ6v65FL7JxizgTiDkuubFOkv0aE0bUT+oerMy4HW+hLmKrR7uzM4Jy7pJZRSzKvvJ+1z
 8/fNFCYwi9wEkHd3YXmJhb7QqUNYWJ4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-kFRILNheONiKHfqO0cx20w-1; Fri, 29 Jul 2022 11:04:52 -0400
X-MC-Unique: kFRILNheONiKHfqO0cx20w-1
Received: by mail-ej1-f71.google.com with SMTP id
 gn10-20020a1709070d0a00b0072fd8bafeffso1903703ejc.12
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 08:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ORLqmTavrpmFCjM97zE9EOvvemvokaHihzrA+oOsJbE=;
 b=I9rxE2AQYBGw9O3XfW3aX8qUR0XaaBC7Fln2efHWhfLYjDQt2zhyPjqDEMpaWMMLxP
 409DjJTiidC5Hj8TuFISIsqqGDHw4ddUH+U8fML25qyEkv5mVsPUn4KvLtbRI7t6JRdX
 uIE4KFUB3IlJvCq7Ehu1cUNA905BDQ1hrWrJLXWqmuiP3MzBrVx+5V+FSwF7Cp2Ym2Ot
 DlMbirErclEGQMH8xQA2nVh1NGJX+IGIxGE1eP7rX0G3nVULt24rZPKT/1Xm18ibk7nX
 VskbFk96j50Q/wUPBlZbj7WZrGw9VnjWlfPX2Xi8EdXx/Sc/lVqYUoBPPRpTM+7IhlV8
 4ctA==
X-Gm-Message-State: AJIora/7vYMsWCPcTj9kwcccvG2KH5Lsl/2ffuuRTXi/YGazQVMdO8cy
 HZhJdlrbG7Tf0HVd7khPRX6CsI4oQv0UIxyCA3Z5oagv4FcG550nuiBvlB1qxGEB+nZOjLTFYOS
 kazuNpoMWUKfunTEpaKcffoyJgOMKdnp5KjPc47TRW2KRU7sRy9l5qoJB0ztg8n+Z91Y=
X-Received: by 2002:a17:907:9613:b0:72b:68df:8ada with SMTP id
 gb19-20020a170907961300b0072b68df8adamr3254713ejc.31.1659107090657; 
 Fri, 29 Jul 2022 08:04:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1thiBirrTpeE4L0FS/3q0D29v5s8HpgK/uQf//Qj8oSIKFFbD5peHQH98isGaCam5FTR+v6OA==
X-Received: by 2002:a17:907:9613:b0:72b:68df:8ada with SMTP id
 gb19-20020a170907961300b0072b68df8adamr3254685ejc.31.1659107090149; 
 Fri, 29 Jul 2022 08:04:50 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a1709061da200b006fec4ee28d0sm1785642ejh.189.2022.07.29.08.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 08:04:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Taylor Simpson <tsimpson@quicinc.com>
Subject: [PULL 6/6] configure: pass correct cflags to container-based cross
 compilers
Date: Fri, 29 Jul 2022 17:04:38 +0200
Message-Id: <20220729150438.20293-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220729150438.20293-1-pbonzini@redhat.com>
References: <20220729150438.20293-1-pbonzini@redhat.com>
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

probe_target_compiler returns nonempty $target_cc for installed toolchains
and $container_cross_cc for container-based toolchains.  In both cases
however the flags (coming from $cross_cc_cflags_${target_arch}) must be
in $target_cflags.

Therefore, do not clear them prior to returning from probe_target_compiler.

Reported-by: Taylor Simpson <tsimpson@quicinc.com>
Fixes: 92e288fcfb ("build: try both native and cross compilers", 2022-07-08)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index c4c02b8438..72ab03f11a 100755
--- a/configure
+++ b/configure
@@ -2173,7 +2173,6 @@ probe_target_compiler() {
     build_static=
     target_cc=
     target_ccas=
-    target_cflags=
     target_ar=
     target_as=
     target_ld=
-- 
2.36.1


