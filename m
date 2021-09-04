Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E05D400D40
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:57:56 +0200 (CEST)
Received: from localhost ([::1]:49916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdff-0004Kz-9B
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdMC-0007qn-Mk
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdMB-0001s9-9Q
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HlvXhUtB/AN0yn39xV5VTOrfdV0zshjuzF146PZp9mo=;
 b=XSK65/+Sgg5sM0K0oEE7XzGumHQZfXFjG3kzz3T5NaOtgVEGhuGmrZq+qyrtktejBxU9vv
 Ydb55bUWATmSPRIueqk29PMDiTn2mqqFxLFICAhew6ib+Oqgfv5NhAixi6I3ro5LySkm+3
 h7IQu5s35eW8OvMRfWiWRvESxfaWwO4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-4UGWOeb8MACCruf-KI5ByA-1; Sat, 04 Sep 2021 17:37:44 -0400
X-MC-Unique: 4UGWOeb8MACCruf-KI5ByA-1
Received: by mail-ed1-f71.google.com with SMTP id
 h4-20020aa7c604000000b003c423efb7efso1492261edq.12
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HlvXhUtB/AN0yn39xV5VTOrfdV0zshjuzF146PZp9mo=;
 b=r7V3vtMOkDE5xH6Iz/cHIle3dBWtyQP/k+EIfKqSzyBibTL88cQhnSoEAiHCnPodZ6
 ylgvrxFJK66MWmDPQlRxjaID1KmhTgS6G0rEXOxoZKL7+m5DOJqcAUBV5w8KUtM2ns7I
 e8WxvEkG1fMUP0FE1J6WcpYNo7KmqDwvNTGNaCHe0APSEKBkrbVhjovNkquuTwsL/ctv
 B6fj2NnoOKa8AH/KqMavOtGHhMMaYhdRE9bc+eypysTJQgYX+IqebvFZVZ1As9tQ5LKk
 urpdYoA5QeXYzvOyKSErm5OHoOhFJke6ftNzfZVr4mNrRfKcFt06YUVRNiDUmf74Vaba
 hhPQ==
X-Gm-Message-State: AOAM530rV+wXSoyl3Lep+hdTEMw2V754saMlNEd3YurFqEIvQkkM+mx5
 RccvfzegQEWWoM2Hf7vNdpeUiBbMBqzridAI6i8PmVjo21YQMxLco5Uf6EgxkMKvGtAUPCNFHd8
 ScuRC0Kld1XLp3kmZiuHzHTkt2ZX6jbUfFhVFUqrXXWV70ioeYwGePcrJ1Xez
X-Received: by 2002:a17:906:4c89:: with SMTP id
 q9mr5904844eju.118.1630791463008; 
 Sat, 04 Sep 2021 14:37:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuxWFYeFbqkJQlH5qGTtej//1XO+kXRvALo+o5C+ElWLHRcrOTUFowLAt3rwZ/57Pd1U9MJg==
X-Received: by 2002:a17:906:4c89:: with SMTP id
 q9mr5904830eju.118.1630791462799; 
 Sat, 04 Sep 2021 14:37:42 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id q1sm1864434edr.68.2021.09.04.14.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:37:42 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:37:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/35] vhost-vdpa: remove the unncessary queue_index assignment
Message-ID: <20210904213506.486886-36-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

The queue_index of NetClientState should be assigned in set_netdev()
afterwards, so trying to net_vhost_vdpa_init() is meaningless. This
patch removes this.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210903091031.47303-12-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index d02cad9855..912686457c 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -165,7 +165,6 @@ static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
     assert(name);
     nc = qemu_new_net_client(&net_vhost_vdpa_info, peer, device, name);
     snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
-    nc->queue_index = 0;
     s = DO_UPCAST(VhostVDPAState, nc, nc);
     vdpa_device_fd = qemu_open_old(vhostdev, O_RDWR);
     if (vdpa_device_fd == -1) {
-- 
MST


