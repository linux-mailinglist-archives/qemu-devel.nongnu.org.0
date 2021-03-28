Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BFF34BE3B
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 20:27:01 +0200 (CEST)
Received: from localhost ([::1]:40268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQa7o-0004w4-KD
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 14:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lQa5v-0004Fl-TN; Sun, 28 Mar 2021 14:25:03 -0400
Resent-Date: Sun, 28 Mar 2021 14:25:03 -0400
Resent-Message-Id: <E1lQa5v-0004Fl-TN@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lQa5p-0000FU-RV; Sun, 28 Mar 2021 14:25:03 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616955892; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=a8mn/JnPyhec0NwpIFUvV2ss7rFI+E6TmE7WQC1hEY+8wbLCWbDdknO98E40mNqqrCUE/T3ArHUziDeYBDQ/5xxcAXGXy4LNiDMzo6gURSfboQIAf9WNpaqceawT5ea/ev0PhOaOyT9BrPXpCvx5OMnfUDM3UrEuYvPnxUZVLXc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1616955892;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Dty79UPqnxGVg66MINiBZqUI+lJPULMfnS20Za0UUPU=; 
 b=g7djZ99+QOHFkL2oCgLiudUATQFPvV6NGK8LpfSuJGOw8Mg14UgIpIw+St5ubvd4w4HX1bOapRyWldiuEkgiUxfcAXVbS9Ev+ZwUiITgu6H7v8ZKKI7T4/AsRc6TDFEqSw1Q3SuJdn2yesjEkv9V2OghMXbG3XY4dUp4fCfG4aY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1616955889692166.81324624230115;
 Sun, 28 Mar 2021 11:24:49 -0700 (PDT)
In-Reply-To: <20210328180135.88449-1-frf@ghgsat.com>
Subject: Re: [PATCH] linux-user: NETLINK_LIST_MEMBERSHIPS: Allow bad ptr if
 its length is 0
Message-ID: <161695588851.19233.1011216598504743770@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: qemu-devel@nongnu.org
Date: Sun, 28 Mar 2021 11:24:49 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, frf@ghgsat.com, qemu-devel@nongnu.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMyODE4MDEzNS44ODQ0
OS0xLWZyZkBnaGdzYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUgc29t
ZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5mb3Jt
YXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAzMjgxODAxMzUuODg0NDktMS1m
cmZAZ2hnc2F0LmNvbQpTdWJqZWN0OiBbUEFUQ0hdIGxpbnV4LXVzZXI6IE5FVExJTktfTElTVF9N
RU1CRVJTSElQUzogQWxsb3cgYmFkIHB0ciBpZiBpdHMgbGVuZ3RoIGlzIDAKCj09PSBURVNUIFND
UklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxs
IHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25m
aWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdv
cml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4u
Cj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQx
ZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVj
dC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTAzMjgxODAxMzUuODg0NDkt
MS1mcmZAZ2hnc2F0LmNvbSAtPiBwYXRjaGV3LzIwMjEwMzI4MTgwMTM1Ljg4NDQ5LTEtZnJmQGdo
Z3NhdC5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwplMmJhN2ZiIGxpbnV4LXVz
ZXI6IE5FVExJTktfTElTVF9NRU1CRVJTSElQUzogQWxsb3cgYmFkIHB0ciBpZiBpdHMgbGVuZ3Ro
IGlzIDAKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9SOiBBdXRob3IgZW1haWwgYWRkcmVzcyBp
cyBtYW5nbGVkIGJ5IHRoZSBtYWlsaW5nIGxpc3QKIzI6IApBdXRob3I6IEZyw6lkw6lyaWMgRm9y
dGllciB2aWEgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz4KCnRvdGFsOiAxIGVycm9ycywgMCB3YXJu
aW5ncywgOCBsaW5lcyBjaGVja2VkCgpDb21taXQgZTJiYTdmYmQ3NTM1IChsaW51eC11c2VyOiBO
RVRMSU5LX0xJU1RfTUVNQkVSU0hJUFM6IEFsbG93IGJhZCBwdHIgaWYgaXRzIGxlbmd0aCBpcyAw
KSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJy
b3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNl
ZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29t
bWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApo
dHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDMyODE4MDEzNS44ODQ0OS0xLWZyZkBnaGdzYXQu
Y29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVk
IGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ug
c2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

