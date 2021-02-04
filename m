Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F2930F020
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:05:15 +0100 (CET)
Received: from localhost ([::1]:53012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7bVi-0008Ta-Ur
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:05:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7bQ4-0002yQ-6D
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:59:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7bQ1-0000NG-KL
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:59:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612432761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m7dZni2i+uZBavmkjw8lvHqwUAtD09j5zH6NzjMwesI=;
 b=IwtCoahnrqmn+ESFlmFsfyw8sGU3TdI2qUQ2Jaor2bPjeo3LdbY6hJozVXinuqqKmJksCX
 gYZ+iMcCwPhBx/1ZqvaXHR4h8hA03NaGxR60sm9Ppb0fVywG4gUA51oQzZnYI8pfwVLjze
 X/Ptxohvmm7EdHsCLgN8h8k7a3kf2vE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-BR76tRvLPBm-2mg_L0ExaQ-1; Thu, 04 Feb 2021 04:59:18 -0500
X-MC-Unique: BR76tRvLPBm-2mg_L0ExaQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 064C4189DF58;
 Thu,  4 Feb 2021 09:59:16 +0000 (UTC)
Received: from localhost (ovpn-115-89.ams2.redhat.com [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D204D60C71;
 Thu,  4 Feb 2021 09:59:06 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 03/27] gitlab-ci: remove redundant GitLab repo URL command
Date: Thu,  4 Feb 2021 09:58:10 +0000
Message-Id: <20210204095834.345749-4-stefanha@redhat.com>
In-Reply-To: <20210204095834.345749-1-stefanha@redhat.com>
References: <20210204095834.345749-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 John G Johnson <john.g.johnson@oracle.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SXQgaXMgbm8gbG9uZ2VyIG5lY2Vzc2FyeSB0byBwb2ludCAuZ2l0bW9kdWxlcyBhdCBHaXRMYWIg
cmVwb3Mgd2hlbgpydW5uaW5nIGluIEdpdExhYiBDSSBzaW5jZSB0aGV5IGFyZSBub3cgdXNlZCBh
bGwgdGhlIHRpbWUuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJl
ZGhhdC5jb20+ClJldmlld2VkLWJ5OiBXYWluZXIgZG9zIFNhbnRvcyBNb3NjaGV0dGEgPHdhaW5l
cnNtQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNv
bT4KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNv
bT4KTWVzc2FnZS1pZDogMjAyMTAxMTExMTUwMTcuMTU2ODAyLTQtc3RlZmFuaGFAcmVkaGF0LmNv
bQpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0t
LQogLmdpdGxhYi1jaS55bWwgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvLmdpdGxhYi1jaS55bWwgYi8uZ2l0bGFiLWNpLnltbAppbmRleCA3YzBkYjY0
NzEwLi4yOGE4M2FmYjkxIDEwMDY0NAotLS0gYS8uZ2l0bGFiLWNpLnltbAorKysgYi8uZ2l0bGFi
LWNpLnltbApAQCAtMTgsNyArMTgsNiBAQCBpbmNsdWRlOgogICBpbWFnZTogJENJX1JFR0lTVFJZ
X0lNQUdFL3FlbXUvJElNQUdFOmxhdGVzdAogICBiZWZvcmVfc2NyaXB0OgogICAgIC0gSk9CUz0k
KGV4cHIgJChucHJvYykgKyAxKQotICAgIC0gc2VkIC1pIHMsZ2l0LnFlbXUub3JnL2dpdCxnaXRs
YWIuY29tL3FlbXUtcHJvamVjdCwgLmdpdG1vZHVsZXMKICAgc2NyaXB0OgogICAgIC0gbWtkaXIg
YnVpbGQKICAgICAtIGNkIGJ1aWxkCi0tIAoyLjI5LjIKCg==


