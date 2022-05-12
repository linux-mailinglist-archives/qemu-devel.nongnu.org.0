Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDADE52543F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 19:57:26 +0200 (CEST)
Received: from localhost ([::1]:43584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npD42-0005rL-0s
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 13:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZO-0004xo-RO
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZN-0005B6-9A
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zd2FgjA2gFamXjlGWzhTIuzxT6LHT0+mCcAuF8/8jGs=;
 b=G6PogIwGSp5zDZ3ggojpq5oBpNgcsEKD2EP61kkmO5Gz/eHQrO+mkP5p/nYShzRiyBeTRv
 q4iV/U/XpmzJwdsJov6kyMLA9p6zQFIA24MWykEUkduYhrnPmdyTQpjuVAesywcqFLYSBa
 188Cfu6GCGgxqqTeg+QM/BbM9ZJCvb0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-yw3atBVMM5OoxoUOe35VjQ-1; Thu, 12 May 2022 13:25:43 -0400
X-MC-Unique: yw3atBVMM5OoxoUOe35VjQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 r8-20020a056402018800b00428b43999feso3489911edv.5
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zd2FgjA2gFamXjlGWzhTIuzxT6LHT0+mCcAuF8/8jGs=;
 b=fWD6fAvvAxnnpVfSKEJY6zsY/SgT0PPXCmLmlZM9aCy/cNsg/Lq/c5S2ShHS8Lk1hh
 6uBaUUxdAmnwkjlbfbfDd8VC73zy5yXjavg7zVy5zVOHJRyBJrh9F9qrqrTn6WtvUgpz
 DF5hFxMs9Lbq/aqG4lGWRkOMdYQvx2ZXkoXlWEvrsdHBAC/Cb7iS20+smjVb6RMZwa5R
 68EEluqU2ogRvTZW5bqWP96vi6h8PUxdQM1jDEWGuh06U85rEwgFDvQh4QwCMXq0sBdU
 K29+bvpgGsG1T/DuzEhZ77j52O0f5ICkOUAr6b8aKYFy/bW3lvUcBIyvX/0B2cCiRXf5
 2U8Q==
X-Gm-Message-State: AOAM530C2RnQuXppLFHOHTbcB52QpvEQ8DKEIQ4ImWp66O4frq+4vKPw
 jsxBMbYiGpbZv1sL/vNpZUU60nLI9JWvOUlYEoiIL4OWZ5gFgtve3LuzOfmpqLpWs+qzKoXEO1A
 4thu6xwAenidhWVho6I00FL5uaonlbZXr7C9rP87UUESNfKv15vIphmhaaY8nowucDOs=
X-Received: by 2002:a17:907:94c6:b0:6f5:287a:2bf2 with SMTP id
 dn6-20020a17090794c600b006f5287a2bf2mr938193ejc.124.1652376341703; 
 Thu, 12 May 2022 10:25:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPeTNnB5RDHxNreuSRVPOBtI+b89zU+GcU928ZeEIZM7zFU3HlEhGpWjfJxqdDZPnDwnX/Lw==
X-Received: by 2002:a17:907:94c6:b0:6f5:287a:2bf2 with SMTP id
 dn6-20020a17090794c600b006f5287a2bf2mr938174ejc.124.1652376341384; 
 Thu, 12 May 2022 10:25:41 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 ot17-20020a170906ccd100b006f3ef214dcdsm2228437ejb.51.2022.05.12.10.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <malureau@redhat.com>
Subject: [PULL 16/27] slirp: bump submodule past 4.7 release
Date: Thu, 12 May 2022 19:24:54 +0200
Message-Id: <20220512172505.1065394-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Version 4.7 of slirp provides a new timer API that works better with CFI,
together with several other improvements:

* Allow disabling the internal DHCP server !22
* Support Unix sockets in hostfwd !103
* IPv6 DNS proxying support !110
* bootp: add support for UEFI HTTP boot !111

and bugfixes.

The submodule update also includes 2 commits to fix warnings in the
Win32 build.

Reviewed-by: Marc-André Lureau <malureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 slirp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/slirp b/slirp
index a88d9ace23..9d59bb775d 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit a88d9ace234a24ce1c17189642ef9104799425e0
+Subproject commit 9d59bb775d6294c8b447a88512f7bb43f12a25a8
-- 
2.36.0


