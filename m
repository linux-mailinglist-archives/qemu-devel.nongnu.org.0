Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C02722E925
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 11:38:42 +0200 (CEST)
Received: from localhost ([::1]:44868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jzzaj-00010m-DC
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 05:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1jzza1-0000b2-HX; Mon, 27 Jul 2020 05:37:57 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:58864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1jzzZw-0004tE-Lb; Mon, 27 Jul 2020 05:37:55 -0400
Received: from sas1-ec30c78b6c5b.qloud-c.yandex.net
 (sas1-ec30c78b6c5b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:2704:0:640:ec30:c78b])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 9C0822E03DE;
 Mon, 27 Jul 2020 12:37:45 +0300 (MSK)
Received: from unknown (unknown [::1])
 by sas1-ec30c78b6c5b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 FjdIJzHK3x-bisGKls0; Mon, 27 Jul 2020 12:37:45 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1595842665; bh=q5MWxIcL48YB8moBBMMGRDn3VyRqxTGYPodQbOE6RQg=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=tgL1M7W7sw/03Qg2W/+ttcYiuCTOPicaMhogX39hREB0cedSEHsPd0jIA4pFMlYyF
 QbFGKkXuFWXztxxy924E2fQ4fWjx5LMAhbhTAcyGFcZzJ1arWhAjQudf5XxDciweOV
 Km6PmyF46SXKXML9rKTgn6LTwiATnkL74sBmgfCs=
Authentication-Results: sas1-ec30c78b6c5b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000161690
X-Yandex-Avir: 1
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net [2a02:6b8:c0c:2f26:0:640:d077:482f])
 by iva8-00026c0e2ab1.qloud-c.yandex.net with LMTP id QbEFIe8hr4-GJhjGQDt
 for <lekiravi@yandex-team.ru>; Mon, 27 Jul 2020 12:37:34 +0300
Received: by iva8-edafde7c849c.qloud-c.yandex.net with HTTP;
 Mon, 27 Jul 2020 12:37:34 +0300
From: =?utf-8?B?0JDQu9C10LrRgdC10Lkg0JrQuNGA0LjQu9C70L7Qsg==?=
 <lekiravi@yandex-team.ru>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
In-Reply-To: <f365e96e-3e83-ede6-3db5-2e02eb03adaa@redhat.com>
References: <20200715152135.20287-1-lekiravi@yandex-team.ru>
 <f365e96e-3e83-ede6-3db5-2e02eb03adaa@redhat.com>
Subject: Re: [PATCH 1/1] analyze-migration.py: fix read_migration_debug_json()
 return type
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 27 Jul 2020 12:37:44 +0300
Message-Id: <318531595842403@mail.yandex-team.ru>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=lekiravi@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 05:37:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 HTML_MIME_NO_HTML_TAG=0.377, MIME_HTML_ONLY=0.1, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PGRpdj5QaW5nPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+MTUuMDcuMjAyMCwgMTk6MDYsICJQaGls
aXBwZSBNYXRoaWV1LURhdWTDqSIgJmx0O3BoaWxtZEByZWRoYXQuY29tJmd0Ozo8L2Rpdj48Ymxv
Y2txdW90ZT48cD5DYydpbmcgRWR1YXJkby9DbGViZXIuPGJyIC8+PGJyIC8+T24gNy8xNS8yMCA1
OjIxIFBNLCBBbGV4ZXkgS2lyaWxsb3Ygd3JvdGU6PC9wPjxibG9ja3F1b3RlPsKgU2luY2Ugd2Ug
dXNlIHJlc3VsdCBvZiByZWFkX21pZ3JhdGlvbl9kZWJ1Z19qc29uKCkgYXMgSlNPTiBmb3JtYXR0
ZWQgc3RyaW5nLDxiciAvPsKgd2UgbXVzdCBwcm92aWRlIHByb3BlciB0eXBlLiBCZWZvcmUgUHl0
aG9uIDMuNiBqc29uLmxvYWRzKCkgbWV0aG9kPGJyIC8+wqBzdXBwb3J0IG9ubHkgc3RyIHR5cGVk
IGlucHV0LjxiciAvPsKgPGJyIC8+wqBTaWduZWQtb2ZmLWJ5OiBBbGV4ZXkgS2lyaWxsb3YgJmx0
OzxhIGhyZWY9Im1haWx0bzpsZWtpcmF2aUB5YW5kZXgtdGVhbS5ydSI+bGVraXJhdmlAeWFuZGV4
LXRlYW0ucnU8L2E+Jmd0OzxiciAvPsKgLS0tPGJyIC8+wqDCoHNjcmlwdHMvYW5hbHl6ZS1taWdy
YXRpb24ucHkgfCAyICstPGJyIC8+wqDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKTxiciAvPsKgPGJyIC8+wqBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9hbmFseXpl
LW1pZ3JhdGlvbi5weSBiL3NjcmlwdHMvYW5hbHl6ZS1taWdyYXRpb24ucHk8YnIgLz7CoGluZGV4
IDk1ODM4Y2JmZjMuLmM1ZjA2NDgyY2YgMTAwNzU1PGJyIC8+wqAtLS0gYS9zY3JpcHRzL2FuYWx5
emUtbWlncmF0aW9uLnB5PGJyIC8+wqArKysgYi9zY3JpcHRzL2FuYWx5emUtbWlncmF0aW9uLnB5
PGJyIC8+wqBAQCAtOTcsNyArOTcsNyBAQCBjbGFzcyBNaWdyYXRpb25GaWxlKG9iamVjdCk6PGJy
IC8+wqDCoMKgwqDCoMKgwqDCoMKgwqAjIFNlZWsgYmFjayB0byB3aGVyZSB3ZSB3ZXJlIGF0IHRo
ZSBiZWdpbm5pbmc8YnIgLz7CoMKgwqDCoMKgwqDCoMKgwqDCoHNlbGYuZmlsZS5zZWVrKGVudHJ5
cG9zLCAwKTxiciAvPsKgwqA8YnIgLz7CoC0gcmV0dXJuIGRhdGFbanNvbnBvczpqc29ucG9zICsg
anNvbmxlbl08YnIgLz7CoCsgcmV0dXJuIGRhdGFbanNvbnBvczpqc29ucG9zICsganNvbmxlbl0u
ZGVjb2RlKCJ1dGYtOCIpPGJyIC8+wqDCoDxiciAvPsKgwqDCoMKgwqDCoGRlZiBjbG9zZShzZWxm
KTo8YnIgLz7CoMKgwqDCoMKgwqDCoMKgwqDCoHNlbGYuZmlsZS5jbG9zZSgpPGJyIC8+wqA8L2Js
b2NrcXVvdGU+PHA+wqA8L3A+PC9ibG9ja3F1b3RlPjxkaXY+wqA8L2Rpdj48ZGl2PsKgPC9kaXY+
PGRpdj4tLcKgPC9kaXY+PGRpdj5BbGV4ZXkgS2lyaWxsb3Y8L2Rpdj48ZGl2PsKgPC9kaXY+

