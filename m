Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90626FEF3A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:51:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2wo-0000Ld-Fz; Thu, 11 May 2023 05:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2wh-0000Jj-8c
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:50:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2wf-0006fu-PK
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:50:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683798645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fVJ0OB9nXcy0+mOhEaIyVdOw97OLkAzKR1jYBf96Ybs=;
 b=WFOAHO2M6ZlureFHW0noIG3SpNQ2njXZxVJ0c9rUvg/YeUr8XODvsU+c5G1iJHqnurDEct
 frF1DDJO2cqCLWrIDm3oDF9vDqF64iZgUXUeW1FwyB1NvV7Hcz0Aq5UfPAe2QZL0mzUota
 R0KYs8zkIMWsTbX50LOLqF/27Re4RWc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-COee0HgmMGmAWbFbIZ7IYQ-1; Thu, 11 May 2023 05:50:43 -0400
X-MC-Unique: COee0HgmMGmAWbFbIZ7IYQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-50bf847b267so9527469a12.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683798642; x=1686390642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fVJ0OB9nXcy0+mOhEaIyVdOw97OLkAzKR1jYBf96Ybs=;
 b=ilRs0SigOOqDXj8/xQUVDVN/XCFxSx54D7TdoYBqD55Oi0uiVK/263Le/icYWr6rwd
 oFUrU98Hty0jmpns76C46pk98P2XOz07NnmJaf7vXN58SKotcdLrEhoHnE6PEbuFsTqj
 eKSK+4lJ/S8RNZ62+jJ7+eCQjICrEHhs9DAIk3fuSumwWlDIXOs+0Ig8oDH/mkJ89PNm
 Whi7LM9+Sg01G5KisT/aNBuIps7NcchivQk50vHlwtFd1GCay1UAren3fix3H6ZumUfd
 EScdr5q2p++5WKxfaerSAxJ6BuxRcfStsW9iGql5L1sJoVIKO7bsIt9KgVGfpEwrS4n2
 zLTg==
X-Gm-Message-State: AC+VfDyeJlQYp7uad46aPAajtnvHVCx1XnN+dGXeOvsGikMTpjIyoxTc
 +lGlY4AlgrORKtp6h6naQPYo4mklTYr5sBZi4ZKqZ0+SP818gJ9s7xMyp4zliE69ILX22Xs5Hlt
 I5X4BX3ninSciwCIcn3WNS8CsQqmGlPHh2hc5+rXoVShL3HApBaxbt0Vq8KIS1hv//99aBcWl0q
 s=
X-Received: by 2002:a17:907:940e:b0:950:e44:47ae with SMTP id
 dk14-20020a170907940e00b009500e4447aemr19916826ejc.40.1683798642417; 
 Thu, 11 May 2023 02:50:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4NUYC4L9oH5nlFaLOeDg2MYLw06YNyha2d4jKd7VmdwtS2F10cEFJc7fpGN3n7vuS+cyWp0Q==
X-Received: by 2002:a17:907:940e:b0:950:e44:47ae with SMTP id
 dk14-20020a170907940e00b009500e4447aemr19916810ejc.40.1683798641988; 
 Thu, 11 May 2023 02:50:41 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 t27-20020a170906269b00b0096616aef7e5sm3874037ejc.149.2023.05.11.02.50.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:50:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/24] meson: drop unnecessary declare_dependency()
Date: Thu, 11 May 2023 11:50:03 +0200
Message-Id: <20230511095021.1397802-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511095021.1397802-1-pbonzini@redhat.com>
References: <20230511095021.1397802-1-pbonzini@redhat.com>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The libvfio_user_dep variable of subprojects/libvfio-user/lib/meson.build
is already a dependency, so there is no need to wrap it with another
declare_dependency().

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 342986f6f90f..56d0c5ba52f5 100644
--- a/meson.build
+++ b/meson.build
@@ -2714,9 +2714,7 @@ if have_system and vfio_user_server_allowed
 
   libvfio_user_proj = subproject('libvfio-user')
 
-  libvfio_user_lib = libvfio_user_proj.get_variable('libvfio_user_dep')
-
-  libvfio_user_dep = declare_dependency(dependencies: [libvfio_user_lib])
+  libvfio_user_dep = libvfio_user_proj.get_variable('libvfio_user_dep')
 endif
 
 fdt = not_found
-- 
2.40.1


