Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6931C5020
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 10:19:58 +0200 (CEST)
Received: from localhost ([::1]:50104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVso1-00058k-A1
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 04:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jVsmF-0003Uo-BL
 for qemu-devel@nongnu.org; Tue, 05 May 2020 04:18:07 -0400
Resent-Date: Tue, 05 May 2020 04:18:07 -0400
Resent-Message-Id: <E1jVsmF-0003Uo-BL@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jVsmC-0001kM-Ug
 for qemu-devel@nongnu.org; Tue, 05 May 2020 04:18:06 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1588666677; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lGf+Ko5l5QzXJvEfLEvwR79nfG2IjwyIjFDAv67vtmAVuFoQ0vp42uOJBavk50fesSwyDEVqYqHcuR4yeSkI3tNQ+9REslooN3dWHqnln9X7pC7GsdVwb734fw0kdiFRlIMtEwxbV7ILtmIixkeejnL5XAqjinah0HvVkO289IU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1588666677;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=u0G0aE1/AeBFlFNrGlmXexQaqMQu+qU/RDVEJvoveFU=; 
 b=YtMOmiostfeNbFmlAHCaR0ej4Cf0Nx8Qauk/iVdUwov5oZsDERnicGdgn4BIcrBEdSSrIIBKV41o2aKz/0NVOlxQ2KQ8+kjijGOD1gD8qPUyjv0Dnj7/MR025qQPvNxFNEnYj0aWb37Bz7oKwiWr4fxLWTmhMzkRxbGvn8ofybg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1588666676519168.14042809963087;
 Tue, 5 May 2020 01:17:56 -0700 (PDT)
Message-ID: <158866667557.24779.1454260894222986896@45ef0f9c86ae>
In-Reply-To: <20200504132300.1AE883C10EF@aeryn.lan.ktmba>
Subject: Re: [PATCH v5] audio/jack: add JACK client audiodev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: geoff@hostfission.com
Date: Tue, 5 May 2020 01:17:56 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 04:16:46
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDUwNDEzMjMwMC4xQUU4
ODNDMTBFRkBhZXJ5bi5sYW4ua3RtYmEvCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVkIGJ1aWxk
IHRlc3Qgb24gRnJlZUJTRCBob3N0LiBQbGVhc2UgZmluZCB0aGUgZGV0YWlscyBiZWxvdy4KCj09
PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKIyBUZXN0aW5nIHNjcmlwdCB3aWxs
IGJlIGludm9rZWQgdW5kZXIgdGhlIGdpdCBjaGVja291dCB3aXRoCiMgSEVBRCBwb2ludGluZyB0
byBhIGNvbW1pdCB0aGF0IGhhcyB0aGUgcGF0Y2hlcyBhcHBsaWVkIG9uIHRvcCBvZiAiYmFzZSIK
IyBicmFuY2gKaWYgcWVtdS1zeXN0ZW0teDg2XzY0IC0taGVscCA+L2Rldi9udWxsIDI+JjE7IHRo
ZW4KICBRRU1VPXFlbXUtc3lzdGVtLXg4Nl82NAplbGlmIC91c3IvbGliZXhlYy9xZW11LWt2bSAt
LWhlbHAgPi9kZXYvbnVsbCAyPiYxOyB0aGVuCiAgUUVNVT0vdXNyL2xpYmV4ZWMvcWVtdS1rdm0K
ZWxzZQogIGV4aXQgMQpmaQptYWtlIHZtLWJ1aWxkLWZyZWVic2QgSj0yMSBRRU1VPSRRRU1VCmV4
aXQgMAo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJs
ZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMDUwNDEzMjMwMC4xQUU4ODNDMTBFRkBh
ZXJ5bi5sYW4ua3RtYmEvdGVzdGluZy5GcmVlQlNELz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBn
ZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10u
ClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

