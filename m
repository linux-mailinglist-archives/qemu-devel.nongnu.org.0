Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80880514317
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 09:19:17 +0200 (CEST)
Received: from localhost ([::1]:44480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkKuJ-0003Nr-2c
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 03:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nkKp5-0001J5-Ap
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 03:13:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nkKp2-0001Jh-Gk
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 03:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651216427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iHISK+uKNFUUXjHIYGaHMLXjOPXbtgF3FLFarrTN+ck=;
 b=Iufqz34RSJWS400gPgs+1eCvEhgp/iltk7nOHyNAmNfQkUb1th8ViidxVcRK2AM16b3lJz
 R78Oe/Xkp0USr+a5KR0INh+/4TDHPvrWGmGIpOcPcuAAc7KGBYUbvoSQZP5xJevINqPFat
 QbtCNvOpTspg75ml7YGrIyYS45tRHcI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-dYBKs6iiOjOSfjqaMC5B1Q-1; Fri, 29 Apr 2022 03:13:43 -0400
X-MC-Unique: dYBKs6iiOjOSfjqaMC5B1Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 045F6811E76;
 Fri, 29 Apr 2022 07:13:43 +0000 (UTC)
Received: from kostyanf14nb.Dlink (unknown [10.40.193.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6FB32166B4D;
 Fri, 29 Apr 2022 07:13:28 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 0/2] build improvments
Date: Fri, 29 Apr 2022 10:13:24 +0300
Message-Id: <20220429071326.324497-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Resend because the series didn't reach the mailing list.

Konstantin Kostiuk (2):
  configure: Add cross prefix for widl tool
  qga-vss: always build qga-vss.tlb when qga-vss.dll is built

 configure                 | 3 +++
 qga/vss-win32/meson.build | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

--
2.25.1


