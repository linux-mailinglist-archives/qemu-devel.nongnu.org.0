Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5DC351BC5
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 20:11:55 +0200 (CEST)
Received: from localhost ([::1]:54794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS1nO-0008RR-DI
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 14:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS1ez-0003ED-7m
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:03:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS1er-0005vH-No
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:03:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617300183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6V9hNvZy38Q/75ynvyJjF+U219yJmq8sKjsSeS+YHDU=;
 b=IuucxJiOzFt7sXmYtmGMpFWcW3kzc8AizmKCBx7ebybHLflJkQ0zm0wKLWLucRaRgpbZBe
 VlDMiAvaYal1+njNGDCIIo8tIT/vtkamAwGXkqtjRUzO93oWYM5+gJ/8MeGtGYaWmJqUMJ
 eJS08cyQnXyhD+5fkbH6DZM3nKRk1dw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-taudAFxyNISkotHW0vu81g-1; Thu, 01 Apr 2021 14:03:01 -0400
X-MC-Unique: taudAFxyNISkotHW0vu81g-1
Received: by mail-wm1-f70.google.com with SMTP id v5so1588312wml.9
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 11:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6V9hNvZy38Q/75ynvyJjF+U219yJmq8sKjsSeS+YHDU=;
 b=DFofO01z/vhZ1WY/Q1JvLiJmcWp9LXpmi2DO1XIy/+CgXVgkt2dpeXeNFZhIwMUV4Q
 8xstz5KioQ/6D+z4Md6QnAKQwQxl6VST/dE8ZAYmEikcGI46SAycB5V1lvo5pabJl6rX
 kOZQxJ95pEJQOES2TyxMdo4EMNDpkuQpBoEEv0c4V13ZSdm69eFXdqPoykRknV3+T9Hp
 QV002CbztsvBdufHSJC/ZayIAEtF+FyGqhOVmMku7lG2AmqVKMmTUTyxNBCqBTVJxKxp
 CU2Zld4enM8Ng0bNtnbMF/5c/NkzXoWv/CMr5SlhMMpsQET8orNSdrucNHBH7I6xazSP
 4YYA==
X-Gm-Message-State: AOAM533lIHTTZYkDf+bcJx2cgRGCaVhwGUJzSza7Jq8Pf4NtQYzBEOSu
 ZSW96EvDa1sge2KVOzlN1N7p8FqYm7xFRuyJci7s4tWHxYXyxspLWJGMHRXg04kAN/POw7r6Hmc
 tzAkqQ1Vcbw8xx4ugpG8pZpZPNt3OpKaTmadJ8g8zvZzolIZdZQ43SQYtlKxU
X-Received: by 2002:a7b:c0c7:: with SMTP id s7mr9338624wmh.5.1617300180184;
 Thu, 01 Apr 2021 11:03:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGDBTpzGaYBTu0by4GaZcXKuLZ8Pj6n4vcRTyYzt4n5I1qknP9ryrHv1wEz31aGN3UiZaxyw==
X-Received: by 2002:a7b:c0c7:: with SMTP id s7mr9338606wmh.5.1617300179999;
 Thu, 01 Apr 2021 11:02:59 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id s21sm9267910wmc.10.2021.04.01.11.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 11:02:59 -0700 (PDT)
Date: Thu, 1 Apr 2021 14:02:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/9] vhost-user-blk: add immediate cleanup on shutdown
Message-ID: <20210401180235.226321-4-mst@redhat.com>
References: <20210401180235.226321-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210401180235.226321-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Denis Plotnikov <den-plotnikov@yandex-team.ru>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Denis Plotnikov <den-plotnikov@yandex-team.ru>

Qemu crashes on shutdown if the chardev used by vhost-user-blk has been
finalized before the vhost-user-blk.

This happens with char-socket chardev operating in the listening mode (server).
The char-socket chardev emits "close" event at the end of finalizing when
its internal data is destroyed. This calls vhost-user-blk event handler
which in turn tries to manipulate with destroyed chardev by setting an empty
event handler for vhost-user-blk cleanup postponing.

This patch separates the shutdown case from the cleanup postponing removing
the need to set an event handler.

Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Message-Id: <20210325151217.262793-4-den-plotnikov@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/block/vhost-user-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 4e215f71f1..0b5b9d44cd 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -411,7 +411,7 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
          * other code perform its own cleanup sequence using vhost_dev data
          * (e.g. vhost_dev_set_log).
          */
-        if (realized) {
+        if (realized && !runstate_check(RUN_STATE_SHUTDOWN)) {
             /*
              * A close event may happen during a read/write, but vhost
              * code assumes the vhost_dev remains setup, so delay the
-- 
MST


