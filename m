Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F072DC3C2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:11:16 +0100 (CET)
Received: from localhost ([::1]:45632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZOV-0000QT-90
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kpZMw-0007x5-DB
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:09:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kpZMu-0004ea-2g
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:09:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608134973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ctNPPXZZuEV3MG1Mit/L9IX7QEyY2SkjEzokDOtMrig=;
 b=i8GmbwEDyVRwU6lUY4Ce8EaYOa3PuVliInx+rg1WSTIFmMNaOQKGA0FV3m1/UYWQU9T8Hf
 LK0hFVo+j8tqCjZumcRcXKjfyK8TbyTFEIXykPYx5PHxu7J7t3D9xn9/PRUnyDnmnrGvL+
 ZFrH1/pwvlSMP2GKo5DjV80Mh8aFcwg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-28b26hWIPpejgBda0n9GzA-1; Wed, 16 Dec 2020 11:09:29 -0500
X-MC-Unique: 28b26hWIPpejgBda0n9GzA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B936C801B14;
 Wed, 16 Dec 2020 16:09:28 +0000 (UTC)
Received: from localhost (ovpn-115-151.ams2.redhat.com [10.36.115.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCDD660BF3;
 Wed, 16 Dec 2020 16:09:24 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] trace: convert docs to rST and feature "log" backend
 in quickstart
Date: Wed, 16 Dec 2020 16:09:20 +0000
Message-Id: <20201216160923.722894-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

djI6DQogKiBTaW1wbGlmeSBxdWlja3N0YXJ0IGZvciB0aGUgImxvZyIgdHJhY2UgYmFja2VuZCB0
aGF0IGlzIGVuYWJsZWQgYnkgZGVmYXVsdA0KICAgW1BldGVyXQ0KICogRG9uJ3Qgc2hvdyAuL2Nv
bmZpZ3VyZSAtLWVuYWJsZS10cmFjZS1iYWNrZW5kcz1sb2cgZXhhbXBsZSBzaW5jZSBpdCdzIGJ1
aWx0DQogICBieSBkZWZhdWx0IChjaGFuZ2VkIHRvIC0tZW5hYmxlLXRyYWNlLWJhY2tlbmRzPXNp
bXBsZSxkdHJhY2UpIFtQZXRlcl0NCg0KQ29udmVydCB0cmFjaW5nLnR4dCB0byByU1QgYW5kIGFk
ZCBpdCB0byB0aGUgZ2VuZXJhdGVkIGRldmVsb3BlciBkb2N1bWVudGF0aW9uLg0KDQpQZXRlciBN
YXlkZWxsIHN1Z2dlc3RlZCBtYWtpbmcgdGhlICJsb2ciIGJhY2tlbmQgdGhlIHJlY29tbWVuZGVk
IGJhY2tlbmQgaW4gdGhlDQpxdWlja3N0YXJ0IGRvY3VtZW50YXRpb24uIEl0J3MgZWFzaWVyIHRv
IHVzZSB0aGFuIHRoZSAic2ltcGxlIiBiYWNrZW5kLiBUaGUNCmZpbmFsIHBhdGNoIHVwZGF0ZXMg
dGhlIGRvY3VtZW50YXRpb24gdG8gZG8gdGhpcy4NCg0KU3RlZmFuIEhham5vY3ppICgzKToNCiAg
dHJhY2U6IGZpeCBzaW1wbGV0cmFjZSBkb2MgbWlzbWVyZ2UNCiAgdHJhY2luZzogY29udmVydCBk
b2N1bWVudGF0aW9uIHRvIHJTVA0KICB0cmFjZTogcmVjb21tZW5kICJsb2ciIGJhY2tlbmQgZm9y
IGdldHRpbmcgc3RhcnRlZCB3aXRoIHRyYWNpbmcNCg0KIGRvY3MvZGV2ZWwvaW5kZXgucnN0ICAg
ICAgICAgICAgICAgICAgICB8ICAgMSArDQogZG9jcy9kZXZlbC97dHJhY2luZy50eHQgPT4gdHJh
Y2luZy5yc3R9IHwgMTg1ICsrKysrKysrKysrKysrLS0tLS0tLS0tLQ0KIDIgZmlsZXMgY2hhbmdl
ZCwgMTA3IGluc2VydGlvbnMoKyksIDc5IGRlbGV0aW9ucygtKQ0KIHJlbmFtZSBkb2NzL2RldmVs
L3t0cmFjaW5nLnR4dCA9PiB0cmFjaW5nLnJzdH0gKDg0JSkNCg0KLS0gDQoyLjI5LjINCg0K


