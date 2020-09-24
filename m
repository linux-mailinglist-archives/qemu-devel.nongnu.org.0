Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FCB27751F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 17:22:00 +0200 (CEST)
Received: from localhost ([::1]:52676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLT4J-0002zA-8e
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 11:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kLSye-0005v9-2B
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 11:16:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kLSyc-0003t1-I4
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 11:16:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600960565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cySJN7dpuz/Va7hJwVhgUr/eA+8gkNc8rx9Q59fpqDE=;
 b=JVA6SlzUBuO1/JKAGWH41rw2XuQPDlH5zNgNn0f5zPchaWrus0PtTK3ptNTPYRgBQnw9eu
 DL6p4Q6quh1eL8BEjBGrw52oC5oEZSL7K9uMKhnWbHfFX97LTZwL1rPVJzy8JuXARJ3MD3
 bqHtS/YEwWR0xJBzLECiwQ64FgxRW4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205--Fol4fNbNJ6WvbOtk_cMZw-1; Thu, 24 Sep 2020 11:16:02 -0400
X-MC-Unique: -Fol4fNbNJ6WvbOtk_cMZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C440664142;
 Thu, 24 Sep 2020 15:16:00 +0000 (UTC)
Received: from localhost (ovpn-114-5.ams2.redhat.com [10.36.114.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62F455C1C7;
 Thu, 24 Sep 2020 15:16:00 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/13] util/vhost-user-server: s/fileds/fields/ typo fix
Date: Thu, 24 Sep 2020 16:15:38 +0100
Message-Id: <20200924151549.913737-3-stefanha@redhat.com>
In-Reply-To: <20200924151549.913737-1-stefanha@redhat.com>
References: <20200924151549.913737-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Coiby Xu <coiby.xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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


