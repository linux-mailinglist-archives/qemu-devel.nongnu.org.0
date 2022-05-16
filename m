Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68035529332
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:53:09 +0200 (CEST)
Received: from localhost ([::1]:44664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqieK-0004xN-Gq
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhkM-0003NL-5i
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:55:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhkK-00072U-Nl
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EBgdvHTSxrbwEFo3tpiVkZs9rY+u7ipcUNblbdnChHM=;
 b=jQ4noGII8mH9Vsx7hzzzuZVICOt2mpM4UoXEsqZEl/GJMhWyuYImjGSEWVcet7UzVWySI/
 uQwHMoRkcz6HeSGVMuaZ1J1JMC0Fn0LiyNtlvQbQ3nORflrGgp140QAKDYW2/ToEMNbjtb
 S4bXH7+rVjZDJ+Fkds8Et9orIoPQx8A=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-lR4WwaZ8Nnm_GLaYONBmiQ-1; Mon, 16 May 2022 16:55:15 -0400
X-MC-Unique: lR4WwaZ8Nnm_GLaYONBmiQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 qw30-20020a1709066a1e00b006f45e7f44b0so6358023ejc.5
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EBgdvHTSxrbwEFo3tpiVkZs9rY+u7ipcUNblbdnChHM=;
 b=IjuEMGbcMEQ7QmK8Gmf71oLs4m/Ee5yMHH8P8kWMqdbrIAy7pV16RYECBa4eWbLtlt
 CTrbK9/g1cguKoQs49y6MegBdPM4tdGdBKKhrwABhDNKNh9K/YKW676gaun7a74OI3Te
 Bfa+yYzxErzBa6GG4nqoxW1Ta+VQF8lBylc2lwYsmBNbVONVvvpO1qDdVo5LFd1KWj0Q
 5x2Su8/HfShsAiqPMBXPodjy+DfDSe283TNFBe397VUXiBdpG0zF/eut6NyucUyknvq+
 Hc3SGg8uEt2aUb19peoE7g7MUxZzINCS2vIx1wXEI4ptCp2uH2T+g4N9Lk2NJJr9D4UP
 UpYQ==
X-Gm-Message-State: AOAM5312b9D8cnNUeKOmR1WaUkImYhgdXjX8/PSsXXLtFqpecfJSfwPO
 64v3u+cLnXASZ1m3VnSjuimPzF4DB2/r0kXxkkU9MgMIAqYCfO/YAvOZv/0EqFRll82RQwhdGXg
 Q5caL1paz4Zk3FM1/sgFeWzk+FhhXMtk/Gnub676gDcCgAyZI/owE6vIBxqzK
X-Received: by 2002:a17:906:7b82:b0:6f3:ee8d:b959 with SMTP id
 s2-20020a1709067b8200b006f3ee8db959mr17763912ejo.458.1652734513597; 
 Mon, 16 May 2022 13:55:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyL+UyRzJQH5vr5syf5VD1vKqZapr3D9e6YAGqahRN4pR8BsXtLdpwSBT7HlXZZGZmUZHq5dA==
X-Received: by 2002:a17:906:7b82:b0:6f3:ee8d:b959 with SMTP id
 s2-20020a1709067b8200b006f3ee8db959mr17763891ejo.458.1652734513349; 
 Mon, 16 May 2022 13:55:13 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 b27-20020a170906729b00b006f3ef214e33sm157523ejl.153.2022.05.16.13.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:55:12 -0700 (PDT)
Date: Mon, 16 May 2022 16:55:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 72/86] vhost-user: more master/slave things
Message-ID: <20220516204913.542894-73-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
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

we switched to front-end/back-end, but newer patches
reintroduced old language. Fix this up.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/interop/vhost-user.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 73e710fe32..3c12607517 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -340,7 +340,7 @@ drivers cannot negotiate it.
 
 This reserved feature bit was reused by the vhost-user protocol to add
 vhost-user protocol feature negotiation in a backwards compatible
-fashion. Old vhost-user master and slave implementations continue to
+fashion. Old vhost-user front-end and back-end implementations continue to
 work even though they are not aware of vhost-user protocol feature
 negotiation.
 
-- 
MST


