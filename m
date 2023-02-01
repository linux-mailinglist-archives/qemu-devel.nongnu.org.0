Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFF7687061
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 22:13:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNKPQ-000129-Ba; Wed, 01 Feb 2023 16:12:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pNKPJ-00010z-Os
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:12:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pNKPI-0003ab-CZ
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:12:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675285959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yOEtzcEZz9a5BSOEpPcBYxwkjIksVxe9FjjC1r+llpE=;
 b=NQs6rUDJZL+KJpuT9SNQx2/6S/pLLk4YA99wykrhQSKoOcvybNC03oNE3U4A6jqusSDnFB
 TTQs35LG3wYEqgaanzQ0qmEkOcA+D+75P0WwD0vKY87bLHKqUZKq8Y4UQCzt473C3jRLJf
 TI9O4ClMfIqz1YLAjPOnvLZcezx1B5g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-c6kj-5_sM8aEe9-TGwfF8A-1; Wed, 01 Feb 2023 16:12:37 -0500
X-MC-Unique: c6kj-5_sM8aEe9-TGwfF8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 666A985A588;
 Wed,  1 Feb 2023 21:12:37 +0000 (UTC)
Received: from localhost (unknown [10.39.192.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1194D40398A0;
 Wed,  1 Feb 2023 21:12:35 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Cc: <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, mjt@tls.msk.ru,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 0/5] docs: expand block driver documentation
Date: Wed,  1 Feb 2023 16:12:29 -0500
Message-Id: <20230201211234.301918-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

During an IRC discussion Michael Tokarev pointed out that block drivers are not
well-documented.

This patch series tries to improve the situation. It's a small step, but any
improvement will help.

Stefan Hajnoczi (5):
  docs: expand introduction to disk images
  docs: differentiate between block driver create and runtime opts
  docs: flesh out raw format driver description
  docs: flesh out qcow2 format driver description
  docs: add throttle filter description

 docs/system/images.rst                 |  35 +++-
 docs/system/qemu-block-drivers.rst.inc | 259 +++++++++++++++++++++----
 2 files changed, 253 insertions(+), 41 deletions(-)

-- 
2.39.1


