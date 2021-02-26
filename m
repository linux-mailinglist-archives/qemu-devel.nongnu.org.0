Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEF6326423
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 15:36:43 +0100 (CET)
Received: from localhost ([::1]:36608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFeEU-000107-D1
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 09:36:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFeCJ-0007qd-Ot
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 09:34:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFeCH-0006YN-Ag
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 09:34:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614350062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ena+6NZQUhZVw4219p4R6Y//4vozZEln8rBcBNjwSs0=;
 b=aLPc+AFaD6kP2PVw2pxffLNqbEVeyaoI4IIG0MirdRiIVFVVLRajeOFi3CUsaw6YlpC9es
 vfbLXO+TdmfLO3m7y5P3I/JWBdiWfUMXxUN8WWq1Mf16YC4ByBd32w0HINPLG+yhtTge9f
 McfgBvBNOXbvSw0GDX568nf1vh+jY7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-4KtnfH9KNXmwODfdvDS1Hg-1; Fri, 26 Feb 2021 09:34:20 -0500
X-MC-Unique: 4KtnfH9KNXmwODfdvDS1Hg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD67E6D4E0;
 Fri, 26 Feb 2021 14:34:19 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D01E12D7E;
 Fri, 26 Feb 2021 14:34:13 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] docs: replace master/slave with more accurate wording
Date: Fri, 26 Feb 2021 09:34:10 -0500
Message-Id: <20210226143413.188046-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
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
Cc: mst@redhat.com, jag.raman@oracle.com, stefanha@redhat.com,
 sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Usually front-end/back-end are used for the two vhost sides rather than
master/slave.  Use them in the documentation as they identify more
clearly what is going on (plus, the documentation was sometimes using
client/server instead).

Jag, would you mind doing the same for multiprocess too?

Paolo

Paolo Bonzini (3):
  docs: vhost-user: clean up request/reply description
  docs: vhost-user: rewrite section on ring state machine
  docs: vhost-user: replace master/slave with front-end/back-end

 docs/interop/vhost-user-gpu.rst |  10 +-
 docs/interop/vhost-user.rst     | 537 +++++++++++++++++---------------
 2 files changed, 285 insertions(+), 262 deletions(-)

-- 
2.26.2


