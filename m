Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62229528BC8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:18:17 +0200 (CEST)
Received: from localhost ([::1]:43676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqeMK-00031b-BI
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd4v-0001Ox-CO
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd4t-0003LV-PW
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M+29f587BYfTw3G2RmXRtQk88brAkMt1RpVyNwxFAJk=;
 b=YoCwv+/8CXHalNfUsn95LygE6TMiEsJXrPVtpMgBuUfP51Vi3Tj5MDzMtv0KZw89fZ4Wxl
 PXRxomVgSNUzfKwNNLYGVKBm37cb0XnpTTujN7ChR7Zm+CVX2IWaQJJo7q1++uljVCEwmn
 7vPveDFHkU7mz4Y5bRtLo9GsILk2tiY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-Ew-Bf2voPAeyMC1Yl5xvgQ-1; Mon, 16 May 2022 11:56:09 -0400
X-MC-Unique: Ew-Bf2voPAeyMC1Yl5xvgQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 f20-20020a50d554000000b0042abba35e60so960452edj.15
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M+29f587BYfTw3G2RmXRtQk88brAkMt1RpVyNwxFAJk=;
 b=oAe95ltQUDGmFc5fJ/ux/wyFTG2VOsz29oqxbKmtaL4IbzC8OpB5PeDYOWEQknlPkM
 y5DOfwpIqXVxQ/MRt8+P0lfpi+fjQK6/wM1GtbeRBm0UEEx+iWVNP2MzaV+bS27FsV0H
 B4uU+V/hGXdbiOxFsi1rPj76gQ5x4qaV7iN8CLKfZ+7UIvZkz1/UUKK2z8Oq3qFr6RsE
 OKpcLJpAC7VtJTN8QoOzb/S7MfrV+zjfAJSycKGdZ0gMbW2lzbrr9bJujsK7NESYdlQ1
 U8MU3LBLHH6F9TqpTGH3FXfH+kpCVnSOouCeglCdGUxnHpwxIti+wO9gLBsfVxukJ2zX
 Vfdg==
X-Gm-Message-State: AOAM531xe+e/mTugciBmSTyxuNSftRXnw6n5yIlJqjqU9BIyeISQKWiO
 yvcd/dzh9q2u0kuzrio2R19Y59pW5Z1FouF9qMlRnK0dEsv+VBK3ReF46kiE2u80qCLCMRIKLEb
 M0C7BjK+AZuhq6/Wl8RlQ2mRoRuSgA5NmUDRI3vxis+3v1Oxj6z3qrkzK7uvSnFq6eU0=
X-Received: by 2002:a50:9b08:0:b0:42a:2d15:e15a with SMTP id
 o8-20020a509b08000000b0042a2d15e15amr13733737edi.361.1652716568200; 
 Mon, 16 May 2022 08:56:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTvI/CFmc2c/hc+Gln70bN81CJ8TpSMt8Xz3OEtcToZVznVZyp4oYK7czb2oUQs+wDEcs9xg==
X-Received: by 2002:a50:9b08:0:b0:42a:2d15:e15a with SMTP id
 o8-20020a509b08000000b0042a2d15e15amr13733709edi.361.1652716567838; 
 Mon, 16 May 2022 08:56:07 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a50eacb000000b0042617ba6383sm5578218edp.13.2022.05.16.08.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>
Subject: [PULL 02/23] qga-vss: Add auto generated headers to dependencies
Date: Mon, 16 May 2022 17:55:42 +0200
Message-Id: <20220516155603.1234712-3-pbonzini@redhat.com>
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

From: Konstantin Kostiuk <kkostiuk@redhat.com>

Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Message-Id: <20220512154906.331399-1-kkostiuk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/vss-win32/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
index 26c5dd6e0e..9483ccd3b8 100644
--- a/qga/vss-win32/meson.build
+++ b/qga/vss-win32/meson.build
@@ -7,7 +7,7 @@ link_args = cc.get_supported_link_arguments([
 
 qga_vss = shared_module(
   'qga-vss',
-  ['requester.cpp', 'provider.cpp', 'install.cpp'],
+  ['requester.cpp', 'provider.cpp', 'install.cpp', genh],
   name_prefix: '',
   cpp_args: ['-Wno-unknown-pragmas', '-Wno-delete-non-virtual-dtor', '-Wno-non-virtual-dtor'],
   link_args: link_args,
-- 
2.36.0


