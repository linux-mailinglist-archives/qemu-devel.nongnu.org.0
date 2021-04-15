Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2B4360639
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 11:52:17 +0200 (CEST)
Received: from localhost ([::1]:37150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWyfX-0006Xi-LY
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 05:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1lWyeX-000668-Tf
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 05:51:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1lWyeS-0005Cd-Kc
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 05:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618480267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TbJNfxs6yzheyJ9qxe1sos1SUVxxDn8ucygjdgUFq5M=;
 b=KnwE5MU23xLHdbuJPzrMVdFcpXu56SEpNyEU0zcKAR3jaINpYwCnIGH3acDeGRTgLpQAWk
 SNu66vTj3JZGyhD3qLZ0AFofzRreHSlvh/ZRvskcyI9r9HM3imS1RVlkg2TkeeAXuSbNCu
 ddU3Tx5SPxkGU9pRBnm+ytDQ1zVoIFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-d7as5UYWOH63kRAXH5aITQ-1; Thu, 15 Apr 2021 05:49:58 -0400
X-MC-Unique: d7as5UYWOH63kRAXH5aITQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9493107ACCD
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 09:49:57 +0000 (UTC)
Received: from paraplu.localdomain (ovpn-115-90.ams2.redhat.com [10.36.115.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD64B5C1B4;
 Thu, 15 Apr 2021 09:49:57 +0000 (UTC)
Received: by paraplu.localdomain (Postfix, from userid 1001)
 id AA2523E049A; Thu, 15 Apr 2021 11:49:54 +0200 (CEST)
Date: Thu, 15 Apr 2021 11:49:54 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: Upstream bug comments on the mailing list and Launchpad
Message-ID: <20210415094954.GA84874@paraplu.home>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kchamart@redhat.com;
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
Cc: thuth@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, folks —

Many here know that upstream bugs from launchpad get replicated to
'qemu-devel'.  But the catch is that it only happens if you _also_ have
an account on Launchpad with the same email address with which you're
replying on the list.  This is easy to forget.

So a QEMU developer without a Launchpad account might give a detailed
response to a bug on the list.  But the bug reporter isn't subscribed to
the list (which is fine; and is expected behaviour).

    <... a few weeks later ... >

The bug reporter thinks: "no one responded to my bug".  Meanwhile, the
detailed comment from the developer is languishing on the list.

PS: I recall there was discussion on the list of moving to a different
    GitLab tracker.  As Thomas Huth mentioned on IRC, more people seem
    to have account on GitLab than on Launchpad.

-- 
/kashyap


