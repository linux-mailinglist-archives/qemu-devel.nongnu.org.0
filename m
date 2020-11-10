Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8584A2ADCAF
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 18:16:55 +0100 (CET)
Received: from localhost ([::1]:43168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcXGI-0006k2-J4
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 12:16:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcXBR-0002dd-Pg
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:11:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcXBO-0001e1-27
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:11:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605028309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lijNlQoal5CZP324ogddw/V1oy4mBUppSaqJxytQpOE=;
 b=VBpFxVQ/wneP6oE+X86ZYzVee4hqXWknBBUcqmbMwJGUiYzAMLomkY2m4JlCfpMFoe/8bL
 LMFwBWDIC+7L+alT9H0kwIi2l1TNSr2nBpJS4T4iEBLHzIA0BHGhbFVh9m8SMcHsMLQszl
 OjTx2obAH0jaC6rft45EH8WtV30fjYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-b4uD9JWLN7OhBdW4TuecsQ-1; Tue, 10 Nov 2020 12:11:47 -0500
X-MC-Unique: b4uD9JWLN7OhBdW4TuecsQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D4DF1006C9D;
 Tue, 10 Nov 2020 17:11:46 +0000 (UTC)
Received: from localhost (ovpn-114-36.ams2.redhat.com [10.36.114.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44DBF1002C09;
 Tue, 10 Nov 2020 17:11:39 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] vhost-user-blk-server: depend on CONFIG_VHOST_USER
Date: Tue, 10 Nov 2020 17:11:20 +0000
Message-Id: <20201110171121.1265142-3-stefanha@redhat.com>
In-Reply-To: <20201110171121.1265142-1-stefanha@redhat.com>
References: <20201110171121.1265142-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SSBpbnRlcnByZXRlZCBDT05GSUdfVkhPU1RfVVNFUiBhcyBjb250cm9sbGluZyBvbmx5IFFFTVUn
cyB2aG9zdC11c2VyCmRldmljZSBmcm9udGVuZHMuIEhvd2V2ZXIsIHZpcnRpb2ZzZCBhbmQgY29u
dHJpYi8gdmhvc3QtdXNlciBkZXZpY2UKYmFja2VuZHMgYXJlIGFsc28gY29udHJvbGxlZCBieSBD
T05GSUdfVkhPU1RfVVNFUi4gTWFrZSB0aGUKdmhvc3QtdXNlci1ibGsgc2VydmVyIGRlcGVuZCBv
biBDT05GSUdfVkhPU1RfVVNFUiBmb3IgY29uc2lzdGVuY3kuCgpOb3cgdGhlIGZvbGxvd2luZyBl
cnJvciBpcyBwcmludGVkIHdoZW4gdGhlIHZob3N0LXVzZXItYmxrIHNlcnZlciBpcwplbmFibGVk
IHdpdGhvdXQgQ09ORklHX1ZIT1NUX1VTRVI6CgogICQgLi9jb25maWd1cmUgLS1kaXNhYmxlLXZo
b3N0LXVzZXIgLS1lbmFibGUtdmhvc3QtdXNlci1ibGsgLi4uCiAgLi4vbWVzb24uYnVpbGQ6NzYx
Ojg6IEVSUk9SOiBQcm9ibGVtIGVuY291bnRlcmVkOiB2aG9zdF91c2VyX2Jsa19zZXJ2ZXIgcmVx
dWlyZXMgdmhvc3QtdXNlciBzdXBwb3J0CgpTdWdnZXN0ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KU3VnZ2VzdGVkLWJ5OiBBbGV4IEJlbm7DqWUgPGFs
ZXguYmVubmVlQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3Rl
ZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBtZXNvbi5idWlsZCB8IDUgKysrKy0KIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXNvbi5i
dWlsZCBiL21lc29uLmJ1aWxkCmluZGV4IDRmNWM5MTY1NTcuLmVlMzcxOWRhMzkgMTAwNjQ0Ci0t
LSBhL21lc29uLmJ1aWxkCisrKyBiL21lc29uLmJ1aWxkCkBAIC03NTEsMTEgKzc1MSwxNCBAQCBz
dGF0eF90ZXN0ID0gJycnCiAKIGhhc19zdGF0eCA9IGNjLmxpbmtzKHN0YXR4X3Rlc3QpCiAKLWhh
dmVfdmhvc3RfdXNlcl9ibGtfc2VydmVyID0gKHRhcmdldG9zID09ICdsaW51eCcpCitoYXZlX3Zo
b3N0X3VzZXJfYmxrX3NlcnZlciA9ICh0YXJnZXRvcyA9PSAnbGludXgnIGFuZAorICAgICdDT05G
SUdfVkhPU1RfVVNFUicgaW4gY29uZmlnX2hvc3QpCiAKIGlmIGdldF9vcHRpb24oJ3Zob3N0X3Vz
ZXJfYmxrX3NlcnZlcicpLmVuYWJsZWQoKQogICAgIGlmIHRhcmdldG9zICE9ICdsaW51eCcKICAg
ICAgICAgZXJyb3IoJ3Zob3N0X3VzZXJfYmxrX3NlcnZlciByZXF1aXJlcyBsaW51eCcpCisgICAg
ZWxpZiAnQ09ORklHX1ZIT1NUX1VTRVInIG5vdCBpbiBjb25maWdfaG9zdAorICAgICAgICBlcnJv
cigndmhvc3RfdXNlcl9ibGtfc2VydmVyIHJlcXVpcmVzIHZob3N0LXVzZXIgc3VwcG9ydCcpCiAg
ICAgZW5kaWYKIGVsaWYgZ2V0X29wdGlvbigndmhvc3RfdXNlcl9ibGtfc2VydmVyJykuZGlzYWJs
ZWQoKSBvciBub3QgaGF2ZV9zeXN0ZW0KICAgICBoYXZlX3Zob3N0X3VzZXJfYmxrX3NlcnZlciA9
IGZhbHNlCi0tIAoyLjI4LjAKCg==


