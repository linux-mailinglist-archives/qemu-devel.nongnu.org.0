Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 124C4B9BE1
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Sep 2019 03:41:23 +0200 (CEST)
Received: from localhost ([::1]:36708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBUOn-0003dj-Kj
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 21:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51444)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1iBUNu-0003DG-4K
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 21:40:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1iBUNr-0000nT-Tx
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 21:40:25 -0400
Resent-Date: Fri, 20 Sep 2019 21:40:25 -0400
Resent-Message-Id: <E1iBUNr-0000nT-Tx@eggs.gnu.org>
Received: from sender4-of-o55.zoho.com ([136.143.188.55]:21563)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1iBUNr-0000k4-Im
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 21:40:23 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1569029994; cv=none; d=zoho.com; s=zohoarc; 
 b=QF2QAVAAo7nVDeDn3lU33PKHfcQiHXdYMFDscdgAcwXg5K022Tu13unz6S2RRO0I/psVKZ0CvE3Vkx7WAPHf4ZXsfUkuPI1XmVVSnVvzBdpj8vtgWR/HmsQixeEj4xXjGipjZoux2IgRdtLqbiX+M8FPD2Dy53Vjs3WujPSo01g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1569029994;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=jSW4Dk1vzSdwFJaaf9R78m3LVMN/mHcSKhTgrQyUf1s=; 
 b=cdp+KVwVwQjXl5U7SRD0OmyI3PCQ3yeHxe6IKVdK41oM4KuvA6BXhhLK1HpmhJrFKl7qdBE05ytCDEnMMxGqSLTSr7tEk5dLaisVBs6W0eJOlR4uWnzrJKJYa5tirAWdK+1n/2XRxbgNDry8VP9lVzEfKJvibEEtW3afaPGPeH8=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1569029993759558.2509693219075;
 Fri, 20 Sep 2019 18:39:53 -0700 (PDT)
In-Reply-To: <20190920074349.2616-1-tao3.xu@intel.com>
Subject: Re: [PATCH v12 00/11] Build ACPI Heterogeneous Memory Attribute Table
 (HMAT)
Message-ID: <156902999228.6626.2651850156767944067@1c8ae44fe5c0>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: tao3.xu@intel.com
Date: Fri, 20 Sep 2019 18:39:53 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.55
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
Cc: ehabkost@redhat.com, jingqi.liu@intel.com, tao3.xu@intel.com,
 fan.du@intel.com, qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 imammedo@redhat.com, dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDkyMDA3NDM0OS4yNjE2
LTEtdGFvMy54dUBpbnRlbC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVkIHRoZSBkb2Nr
ZXItcXVpY2tAY2VudG9zNyBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21t
YW5kcyBhbmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVk
LCB5b3UgY2FuIHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NSSVBU
IEJFR0lOID09PQojIS9iaW4vYmFzaAptYWtlIGRvY2tlci1pbWFnZS1jZW50b3M3IFY9MSBORVRX
T1JLPTEKdGltZSBtYWtlIGRvY2tlci10ZXN0LXF1aWNrQGNlbnRvczcgU0hPV19FTlY9MSBKPTE0
IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKbGlidWRldiAgICAgICAgICAgbm8K
ZGVmYXVsdCBkZXZpY2VzICAgeWVzCgp3YXJuaW5nOiBQeXRob24gMiBzdXBwb3J0IGlzIGRlcHJl
Y2F0ZWQKd2FybmluZzogUHl0aG9uIDMgd2lsbCBiZSByZXF1aXJlZCBmb3IgYnVpbGRpbmcgZnV0
dXJlIHZlcnNpb25zIG9mIFFFTVUKY3Jvc3MgY29udGFpbmVycyAgbm8KCk5PVEU6IGd1ZXN0IGNy
b3NzLWNvbXBpbGVycyBlbmFibGVkOiBjYwotLS0KTG9va2luZyBmb3IgZXhwZWN0ZWQgZmlsZSAn
dGVzdHMvZGF0YS9hY3BpL3BjL1NSQVQuYWNwaWhtYXQnCkxvb2tpbmcgZm9yIGV4cGVjdGVkIGZp
bGUgJ3Rlc3RzL2RhdGEvYWNwaS9wYy9TUkFUJwoqKgpFUlJPUjovdG1wL3FlbXUtdGVzdC9zcmMv
dGVzdHMvYmlvcy10YWJsZXMtdGVzdC5jOjMyNzpsb2FkX2V4cGVjdGVkX2FtbDogYXNzZXJ0aW9u
IGZhaWxlZDogKGV4cF9zZHQuYW1sX2ZpbGUpCkVSUk9SIC0gQmFpbCBvdXQhIEVSUk9SOi90bXAv
cWVtdS10ZXN0L3NyYy90ZXN0cy9iaW9zLXRhYmxlcy10ZXN0LmM6MzI3OmxvYWRfZXhwZWN0ZWRf
YW1sOiBhc3NlcnRpb24gZmFpbGVkOiAoZXhwX3NkdC5hbWxfZmlsZSkKbWFrZTogKioqIFtjaGVj
ay1xdGVzdC14ODZfNjRdIEVycm9yIDEKbWFrZTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQg
am9icy4uLi4KICBURVNUICAgIGlvdGVzdC1xY293MjogMDM4CgoKVGhlIGZ1bGwgbG9nIGlzIGF2
YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDE5MDkyMDA3NDM0OS4yNjE2LTEt
dGFvMy54dUBpbnRlbC5jb20vdGVzdGluZy5kb2NrZXItcXVpY2tAY2VudG9zNy8/dHlwZT1tZXNz
YWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6
Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2
ZWxAcmVkaGF0LmNvbQ==


