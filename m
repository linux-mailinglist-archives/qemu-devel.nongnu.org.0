Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFC33A71C3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 00:07:31 +0200 (CEST)
Received: from localhost ([::1]:34586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsujy-0007fn-Dk
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 18:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lsuiz-0006A8-Tf
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:06:29 -0400
Resent-Date: Mon, 14 Jun 2021 18:06:29 -0400
Resent-Message-Id: <E1lsuiz-0006A8-Tf@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lsuix-000253-0x
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:06:29 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623708364; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=AL/ukawezBREzCdYs9yU48AW89ucuEArelSOs10/QrNYRwTH81E44xGEOsPoQk+Zw9mlX9rJJ2OAOtZ5cqxvT2XyAlnUuxtA0paexVmfWec5wU1EVL3TkTFRTqUrhb036c8vADoyncCoub2hGhxrgMOMB049Sz+GOKa33TGMRgc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623708364;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=PEop2NY+9Dloa3iUtxKhyXekHkbmE1ztrOBrJe97L44=; 
 b=cmwNjK6I3c8UKdkP8dbsb5+fkaadXDhPz25wwscU+SHSwbbTWhx1kFxPJPLc/2xjOmkMFjccxKJ7+MzQmlXqFtOMwHpaFWHLLAwALgIvrnjhkSIJux3C/QVFktT3v4X2uxe+b7ZI0asoHE5YxQBha+zQI5EnkAZgx6lsDmVqssQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 162370836383621.892983904223;
 Mon, 14 Jun 2021 15:06:03 -0700 (PDT)
In-Reply-To: <20210609144512.211746-1-dgilbert@redhat.com>
Subject: Re: [PULL 0/9] migration queue
Message-ID: <162370836245.2358.13955068616183995114@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: dgilbert@redhat.com
Date: Mon, 14 Jun 2021 15:06:03 -0700 (PDT)
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
Cc: leobras.c@gmail.com, lizhijian@cn.fujitsu.com, huangy81@chinatelecom.cn,
 qemu-devel@nongnu.org, peterx@redhat.com, pabeni@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYwOTE0NDUxMi4yMTE3
NDYtMS1kZ2lsYmVydEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA2MDkxNDQ1MTIuMjEx
NzQ2LTEtZGdpbGJlcnRAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUFVMTCAwLzldIG1pZ3JhdGlvbiBx
dWV1ZQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNl
IGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFt
ZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcg
LS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwg
LS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNm
NWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5j
b20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIx
MDYwOTE4NDk1NS4xMTkzMDgxLTEtcGhpbG1kQHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDIxMDYw
OTE4NDk1NS4xMTkzMDgxLTEtcGhpbG1kQHJlZGhhdC5jb20KICogW25ldyB0YWddICAgICAgICAg
cGF0Y2hldy8yMDIxMDYxMTEyMDQyNy40OTczNi0xLWJlcnJhbmdlQHJlZGhhdC5jb20gLT4gcGF0
Y2hldy8yMDIxMDYxMTEyMDQyNy40OTczNi0xLWJlcnJhbmdlQHJlZGhhdC5jb20KICogW25ldyB0
YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDYxMzE0MTIyMi41NDgzNTctMS1sdWthcy5qdWVuZ2Vy
QGdyZWVuc29jcy5jb20gLT4gcGF0Y2hldy8yMDIxMDYxMzE0MTIyMi41NDgzNTctMS1sdWthcy5q
dWVuZ2VyQGdyZWVuc29jcy5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwoKPT09
IE9VVFBVVCBCRUdJTiA9PT0KY2hlY2twYXRjaC5wbDogbm8gcmV2aXNpb25zIHJldHVybmVkIGZv
ciByZXZsaXN0ICdiYXNlLi4nCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRl
ZCB3aXRoIGNvZGU6IDI1NQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3Bh
dGNoZXcub3JnL2xvZ3MvMjAyMTA2MDkxNDQ1MTIuMjExNzQ2LTEtZGdpbGJlcnRAcmVkaGF0LmNv
bS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBh
dXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNl
bmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

