Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B844235C8DE
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 16:36:42 +0200 (CEST)
Received: from localhost ([::1]:35130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVxg9-0006IM-Pk
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 10:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lVxeW-0005NY-5P
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:35:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lVxeR-0007sn-Ki
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618238093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fL35kfUtJ0fm9TNmvvTQ9YaZ2VuWHcNbHajP0cJpT74=;
 b=DDi+10mmvoIeXddjgv3NoLNVUkKtFPaDUSxmCknBQAV9l3eR1zROCNeXZ0q0ocB4XcfwbR
 lIOPfMT+Q82Eiqf3abKyxzXvmasPkNavFjYEd3O7bHUV2c1fiTswg1ihs6+cPOby/mSEuL
 clMRy6evRRBCFh32PIQQLR1GpEn5xxA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-iTUYNAlBMwyl4FZYhg48Lg-1; Mon, 12 Apr 2021 10:34:51 -0400
X-MC-Unique: iTUYNAlBMwyl4FZYhg48Lg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90AF48030A1
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 14:34:50 +0000 (UTC)
Received: from localhost (ovpn-115-66.ams2.redhat.com [10.36.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C33D95D9F0;
 Mon, 12 Apr 2021 14:34:46 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] libqos/qgraph: fix "UNAVAILBLE" typo
Date: Mon, 12 Apr 2021 15:34:36 +0100
Message-Id: <20210412143437.727560-2-stefanha@redhat.com>
In-Reply-To: <20210412143437.727560-1-stefanha@redhat.com>
References: <20210412143437.727560-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Q2M6IEVtYW51ZWxlIEdpdXNlcHBlIEVzcG9zaXRvIDxlZXNwb3NpdEByZWRoYXQuY29tPgpDYzog
UGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogU3RlZmFu
IEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0
aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgotLS0KIHRlc3RzL3F0ZXN0L2xpYnFvcy9x
Z3JhcGguYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3F0ZXN0L2xpYnFvcy9xZ3JhcGguYyBiL3Rlc3RzL3F0
ZXN0L2xpYnFvcy9xZ3JhcGguYwppbmRleCBiM2IxYTMxZjgxLi5kMWRjNDkxOTMwIDEwMDY0NAot
LS0gYS90ZXN0cy9xdGVzdC9saWJxb3MvcWdyYXBoLmMKKysrIGIvdGVzdHMvcXRlc3QvbGlicW9z
L3FncmFwaC5jCkBAIC04NDQsNyArODQ0LDcgQEAgdm9pZCBxb3NfZHVtcF9ncmFwaCh2b2lkKQog
ICAgICAgICB9CiAgICAgICAgIHFvc19wcmludGZfbGl0ZXJhbCgidHlwZT0lZCBjbWRfbGluZT0n
JXMnIFslc11cbiIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBub2RlLT50eXBlLCBub2Rl
LT5jb21tYW5kX2xpbmUsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICBub2RlLT5hdmFpbGFi
bGUgPyAiYXZhaWxhYmxlIiA6ICJVTkFWQUlMQkxFIgorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbm9kZS0+YXZhaWxhYmxlID8gImF2YWlsYWJsZSIgOiAiVU5BVkFJTEFCTEUiCiAgICAgICAg
ICk7CiAgICAgfQogICAgIGdfbGlzdF9mcmVlKGtleXMpOwotLSAKMi4zMC4yCgo=


