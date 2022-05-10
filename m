Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B784A520DDB
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 08:26:47 +0200 (CEST)
Received: from localhost ([::1]:60000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noJKY-0000Rr-S7
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 02:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1noJAy-0004kp-Mu
 for qemu-devel@nongnu.org; Tue, 10 May 2022 02:16:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1noJAx-00056n-9V
 for qemu-devel@nongnu.org; Tue, 10 May 2022 02:16:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652163410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qdkWDYrX8z68MmZF5paO0ZCLjA8KvHibzTcDUmCJeFQ=;
 b=OA7/1a0D2OKPr4sxVVSaycV6/952cKpeRmdAI0zR5CEIqwLu/r1i3jmovCQG43MRVdWGQh
 9++EwIJipayx4A7bT/9zgae1ESu80fgyJH2fwGgQH8g5blxdKpqwsIrrqqfOCcMA2Z8YMS
 4Jvps36J3k3OclN2JvwPpvRLv/HYqho=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-Kot0RGvVOtuSVslQv-zPXA-1; Tue, 10 May 2022 02:16:49 -0400
X-MC-Unique: Kot0RGvVOtuSVslQv-zPXA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C732885A5BE;
 Tue, 10 May 2022 06:16:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFE3C200B663;
 Tue, 10 May 2022 06:16:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7B06C21E6880; Tue, 10 May 2022 08:16:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com,
	jsnow@redhat.com,
	eblake@redhat.com
Subject: [PATCH 0/2] qapi: Minor fixes around feature names
Date: Tue, 10 May 2022 08:16:43 +0200
Message-Id: <20220510061645.3209195-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster (2):
  qapi/expr: Enforce feature naming rules again
  docs/devel/qapi-code-gen: Belatedly document feature naming rules

 docs/devel/qapi-code-gen.rst | 9 +++++----
 scripts/qapi/expr.py         | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.35.1


