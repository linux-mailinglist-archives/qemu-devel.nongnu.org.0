Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD233A71DB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 00:23:15 +0200 (CEST)
Received: from localhost ([::1]:45174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsuzD-00077P-0G
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 18:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lsuyT-0006OL-SA; Mon, 14 Jun 2021 18:22:29 -0400
Resent-Date: Mon, 14 Jun 2021 18:22:29 -0400
Resent-Message-Id: <E1lsuyT-0006OL-SA@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lsuyR-0004ET-EQ; Mon, 14 Jun 2021 18:22:29 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623709339; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WYR8xfGEqc69ADqDHJrgLXeMyCorguIq8Dv7hUbC93qLRW/tD4yOPsk5knqqQcHiqU3/RrJh5tCUX4pq2Gch8+floociu5MiLUP8YBAkF9hQNenBiSTXBivQ+xLSIzqVTwTSlY3oIGiPjlZrSKs15qoFCySOFJp8u8xAOvMAvTQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623709339;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=6R2MkG7XLfd1r3n0ph+NU2Mpj16jYBkcp8CIQgpwQYs=; 
 b=gPDalJQEMkFGWGKX6tSnKZ8nH6MWrOMKhvJl5KfrkzRSIldnPz317Muos+hVkyyuLSPSBjftEYMRcyyYfMNcn9raHuOXxTJ5tuX59ms319hWOkfTloHmiCmhJOJ+FvMJI2kiEbgrKoi0PRQ8DpOCPdxDToQre3y56BvVHfGNMNk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1623709337825840.7964115785959;
 Mon, 14 Jun 2021 15:22:17 -0700 (PDT)
In-Reply-To: <20210610224450.23425-1-jziviani@suse.de>
Subject: Re: [PATCH] tcg/arm: Fix tcg_out_op function signature
Message-ID: <162370933679.2358.3259800166354184001@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: jziviani@suse.de
Date: Mon, 14 Jun 2021 15:22:17 -0700 (PDT)
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
Cc: qemu-arm@nongnu.org, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 jziviani@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYxMDIyNDQ1MC4yMzQy
NS0xLWp6aXZpYW5pQHN1c2UuZGUvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBz
b21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZv
cm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDYxMDIyNDQ1MC4yMzQyNS0x
LWp6aXZpYW5pQHN1c2UuZGUKU3ViamVjdDogW1BBVENIXSB0Y2cvYXJtOiBGaXggdGNnX291dF9v
cCBmdW5jdGlvbiBzaWduYXR1cmUKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jh
c2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0t
bG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMg
VHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0
cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09
CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20g
aHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAg
ICAgIHBhdGNoZXcvMjAyMTA2MTQxMTQzNTcuMTE0NjcyNS0xLXZpbmNlbnRAYmVybmF0LmNoIC0+
IHBhdGNoZXcvMjAyMTA2MTQxMTQzNTcuMTE0NjcyNS0xLXZpbmNlbnRAYmVybmF0LmNoCiAqIFtu
ZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTA2MTQxNDQ0MDcuMTM0MjQzLTEtbXJlaXR6QHJl
ZGhhdC5jb20gLT4gcGF0Y2hldy8yMDIxMDYxNDE0NDQwNy4xMzQyNDMtMS1tcmVpdHpAcmVkaGF0
LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCgo9PT0gT1VUUFVUIEJFR0lOID09
PQpjaGVja3BhdGNoLnBsOiBubyByZXZpc2lvbnMgcmV0dXJuZWQgZm9yIHJldmxpc3QgJ2Jhc2Uu
LicKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMjU1
CgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8y
MDIxMDYxMDIyNDQ1MC4yMzQyNS0xLWp6aXZpYW5pQHN1c2UuZGUvdGVzdGluZy5jaGVja3BhdGNo
Lz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRj
aGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8g
cGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

