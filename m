Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710E9337B2C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 18:43:31 +0100 (CET)
Received: from localhost ([::1]:53938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKPLO-00033G-7b
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 12:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lKPI5-0001Hd-G4
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:40:06 -0500
Resent-Date: Thu, 11 Mar 2021 12:40:05 -0500
Resent-Message-Id: <E1lKPI5-0001Hd-G4@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lKPI0-0007Sh-4b
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:40:04 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1615484388; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZpVyGyB9QGtVU643IXC11zkHevjvKies31zdIZLQ1vIvmIVT32vatIXN8Sy/t3AzpXcib57L3XrmBdUqtdEPpJpBJx9ciG+suAPBIrd3ZIWknM21fb/5KQ3ZkKGd4AzntuC45pv8TKfDVCkrw1nstV5zXMN5WzRV9YbUJgcU7ko=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1615484388;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=zYey82SnSJE1xIbzPkLEkB5VHceBZcIuApYTHjhpBpk=; 
 b=ehdml/+AYYzYqrkXGhXyDl/LA10eB+uxFGYWk5/qUXy31vqZtP/uGhAkXleDVpXNjSubpogA21akWX56UsFwCULQf1/ecnSsUB8s9POK4HRx/0vZQG2n7MBATAn6KNhRZdtUmbFgeZQ++tDLqvoNDbClNq8EVLqufQ0zDNAsc7w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1615484386571751.8691360216945;
 Thu, 11 Mar 2021 09:39:46 -0800 (PST)
In-Reply-To: <20210311172459.990281-1-pbonzini@redhat.com>
Subject: Re: [PATCH 0/3] vl: QAPIfy -object
Message-ID: <161548438525.22837.11422848720480793024@f3770d8ad632>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pbonzini@redhat.com
Date: Thu, 11 Mar 2021 09:39:46 -0800 (PST)
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMxMTE3MjQ1OS45OTAy
ODEtMS1wYm9uemluaUByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAzMTExNzI0NTkuOTkw
MjgxLTEtcGJvbnppbmlAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUEFUQ0ggMC8zXSB2bDogUUFQSWZ5
IC1vYmplY3QKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1w
YXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5y
ZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29u
ZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNo
LnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAz
YzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRo
dWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcv
MjAyMTAzMTAxNTQ1MjYuNDYzODUwLTEtcGJvbnppbmlAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIw
MjEwMzEwMTU0NTI2LjQ2Mzg1MC0xLXBib256aW5pQHJlZGhhdC5jb20KICogW25ldyB0YWddICAg
ICAgICAgcGF0Y2hldy8yMDIxMDMxMTE3MjQ1OS45OTAyODEtMS1wYm9uemluaUByZWRoYXQuY29t
IC0+IHBhdGNoZXcvMjAyMTAzMTExNzI0NTkuOTkwMjgxLTEtcGJvbnppbmlAcmVkaGF0LmNvbQpT
d2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjU2ZDE1NzUgdmw6IGFsbG93IHBhc3Npbmcg
SlNPTiB0byAtb2JqZWN0CjMyMGQ1YjMgcW9tOiBtb3ZlIHVzZXJfY3JlYXRhYmxlX2FkZF9vcHRz
IGxvZ2ljIHRvIHZsLmMgYW5kIFFBUElmeSBpdAo2NDVmOWRmIHRlc3RzOiBjb252ZXJ0IGNoZWNr
LXFvbS1wcm9wbGlzdCB0byBrZXl2YWwKCj09PSBPVVRQVVQgQkVHSU4gPT09CjEvMyBDaGVja2lu
ZyBjb21taXQgNjQ1ZjlkZmFlYTA1ICh0ZXN0czogY29udmVydCBjaGVjay1xb20tcHJvcGxpc3Qg
dG8ga2V5dmFsKQoyLzMgQ2hlY2tpbmcgY29tbWl0IDMyMGQ1YjMwMTk2OCAocW9tOiBtb3ZlIHVz
ZXJfY3JlYXRhYmxlX2FkZF9vcHRzIGxvZ2ljIHRvIHZsLmMgYW5kIFFBUElmeSBpdCkKV0FSTklO
RzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzE5MjogRklMRTogc29mdG1tdS92bC5jOjE0NToK
K3N0YXRpYyBRVEFJTFFfSEVBRCgsIE9iamVjdE9wdGlvbikgb2JqZWN0X29wdHMgPSBRVEFJTFFf
SEVBRF9JTklUSUFMSVpFUihvYmplY3Rfb3B0cyk7CgpFUlJPUjogbGluZSBvdmVyIDkwIGNoYXJh
Y3RlcnMKIzIwMDogRklMRTogc29mdG1tdS92bC5jOjE2OTQ6CitzdGF0aWMgdm9pZCBvYmplY3Rf
b3B0aW9uX2ZvcmVhY2hfYWRkKGJvb2wgKCp0eXBlX29wdF9wcmVkaWNhdGUpKGNvbnN0IGNoYXIg
KiksIEVycm9yICoqZXJycCkKCnRvdGFsOiAxIGVycm9ycywgMSB3YXJuaW5ncywgMjUzIGxpbmVz
IGNoZWNrZWQKClBhdGNoIDIvMyBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJ
ZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8g
dGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKMy8zIENoZWNr
aW5nIGNvbW1pdCA1NmQxNTc1YmNlMWUgKHZsOiBhbGxvdyBwYXNzaW5nIEpTT04gdG8gLW9iamVj
dCkKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoK
ClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAy
MTAzMTExNzI0NTkuOTkwMjgxLTEtcGJvbnppbmlAcmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0
Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBh
dGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0
byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

