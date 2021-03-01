Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00423287C0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 18:30:12 +0100 (CET)
Received: from localhost ([::1]:47554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGmMv-0008B8-TU
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 12:30:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGmKl-0006r4-B8
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:27:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGmKi-0002qG-EG
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:27:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614619667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+h3J6lyrpjo1RCh6voyew/14pVr4vkeu6sfRh9qJ2o0=;
 b=dPUCQG/+4KasVAJuHf90Bz+Ob+75DGAZ07nFSz9495+7KtKRBS3/tu91yDRv6eyo1pSz5H
 k3JI9OzjOBsbuoth6pCxdlR7jABxIV410wCWftXTIJ3e9mNDLm0xVFPsPp4BCPXSoO2wWd
 De7M5qq8+lR716B64n3ls58/pkANzGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-SSguEFBGMxuYi3Ina3W-Ng-1; Mon, 01 Mar 2021 12:27:45 -0500
X-MC-Unique: SSguEFBGMxuYi3Ina3W-Ng-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2D9B80197C;
 Mon,  1 Mar 2021 17:27:44 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F7305D6CF;
 Mon,  1 Mar 2021 17:27:41 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] docs: replace insecure /tmp examples in qsd docs
Date: Mon,  1 Mar 2021 17:27:28 +0000
Message-Id: <20210301172728.135331-3-stefanha@redhat.com>
In-Reply-To: <20210301172728.135331-1-stefanha@redhat.com>
References: <20210301172728.135331-1-stefanha@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

V29ybGQtd3JpdGVhYmxlIGRpcmVjdG9yaWVzIGhhdmUgc2VjdXJpdHkgaXNzdWVzLiBBdm9pZCBz
aG93aW5nIHRoZW0gaW4KdGhlIGRvY3VtZW50YXRpb24gc2luY2Ugc29tZW9uZSBtaWdodCBhY2Np
ZGVudGFsbHkgdXNlIHRoZW0gaW4Kc2l0dWF0aW9ucyB3aGVyZSB0aGV5IGFyZSBpbnNlY3VyZS4K
ClRoZXJlIHRlbmQgdG8gYmUgMyBzZWN1cml0eSBwcm9ibGVtczoKMS4gRGVuaWFsIG9mIHNlcnZp
Y2UuIEFuIGFkdmVyc2FyeSBtYXkgYmUgYWJsZSB0byBjcmVhdGUgdGhlIGZpbGUKICAgYmVmb3Jl
aGFuZCwgY29uc3VtZSBhbGwgc3BhY2UvaW5vZGVzLCBldGMgdG8gc2Fib3RhZ2UgdXMuCjIuIElt
cGVyc29uYXRpb24uIEFuIGFkdmVyc2FyeSBtYXkgYmUgYWJsZSB0byBjcmVhdGUgYSBsaXN0ZW4g
c29ja2V0IGFuZAogICBhY2NlcHQgaW5jb21pbmcgY29ubmVjdGlvbnMgdGhhdCB3ZXJlIG1lYW50
IGZvciB1cy4KMy4gVW5hdXRoZW50aWNhdGVkIGNsaWVudCBhY2Nlc3MuIEFuIGFkdmVyc2FyeSBt
YXkgYmUgYWJsZSB0byBjb25uZWN0IHRvCiAgIHVzIGlmIHdlIGRpZCBub3Qgc2V0IHRoZSB1aWQv
Z2lkIGFuZCBwZXJtaXNzaW9ucyBjb3JyZWN0bHkuCgpUaGVzZSBjYW4gYmUgcHJldmVudGVkIG9y
IG1pdGlnYXRlZCB3aXRoIHByaXZhdGUgL3RtcCwgY2FyZWZ1bGx5IHNldHRpbmcKdGhlIHVtYXNr
LCBldGMgYnV0IHRoYXQgcmVxdWlyZXMgc3BlY2lhbCBhY3Rpb24gYW5kIGRvZXMgbm90IGFwcGx5
IHRvCmFsbCBzaXR1YXRpb25zLiBKdXN0IGF2b2lkIHVzaW5nIC90bXAgaW4gZXhhbXBsZXMuCgpS
ZXBvcnRlZC1ieTogUmljaGFyZCBXLk0uIEpvbmVzIDxyam9uZXNAcmVkaGF0LmNvbT4KUmVwb3J0
ZWQtYnk6IERhbmllbCBQLiBCZXJyYW5nw6kgPGJlcnJhbmdlQHJlZGhhdC5jb20+ClNpZ25lZC1v
ZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBkb2NzL3Rv
b2xzL3FlbXUtc3RvcmFnZS1kYWVtb24ucnN0IHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RvY3MvdG9vbHMv
cWVtdS1zdG9yYWdlLWRhZW1vbi5yc3QgYi9kb2NzL3Rvb2xzL3FlbXUtc3RvcmFnZS1kYWVtb24u
cnN0CmluZGV4IDc4OWE4ZTRhNzUuLjJkYTI4YTQ0N2EgMTAwNjQ0Ci0tLSBhL2RvY3MvdG9vbHMv
cWVtdS1zdG9yYWdlLWRhZW1vbi5yc3QKKysrIGIvZG9jcy90b29scy9xZW11LXN0b3JhZ2UtZGFl
bW9uLnJzdApAQCAtNjksNyArNjksNyBAQCBTdGFuZGFyZCBvcHRpb25zOgogICBhIGRlc2NyaXB0
aW9uIG9mIGNoYXJhY3RlciBkZXZpY2UgcHJvcGVydGllcy4gQSBjb21tb24gY2hhcmFjdGVyIGRl
dmljZQogICBkZWZpbml0aW9uIGNvbmZpZ3VyZXMgYSBVTklYIGRvbWFpbiBzb2NrZXQ6OgogCi0g
IC0tY2hhcmRldiBzb2NrZXQsaWQ9Y2hhcjEscGF0aD0vdG1wL3FtcC5zb2NrLHNlcnZlcixub3dh
aXQKKyAgLS1jaGFyZGV2IHNvY2tldCxpZD1jaGFyMSxwYXRoPS92YXIvcnVuL3FzZC1xbXAuc29j
ayxzZXJ2ZXIsbm93YWl0CiAKIC4uIG9wdGlvbjo6IC0tZXhwb3J0IFt0eXBlPV1uYmQsaWQ9PGlk
Pixub2RlLW5hbWU9PG5vZGUtbmFtZT5bLG5hbWU9PGV4cG9ydC1uYW1lPl1bLHdyaXRhYmxlPW9u
fG9mZl1bLGJpdG1hcD08bmFtZT5dCiAgIC0tZXhwb3J0IFt0eXBlPV12aG9zdC11c2VyLWJsayxp
ZD08aWQ+LG5vZGUtbmFtZT08bm9kZS1uYW1lPixhZGRyLnR5cGU9dW5peCxhZGRyLnBhdGg9PHNv
Y2tldC1wYXRoPlssd3JpdGFibGU9b258b2ZmXVssbG9naWNhbC1ibG9jay1zaXplPTxibG9jay1z
aXplPl1bLG51bS1xdWV1ZXM9PG51bS1xdWV1ZXM+XQpAQCAtMTA4LDkgKzEwOCwxMCBAQCBTdGFu
ZGFyZCBvcHRpb25zOgogICBiZWxvdykuIFRMUyBlbmNyeXB0aW9uIGNhbiBiZSBjb25maWd1cmVk
IHVzaW5nIGBgLS1vYmplY3RgYCB0bHMtY3JlZHMtKiBhbmQKICAgYXV0aHotKiBzZWNyZXRzIChz
ZWUgYmVsb3cpLgogCi0gIFRvIGNvbmZpZ3VyZSBhbiBOQkQgc2VydmVyIG9uIFVOSVggZG9tYWlu
IHNvY2tldCBwYXRoIGBgL3RtcC9uYmQuc29ja2BgOjoKKyAgVG8gY29uZmlndXJlIGFuIE5CRCBz
ZXJ2ZXIgb24gVU5JWCBkb21haW4gc29ja2V0IHBhdGgKKyAgYGAvdmFyL3J1bi9xc2QtbmJkLnNv
Y2tgYDo6CiAKLSAgLS1uYmQtc2VydmVyIGFkZHIudHlwZT11bml4LGFkZHIucGF0aD0vdG1wL25i
ZC5zb2NrCisgIC0tbmJkLXNlcnZlciBhZGRyLnR5cGU9dW5peCxhZGRyLnBhdGg9L3Zhci9ydW4v
cXNkLW5iZC5zb2NrCiAKIC4uIG9wdGlvbjo6IC0tb2JqZWN0IGhlbHAKICAgLS1vYmplY3QgPHR5
cGU+LGhlbHAKLS0gCjIuMjkuMgoK


