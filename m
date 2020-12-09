Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D43B2D486B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:58:40 +0100 (CET)
Received: from localhost ([::1]:54848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3jS-0000wr-4g
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:58:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kn3U5-00037u-FB
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:42:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kn3U3-0007fY-BR
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:42:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607535753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LuEbuo/ieSF1uHa6V8Xq9PJM6Uihm9PtVKUVD5o7Ms4=;
 b=S4wZ/TZqg6Mkm1S3YMSlmR4ylqP5MP40WB6sj3WEbycbaQp4uuehKht539Qbfta5bdfpt+
 q0QdsGpI29OUytYeLYCF2fTnRbX4/tgnr+Lfxxur2roYjReqtHZEjFYp6RpGqDRkfRKEsR
 S54zfaDX5z1fRblZu8oV+Rgorzk0ZkM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-bvntxmrpMyODsF9q3ct6kA-1; Wed, 09 Dec 2020 12:42:31 -0500
X-MC-Unique: bvntxmrpMyODsF9q3ct6kA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16AD185818D;
 Wed,  9 Dec 2020 17:42:30 +0000 (UTC)
Received: from localhost (ovpn-115-48.ams2.redhat.com [10.36.115.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B56196064B;
 Wed,  9 Dec 2020 17:42:26 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] trace: convert docs to rST and feature "log" backend in
 quickstart
Date: Wed,  9 Dec 2020 17:42:22 +0000
Message-Id: <20201209174225.401337-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Q29udmVydCB0cmFjaW5nLnR4dCB0byByU1QgYW5kIGFkZCBpdCB0byB0aGUgZ2VuZXJhdGVkIGRl
dmVsb3BlciBkb2N1bWVudGF0aW9uLg0KDQpQZXRlciBNYXlkZWxsIHN1Z2dlc3RlZCBtYWtpbmcg
dGhlICJsb2ciIGJhY2tlbmQgdGhlIHJlY29tbWVuZGVkIGJhY2tlbmQgaW4gdGhlDQpxdWlja3N0
YXJ0IGRvY3VtZW50YXRpb24uIEl0J3MgZWFzaWVyIHRvIHVzZSB0aGFuIHRoZSAic2ltcGxlIiBi
YWNrZW5kLiBUaGUNCmZpbmFsIHBhdGNoIHVwZGF0ZXMgdGhlIGRvY3VtZW50YXRpb24gdG8gZG8g
dGhpcy4NCg0KU3RlZmFuIEhham5vY3ppICgzKToNCiAgdHJhY2U6IGZpeCBzaW1wbGV0cmFjZSBk
b2MgbWlzbWVyZ2UNCiAgdHJhY2luZzogY29udmVydCBkb2N1bWVudGF0aW9uIHRvIHJTVA0KICB0
cmFjZTogcmVjb21tZW5kICJsb2ciIGJhY2tlbmQgZm9yIGdldHRpbmcgc3RhcnRlZCB3aXRoIHRy
YWNpbmcNCg0KIGRvY3MvZGV2ZWwvaW5kZXgucnN0ICAgICAgICAgICAgICAgICAgICB8ICAgMSAr
DQogZG9jcy9kZXZlbC97dHJhY2luZy50eHQgPT4gdHJhY2luZy5yc3R9IHwgMTc1ICsrKysrKysr
KysrKysrLS0tLS0tLS0tLQ0KIDIgZmlsZXMgY2hhbmdlZCwgMTAwIGluc2VydGlvbnMoKyksIDc2
IGRlbGV0aW9ucygtKQ0KIHJlbmFtZSBkb2NzL2RldmVsL3t0cmFjaW5nLnR4dCA9PiB0cmFjaW5n
LnJzdH0gKDg2JSkNCg0KLS0gDQoyLjI4LjANCg0K


