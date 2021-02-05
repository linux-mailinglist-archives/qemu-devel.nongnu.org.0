Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FD3310E37
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:57:32 +0100 (CET)
Received: from localhost ([::1]:49408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84QF-0001rz-Ct
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l84F8-0000lX-Hv
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:46:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l84Ew-0006IJ-4R
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:45:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612543549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m7dZni2i+uZBavmkjw8lvHqwUAtD09j5zH6NzjMwesI=;
 b=WvZDB3ESIYw7xYatTOpaA1iSeLTbKT7byHmFkspL2ffMGOp6YNenMrkcy+fY94GDcufTRF
 R+uZll+BN/iBo62ltBMZhxZRzX3UItp1/yh0X47a/gZq+XC7gWGuSL+5PvC7YtbGNtqH4w
 h4e3Y9y+lo5XlKWh9X2fjUtN17rSsF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-1t9-zhNNN-WXcqb9jASWjg-1; Fri, 05 Feb 2021 11:45:45 -0500
X-MC-Unique: 1t9-zhNNN-WXcqb9jASWjg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F5CB10074B0;
 Fri,  5 Feb 2021 16:45:43 +0000 (UTC)
Received: from localhost (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A74E75D71D;
 Fri,  5 Feb 2021 16:45:33 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v3 03/27] gitlab-ci: remove redundant GitLab repo URL command
Date: Fri,  5 Feb 2021 16:44:35 +0000
Message-Id: <20210205164459.432714-4-stefanha@redhat.com>
In-Reply-To: <20210205164459.432714-1-stefanha@redhat.com>
References: <20210205164459.432714-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 Thomas Huth <thuth@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
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


