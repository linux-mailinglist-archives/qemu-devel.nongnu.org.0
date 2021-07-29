Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 549753DA8EC
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 18:25:09 +0200 (CEST)
Received: from localhost ([::1]:51366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m98qK-0002cH-Cc
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 12:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m98oZ-0000Mx-2J
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:23:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m98oX-0003yM-EH
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:23:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627575796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VDTPop5rVOr45HBczV+F+W1m8XDQUvEf/1x0A1jvx4A=;
 b=NcUerNLn4wbsCNrFZXvu1AwHowdVXxZ2a6KNyAK+0CU+g6apbWcAQiuoSUP0lEWCFRz+72
 Rc+qRiY4v43t+DnQB/lEU3LBEXVBa0qWLYTtwG4359u+JSQXS27xm6RRDGgLGHdLQHRJDa
 MnxvThkh527ls+onIq17mB1zmimPgxU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-1K2yLu37Ooq_4fbHz0hNNw-1; Thu, 29 Jul 2021 12:22:57 -0400
X-MC-Unique: 1K2yLu37Ooq_4fbHz0hNNw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10577800D55;
 Thu, 29 Jul 2021 16:22:56 +0000 (UTC)
Received: from localhost (unknown [10.39.194.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA07760875;
 Thu, 29 Jul 2021 16:22:48 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.1 1/3] MAINTAINERS: add Stefano Garzarella as io_uring
 reviewer
Date: Thu, 29 Jul 2021 17:22:37 +0100
Message-Id: <20210729162239.932125-2-stefanha@redhat.com>
In-Reply-To: <20210729162239.932125-1-stefanha@redhat.com>
References: <20210729162239.932125-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Julia Suvorova <jusual@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogU3RlZmFubyBHYXJ6YXJlbGxhIDxzZ2FyemFyZUByZWRoYXQuY29tPgoKSSd2ZSBiZWVu
IHdvcmtpbmcgd2l0aCBpb191cmluZyBmb3IgYSB3aGlsZSBzbyBJJ2QgbGlrZSB0byBoZWxwCndp
dGggcmV2aWV3cy4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gR2FyemFyZWxsYSA8c2dhcnphcmVA
cmVkaGF0LmNvbT4KTWVzc2FnZS1JZDogPDIwMjEwNzI4MTMxNTE1LjEzMTA0NS0xLXNnYXJ6YXJl
QHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVk
aGF0LmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCA0MmFj
NDVjM2U1Li4xNzc2ZDA5NTBiIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJ
TkVSUwpAQCAtMzI1Nyw2ICszMjU3LDcgQEAgTGludXggaW9fdXJpbmcKIE06IEFhcnVzaGkgTWVo
dGEgPG1laHRhLmFhcnUyMEBnbWFpbC5jb20+CiBNOiBKdWxpYSBTdXZvcm92YSA8anVzdWFsQHJl
ZGhhdC5jb20+CiBNOiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+CitSOiBT
dGVmYW5vIEdhcnphcmVsbGEgPHNnYXJ6YXJlQHJlZGhhdC5jb20+CiBMOiBxZW11LWJsb2NrQG5v
bmdudS5vcmcKIFM6IE1haW50YWluZWQKIEY6IGJsb2NrL2lvX3VyaW5nLmMKLS0gCjIuMzEuMQoK


