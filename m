Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6A751B012
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 23:07:17 +0200 (CEST)
Received: from localhost ([::1]:41306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmMDM-0007Gk-O4
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 17:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmM6V-0006QQ-Dr
 for qemu-devel@nongnu.org; Wed, 04 May 2022 17:00:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmM6T-00068D-Rr
 for qemu-devel@nongnu.org; Wed, 04 May 2022 17:00:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651698009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F1Kb1eLm9tVTwYNCejQZxVmvj58B5hVqCxAsyodmLmU=;
 b=BU9nGj567eppaS8l3y45Spc7f/yt7UcuWoJzKj1JEuzFS08LhGe2lF2NvRREgJ18kkJTZN
 Cp2pvNG7k5S+GskmcrvJymiV39vnY7EZpYSCavlIXX410Wo1lG5LkolWKwlKdn1tgE43V7
 DTmMYiL7NIt8AN16eNZozpWi2vLzWQs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-ujWA2fEDNY2vFYeq_VGTMw-1; Wed, 04 May 2022 17:00:07 -0400
X-MC-Unique: ujWA2fEDNY2vFYeq_VGTMw-1
Received: by mail-ej1-f70.google.com with SMTP id
 ga27-20020a1709070c1b00b006f43c161da4so1506015ejc.7
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 14:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F1Kb1eLm9tVTwYNCejQZxVmvj58B5hVqCxAsyodmLmU=;
 b=YztHNQYZlhZTE/xS2bY6/z6g3KGj6rOoLRKCKTzbOaMa5+x72ClEjpe6Qu94YKvzCI
 19kOKXJfSmgG6OtFwM0vxWF0WIJecJWY6bDn278I4WxnXHWUSJctrQgxkhT+wtzb2jdy
 1sxL5okcdqoqDrdunyf99uflQ+biCj+9HxDhOHylmfbY2Bs/GbqI4GO4DfKsR1R+QqRA
 j2O4B73K7LoMmpkNkTzXLYfY0ypvygd1Gd5rR+BWDbLNJlLbjrljuxgs4QAJEVNaVo5E
 VVMb4kQfqjV11e8fnqnrQUdkNqcXoJ6Wb8bwQWk6nR5xCCRUALdo9XEFcDhUVYxzhuIw
 /UnA==
X-Gm-Message-State: AOAM531ByW2xQ+NqmkdzeKlOZDt6cytxavpuYlaUvp/DJM7JfV6+qJ90
 C24X5UEFZnQ5u0Ig53l3C2NsjPKr5npkKS+H7msG0OGWJsiHUlyxYka21ygLu/uuOTCysMUIOt5
 hULigYRgggT2v6VxtscpcmoCTHsGTIrMey5s09sTSzLAPg9kM5RsqDSZR0+uf4E6odl0=
X-Received: by 2002:a17:907:2daa:b0:6da:924e:955 with SMTP id
 gt42-20020a1709072daa00b006da924e0955mr21823095ejc.1.1651698005377; 
 Wed, 04 May 2022 14:00:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi+MyUsaK745ZfGSOvgAou0NEeK4+5ie9waBqe7/dQU/yjAeVxH4BkjCDOaiu/rxVFVEJwdw==
X-Received: by 2002:a17:907:2daa:b0:6da:924e:955 with SMTP id
 gt42-20020a1709072daa00b006da924e0955mr21823071ejc.1.1651698005136; 
 Wed, 04 May 2022 14:00:05 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 hy10-20020a1709068a6a00b006f3ef214dd4sm6244731ejc.58.2022.05.04.14.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 14:00:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: [PATCH 1/5] slirp: bump submodule to 4.7 release
Date: Wed,  4 May 2022 22:59:57 +0200
Message-Id: <20220504210001.678419-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504210001.678419-1-pbonzini@redhat.com>
References: <20220504210001.678419-1-pbonzini@redhat.com>
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

Version 4.7 of slirp provides a new timer API that works better with CFI,
together with several other improvements:

* Allow disabling the internal DHCP server !22
* Support Unix sockets in hostfwd !103
* IPv6 DNS proxying support !110
* bootp: add support for UEFI HTTP boot !111

and bugfixes.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 slirp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/slirp b/slirp
index a88d9ace23..3ad1710a96 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit a88d9ace234a24ce1c17189642ef9104799425e0
+Subproject commit 3ad1710a96678fe79066b1469cead4058713a1d9
-- 
2.35.1


