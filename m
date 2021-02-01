Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F8D30B1F3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 22:17:29 +0100 (CET)
Received: from localhost ([::1]:57058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6gZc-0007Xx-AD
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 16:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l6gXW-0006CI-8M
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 16:15:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l6gXQ-0007Zb-Lu
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 16:15:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612214110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GmT19pDMVZ4aqkyiVhIF91rPIteYCQTt10hVxF0wRtA=;
 b=i6CA2p7Lm1sE9Xep6YaIb1f6dOG2fTiMoNi9q0A/473OQM/sgz7hi/eRQC8Ou1npQYG0BU
 gBCEl8Y7EoiithgDOzDo4uvRLf0//Imlbw0i2XJ+tZ4N/+iEZoFKwzRbtsMHd9L8+yM1Nd
 nYYckbZ2/lg+NZDuPA1wgIupfJydqt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-asoXrROTO8mWI9JWutacoA-1; Mon, 01 Feb 2021 16:15:07 -0500
X-MC-Unique: asoXrROTO8mWI9JWutacoA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0D73801AC0;
 Mon,  1 Feb 2021 21:15:05 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AF8B5C1A1;
 Mon,  1 Feb 2021 21:14:59 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] Allow to build virtiofsd without the entire tools
Date: Mon,  1 Feb 2021 18:14:55 -0300
Message-Id: <20210201211456.1133364-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, dgilbert@redhat.com, stefanha@redhat.com,
 misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not too long ago (QEMU 5.0) it was possible to configure with --disable-tools
and still have virtiofsd built. With the recent port of the build system to
Meson, it is now built together with the tools though.

The Kata Containers [1] project build QEMU with --disable-tools to decrease the
attack surface, apart from the fact that tools (except for virtiofsd) aren't
used at all. So the ability to build only virtiofsd is appreciated.

On commit cece116c939 it was introduced the --enable-virtiofsd option. One
might think that option will enable the virtiofsd build regardless of 
--disable-tools but it isn't the current behavior. So the patch that I am
sending allows to disable all tools but virtiofsd.

Side note: in a private chat with Stefan Hajnoczi he come up with the idea
that perhaps --disable-tools could be like --without-default-features where
one can add back on feature-by-feature basis. This is outside the scope of this
series but I thought in sharing because IMHO it is deserves a discussion.

[1] https://katacontainers.io

Wainer dos Santos Moschetta (1):
  virtiofsd: Allow to build it without the tools

 tools/meson.build | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.29.2


