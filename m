Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89081D56FD
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 19:02:47 +0200 (CEST)
Received: from localhost ([::1]:40672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZdjS-0004S5-6D
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 13:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jZdii-00041H-1L
 for qemu-devel@nongnu.org; Fri, 15 May 2020 13:02:00 -0400
Resent-Date: Fri, 15 May 2020 13:02:00 -0400
Resent-Message-Id: <E1jZdii-00041H-1L@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jZdig-0001K9-4k
 for qemu-devel@nongnu.org; Fri, 15 May 2020 13:01:59 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1589562084; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KmmghsuqWq/XmiHaba9/euJy6tqmkqSB0igGl7XkBAGSwRM9H9VGAFlQY0FQxA+WtDfIajFiKhcpLiivhVSj15TKQILGadqAY9Q3kY1YxjRkql0sp48otaOSlyWVpkhSFWfqKotKVWvJUMVWZgpU+1OgACjiCvXWUeqfOplGvNE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1589562084;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=pUCGvPKezvEOM3uNICo/9QQVRUZEl/QjrvEi9tnkAjU=; 
 b=ZSMjHZFjt+PBegR3ljZsKtBCTG1JwI7XLiI7OQAaRB/Hrl5JdtB5rOBg3RtgkdcMfwkvUtkEu3wUvLUT0KhAHNM2nfE4SJl3JrxJn6dMQK3kioXz7/IvW0CD2xz9vDxA1iG75SHBP1hCJpwD3PFbzNL7W62OdJXJwW215MEWB+E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1589562081025439.4915072153816;
 Fri, 15 May 2020 10:01:21 -0700 (PDT)
Message-ID: <158956207915.7125.11210004730708195080@45ef0f9c86ae>
In-Reply-To: <1589537195-31392-1-git-send-email-ani.sinha@nutanix.com>
Subject: Re: [PATCH] Add a new PIIX option to control global PCI hot-plugging
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: ani.sinha@nutanix.com
Date: Fri, 15 May 2020 10:01:21 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 10:35:12
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: ani.sinha@nutanix.com, ehabkost@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, aleksandar.qemu.devel@gmail.com, imammedo@redhat.com,
 ani@anisinha.ca, pbonzini@redhat.com, philmd@redhat.com, aurelien@aurel32.net,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNTg5NTM3MTk1LTMxMzkyLTEt
Z2l0LXNlbmQtZW1haWwtYW5pLnNpbmhhQG51dGFuaXguY29tLwoKCgpIaSwKClRoaXMgc2VyaWVz
IGZhaWxlZCB0aGUgYXNhbiBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21t
YW5kcyBhbmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVk
LCB5b3UgY2FuIHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NSSVBU
IEJFR0lOID09PQojIS9iaW4vYmFzaApleHBvcnQgQVJDSD14ODZfNjQKbWFrZSBkb2NrZXItaW1h
Z2UtZmVkb3JhIFY9MSBORVRXT1JLPTEKdGltZSBtYWtlIGRvY2tlci10ZXN0LWRlYnVnQGZlZG9y
YSBUQVJHRVRfTElTVD14ODZfNjQtc29mdG1tdSBKPTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJ
UFQgRU5EID09PQoKICBDQyAgICAgIGh3L2lwYWNrL3RwY2kyMDAubwogIENDICAgICAgaHcvaXBt
aS9pcG1pLm8KICBDQyAgICAgIGh3L2lwbWkvaXBtaV9rY3MubwovdG1wL3FlbXUtdGVzdC9zcmMv
aHcvYWNwaS9waWl4NC5jOjU5ODo1MDogZXJyb3I6IHVzZSBvZiB1bmRlY2xhcmVkIGlkZW50aWZp
ZXIgJ2Rldic7IGRpZCB5b3UgbWVhbiAnZGl2Jz8KICAgICAgICBxYnVzX3NldF9ob3RwbHVnX2hh
bmRsZXIoQlVTKHBjaV9nZXRfYnVzKGRldikpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXn5+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBkaXYKLS0tCmV4dGVybiBkaXZfdCBkaXYgKGludCBfX251bWVyLCBp
bnQgX19kZW5vbSkKICAgICAgICAgICAgIF4KMSBlcnJvciBnZW5lcmF0ZWQuCm1ha2U6ICoqKiBb
L3RtcC9xZW11LXRlc3Qvc3JjL3J1bGVzLm1hazo2OTogaHcvYWNwaS9waWl4NC5vXSBFcnJvciAx
Cm1ha2U6ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uClRyYWNlYmFjayAobW9z
dCByZWNlbnQgY2FsbCBsYXN0KToKICBGaWxlICIuL3Rlc3RzL2RvY2tlci9kb2NrZXIucHkiLCBs
aW5lIDY2NCwgaW4gPG1vZHVsZT4KLS0tCiAgICByYWlzZSBDYWxsZWRQcm9jZXNzRXJyb3IocmV0
Y29kZSwgY21kKQpzdWJwcm9jZXNzLkNhbGxlZFByb2Nlc3NFcnJvcjogQ29tbWFuZCAnWydzdWRv
JywgJy1uJywgJ2RvY2tlcicsICdydW4nLCAnLS1sYWJlbCcsICdjb20ucWVtdS5pbnN0YW5jZS51
dWlkPTBiYjVlNjU1YThmYzRjYzc4NDE1ZTAxNzU2ZDk5N2YzJywgJy11JywgJzEwMDMnLCAnLS1z
ZWN1cml0eS1vcHQnLCAnc2VjY29tcD11bmNvbmZpbmVkJywgJy0tcm0nLCAnLWUnLCAnVEFSR0VU
X0xJU1Q9eDg2XzY0LXNvZnRtbXUnLCAnLWUnLCAnRVhUUkFfQ09ORklHVVJFX09QVFM9JywgJy1l
JywgJ1Y9JywgJy1lJywgJ0o9MTQnLCAnLWUnLCAnREVCVUc9JywgJy1lJywgJ1NIT1dfRU5WPScs
ICctZScsICdDQ0FDSEVfRElSPS92YXIvdG1wL2NjYWNoZScsICctdicsICcvaG9tZS9wYXRjaGV3
Mi8uY2FjaGUvcWVtdS1kb2NrZXItY2NhY2hlOi92YXIvdG1wL2NjYWNoZTp6JywgJy12JywgJy92
YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC0yanNjc3QxYS9zcmMvZG9ja2VyLXNyYy4yMDIwLTA1
LTE1LTEyLjU4LjA4LjMxODgzOi92YXIvdG1wL3FlbXU6eixybycsICdxZW11OmZlZG9yYScsICcv
dmFyL3RtcC9xZW11L3J1bicsICd0ZXN0LWRlYnVnJ10nIHJldHVybmVkIG5vbi16ZXJvIGV4aXQg
c3RhdHVzIDIuCmZpbHRlcj0tLWZpbHRlcj1sYWJlbD1jb20ucWVtdS5pbnN0YW5jZS51dWlkPTBi
YjVlNjU1YThmYzRjYzc4NDE1ZTAxNzU2ZDk5N2YzCm1ha2VbMV06ICoqKiBbZG9ja2VyLXJ1bl0g
RXJyb3IgMQptYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSBgL3Zhci90bXAvcGF0Y2hldy10ZXN0
ZXItdG1wLTJqc2NzdDFhL3NyYycKbWFrZTogKioqIFtkb2NrZXItcnVuLXRlc3QtZGVidWdAZmVk
b3JhXSBFcnJvciAyCgpyZWFsICAgIDNtMTEuNjY4cwp1c2VyICAgIDBtOC4yOTFzCgoKVGhlIGZ1
bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8xNTg5NTM3MTk1
LTMxMzkyLTEtZ2l0LXNlbmQtZW1haWwtYW5pLnNpbmhhQG51dGFuaXguY29tL3Rlc3RpbmcuYXNh
bi8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0
Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRv
IHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

