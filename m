Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D232D4B50
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:11:25 +0100 (CET)
Received: from localhost ([::1]:46344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5o4-0001RF-1T
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:11:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kn5E2-00013V-L6
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 14:34:10 -0500
Resent-Date: Wed, 09 Dec 2020 14:34:10 -0500
Resent-Message-Id: <E1kn5E2-00013V-L6@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kn5Du-0000zT-CC
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 14:34:09 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1607542425; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=heYwo+OcN3U5XNUHYGuvG5XjyDFQKKcvQNcjpzWsmDQnUjKs/CPXnEVGi8CUMkHcFNXAT/t5m/4G+D14MeWPPChrOpAdN1Q7BpoWKgLARtZSXyURxLBWZeNyIIIDFrOSqAzp6oSgYQP2+wa+od3wGfzeY7kwVIbeNs3brt9T6+E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1607542425;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Fjt4/+GjihHJcPVESXSyMuOBg2TcNGku0RnlFiCmZBM=; 
 b=OPAJLlU1xFe8ZVL510z/WNwl14xVbw8EFNRP48DBvF8FMnbbzMYMM6jj1gLgB5rUeJ6twEFcl2gOaM3AW+aWxgwugLfa907wFZMWv6YlE6vbNZALHCjPOb2XG/dEBgywdXJuWCpeiszKpr18qFEPMKO2z+Z6h18JzjbzUuE2QVQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1607542423781195.68434132249854;
 Wed, 9 Dec 2020 11:33:43 -0800 (PST)
In-Reply-To: <20201209172334.14100-1-jejb@linux.ibm.com>
Subject: Re: [PATCH 0/3] sev: enable seret injection to a self described area
 in OVMF
Message-ID: <160754242170.29567.17871617035143884218@600e7e483b3a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: jejb@linux.ibm.com
Date: Wed, 9 Dec 2020 11:33:43 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
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
Cc: thomas.lendacky@amd.com, ashish.kalra@amd.com, brijesh.singh@amd.com,
 david.kaplan@amd.com, berrange@redhat.com, jejb@linux.ibm.com,
 jon.grimm@amd.com, tobin@ibm.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 frankeh@us.ibm.com, Dov.Murik1@il.ibm.com, pbonzini@redhat.com,
 dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTIwOTE3MjMzNC4xNDEw
MC0xLWplamJAbGludXguaWJtLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZl
IHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGlu
Zm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjAxMjA5MTcyMzM0LjE0MTAw
LTEtamVqYkBsaW51eC5pYm0uY29tClN1YmplY3Q6IFtQQVRDSCAwLzNdIHNldjogZW5hYmxlIHNl
cmV0IGluamVjdGlvbiB0byBhIHNlbGYgZGVzY3JpYmVkIGFyZWEgaW4gT1ZNRgoKPT09IFRFU1Qg
U0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251
bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFs
Z29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNl
Li4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0
ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9q
ZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIwMTIwOTE3MjMzNC4xNDEw
MC0xLWplamJAbGludXguaWJtLmNvbSAtPiBwYXRjaGV3LzIwMjAxMjA5MTcyMzM0LjE0MTAwLTEt
amVqYkBsaW51eC5pYm0uY29tCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMDEyMDkx
NzM1MzYuMTQzNzM1MS0xLWdyb3VnQGthb2Qub3JnIC0+IHBhdGNoZXcvMjAyMDEyMDkxNzM1MzYu
MTQzNzM1MS0xLWdyb3VnQGthb2Qub3JnCiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvY292
ZXIuMTYwNzQ2NzgxOS5naXQuYWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tIC0+IHBhdGNoZXcvY292
ZXIuMTYwNzQ2NzgxOS5naXQuYWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tClN3aXRjaGVkIHRvIGEg
bmV3IGJyYW5jaCAndGVzdCcKZjUxZTkwZCBzZXY6IHVwZGF0ZSBzZXYtaW5qZWN0LWxhdW5jaC1z
ZWNyZXQgdG8gbWFrZSBncGEgb3B0aW9uYWwKNGY1MjRiYyBwYzogYWRkIHBhcnNlciBmb3IgT1ZN
RiByZXNldCBibG9jawo5MTVlZDUyIHNldjogYWRkIHNldi1pbmplY3QtbGF1bmNoLXNlY3JldAoK
PT09IE9VVFBVVCBCRUdJTiA9PT0KMS8zIENoZWNraW5nIGNvbW1pdCA5MTVlZDUyYjgwYWEgKHNl
djogYWRkIHNldi1pbmplY3QtbGF1bmNoLXNlY3JldCkKMi8zIENoZWNraW5nIGNvbW1pdCA0ZjUy
NGJjMmVlMTggKHBjOiBhZGQgcGFyc2VyIGZvciBPVk1GIHJlc2V0IGJsb2NrKQpFUlJPUjogYnJh
Y2VzIHt9IGFyZSBuZWNlc3NhcnkgZm9yIGFsbCBhcm1zIG9mIHRoaXMgc3RhdGVtZW50CiM1MDog
RklMRTogaHcvaTM4Ni9wY19zeXNmdy5jOjE0ODoKKyAgICBpZiAob3ZtZl90YWJsZSkKWy4uLl0K
CkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBmb3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0
ZW1lbnQKIzYxOiBGSUxFOiBody9pMzg2L3BjX3N5c2Z3LmM6MTU5OgorICAgIGlmICghcWVtdV91
dWlkX2lzX2VxdWFsKChRZW11VVVJRCAqKXB0ciwgJmd1aWQpKQpbLi4uXQoKRVJST1I6IGJyYWNl
cyB7fSBhcmUgbmVjZXNzYXJ5IGZvciBhbGwgYXJtcyBvZiB0aGlzIHN0YXRlbWVudAojNjg6IEZJ
TEU6IGh3L2kzODYvcGNfc3lzZncuYzoxNjY6CisgICAgaWYgKHRvdF9sZW4gPD0gMCkKWy4uLl0K
CkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBmb3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0
ZW1lbnQKIzkwOiBGSUxFOiBody9pMzg2L3BjX3N5c2Z3LmM6MTg4OgorICAgIGlmIChxZW11X3V1
aWRfcGFyc2UoZW50cnksICZlbnRyeV9ndWlkKSA8IDApClsuLi5dCgpFUlJPUjogYnJhY2VzIHt9
IGFyZSBuZWNlc3NhcnkgZm9yIGFsbCBhcm1zIG9mIHRoaXMgc3RhdGVtZW50CiM5MzogRklMRTog
aHcvaTM4Ni9wY19zeXNmdy5jOjE5MToKKyAgICBpZiAoIXB0cikKWy4uLl0KCkVSUk9SOiBicmFj
ZXMge30gYXJlIG5lY2Vzc2FyeSBmb3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQKIzExMjog
RklMRTogaHcvaTM4Ni9wY19zeXNmdy5jOjIxMDoKKyAgICAgICAgaWYgKCFsZW4pClsuLi5dCgpF
UlJPUjogYnJhY2VzIHt9IGFyZSBuZWNlc3NhcnkgZm9yIGFsbCBhcm1zIG9mIHRoaXMgc3RhdGVt
ZW50CiMxMTg6IEZJTEU6IGh3L2kzODYvcGNfc3lzZncuYzoyMTY6CisgICAgICAgICAgICBpZiAo
ZGF0YSkKWy4uLl0KCkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBmb3IgYWxsIGFybXMg
b2YgdGhpcyBzdGF0ZW1lbnQKIzEyMDogRklMRTogaHcvaTM4Ni9wY19zeXNmdy5jOjIxODoKKyAg
ICAgICAgICAgIGlmIChkYXRhX2xlbikKWy4uLl0KCnRvdGFsOiA4IGVycm9ycywgMCB3YXJuaW5n
cywgMTIzIGxpbmVzIGNoZWNrZWQKClBhdGNoIDIvMyBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFz
ZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVw
b3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJT
LgoKMy8zIENoZWNraW5nIGNvbW1pdCBmNTFlOTBkYmM5MTQgKHNldjogdXBkYXRlIHNldi1pbmpl
Y3QtbGF1bmNoLXNlY3JldCB0byBtYWtlIGdwYSBvcHRpb25hbCkKV0FSTklORzogbGluZSBvdmVy
IDgwIGNoYXJhY3RlcnMKIzY3OiBGSUxFOiB0YXJnZXQvaTM4Ni9tb25pdG9yLmM6NzUwOgorICAg
ICAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCAiU0VWOiBubyBzZWNyZXQgYXJlYSBmb3VuZCBpbiBP
Vk1GLCBncGEgbXVzdCBiZSBzcGVjaWZpZWQuIik7Cgp0b3RhbDogMCBlcnJvcnMsIDEgd2Fybmlu
Z3MsIDQ0IGxpbmVzIGNoZWNrZWQKClBhdGNoIDMvMyBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFz
ZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVw
b3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJT
Lgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoK
VGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIw
MTIwOTE3MjMzNC4xNDEwMC0xLWplamJAbGludXguaWJtLmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gv
P3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNo
ZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBw
YXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

