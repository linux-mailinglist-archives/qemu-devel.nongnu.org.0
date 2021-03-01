Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FEF3286EB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 18:19:48 +0100 (CET)
Received: from localhost ([::1]:59252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGmCx-0000tc-Fr
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 12:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lGm6Q-0005XK-9w
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:13:02 -0500
Resent-Date: Mon, 01 Mar 2021 12:13:02 -0500
Resent-Message-Id: <E1lGm6Q-0005XK-9w@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lGm6N-0006iW-Bu
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:13:01 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1614618770; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NHc5eLQwv2X2/bTEhySm35ibXVv6xCj069R4QgwNmg1a1ZRX60prwJ2IjeaTAODAms94rjaI6vsogk0iJ4Jt29iyeSLcfxQLLBg7OuMFm73lFtLTJdu1cIio3V9nMlls1h6DxUQVrajuxD7ufZS3q901IsAbomSG2aV5zBiflxM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1614618770;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=UNkFzvFuQ/QTL8jGYbQMOZUGeC3lgqE03cNO/oMDwe4=; 
 b=EVS3MgRprMBPAjxkcBPUH1JlelP8bmMX5B6oOj+XTEA/XR1puiS9Kq3koov12WoT8AjPF0fTzfEWTV8+Dr2dtzteWF1Z5XskFEzGWD69l2YSWqpbx+extV0g5sPA8YnpzZwrCroH+gxVWSloRrxZqgfVWTYd+31gX0xM0j4Vx4s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 16146187673441007.7274363936485;
 Mon, 1 Mar 2021 09:12:47 -0800 (PST)
In-Reply-To: <20210301161432.22554-1-danny.milo@datacom.wien>
Subject: Re: [PATCH 0/1] Add support for AMD new-style boot mechanism.
Message-ID: <161461876613.22330.8584808666884329692@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: danny.milo@datacom.wien
Date: Mon, 1 Mar 2021 09:12:47 -0800 (PST)
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
Cc: qemu-devel@nongnu.org, danny.milo@datacom.wien, rminnich@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMwMTE2MTQzMi4yMjU1
NC0xLWRhbm55Lm1pbG9AZGF0YWNvbS53aWVuLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRv
IGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1v
cmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAzMDExNjE0MzIu
MjI1NTQtMS1kYW5ueS5taWxvQGRhdGFjb20ud2llbgpTdWJqZWN0OiBbUEFUQ0ggMC8xXSBBZGQg
c3VwcG9ydCBmb3IgQU1EIG5ldy1zdHlsZSBib290IG1lY2hhbmlzbS4KCj09PSBURVNUIFNDUklQ
VCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8
IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcg
LS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0
aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09
PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVm
N2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9x
ZW11CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTAzMDExNjE0MzIuMjI1NTQtMS1k
YW5ueS5taWxvQGRhdGFjb20ud2llbiAtPiBwYXRjaGV3LzIwMjEwMzAxMTYxNDMyLjIyNTU0LTEt
ZGFubnkubWlsb0BkYXRhY29tLndpZW4KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwph
YTUzYTc0IGkzODY6IEFkZCBzdXBwb3J0IGZvciBBTUQgbmV3LXN0eWxlIGJvb3QgbWVjaGFuaXNt
LgoKPT09IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6IGJyYWNlcyB7fSBhcmUgbmVjZXNzYXJ5IGZv
ciBhbGwgYXJtcyBvZiB0aGlzIHN0YXRlbWVudAojMjc6IEZJTEU6IGh3L2NvcmUvZ2VuZXJpYy1s
b2FkZXIuYzo1NjoKKyAgICAgICAgICAgIGlmIChjYy0+c2V0X2NzYmFzZSkKWy4uLl0KCldBUk5J
Tkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiM0NTogRklMRTogaHcvY29yZS9nZW5lcmljLWxv
YWRlci5jOjE4NToKKyAgICBERUZJTkVfUFJPUF9VSU5UNjQoImNzYmFzZWFkZHIiLCBHZW5lcmlj
TG9hZGVyU3RhdGUsIGNzYmFzZWFkZHIsIDB4ZmZmZjAwMDApLAoKdG90YWw6IDEgZXJyb3JzLCAx
IHdhcm5pbmdzLCA2MCBsaW5lcyBjaGVja2VkCgpDb21taXQgYWE1M2E3NDI5YzhiIChpMzg2OiBB
ZGQgc3VwcG9ydCBmb3IgQU1EIG5ldy1zdHlsZSBib290IG1lY2hhbmlzbS4pIGhhcyBzdHlsZSBw
cm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNl
IHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0gg
aW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3
aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3
Lm9yZy9sb2dzLzIwMjEwMzAxMTYxNDMyLjIyNTU0LTEtZGFubnkubWlsb0BkYXRhY29tLndpZW4v
dGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0
b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5k
IHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

