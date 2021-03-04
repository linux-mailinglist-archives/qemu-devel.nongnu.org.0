Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 473B932D1AC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 12:23:52 +0100 (CET)
Received: from localhost ([::1]:45694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHm59-0000tW-CC
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 06:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lHm3L-0008Aq-Gk
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 06:21:59 -0500
Resent-Date: Thu, 04 Mar 2021 06:21:59 -0500
Resent-Message-Id: <E1lHm3L-0008Aq-Gk@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lHm3I-0005t0-Lv
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 06:21:58 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1614856908; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VPI894Dff6rGeFt6JeQEWGI21/bTce+LXHvRygXEDeVS6nmXZUgzTeWja3gzqa6MZRCKlfUVx5b/gbCoqjxgGTYyX6SUiZ3iyBOJcG508Puw21rk53SXrso+Htp3PTH70k7h+FGR6jbYoqm61EJZkgI20D96WsZqFkeHA6gmheI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1614856908;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=VGjeXUKCYpShrT13hm4+VgURu925yDaiPEmhcnydn1A=; 
 b=ebfCztsZfgOUZ+sGiV8wZi2LVhJsTTmU4OgJ12HrBWLJpfg5XWFNQmrmDKx1ITnZYf8cxBxJSALHw4kwNfc1f6siXlg8dlBTXwI53/Ktoc7xyVnhT5jiYploQ36oi7N1uc8pJBdyOSZNRuWdZ5vKC1OxWOQHxiN0/fT+f4jWv3k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1614856905343194.59501609810673;
 Thu, 4 Mar 2021 03:21:45 -0800 (PST)
In-Reply-To: <20210304111743.118752-1-pbonzini@redhat.com>
Subject: Re: [PATCH v2] qemu-option: do not suggest using the delay option
Message-ID: <161485690411.4891.2947257602905666657@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pbonzini@redhat.com
Date: Thu, 4 Mar 2021 03:21:45 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMwNDExMTc0My4xMTg3
NTItMS1wYm9uemluaUByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAzMDQxMTE3NDMuMTE4
NzUyLTEtcGJvbnppbmlAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUEFUQ0ggdjJdIHFlbXUtb3B0aW9u
OiBkbyBub3Qgc3VnZ2VzdCB1c2luZyB0aGUgZGVsYXkgb3B0aW9uCgo9PT0gVEVTVCBTQ1JJUFQg
QkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBl
eGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0t
bG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGht
IGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0g
VEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdm
NDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVt
dQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwMzA0MTExNzQzLjExODc1Mi0xLXBi
b256aW5pQHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDIxMDMwNDExMTc0My4xMTg3NTItMS1wYm9u
emluaUByZWRoYXQuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKNDk1YzliMCBx
ZW11LW9wdGlvbjogZG8gbm90IHN1Z2dlc3QgdXNpbmcgdGhlIGRlbGF5IG9wdGlvbgoKPT09IE9V
VFBVVCBCRUdJTiA9PT0KRVJST1I6IGxpbmUgb3ZlciA5MCBjaGFyYWN0ZXJzCiM1MDogRklMRTog
dXRpbC9xZW11LW9wdGlvbi5jOjc4OToKKyAgICAgICAgICAgICAgICAgICAgZXJyb3JfcHJpbnRm
KCJQbGVhc2UgdXNlIG5vZGVsYXk9JXMgaW5zdGVhZFxuIiwgcHJlZml4WzBdID8gIm9uIiA6ICJv
ZmYiKTsKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgMjQgbGluZXMgY2hlY2tlZAoKQ29t
bWl0IDQ5NWM5YjA5NzMyYSAocWVtdS1vcHRpb246IGRvIG5vdCBzdWdnZXN0IHVzaW5nIHRoZSBk
ZWxheSBvcHRpb24pIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBv
ZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFp
bnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09
PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZh
aWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwMzA0MTExNzQzLjExODc1Mi0x
LXBib256aW5pQHJlZGhhdC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0t
LQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNo
ZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRo
YXQuY29t

