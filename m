Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB9234ADD3
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 18:47:46 +0100 (CET)
Received: from localhost ([::1]:47066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPqYi-0005P8-Ui
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 13:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lPqX5-0004rr-SE
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:46:03 -0400
Resent-Date: Fri, 26 Mar 2021 13:46:03 -0400
Resent-Message-Id: <E1lPqX5-0004rr-SE@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lPqX3-0002RL-C2
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:46:03 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616780752; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EkXFmnFTub82dSwqlHNi1Cb8d1qPSF13EjuxpmkrBdKf4aehFIbAQ9viyn8YzdhdkSeUBhlu/ZM1Zu2dtbLVU0YcC6WdlfcOebdc6UrbWDwLkp48SxrJZSVXJJwvgQLZ2CQ4POuQ2wGVq4aONOLyUBjEgGaptEOl9W6meAUmfM4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1616780752;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=3pRhWxrYuLKCSMLR1sPjwOC+ZlAv3qtzRL4SUAk5Wss=; 
 b=UO1SOuoW4OKFgMrpSVACZbxHQUOhO7U1FgUFXwCaf8gSqqfzEZWXWnGo9xjg2vUGeGw3XBJ++0KgIF8+B4oECzHg4gswjxswXqmVYzSGgrJXE96SiGRtwz6dyerYPz1tH+YVqqB8eJ4ds+tCAV6rCXzFMZEh/gVX3dLA9Y15yzQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1616780749204117.43780226509966;
 Fri, 26 Mar 2021 10:45:49 -0700 (PDT)
In-Reply-To: <cover.1616779714.git.lukasstraub2@web.de>
Subject: Re: [PULL for 6.0 0/6] Yank fixes
Message-ID: <161678074774.16936.3504821722774220509@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: lukasstraub2@web.de
Date: Fri, 26 Mar 2021 10:45:49 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9jb3Zlci4xNjE2Nzc5NzE0Lmdp
dC5sdWthc3N0cmF1YjJAd2ViLmRlLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogY292ZXIuMTYxNjc3OTcxNC5naXQu
bHVrYXNzdHJhdWIyQHdlYi5kZQpTdWJqZWN0OiBbUFVMTCBmb3IgNi4wIDAvNl0gWWFuayBmaXhl
cwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJh
c2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxp
bWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1s
b2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1t
YWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5
YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20v
cGF0Y2hldy1wcm9qZWN0L3FlbXUKIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy9jb3Zlci4x
NjE2NzQ0NTA5LmdpdC5sdWthc3N0cmF1YjJAd2ViLmRlIC0+IHBhdGNoZXcvY292ZXIuMTYxNjc0
NDUwOS5naXQubHVrYXNzdHJhdWIyQHdlYi5kZQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3
L2NvdmVyLjE2MTY3Nzk3MTQuZ2l0Lmx1a2Fzc3RyYXViMkB3ZWIuZGUgLT4gcGF0Y2hldy9jb3Zl
ci4xNjE2Nzc5NzE0LmdpdC5sdWthc3N0cmF1YjJAd2ViLmRlClN3aXRjaGVkIHRvIGEgbmV3IGJy
YW5jaCAndGVzdCcKNGQ5ZDRkZCB0ZXN0czogQWRkIHRlc3RzIGZvciB5YW5rIHdpdGggdGhlIGNo
YXJkZXYtY2hhbmdlIGNhc2UKYjczMDlhMyBjaGFyZGV2OiBGaXggeWFuayB3aXRoIHRoZSBjaGFy
ZGV2LWNoYW5nZSBjYXNlCjRkNjI2ZGUgY2hhcmRldi9jaGFyLmM6IEFsd2F5cyBwYXNzIGlkIHRv
IGNoYXJkZXZfbmV3Cjk4NjcwNGUgY2hhcmRldi9jaGFyLmM6IE1vdmUgb2JqZWN0X3Byb3BlcnR5
X3RyeV9hZGRfY2hpbGQgb3V0IG9mIGNoYXJkZXZfbmV3CjNhODNmOWEgeWFuazogQWx3YXlzIGxp
bmsgZnVsbCB5YW5rIGNvZGUKNDE0MmM2ZCB5YW5rOiBSZW1vdmUgZGVwZW5kZW5jeSBvbiBxaW9j
aGFubmVsCgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzYgQ2hlY2tpbmcgY29tbWl0IDQxNDJjNmRl
OGJmMiAoeWFuazogUmVtb3ZlIGRlcGVuZGVuY3kgb24gcWlvY2hhbm5lbCkKMi82IENoZWNraW5n
IGNvbW1pdCAzYTgzZjlhOGYzMGYgKHlhbms6IEFsd2F5cyBsaW5rIGZ1bGwgeWFuayBjb2RlKQoz
LzYgQ2hlY2tpbmcgY29tbWl0IDk4NjcwNGVhY2ZkZiAoY2hhcmRldi9jaGFyLmM6IE1vdmUgb2Jq
ZWN0X3Byb3BlcnR5X3RyeV9hZGRfY2hpbGQgb3V0IG9mIGNoYXJkZXZfbmV3KQo0LzYgQ2hlY2tp
bmcgY29tbWl0IDRkNjI2ZGUxYzg2ZSAoY2hhcmRldi9jaGFyLmM6IEFsd2F5cyBwYXNzIGlkIHRv
IGNoYXJkZXZfbmV3KQo1LzYgQ2hlY2tpbmcgY29tbWl0IGI3MzA5YTM1MTVhMiAoY2hhcmRldjog
Rml4IHlhbmsgd2l0aCB0aGUgY2hhcmRldi1jaGFuZ2UgY2FzZSkKNi82IENoZWNraW5nIGNvbW1p
dCA0ZDlkNGRkYTA1ZTQgKHRlc3RzOiBBZGQgdGVzdHMgZm9yIHlhbmsgd2l0aCB0aGUgY2hhcmRl
di1jaGFuZ2UgY2FzZSkKRVJST1I6IE1hY3JvcyB3aXRoIG11bHRpcGxlIHN0YXRlbWVudHMgc2hv
dWxkIGJlIGVuY2xvc2VkIGluIGEgZG8gLSB3aGlsZSBsb29wCiMyMzA6IEZJTEU6IHRlc3RzL3Vu
aXQvdGVzdC15YW5rLmM6MTgwOgorI2RlZmluZSBDSEFSX0NIQU5HRV9URVNUKG5hbWUsIF9vbGRf
eWFuaywgX25ld195YW5rKSAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICAgICAgZ190
ZXN0X2FkZF9kYXRhX2Z1bmMoIi95YW5rL2NoYXJfY2hhbmdlL3N1Y2Nlc3MvIiAjIG5hbWUsICAg
ICAgICAgICAgICBcCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICYoQ2hhckNoYW5nZVRl
c3RDb25maWcpIHsgLmFkZHIgPSAmdGNwYWRkciwgICAgICAgXAorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC5vbGRfeWFuayA9IChfb2xkX3lh
bmspLFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAubmV3X3lhbmsgPSAoX25ld195YW5rKSxcCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLmZhaWwgPSBmYWxzZSB9LCAgICAgICAgXAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjaGFyX2NoYW5nZV90ZXN0KTsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICAgICAgZ190ZXN0X2FkZF9kYXRhX2Z1bmMoIi95
YW5rL2NoYXJfY2hhbmdlL2ZhaWwvIiAjIG5hbWUsICAgICAgICAgICAgICAgICBcCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICYoQ2hhckNoYW5nZVRlc3RDb25maWcpIHsgLmFkZHIgPSAm
dGNwYWRkciwgICAgICAgXAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC5vbGRfeWFuayA9IChfb2xkX3lhbmspLFwKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAubmV3X3lhbmsgPSAoX25l
d195YW5rKSxcCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLmZhaWwgPSB0cnVlIH0sICAgICAgICAgXAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjaGFyX2NoYW5nZV90ZXN0KTsKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywg
MjE2IGxpbmVzIGNoZWNrZWQKClBhdGNoIDYvNiBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSBy
ZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0
IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoK
PT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRo
ZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvY292ZXIu
MTYxNjc3OTcxNC5naXQubHVrYXNzdHJhdWIyQHdlYi5kZS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5
cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcg
W2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRj
aGV3LWRldmVsQHJlZGhhdC5jb20=

