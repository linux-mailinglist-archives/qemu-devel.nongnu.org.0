Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD402070AE
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 12:04:17 +0200 (CEST)
Received: from localhost ([::1]:39866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo2GO-0002t8-53
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 06:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jo2Ee-00015v-Kh
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:02:28 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:31060
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jo2Ec-0003V4-Ka
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:02:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592992946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bwiDOfVjE/FAb1b/x87NcnJ24Pw7FqnMOItBaWEB77k=;
 b=FruaT+8uNHy1RDO+FN69wwME6KnKYqIepx6K0fRZLlJzqtMNjzquEv9EZmhZlcELji4C6x
 WYRiJnMFPEso/zshBOv5h6Ryi2+wJXKz5K5RerVcIB0QvCHkRQjIGTCEY+hOkFrrm52XyS
 RFiNXSH5XeACCQSHnoUce2t3OlOqP+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-j12izr9NP1O68XIksyYgog-1; Wed, 24 Jun 2020 06:02:21 -0400
X-MC-Unique: j12izr9NP1O68XIksyYgog-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFF3D1B18BC3;
 Wed, 24 Jun 2020 10:02:20 +0000 (UTC)
Received: from localhost (ovpn-114-150.ams2.redhat.com [10.36.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 919C47FE87;
 Wed, 24 Jun 2020 10:02:16 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/12] minikconf: explicitly set encoding to UTF-8
Date: Wed, 24 Jun 2020 11:01:59 +0100
Message-Id: <20200624100210.59975-2-stefanha@redhat.com>
In-Reply-To: <20200624100210.59975-1-stefanha@redhat.com>
References: <20200624100210.59975-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.211.31.81; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 01:59:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UUVNVSBjdXJyZW50bHkgb25seSBoYXMgQVNDSUkgS2NvbmZpZyBmaWxlcyBidXQgTGludXggYWN0
dWFsbHkgdXNlcwpVVEYtOC4gRXhwbGljaXRseSBzcGVjaWZ5IHRoZSBlbmNvZGluZyBhbmQgdGhh
dCB3ZSdyZSBkb2luZyB0ZXh0IGZpbGUKSS9PLgoKSXQncyB1bmNsZWFyIHdoZXRoZXIgb3Igbm90
IFFFTVUgd2lsbCBldmVyIG5lZWQgVW5pY29kZSBpbiBpdHMgS2NvbmZpZwpmaWxlcy4gSWYgd2Ug
c3RhcnQgdXNpbmcgdGhlIGhlbHAgdGV4dCB0aGVuIGl0IHdpbGwgYmVjb21lIGFuIGlzc3VlCnNv
b25lciBvciBsYXRlci4gTWFrZSB0aGlzIGNoYW5nZSBub3cgZm9yIGNvbnNpc3RlbmN5IHdpdGgg
TGludXgKS2NvbmZpZy4KClJlcG9ydGVkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhp
bG1kQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFA
cmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRl
cnNvbkBsaW5hcm8ub3JnPgpNZXNzYWdlLWlkOiAyMDIwMDUyMTE1MzYxNi4zMDcxMDAtMS1zdGVm
YW5oYUByZWRoYXQuY29tClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFA
cmVkaGF0LmNvbT4KLS0tCiBzY3JpcHRzL21pbmlrY29uZi5weSB8IDYgKysrLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Nj
cmlwdHMvbWluaWtjb25mLnB5IGIvc2NyaXB0cy9taW5pa2NvbmYucHkKaW5kZXggOTBiOTk1MTdj
MS4uYmNkOTEwMTVkMyAxMDA3NTUKLS0tIGEvc2NyaXB0cy9taW5pa2NvbmYucHkKKysrIGIvc2Ny
aXB0cy9taW5pa2NvbmYucHkKQEAgLTQwMiw3ICs0MDIsNyBAQCBjbGFzcyBLY29uZmlnUGFyc2Vy
OgogICAgICAgICBpZiBpbmNsX2Fic19mbmFtZSBpbiBzZWxmLmRhdGEucHJldmlvdXNseV9pbmNs
dWRlZDoKICAgICAgICAgICAgIHJldHVybgogICAgICAgICB0cnk6Ci0gICAgICAgICAgICBmcCA9
IG9wZW4oaW5jbF9hYnNfZm5hbWUsICdyJykKKyAgICAgICAgICAgIGZwID0gb3BlbihpbmNsX2Fi
c19mbmFtZSwgJ3J0JywgZW5jb2Rpbmc9J3V0Zi04JykKICAgICAgICAgZXhjZXB0IElPRXJyb3Ig
YXMgZToKICAgICAgICAgICAgIHJhaXNlIEtjb25maWdQYXJzZXJFcnJvcihzZWxmLAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAnJXM6ICVzJyAlIChlLnN0cmVycm9yLCBpbmNsdWRl
KSkKQEAgLTY5Niw3ICs2OTYsNyBAQCBpZiBfX25hbWVfXyA9PSAnX19tYWluX18nOgogICAgICAg
ICAgICAgcGFyc2VyLmRvX2Fzc2lnbm1lbnQobmFtZSwgdmFsdWUgPT0gJ3knKQogICAgICAgICAg
ICAgZXh0ZXJuYWxfdmFycy5hZGQobmFtZVs3Ol0pCiAgICAgICAgIGVsc2U6Ci0gICAgICAgICAg
ICBmcCA9IG9wZW4oYXJnLCAncicpCisgICAgICAgICAgICBmcCA9IG9wZW4oYXJnLCAncnQnLCBl
bmNvZGluZz0ndXRmLTgnKQogICAgICAgICAgICAgcGFyc2VyLnBhcnNlX2ZpbGUoZnApCiAgICAg
ICAgICAgICBmcC5jbG9zZSgpCiAKQEAgLTcwNSw3ICs3MDUsNyBAQCBpZiBfX25hbWVfXyA9PSAn
X19tYWluX18nOgogICAgICAgICBpZiBrZXkgbm90IGluIGV4dGVybmFsX3ZhcnMgYW5kIGNvbmZp
Z1trZXldOgogICAgICAgICAgICAgcHJpbnQgKCdDT05GSUdfJXM9eScgJSBrZXkpCiAKLSAgICBk
ZXBzID0gb3Blbihhcmd2WzJdLCAndycpCisgICAgZGVwcyA9IG9wZW4oYXJndlsyXSwgJ3d0Jywg
ZW5jb2Rpbmc9J3V0Zi04JykKICAgICBmb3IgZm5hbWUgaW4gZGF0YS5wcmV2aW91c2x5X2luY2x1
ZGVkOgogICAgICAgICBwcmludCAoJyVzOiAlcycgJSAoYXJndlsxXSwgZm5hbWUpLCBmaWxlPWRl
cHMpCiAgICAgZGVwcy5jbG9zZSgpCi0tIAoyLjI2LjIKCg==


