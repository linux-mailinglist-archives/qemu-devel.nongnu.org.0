Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AADDB2746F4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 18:49:12 +0200 (CEST)
Received: from localhost ([::1]:60250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKlTb-0004Zx-OW
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 12:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kKkmN-0002wR-8L
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 12:04:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kKkmB-0005NU-31
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 12:04:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600790656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cySJN7dpuz/Va7hJwVhgUr/eA+8gkNc8rx9Q59fpqDE=;
 b=amCMGiqcgKVksfZIZdt6o1cj42UtJjvNFY88WOxwgJk3PZN/qhwAKJrTiu/aqPvxEjO7g7
 tnwwUWR+TN09mj2Ciu7Nd769PVpKl0T4SUybOCcJEG7bQCZr4Na4OiPVJ0Lk9Z+yJ0/hMn
 WG4nas4c29lTMxwNKpDrWYJXGEjYzzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-BUbP_qbwMAanNGDrCT1mAg-1; Tue, 22 Sep 2020 12:04:13 -0400
X-MC-Unique: BUbP_qbwMAanNGDrCT1mAg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D360A1868429;
 Tue, 22 Sep 2020 16:04:11 +0000 (UTC)
Received: from localhost (ovpn-115-55.ams2.redhat.com [10.36.115.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A6B060CCC;
 Tue, 22 Sep 2020 16:04:11 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/11] util/vhost-user-server: s/fileds/fields/ typo fix
Date: Tue, 22 Sep 2020 17:03:52 +0100
Message-Id: <20200922160401.294055-3-stefanha@redhat.com>
In-Reply-To: <20200922160401.294055-1-stefanha@redhat.com>
References: <20200922160401.294055-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 00:31:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Coiby Xu <coiby.xu@gmail.com>,
 mreitz@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0K
IHV0aWwvdmhvc3QtdXNlci1zZXJ2ZXIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3V0aWwvdmhvc3QtdXNlci1zZXJ2
ZXIuYyBiL3V0aWwvdmhvc3QtdXNlci1zZXJ2ZXIuYwppbmRleCA3YjUwYTJiMWZkLi4yY2QwY2Y4
Mjc3IDEwMDY0NAotLS0gYS91dGlsL3Zob3N0LXVzZXItc2VydmVyLmMKKysrIGIvdXRpbC92aG9z
dC11c2VyLXNlcnZlci5jCkBAIC00MDcsNyArNDA3LDcgQEAgYm9vbCB2aG9zdF91c2VyX3NlcnZl
cl9zdGFydChWdVNlcnZlciAqc2VydmVyLAogICAgICAgICByZXR1cm4gZmFsc2U7CiAgICAgfQog
Ci0gICAgLyogemVybyBvdXQgdW5zcGVjaWZpZWQgZmlsZWRzICovCisgICAgLyogemVybyBvdXQg
dW5zcGVjaWZpZWQgZmllbGRzICovCiAgICAgKnNlcnZlciA9IChWdVNlcnZlcikgewogICAgICAg
ICAubGlzdGVuZXIgICAgICAgICAgICAgID0gbGlzdGVuZXIsCiAgICAgICAgIC52dV9pZmFjZSAg
ICAgICAgICAgICAgPSB2dV9pZmFjZSwKLS0gCjIuMjYuMgoK


