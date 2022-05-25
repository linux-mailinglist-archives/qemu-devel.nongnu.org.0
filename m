Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21A6533897
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 10:35:52 +0200 (CEST)
Received: from localhost ([::1]:46094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntmUh-0006Nh-8I
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 04:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1ntmLQ-00040K-5d
 for qemu-devel@nongnu.org; Wed, 25 May 2022 04:26:16 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:58470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1ntmLM-0005dp-8s
 for qemu-devel@nongnu.org; Wed, 25 May 2022 04:26:14 -0400
Received: from sas1-9c28cd37d27b.qloud-c.yandex.net
 (sas1-9c28cd37d27b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:309b:0:640:9c28:cd37])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id C95872E12E8;
 Wed, 25 May 2022 11:26:04 +0300 (MSK)
Received: from 2a02:6b8:c08:8889:0:640:bf93:f901
 (2a02:6b8:c08:8889:0:640:bf93:f901 [2a02:6b8:c08:8889:0:640:bf93:f901])
 by sas1-9c28cd37d27b.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 1QaBE92JXOs1-Q4JqPeQU; Wed, 25 May 2022 11:26:04 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1653467164; bh=cXLb/E7havk5JIKaTC+He/vHuzB/XfEfcPQ57puVSGY=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=uhwvCptpifCvf4FKW2BUOTEVWWDiYSmk7bXtzPWLhJANQX0KKfvUkkHtGIqPIRU99
 dpp8uN6D/B8drHk7z01Qv55lAlW8COcwDeUuJ2TtKv3kFGMIftI7ebfHI1MUCz5w09
 TaOgEbDwyAM1+6WeuVhzNTrycGgQs8IZ/rHrshRw=
Authentication-Results: sas1-9c28cd37d27b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from sas1-7f179212b74f.qloud-c.yandex.net
 (sas1-7f179212b74f.qloud-c.yandex.net [2a02:6b8:c08:78a:0:640:7f17:9212])
 by sas2-6a1db1376cb6.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 rPaNx52LeCg1-duejDRVi
 for <khlebnikov@yandex-team.ru>; Wed, 25 May 2022 11:25:54 +0300
Received: by sas1-7f179212b74f.qloud-c.yandex.net with HTTP;
 Wed, 25 May 2022 11:25:54 +0300
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 "eblake@redhat.com" <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 Denis Plotnikov <den-plotnikov@yandex-team.ru>
In-Reply-To: <f0f173e2-66b1-393f-447d-2d8f102241d8@yandex-team.ru>
References: <165296995578.196133.16183155555450040914.stgit@buzz>
 <f0f173e2-66b1-393f-447d-2d8f102241d8@yandex-team.ru>
Subject: Re: [PATCH 1/4] qdev: add DEVICE_RUNTIME_ERROR event
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 25 May 2022 11:26:04 +0300
Message-Id: <312611653465106@mail.yandex-team.ru>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=khlebnikov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 HTML_MIME_NO_HTML_TAG=0.377, MIME_HTML_ONLY=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PGRpdj4yNC4wNS4yMDIyLCAyMjowNCwgIlZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkiICZs
dDt2c2VtZW50c292QHlhbmRleC10ZWFtLnJ1Jmd0Ozo8L2Rpdj48YmxvY2txdW90ZT48cD5GaXJz
dCwgY292ZXIgbGV0dGVyIGlzIGFic2VudC4gS29uc3RhbnRpbiwgY291bGQgeW91IHBsZWFzZSBw
cm92aWRlIGEgZGVzY3JpcHRpb24gd2hhdCB0aGUgd2hvbGUgc2VyaWVzIGRvZXM/PC9wPjwvYmxv
Y2txdW90ZT48ZGl2PkdlbmVyaWMgZGV2aWNlIGxheWVyIGxhY2sgb2YgY29tbW9uIHdheSB0byBy
ZXBvcnQgcnVudGltZSBlcnJvcnMgcmVsYXRlZCB0byB0aGUgcGFydGljdWxhciBkZXZpY2Ugdmlh
IHFtcC48L2Rpdj48ZGl2Pkl0IHNlZW1zIHVzZWZ1bCB0byBhZGQgcW1wIGV2ZW50IHdpdGggaHVt
YW4gcmVhZGFibGUgZXJyb3IgZm9yIGRldmljZSBhdCB0aGUgc2FtZSBsZXZlbCBvZiBhYnN0cmFj
dGlvbiBhczwvZGl2PjxkaXY+cW1wIGNvbW1hbmRzIGRldmljZV9hZGQgXCBkZXZpY2VfZGVsLjwv
ZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PlZpcnRpbyBkZXZpY2VzIGFscmVhZHkgaGF2ZSBjb21tb24g
d2F5IGZvciByZXBvcnRpbmcgc3VjaCBlcnJvcnMgdG8gbGlua2luZyB0aGVtIGlzIGVhc3kuPC9k
aXY+PGRpdj7CoDwvZGl2PjxkaXY+U2Vjb25kIGhhbGYgaXMgcmVsYXRlZCB0byBjb21wbGV0ZSBs
YWNrIG9mIGhhbmRsaW5nIGVycm9ycyBmb3Igdmhvc3QgYmFja2VuZC48L2Rpdj48ZGl2PkZvciBu
b3cgSSBwcm9wb3NlIHRvIGhhbmRsZSB0aGVtIGJ5IGZvcndhcmRpbmcgdG8gcmVsYXRlZCB2aXJ0
aW8gZGV2aWNlLjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PkZ1cnRoZXIgSXQgd29ydGggdG8gYWRk
IHNlcGFyYXRlIG9iamVjdCBmb3Igdmhvc3QtZW5wb2ludCwgYmVjYXVzZSBwcmVzZW50PC9kaXY+
PGRpdj5jaGFyLWRldmljZSBhcHByb2FjaCBkb2Vzbid0IHByb3ZpZGUgYW4gYWRlcXVhdGUgYWJz
dHJhY3Rpb24gbGV2ZWwuPC9kaXY+PGRpdj48YnIgLz4mZ3Q7IEhtbS4gU28gd2UgY3JlYXRlIHRl
bXBvcmFyeSBFcnJvciBvYmplY3QganVzdCB0byBwYXNzIGl0IHRvIHFkZXZfcmVwb3J0X3J1bnRp
bWVfZXJyb3IuLjwvZGl2PjxkaXY+Jmd0OyBJIHRoaW5rIHdlIGNhbiBhdm9pZCBpbnRyb2R1Y2lu
ZyB0aGlzIGludGVybWVkaWF0ZSBFcnJvciBvYmplY3QgdG9nZXRoZXIgd2l0aCBuZXcgbWFjcm86
PGJyIC8+Jmd0OyBqdXN0IGNvbnZlcnQgYXJndW1lbnQgbGlzdCB0byBzdHJpbmcgd2l0aCBoZWxw
IG9mIGdfc3RyZHVwX3ZwcmludGYoKSBpbiBvcmlnaW5hbCB2aXJ0aW9fZXJyb3IoKSw8L2Rpdj48
ZGl2PiZndDsgZXJyb3JfcmVwb3J0IHRoaXMgc3RyaW5nIGFuZCBwYXNzIHRvIHFkZXZfcmVwb3J0
X3J1bnRpbWVfZXJyb3IoKSAod2hpY2ggc2hvdWxkIGJlIHNpbXBsaWZpZWQgdG8gZ2V0IGp1c3Qg
YSBzdHJpbmcpLjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PlRoaXMgaXMgYW4gZXJyb3IgcGF0aC4g
RGV2aWNlIGdvaW5nIHRvIGJlIGJyb2tlbiBhZnRlciB0aGF0LjwvZGl2PjxkaXY+QnV0IHRoaXMg
bm90IGVuZCBvZiB0aGUgd29ybGQgc2l0dWF0aW9uIHdoZXJlIHdlIGNvdWxkIGp1c3QgZHVtcCBl
dmVyeXRoaW5nIGFuZCBkaWUuPC9kaXY+PGRpdj5Tbywgd2UgbXVzdCBwYWNrIGZ1bGwgZGVzY3Jp
cHRpb24gaW4gZ2VuZXJpYyB3YXkgYW5kIHBhc3MgaXQgaW50byB1cHBlciBsYXllci48L2Rpdj48
ZGl2PkZvciBub3cgb25seSBodW1hbiByZWFkYWJsZSBkZXNjcmlwdGlvbiBpcyB1c2VkLiBCdXQg
aXQncyBlYXN5IHRvIHBhc3NcdXNlIG1vcmUuPC9kaXY+PGRpdj7CoDwvZGl2PjxibG9ja3F1b3Rl
PjxwPjxiciAvPlNlY29uZCwgYWRkIG1haW50YWluZXJzIHRvIENDOjxiciAvPitNaWNoZWFsPGJy
IC8+K0VyaWM8YnIgLz4rTWFya3VzPGJyIC8+PGJyIC8+T24gNS8xOS8yMiAxNzoxOSwgS29uc3Rh
bnRpbiBLaGxlYm5pa292IHdyb3RlOjwvcD48YmxvY2txdW90ZT7CoFRoaXMgZXZlbnQgcmVwcmVz
ZW50cyBkZXZpY2UgcnVudGltZSBlcnJvcnMgdG8gZ2l2ZSB0aW1lIGFuZDxiciAvPsKgcmVhc29u
IHdoeSBkZXZpY2UgaXMgYnJva2VuLjxiciAvPsKgPGJyIC8+wqBTaWduZWQtb2ZmLWJ5OiBLb25z
dGFudGluIEtobGVibmlrb3YgJmx0OzxhIGhyZWY9Im1haWx0bzpraGxlYm5pa292QHlhbmRleC10
ZWFtLnJ1IiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiPmtobGVibmlrb3ZAeWFuZGV4LXRlYW0u
cnU8L2E+Jmd0OzxiciAvPsKgLS0tPC9ibG9ja3F1b3RlPjxwPjxiciAvPlRoZSBwYXRjaCBpdHNl
bGYgc2VlbXMgZ29vZCB0byBtZTo8YnIgLz5SZXZpZXdlZC1ieTogVmxhZGltaXIgU2VtZW50c292
LU9naWV2c2tpeSAmbHQ7PGEgaHJlZj0ibWFpbHRvOnZzZW1lbnRzb3ZAeWFuZGV4LXRlYW0ucnUi
IHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJlciI+dnNlbWVudHNvdkB5YW5kZXgtdGVhbS5ydTwvYT4m
Z3Q7PGJyIC8+wqA8L3A+LS08YnIgLz5CZXN0IHJlZ2FyZHMsPGJyIC8+VmxhZGltaXI8L2Jsb2Nr
cXVvdGU+PGRpdj7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2Pi0twqA8L2Rpdj48ZGl2PtCa0L7Q
vdGB0YLQsNC90YLQuNC9INCl0LvQtdCx0L3QuNC60L7QsjwvZGl2PjxkaXY+aHR0cHM6Ly9zdGFm
Zi55YW5kZXgtdGVhbS5ydS9raGxlYm5pa292PC9kaXY+PGRpdj7CoDwvZGl2Pg==

