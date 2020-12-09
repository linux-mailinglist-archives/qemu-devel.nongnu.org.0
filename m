Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5442D4920
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:37:37 +0100 (CET)
Received: from localhost ([::1]:53852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4LI-0003XV-Ss
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:37:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3tL-0002KC-9m
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3tF-00088U-6z
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e63XrFjhRraaBUyyxddNntT8UVuXnzEpnyPrT9Xi6Do=;
 b=E8lA66j7tju4fHiEFdJ+eqfsKjyS4DQquQQSbCyIbd995MgOZ0XG3iSCVLj3vh9ojzwoIE
 YcB2r3bBrTgqBnmqnmjPSEMlF5hjHDLYxEMg0MmNVOiUYtBFfaT+Kbv7tv9HsRYKOu1hCE
 rNOVJIvmHQTJpbnTcNcWRndaCjWyOdc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-IYHbzYXZOyqHEERIr2GSNg-1; Wed, 09 Dec 2020 13:08:34 -0500
X-MC-Unique: IYHbzYXZOyqHEERIr2GSNg-1
Received: by mail-wr1-f71.google.com with SMTP id o4so936213wrw.19
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:08:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e63XrFjhRraaBUyyxddNntT8UVuXnzEpnyPrT9Xi6Do=;
 b=dXiY6f3qw8kdxvrnkfoXh4iS6Aob/msxYo2MgbBDsAb5mOV8cYk0a+uW5cX8bYI/0O
 EhPM6/XZiUQZX4CY2Ss4z+PoahndHt5XDDbJsO1o0vg1T+J6MGslh9oaWCrcB7qRWJ7m
 hrByUCG2UAHO2JV+KeXFPWrfUEVh2iMyg/tresDlwT6ObId8U3j+yJdF140+6D5o+KOj
 qXhGE++VR2RElnGmXJ5Ygm5Zi0WAo3b6ODLaHQCmrMNexYhD5EifuiojfJihj4grg3wa
 KkFPBXpcc6UEr09zfo4ex/sm01lhJoEqw4+hhi8gcsNiYZSnLXC7YcyMbapvq3w/nIVY
 00Lw==
X-Gm-Message-State: AOAM5308CcjCFb68zo5+moGRdHWu+rVS57aFm9knk97L8S6v/XoCZn2O
 eFk/5oqlyxGEP6qXh4YKg9dZq/ifIl9g1yw648xj/amQ67Jakb/SW0t7e9BRWUrFanKXgPqsuVY
 Tax5lQjNkQuoGDGUGvBpUBfS7+bCKnAUlhXV+lH8inESFgE9p/wRKVMzF9azP
X-Received: by 2002:a5d:5401:: with SMTP id g1mr4010440wrv.93.1607537312964;
 Wed, 09 Dec 2020 10:08:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTh+fOXnpFgSKeY5AEVgYbsQmU6zEVqaH5P6SWZAI7MpXNN99Q3HFMAFMvO/cFBNOw1n6Z7Q==
X-Received: by 2002:a5d:5401:: with SMTP id g1mr4010414wrv.93.1607537312742;
 Wed, 09 Dec 2020 10:08:32 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id z64sm4610291wme.10.2020.12.09.10.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:08:32 -0800 (PST)
Date: Wed, 9 Dec 2020 13:08:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 24/65] failover: g_strcmp0() knows how to handle NULL
Message-ID: <20201209180546.721296-25-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-10-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index c221671852..e334f05352 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -818,7 +818,7 @@ static int is_my_primary(void *opaque, QemuOpts *opts, Error **errp)
     int ret = 0;
     const char *standby_id = qemu_opt_get(opts, "failover_pair_id");
 
-    if (standby_id != NULL && (g_strcmp0(standby_id, n->netclient_name) == 0)) {
+    if (g_strcmp0(standby_id, n->netclient_name) == 0) {
         n->primary_device_id = g_strdup(opts->id);
         ret = 1;
     }
-- 
MST


