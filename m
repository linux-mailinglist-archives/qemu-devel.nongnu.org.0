Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346F236DD0C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:33:05 +0200 (CEST)
Received: from localhost ([::1]:35464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbn7Y-0008HY-9T
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbn4K-00078c-QZ
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:29:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbn4H-0006Tp-PW
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:29:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619627380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Co/dMFKm0k4Bh5ngAGA6PebzSt63Cg+l8mYlMiLmNds=;
 b=GlmRKk3Pb5r7MoLm2HZtWygoEbyaLTD5FXWw5PTXsYoXWa3NvC4QttWHnRY1zg6iBbiQyh
 efcHbr7JErKK/gqJBk81X678Nd5CBhjm5pwXerzGD+h0ZdB1guJcD4fxZGzkxAW2tj37BV
 PLgDA/Ws7wKUh9ROQXFLi2iTw2WJny0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-ZdhyTsCXNkaxII5kekdtxQ-1; Wed, 28 Apr 2021 12:29:38 -0400
X-MC-Unique: ZdhyTsCXNkaxII5kekdtxQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75A28107ACE4
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 16:29:37 +0000 (UTC)
Received: from localhost (unknown [10.22.9.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9300C60CC9;
 Wed, 28 Apr 2021 16:29:30 +0000 (UTC)
Date: Wed, 28 Apr 2021 12:29:30 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] Deprecate pmem=on with non-DAX capable backend file
Message-ID: <20210428162929.bgwyol24brh2avfa@habkost.net>
References: <20210111203332.740815-1-imammedo@redhat.com>
 <20210427204848.ubgncujxjxcufpul@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210427204848.ubgncujxjxcufpul@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: thuth@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 27, 2021 at 04:48:48PM -0400, Eduardo Habkost wrote:
> On Mon, Jan 11, 2021 at 03:33:32PM -0500, Igor Mammedov wrote:
> > It is not safe to pretend that emulated NVDIMM supports
> > persistence while backend actually failed to enable it
> > and used non-persistent mapping as fall back.
> > Instead of falling-back, QEMU should be more strict and
> > error out with clear message that it's not supported.
> > So if user asks for persistence (pmem=on), they should
> > store backing file on NVDIMM.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> I'm queueing this for 6.1, after changing "since 6.0" to "since 6.1".
> 
> Sorry for letting it fall through the cracks.

This caused build failures[1] and I had to apply the following
fixup.

[1] https://gitlab.com/ehabkost/qemu/-/jobs/1216917482#L3444

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 docs/system/deprecated.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index cc8d810be1a..c55c4bceb00 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -257,6 +257,7 @@ is (a) not DAX capable or (b) not on a filesystem that support direct mapping
 of persistent memory, is not safe and may lead to data loss or corruption in case
 of host crash.
 Options are:
+
     - modify VM configuration to set ``pmem=off`` to continue using fake NVDIMM
       (without persistence guaranties) with backing file on non DAX storage
     - move backing file to NVDIMM storage and keep ``pmem=on``
-- 
2.30.2

-- 
Eduardo


