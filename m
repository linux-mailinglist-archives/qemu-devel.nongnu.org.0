Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D09E35150E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:19:49 +0200 (CEST)
Received: from localhost ([::1]:55624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRxEh-00011K-U8
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7r-0001tm-GT
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7o-0004RT-FE
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617282759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZwOcQEd7H7MbO+MV41Zd90QaVi9nUUDy/4cQYvQ4ZhE=;
 b=AkXu2THUqW43AM7qQ81oDF5pEBsmfajKTV8iVDUD4ybzjLHPoYUl8A1fZMkkZFOWJJfzxW
 zXBwXMPVYp4Ag6YobfYhMuSFALKfHe5hNSneHp8AkGcjQ9NFdaiWzHJO5Iki5JRrODhdHL
 Wm9H4ASgSY0yU26mq0vpp8nVzzXXn/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-NrvyZI0mMnSq5Q9GSAPX8A-1; Thu, 01 Apr 2021 09:12:37 -0400
X-MC-Unique: NrvyZI0mMnSq5Q9GSAPX8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22BEA190A7D5;
 Thu,  1 Apr 2021 13:12:37 +0000 (UTC)
Received: from thuth.com (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D7AC19107;
 Thu,  1 Apr 2021 13:12:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/13] MAINTAINERS: add virtio-fs mailing list
Date: Thu,  1 Apr 2021 15:12:13 +0200
Message-Id: <20210401131220.3252320-7-thuth@redhat.com>
In-Reply-To: <20210401131220.3252320-1-thuth@redhat.com>
References: <20210401131220.3252320-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
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
Cc: Connor Kuehl <ckuehl@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Connor Kuehl <ckuehl@redhat.com>

General discussion and patch reviews take place on this list for both
virtiofsd (tools/virtiofsd/*) and the guest kernel module.

Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Vivek Goyal <vgoyal@redhat.com>
Message-Id: <20210318154157.1357224-1-ckuehl@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f237ea313d..155c7995d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1916,6 +1916,7 @@ F: tools/virtiofsd/*
 F: hw/virtio/vhost-user-fs*
 F: include/hw/virtio/vhost-user-fs.h
 F: docs/tools/virtiofsd.rst
+L: virtio-fs@redhat.com
 
 virtio-input
 M: Gerd Hoffmann <kraxel@redhat.com>
-- 
2.27.0


