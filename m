Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98EC263F74
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 10:14:14 +0200 (CEST)
Received: from localhost ([::1]:57150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGHif-0006MP-Qv
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 04:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kGHgW-0002jV-QD
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 04:12:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kGHgV-0002y7-4j
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 04:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599725518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8RRjpvYPCcfDxxO0ofYqEkm/yCYLWT9vZIQ9mkRtceg=;
 b=PIt1smFKxphzF+v1fBnzJCOiHoJvgllhaTzsFQ3vm6RAZee5e928My/Kcgc9PzI8dfiqH6
 X9RoAm/whNDxRQDWwTuH3iOFbaiTupnhDFgWHVPppFwTS5aSWUVIkp+a7CWi4xyRYzkjnH
 UfQ8IIEirtOr3r2C1u0QYduQKQFMDo0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-Lb2dyaXXNISYESApfU67aQ-1; Thu, 10 Sep 2020 04:11:56 -0400
X-MC-Unique: Lb2dyaXXNISYESApfU67aQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2950D1084C82;
 Thu, 10 Sep 2020 08:11:55 +0000 (UTC)
Received: from localhost (ovpn-112-28.ams2.redhat.com [10.36.112.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C86375C22E;
 Thu, 10 Sep 2020 08:11:54 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 6/8] scripts/cleanup-trace-events: Emit files in
 alphabetical order
Date: Thu, 10 Sep 2020 09:10:47 +0100
Message-Id: <20200910081049.38393-7-stefanha@redhat.com>
In-Reply-To: <20200910081049.38393-1-stefanha@redhat.com>
References: <20200910081049.38393-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 00:49:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogTWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPgoKU2lnbmVkLW9mZi1i
eTogTWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPgpNZXNzYWdlLWlkOiAyMDIw
MDgwNjE0MTMzNC4zNjQ2MzAyLTMtYXJtYnJ1QHJlZGhhdC5jb20KU2lnbmVkLW9mZi1ieTogU3Rl
ZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIHNjcmlwdHMvY2xlYW51cC10
cmFjZS1ldmVudHMucGwgfCAxMyArKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvY2xlYW51cC10
cmFjZS1ldmVudHMucGwgYi9zY3JpcHRzL2NsZWFudXAtdHJhY2UtZXZlbnRzLnBsCmluZGV4IDZj
Mzc2N2JkNmEuLmM0MGQyZmNjNTAgMTAwNzU1Ci0tLSBhL3NjcmlwdHMvY2xlYW51cC10cmFjZS1l
dmVudHMucGwKKysrIGIvc2NyaXB0cy9jbGVhbnVwLXRyYWNlLWV2ZW50cy5wbApAQCAtMTUsMTIg
KzE1LDE1IEBAIHVzZSB3YXJuaW5nczsKIHVzZSBzdHJpY3Q7CiB1c2UgRmlsZTo6QmFzZW5hbWU7
CiAKLW15ICRidWYgPSAnJzsKK215IEBmaWxlcyA9ICgpOworbXkgJGV2ZW50cyA9ICcnOwogbXkg
JXNlZW4gPSAoKTsKIAogc3ViIG91dCB7Ci0gICAgcHJpbnQgJGJ1ZjsKLSAgICAkYnVmID0gJyc7
CisgICAgcHJpbnQgc29ydCBAZmlsZXM7CisgICAgcHJpbnQgJGV2ZW50czsKKyAgICBAZmlsZXMg
PSAoKTsKKyAgICAkZXZlbnRzID0gJyc7CiAgICAgJXNlZW4gPSAoKTsKIH0KIApAQCAtNDIsNyAr
NDUsNyBAQCB3aGlsZSAoPElOPikgewogICAgICAgICAgICAgY2hvbXAgJGZuYW1lOwogICAgICAg
ICAgICAgbmV4dCBpZiAkc2VlbnskZm5hbWV9IHx8ICRmbmFtZSBlcSAndHJhY2UtZXZlbnRzJzsK
ICAgICAgICAgICAgICRzZWVueyRmbmFtZX0gPSAxOwotICAgICAgICAgICAgJGJ1ZiA9ICIjICRm
bmFtZVxuIiAuICRidWY7CisgICAgICAgICAgICBwdXNoIEBmaWxlcywgIiMgJGZuYW1lXG4iOwog
ICAgICAgICB9CiAgICAgICAgIHVubGVzcyAoY2xvc2UgR1JFUCkgewogICAgICAgICAgICAgZGll
ICJjbG9zZSBnaXQgZ3JlcDogJCEiCkBAIC01NSw3ICs1OCw3IEBAIHdoaWxlICg8SU4+KSB7CiAg
ICAgfSBlbHNpZiAoIS9eI3xeJC8pIHsKICAgICAgICAgd2FybiAidW5pbnRlbGxpZ2libGUgbGlu
ZSI7CiAgICAgfQotICAgICRidWYgLj0gJF87CisgICAgJGV2ZW50cyAuPSAkXzsKIH0KIAogb3V0
OwotLSAKMi4yNi4yCgo=


