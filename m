Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAAA2DEDE6
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 10:09:39 +0100 (CET)
Received: from localhost ([::1]:34392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqYF8-00006D-UU
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 04:09:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqYCP-0006MR-0Q
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 04:06:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqYCM-0004DF-7J
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 04:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608368804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GchQ321H+NpocWzquXFv1gdTdttnxEJkaK6U/52ojk4=;
 b=SFu0LyHplV9k+Mdb1P6xl6xOqb3VWxIJsRyfR5lPsRnL3NsWgY2M9HoKrebFMqQ5G8iC8E
 9NN8yLLU4FFfNNJiZV8aeH0HQV6SaC9C7wm9FLXPpTpIPONql62p6zVYChyqNF0OPbfU/k
 wh70j2Q2KU6b4FrIPUqFHatN5zvb814=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-os9QOwXhMOyCa7cd0sRBjQ-1; Sat, 19 Dec 2020 04:06:42 -0500
X-MC-Unique: os9QOwXhMOyCa7cd0sRBjQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E33B180A089
 for <qemu-devel@nongnu.org>; Sat, 19 Dec 2020 09:06:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C73A52BCC3;
 Sat, 19 Dec 2020 09:06:37 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Cleanup internal WHPX headers
Date: Sat, 19 Dec 2020 04:06:35 -0500
Message-Id: <20201219090637.1700900-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove Windows type usage from sysemu/whpx.h, because
the whp-dispatch.h header is internal to the WHPX accelerator
implementation.  Fixes WHPX build.

Paolo Bonzini (2):
  whpx: rename whp-dispatch to whpx-internal.h
  whpx: move internal definitions to whpx-internal.h

 include/sysemu/whpx.h                         | 22 +----------------
 target/i386/whpx/whpx-all.c                   |  9 +++----
 target/i386/whpx/whpx-apic.c                  |  2 +-
 target/i386/whpx/whpx-cpus.c                  |  4 +---
 .../whpx/{whp-dispatch.h => whpx-internal.h}  | 24 ++++++++++++++++---
 5 files changed, 29 insertions(+), 32 deletions(-)
 rename target/i386/whpx/{whp-dispatch.h => whpx-internal.h} (91%)

-- 
2.26.2


