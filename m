Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D996E622177
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 02:54:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osaHK-0001MV-59; Tue, 08 Nov 2022 20:53:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=3054bc8e5=cnkevin@amazon.com>)
 id 1osaAD-0008L8-P7
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 20:46:06 -0500
Received: from smtp-fw-6001.amazon.com ([52.95.48.154])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=3054bc8e5=cnkevin@amazon.com>)
 id 1osaAB-0006ph-V4
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 20:46:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1667958360; x=1699494360;
 h=from:to:subject:date:message-id:mime-version;
 bh=ffNGDeV57D1zul5JFvlVT+wUrnaIrxgFRague4Ce3ts=;
 b=A5UcoDAK7f+Etvg4gvl8Fn5+2cRZOo7gsekHhK1r6lcL6qBC83Aj8RUW
 xuFOVhXObY3a24E+NRGSZyhyW/90JJjJ0N4bcS7qSWGsPmQHr2U5n3jv+
 5BPdXr5vGWfQc/88COONThVIWvb3IRt0ZcrBRkMpyuQV37z2gl8UR7Rsk c=;
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1d-m6i4x-153b24bc.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-6001.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2022 01:45:57 +0000
Received: from EX13MTAUWB002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1d-m6i4x-153b24bc.us-east-1.amazon.com (Postfix)
 with ESMTPS id 059D8C1FBB
 for <qemu-devel@nongnu.org>; Wed,  9 Nov 2022 01:45:56 +0000 (UTC)
Received: from EX19D022UWC002.ant.amazon.com (10.13.139.216) by
 EX13MTAUWB002.ant.amazon.com (10.43.161.202) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Wed, 9 Nov 2022 01:45:41 +0000
Received: from EX19D022UWC004.ant.amazon.com (10.13.139.244) by
 EX19D022UWC002.ant.amazon.com (10.13.139.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.15;
 Wed, 9 Nov 2022 01:45:41 +0000
Received: from EX19D022UWC004.ant.amazon.com ([fe80::b8b8:82f3:ceea:2f15]) by
 EX19D022UWC004.ant.amazon.com ([fe80::b8b8:82f3:ceea:2f15%6]) with
 mapi id 15.02.1118.015; Wed, 9 Nov 2022 01:45:41 +0000
From: "Li, Kevin" <cnkevin@amazon.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Questions about QEMU exception
Thread-Topic: Questions about QEMU exception
Thread-Index: AQHY89z59Vyy/iCgGEC+rUz4GJkFsA==
Date: Wed, 9 Nov 2022 01:45:41 +0000
Message-ID: <6FE4D6CD-1F6C-4632-92ED-9233C8F0EB87@amazon.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.171.36]
Content-Type: multipart/alternative;
 boundary="_000_6FE4D6CD1F6C463292ED9233C8F0EB87amazoncom_"
MIME-Version: 1.0
Precedence: Bulk
Received-SPF: pass client-ip=52.95.48.154;
 envelope-from=prvs=3054bc8e5=cnkevin@amazon.com; helo=smtp-fw-6001.amazon.com
X-Spam_score_int: -118
X-Spam_score: -11.9
X-Spam_bar: -----------
X-Spam_report: (-11.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 08 Nov 2022 20:53:15 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--_000_6FE4D6CD1F6C463292ED9233C8F0EB87amazoncom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgcWVtdSBjb21tdW5pdHksDQoNCldlIGFyZSB3b3JraW5nIG9uIHNvbWUgb3BlbiBzb3VyY2Ug
cHJvamVjdCB3aGljaCB1c2VzIHFlbXUgb24gbWFjLCBhbmQgd2UgaGF2ZSBzb21lIHNpZ25pbmcg
cHJvY2VzcyB0byBzaWduIHFlbXUtc3lzdGVtLXg4Nl82NC4NCklmIHFlbXUtc3lzdGVtLXg4Nl82
NCBpcyBub3Qgc2lnbmVkLCB3ZSBkb27igJl0IHNlZSBhbnkgcHJvYmxlbSwgYnV0IGFmdGVyIHNp
Z24gaXQsIHdlIGdvdCB0aGUgZm9sbG93aW5nIGVycm9yOg0KDQpxZW11LXN5c3RlbS14ODZfNjQg
LU0gbm9uZSAtbmV0ZGV2IGhlbHBdOiBzdGRvdXQ9XCJBY2NlbGVyYXRvcnMgc3VwcG9ydGVkIGlu
IFFFTVUgYmluYXJ5OlxcbnRjZ1xcbmhheFxcbmh2ZlxcblwiLCBzdGRlcnI9XCJxZW11LXN5c3Rl
bS14ODZfNjQ6IGFsbG9jYXRlIDEwNzM3NDE4MjQgYnl0ZXMgZm9yIGppdCBidWZmZXI6IEludmFs
aWQgYXJndW1lbnQNCg0KRG9lcyBhbnlvbmUgaGFzIGNsdWUgYWJvdXQgd2hhdCBjaGFuZ2UgbWF5
IHJlc3VsdCBpbiB0aGlzIGZhaWx1cmU/DQoNClRoYW5rcywNCktldmluDQo=

--_000_6FE4D6CD1F6C463292ED9233C8F0EB87amazoncom_
Content-Type: text/html; charset="utf-8"
Content-ID: <165674A4CC76354FBA066BCEF8C9DF16@amazon.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6RGVuZ1hpYW47DQoJcGFub3NlLTE6
MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7
DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZh
bWlseToiXEBEZW5nWGlhbiI7DQoJcGFub3NlLTE6MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQpAZm9u
dC1mYWNlDQoJe2ZvbnQtZmFtaWx5OmluaGVyaXQ7DQoJcGFub3NlLTE6MiAxMSA2IDQgMiAyIDIg
MiAyIDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3Jt
YWwsIGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBjbTsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZv
bnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21z
by1zdHlsZS10eXBlOnBlcnNvbmFsLWNvbXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNh
bnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5
bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9
DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo2MTIuMHB0IDc5Mi4wcHQ7DQoJbWFyZ2luOjcy
LjBwdCA3Mi4wcHQgNzIuMHB0IDcyLjBwdDt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29y
ZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1DQSIgbGlu
az0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiIHN0eWxlPSJ3b3JkLXdyYXA6YnJlYWstd29yZCI+
DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SGkgcWVt
dSBjb21tdW5pdHksPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZu
YnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPldlIGFyZSB3b3JraW5nIG9uIHNv
bWUgb3BlbiBzb3VyY2UgcHJvamVjdCB3aGljaCB1c2VzIHFlbXUgb24gbWFjLCBhbmQgd2UgaGF2
ZSBzb21lIHNpZ25pbmcgcHJvY2VzcyB0byBzaWduIHFlbXUtc3lzdGVtLXg4Nl82NC48bzpwPjwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPklmIHFlbXUtc3lzdGVtLXg4Nl82NCBpcyBu
b3Qgc2lnbmVkLCB3ZSBkb27igJl0IHNlZSBhbnkgcHJvYmxlbSwgYnV0IGFmdGVyIHNpZ24gaXQs
IHdlIGdvdCB0aGUgZm9sbG93aW5nIGVycm9yOjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHls
ZT0iYmFja2dyb3VuZDp3aGl0ZSI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC4wcHQ7Zm9udC1m
YW1pbHk6JnF1b3Q7aW5oZXJpdCZxdW90OyxzZXJpZjtjb2xvcjojMUQxQzFEIj5xZW11LXN5c3Rl
bS14ODZfNjQgLU0gbm9uZSAtbmV0ZGV2IGhlbHBdOiBzdGRvdXQ9XCZxdW90O0FjY2VsZXJhdG9y
cyBzdXBwb3J0ZWQgaW4gUUVNVSBiaW5hcnk6XFxudGNnXFxuaGF4XFxuaHZmXFxuXCZxdW90Oywg
c3RkZXJyPVwmcXVvdDtxZW11LXN5c3RlbS14ODZfNjQ6DQogYWxsb2NhdGUgMTA3Mzc0MTgyNCBi
eXRlcyBmb3Igaml0IGJ1ZmZlcjogSW52YWxpZCBhcmd1bWVudDxvOnA+PC9vOnA+PC9zcGFuPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+RG9lcyBhbnlvbmUgaGFzIGNsdWUgYWJvdXQgd2hhdCBjaGFuZ2UgbWF5IHJl
c3VsdCBpbiB0aGlzIGZhaWx1cmU/PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlRoYW5rcyw8bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPktldmluPG86cD48L286cD48L3A+DQo8
L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_6FE4D6CD1F6C463292ED9233C8F0EB87amazoncom_--

