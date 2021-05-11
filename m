Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF33437B18F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 00:21:33 +0200 (CEST)
Received: from localhost ([::1]:56726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgaku-000487-C4
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 18:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaWG-0007zg-Hj
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaWE-0006WG-Jh
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620770782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8QEcYwPpiAdzGnQtGtm+YvWw/XHUAr6+X1gfe0OtI4w=;
 b=IwmSOo1QolWAOrZCpp84/nxR4Ijpa+X+ADRmL6ZWfg24AxtrZ1hpy/M6vQdWxaqG/ifptr
 iRuDdwYCEUzIEQFwx0NJDJIS6dZtVv9P6ZZhwU3QKZPRpZ3KxH2msvb8Z/c4KQPdXdy0na
 8kJ3buNhFlbCpAlbQ0TKeKaA1o7giLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-jLarfbmVNumLYa3bihIZ2w-1; Tue, 11 May 2021 18:06:17 -0400
X-MC-Unique: jLarfbmVNumLYa3bihIZ2w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAF9F101371E;
 Tue, 11 May 2021 22:06:16 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2A2EBA6F;
 Tue, 11 May 2021 22:06:15 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/21] qapi/parser: allow 'ch' variable name
Date: Tue, 11 May 2021 18:05:54 -0400
Message-Id: <20210511220601.2110055-15-jsnow@redhat.com>
In-Reply-To: <20210511220601.2110055-1-jsnow@redhat.com>
References: <20210511220601.2110055-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can have a two-letter variable name, as a treat.

Signed-off-by: John Snow <jsnow@redhat.com>

--

I don't want to use 'chr' or 'char', and in context 'ch' works well
enough. I will assume that any possible future uses will also be obvious
enough.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/pylintrc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
index 88efbf71cb2..c5275d5f59b 100644
--- a/scripts/qapi/pylintrc
+++ b/scripts/qapi/pylintrc
@@ -43,6 +43,7 @@ good-names=i,
            _,
            fp,  # fp = open(...)
            fd,  # fd = os.open(...)
+           ch,
 
 [VARIABLES]
 
-- 
2.30.2


