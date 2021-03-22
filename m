Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27AA343CB1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 10:26:59 +0100 (CET)
Received: from localhost ([::1]:43300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOGpu-0006ga-6x
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 05:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOGmj-0005WM-SH
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 05:23:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOGmg-0000jD-R8
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 05:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616405016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=epm4ndTfNCy8xPdbM5Sd6RtWk77CS3HrzKwmiB0SoCg=;
 b=GVWMMT8Snl4YvioCXKyDkBsHFglBrmXZ2r/BZjEOoX0vty0k/gHdwwzFhKCnrJynsYWyFJ
 kWFszS6iuSCNpE418YYu1FEVu838YfnARMkOqzXi6J6l7PENE/1IgFUL3wbXFdYRJBz6fr
 6paKiXE8egl1THfuT18zmfmbArgZxb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-DDwyuFkrPFiPTEShvec4WA-1; Mon, 22 Mar 2021 05:23:34 -0400
X-MC-Unique: DDwyuFkrPFiPTEShvec4WA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2965C107ACCD;
 Mon, 22 Mar 2021 09:23:33 +0000 (UTC)
Received: from localhost (ovpn-114-89.ams2.redhat.com [10.36.114.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA69D60C04;
 Mon, 22 Mar 2021 09:23:28 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] vhost-user-blk-test: add tests for the vhost-user-blk
 server
Date: Mon, 22 Mar 2021 09:23:24 +0000
Message-Id: <20210322092327.150720-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Coiby Xu <Coiby.Xu@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlc2UgcGF0Y2hlcyBhZGQgYSBxdGVzdCBmb3IgdGhlIHZob3N0LXVzZXItYmxrIHNlcnZlci4g
Q0kgZm91bmQgc2V2ZXJhbA0KaXNzdWVzIHRoYXQgY2F1c2VkIHRoZXNlIHBhdGNoZXMgdG8gYmUg
ZHJvcHBlZCBmcm9tIE1pY2hhZWwgVHNpcmtpbiBhbmQgS2V2aW4NCldvbGYncyBwdWxsIHJlcXVl
c3RzIGluIHRoZSBwYXN0LiBIb3BlZnVsbHkgdGhleSB3aWxsIGdvIGluIHNtb290aGx5IHRoaXMg
dGltZSENCg0KQ29pYnkgWHUgKDEpOg0KICB0ZXN0OiBuZXcgcVRlc3QgY2FzZSB0byB0ZXN0IHRo
ZSB2aG9zdC11c2VyLWJsay1zZXJ2ZXINCg0KU3RlZmFuIEhham5vY3ppICgyKToNCiAgdGVzdHMv
cXRlc3Q6IGFkZCBtdWx0aS1xdWV1ZSB0ZXN0IGNhc2UgdG8gdmhvc3QtdXNlci1ibGstdGVzdA0K
ICB2aG9zdC11c2VyLWJsay10ZXN0OiB0ZXN0IGRpc2NhcmQvd3JpdGUgemVyb2VzIGludmFsaWQg
aW5wdXRzDQoNCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArDQog
dGVzdHMvcXRlc3QvbGlicW9zL3Zob3N0LXVzZXItYmxrLmggfCAgNDggKysNCiB0ZXN0cy9xdGVz
dC9saWJxb3Mvdmhvc3QtdXNlci1ibGsuYyB8IDEzMCArKysrDQogdGVzdHMvcXRlc3Qvdmhvc3Qt
dXNlci1ibGstdGVzdC5jICAgfCA5ODkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KIHRl
c3RzL3F0ZXN0L2xpYnFvcy9tZXNvbi5idWlsZCAgICAgIHwgICAxICsNCiB0ZXN0cy9xdGVzdC9t
ZXNvbi5idWlsZCAgICAgICAgICAgICB8ICAgNCArDQogNiBmaWxlcyBjaGFuZ2VkLCAxMTc0IGlu
c2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvcXRlc3QvbGlicW9zL3Zob3N0
LXVzZXItYmxrLmgNCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvcXRlc3QvbGlicW9zL3Zob3N0
LXVzZXItYmxrLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvcXRlc3Qvdmhvc3QtdXNlci1i
bGstdGVzdC5jDQoNCi0tIA0KMi4zMC4yDQoNCg==


