Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2480D4B74C0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:42:04 +0100 (CET)
Received: from localhost ([::1]:58444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3i7-0003bO-7V
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:42:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nK3bJ-00077H-VV
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:35:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nK3bG-0007GN-Sc
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:35:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644953698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J5mASyQOEyOzslhSb4jH9SRBF2cVMdloZ4sW1WlNTJs=;
 b=AYBJH7i8+jW910QyThBxn/W/XNhw+N8JWC1AFgoQ21IooEmXAQlX7s5A3Eq0+s4uvp0xGR
 H13fDtj6Sm8WYndA+S7W1fflo3Ae6v+GYwF9+WLys4NSxPxVQv6mEuk4OHwwK3JQxRV6Is
 Hwfx48pMSAY9B6ZNEfcOy/93e8w/p3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-7mU2-eIuNbywlWuSEl-fAA-1; Tue, 15 Feb 2022 14:34:56 -0500
X-MC-Unique: 7mU2-eIuNbywlWuSEl-fAA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEF35814243
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 19:34:55 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 245A145D75;
 Tue, 15 Feb 2022 19:34:49 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: Jason Wang <jasowang@redhat.com>,
	Peter Xu <peterx@redhat.com>
Subject: 
Date: Tue, 15 Feb 2022 20:34:22 +0100
Message-Id: <20220215193422.1777441-1-eperezma@redhat.com>
In-Reply-To: <345cd684-0cc2-a685-0611-e2fcf0dfc52b@redhat.com>
References: <345cd684-0cc2-a685-0611-e2fcf0dfc52b@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Please review this new minimal version. It is way shorter, but this
comes with a cost:
* Iteration does not stop at the end of range (but an out of range
  allocation never happens)
* Iteration must start from iova == 0 instead of first valid entry in
  the hole.

These should not be a big deal though.

Another possible optimization that comes to my mind is to allocate
always at the end of range. In the case of having to allocate and
deallocate frequently, this should avoid to iterate over long lived
entries. Better justify this with numbers, so I left that out.

Thanks!



