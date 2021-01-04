Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FE02E9731
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 15:25:36 +0100 (CET)
Received: from localhost ([::1]:34588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwQnf-0003zn-8t
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 09:25:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwQlR-0002Xr-TM
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 09:23:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwQlO-0006Gc-T4
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 09:23:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609770193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8TynmmRCpsEmNp/exZvqEylx0qp8iJRfV/+ljjYmpVk=;
 b=JxhrMrcZmPSowDf/Ez8tbzSIuaNR6DFdbFIOxqBk89qd+NwylWm1xNe6HIaxh8uC/4b8b7
 G6Mi0QV0mLqoUrW0WNTXnNjcqb8nQgp5xUJDjiLCCFVXE1A4PWb0MIGTH925n76FH94h8o
 SyMS0WAcQQabXeIIupoSI4IWPHO0tAU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-RTy-OUEzNMyk72GnLPTK-g-1; Mon, 04 Jan 2021 09:23:11 -0500
X-MC-Unique: RTy-OUEzNMyk72GnLPTK-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 053F4107ACE4;
 Mon,  4 Jan 2021 14:23:10 +0000 (UTC)
Received: from localhost (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 443EF19726;
 Mon,  4 Jan 2021 14:23:05 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 0/1] Block patches
Date: Mon,  4 Jan 2021 14:23:03 +0000
Message-Id: <20210104142304.461097-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA0MTE5MmRiMzM4NTg4MDUxZjIxNTAx
YWJjMTM3NDNlNjJiMGE1NjA1Og0KDQogIE1lcmdlIHJlbW90ZS10cmFja2luZyBicmFuY2ggJ3Jl
bW90ZXMvZWhhYmtvc3QtZ2wvdGFncy9tYWNoaW5lLW5leHQtcHVsbC1yZXF1ZXN0JyBpbnRvIHN0
YWdpbmcgKDIwMjEtMDEtMDEgMjI6NTc6MTUgKzAwMDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhl
IEdpdCByZXBvc2l0b3J5IGF0Og0KDQogIGh0dHBzOi8vZ2l0bGFiLmNvbS9zdGVmYW5oYS9xZW11
LmdpdCB0YWdzL2Jsb2NrLXB1bGwtcmVxdWVzdA0KDQpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMg
dXAgdG8gNTkzNjIxZjM2YjcxNmViMDkxYzRlYzc5MWRiNzJkZDQ0NjE3ODlkYToNCg0KICByZWFk
bGluZTogRml4IHBvc3NpYmxlIGFycmF5IGluZGV4IG91dCBvZiBib3VuZHMgaW4gcmVhZGxpbmVf
aGlzdF9hZGQoKSAoMjAyMS0wMS0wNCAxMToxMzozOSArMDAwMCkNCg0KLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KUHVsbCBy
ZXF1ZXN0DQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCg0KQWxleCBDaGVuICgxKToNCiAgcmVhZGxpbmU6IEZpeCBwb3Nz
aWJsZSBhcnJheSBpbmRleCBvdXQgb2YgYm91bmRzIGluDQogICAgcmVhZGxpbmVfaGlzdF9hZGQo
KQ0KDQogdXRpbC9yZWFkbGluZS5jIHwgMyArKysNCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspDQoNCi0tIA0KMi4yOS4yDQoNCg==


