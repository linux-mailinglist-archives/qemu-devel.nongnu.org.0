Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E085F38F716
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 02:50:03 +0200 (CEST)
Received: from localhost ([::1]:33322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llLGk-0006eb-Is
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 20:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1llLFm-0005iz-C7; Mon, 24 May 2021 20:49:02 -0400
Resent-Date: Mon, 24 May 2021 20:49:02 -0400
Resent-Message-Id: <E1llLFm-0005iz-C7@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1llLFk-0000dx-4m; Mon, 24 May 2021 20:49:02 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1621903732; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kLeoQpSYnPY3IRjuKla6Szxk4o9woHqHTgfO4S6DvGtsipZY8o58AwyR0wez0WGkW+USFDTitao1P6T8Mp5CtpsxbpxuIcPwMUidrvYqkhIL89bE5fCp9V63iHUV1CjWtIbo6sCx9qYuE2CBo7YUUtkDBumjJIlktRyhpgMdfBk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1621903732;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=LoWvn9qm8RG+zujQN3SqfGBMKLm6e47nYjn0zJhF7sk=; 
 b=c0cYpkg25+rjA2anOCpSZ42izt8cBsPlq9Pw26g9jvXbxEbIiXhw6srN/MQ2YRVWeStkNOIdqW+zVq88wtUi0HiShnS0R3iiKuABMYUEplcKBEDj18tiFCNpuUpN/CUO2Igrs+kAtIV/73n0lPPZly68OQPNAmYtbL8K3sNL7Q8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1621903730689594.3664916048383;
 Mon, 24 May 2021 17:48:50 -0700 (PDT)
In-Reply-To: <20210524225608.3191809-1-swethajoshi139@gmail.com>
Subject: Re: [PATCH] Adding ifdefs to call the respective routines only when
 their configs are enabled
Message-ID: <162190372969.18674.2618006233204206235@0addf061776e>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: swethajoshi139@gmail.com
Date: Mon, 24 May 2021 17:48:50 -0700 (PDT)
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
Cc: qemu-trivial@nongnu.org, swjoshi@microsoft.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUyNDIyNTYwOC4zMTkx
ODA5LTEtc3dldGhham9zaGkxMzlAZ21haWwuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1z
IHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9y
Cm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA1MjQyMjU2
MDguMzE5MTgwOS0xLXN3ZXRoYWpvc2hpMTM5QGdtYWlsLmNvbQpTdWJqZWN0OiBbUEFUQ0hdIEFk
ZGluZyBpZmRlZnMgdG8gY2FsbCB0aGUgcmVzcGVjdGl2ZSByb3V0aW5lcyBvbmx5IHdoZW4gdGhl
aXIgY29uZmlncyBhcmUgZW5hYmxlZAoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4v
YmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcg
LS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1l
cyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3Jp
cHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9
PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJv
bSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWddICAg
ICAgICAgcGF0Y2hldy8yMDIxMDUyNDIyNTYwOC4zMTkxODA5LTEtc3dldGhham9zaGkxMzlAZ21h
aWwuY29tIC0+IHBhdGNoZXcvMjAyMTA1MjQyMjU2MDguMzE5MTgwOS0xLXN3ZXRoYWpvc2hpMTM5
QGdtYWlsLmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjE4Y2FiMzkgQWRkaW5n
IGlmZGVmcyB0byBjYWxsIHRoZSByZXNwZWN0aXZlIHJvdXRpbmVzIG9ubHkgd2hlbiB0aGVpciBj
b25maWdzIGFyZSBlbmFibGVkCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogc3VzcGVjdCBj
b2RlIGluZGVudCBmb3IgY29uZGl0aW9uYWwgc3RhdGVtZW50cyAoMTYsIDE4KQojMzg6IEZJTEU6
IHRhcmdldC9hcm0va3ZtNjQuYzoxNDMzOgorICAgICAgICAgICAgICAgIGlmIChhY3BpX2doZXNf
cmVjb3JkX2Vycm9ycyhBQ1BJX0hFU1RfU1JDX0lEX1NFQSwgcGFkZHIpKSB7CisgICAgICAgICAg
ICAgICAgICBlcnJvcl9yZXBvcnQoImZhaWxlZCB0byByZWNvcmQgdGhlIGVycm9yIik7Cgp0b3Rh
bDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDI4IGxpbmVzIGNoZWNrZWQKCkNvbW1pdCAxOGNhYjM5
YmNkNDYgKEFkZGluZyBpZmRlZnMgdG8gY2FsbCB0aGUgcmVzcGVjdGl2ZSByb3V0aW5lcyBvbmx5
IHdoZW4gdGhlaXIgY29uZmlncyBhcmUgZW5hYmxlZCkgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVh
c2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJl
cG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVS
Uy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoK
ClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAy
MTA1MjQyMjU2MDguMzE5MTgwOS0xLXN3ZXRoYWpvc2hpMTM5QGdtYWlsLmNvbS90ZXN0aW5nLmNo
ZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5
IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVk
YmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

