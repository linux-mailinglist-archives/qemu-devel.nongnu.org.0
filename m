Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAA4526061
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 12:58:51 +0200 (CEST)
Received: from localhost ([::1]:56728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npT0V-0002bw-1v
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 06:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npSyv-0001UY-Id
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:57:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npSyu-0008FD-4V
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652439431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=EBgdvHTSxrbwEFo3tpiVkZs9rY+u7ipcUNblbdnChHM=;
 b=J+/JfsrMO21mLO4N0TGXaGvjflojbFAe8kj9kOEU6sCdJgAu2qE2qjSPluUmx/mlYZu9d7
 ECqGSI9B9d7ORrfOF0lswCM06dD5a8PxpBC1EvEGc8cjvsp6X1oCf9t0a/TPz7HMAFJJm+
 Z4uhV2j1AxD+PqiQ3siFPdgIzMw5y8w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-KE42Q7JGP2iEmMjakk7PGA-1; Fri, 13 May 2022 06:57:10 -0400
X-MC-Unique: KE42Q7JGP2iEmMjakk7PGA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so2794000wmr.0
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 03:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=EBgdvHTSxrbwEFo3tpiVkZs9rY+u7ipcUNblbdnChHM=;
 b=LoHgsWbJSIEKlfGEqejdAOcUPb2JE6wJBW/YnS2B3BJsVtf0/CTCfG/fBDrp+jto0N
 trx+SHueXG7jlMOpvOX3wAvZLEP1dj0zc2KLfQHtKPYnFGDuAKvuWuZklCrJRUspEPSG
 7rlt2/RNao4Zx3g66XvGUwStoxZccC1Ke4mo0cbp5odOgBa/N16V4XZ6IvbfrQ25imrn
 X9GyKzFXO4eDAxKZJR9KkeY6IaFb66ju9QV0wTWXZPWFaYt+Wvv5x8bzg2zfNdGoYHvS
 AtCFgIkqpuhdgInTbfxx+z2T0uYSdcnGJK349PEYyWZVyovypQ4E5iOLTlxxkrHqSvWi
 LJDw==
X-Gm-Message-State: AOAM532iuvXgJ/z1Mc2YZJMY8Oc27nSdbSFlllcvzGlzZCReh5YIo/ue
 Zmz4bR7Bq/Nyn1uAeQS4cnVI3ga+TbfJ+qJOkbwTiSNUZj8LDCuiE3c8GlsvghM9oRgzeyz7KLT
 jXRprYiSNQk+y5kSJGxejzohjLNEXTOBvZweWWYfKM5mcwu2XbohujYwLVLb4
X-Received: by 2002:a05:6000:136b:b0:20a:c416:e914 with SMTP id
 q11-20020a056000136b00b0020ac416e914mr3488419wrz.167.1652439428417; 
 Fri, 13 May 2022 03:57:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3yvPc7OleG5t9tACMJzddAcMo0qsUNFixbj+X5eX1UFHVls2R+bVXaK0NJU8c9tYOmqv+LQ==
X-Received: by 2002:a05:6000:136b:b0:20a:c416:e914 with SMTP id
 q11-20020a056000136b00b0020ac416e914mr3488384wrz.167.1652439427937; 
 Fri, 13 May 2022 03:57:07 -0700 (PDT)
Received: from redhat.com ([2.53.15.195]) by smtp.gmail.com with ESMTPSA id
 u16-20020adfc650000000b0020c5253d8e8sm1971429wrg.52.2022.05.13.03.57.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 03:57:07 -0700 (PDT)
Date: Fri, 13 May 2022 06:57:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vhost-user: more master/slave things
Message-ID: <20220513105703.52376-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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


