Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA3E29920E
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 17:14:29 +0100 (CET)
Received: from localhost ([::1]:37940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX58e-0007FZ-UC
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 12:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kX4xK-0003Bw-9Y
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 12:02:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kX4xI-0005sO-JQ
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 12:02:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603728163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zn+pN59A0gckCjOQnh1z+idcXSYHD9BQQ2+zwP6kiYk=;
 b=BBQ+eCSQc/D6I9C4h2QMVjiDENz2+TlJmIlAa1SOzzOVIa2LUEFdCNRbRQE/laHkov7S0f
 5IurrTZmGOVxcxMGsmQt/Z+6DGxPmtwWrLxSRz2XvQLy0ESOgAmCa8bqetGNfPKR0kAlNU
 cvja4LhxHsRTg+yWOfSt6ui56JXKN4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-LFyCPfhVOgSLB47XSHU4PQ-1; Mon, 26 Oct 2020 12:02:33 -0400
X-MC-Unique: LFyCPfhVOgSLB47XSHU4PQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D01018C9F46;
 Mon, 26 Oct 2020 16:02:32 +0000 (UTC)
Received: from localhost (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 048035B4A4;
 Mon, 26 Oct 2020 16:02:28 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 2/2] Add execute bit back to scripts/tracetool.py
Date: Mon, 26 Oct 2020 16:02:21 +0000
Message-Id: <20201026160221.62704-3-stefanha@redhat.com>
In-Reply-To: <20201026160221.62704-1-stefanha@redhat.com>
References: <20201026160221.62704-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 02:39:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogQW50aG9ueSBQRVJBUkQgdmlhIDxxZW11LWRldmVsQG5vbmdudS5vcmc+CgpDb21taXQg
YTgxZGYxYjY4YjY1ICgibGlicWVtdXV0aWwsIHFhcGksIHRyYWNlOiBjb252ZXJ0IHRvIG1lc29u
IikKcmVtb3ZlZCBpdCB3aXRob3V0IGV4cGxhbmF0aW9uIGFuZCBpdCBpcyB1c2VmdWwgdG8gYmUg
YWJsZSB0byBydW4gYQpzY3JpcHQgd2l0aG91dCBoYXZpbmcgdG8gZmlndXJlIG91dCB3aGljaCBp
bnRlcnByZXRlciB0byB1c2UuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9u
eS5wZXJhcmRAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVm
YW5oYUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBo
aWxtZEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogRGFuaWVsIFAuIEJlcnJhbmfDqSA8YmVycmFu
Z2VAcmVkaGF0LmNvbT4KTWVzc2FnZS1JZDogPDIwMjAwOTIzMTAzNjIwLjE5ODAxNTEtMS1hbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIHNjcmlwdHMvdHJhY2V0b29sLnB5IHwgMAogMSBm
aWxlIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKIG1vZGUgY2hhbmdl
IDEwMDY0NCA9PiAxMDA3NTUgc2NyaXB0cy90cmFjZXRvb2wucHkKCmRpZmYgLS1naXQgYS9zY3Jp
cHRzL3RyYWNldG9vbC5weSBiL3NjcmlwdHMvdHJhY2V0b29sLnB5Cm9sZCBtb2RlIDEwMDY0NApu
ZXcgbW9kZSAxMDA3NTUKLS0gCjIuMjYuMgoK


