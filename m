Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE86060F68
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jul 2019 10:09:10 +0200 (CEST)
Received: from localhost ([::1]:58228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjfkr-0004vV-9H
	for lists+qemu-devel@lfdr.de; Sat, 06 Jul 2019 04:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37133)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <no-reply@patchew.org>) id 1hjfjT-00044e-H2
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 04:07:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1hjfjQ-0006mc-KV
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 04:07:42 -0400
Resent-Date: Sat, 06 Jul 2019 04:07:41 -0400
Resent-Message-Id: <E1hjfjQ-0006mc-KV@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21487)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1hjfjQ-0006km-AI
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 04:07:40 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1562400447; cv=none; d=zoho.com; s=zohoarc; 
 b=gr4dDAjtUD/S6qS7gU2G/L2yOT97oBiW1QdWLuvQBKuChX84yD4YJ/xQNTHTkYz6aAXZUfv+i4XMuhcaG39WbJ4BAZX9D+QhK+T0CoDPhJZkkynzCAy5cI8rxk3aniAGT8H0GTcxPjlSDWOhvtxUK/Ti7/i4r61dasXQ+xEszXw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1562400447;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=NuV+FRXd8toiVltXoD1C9CIHPunWYXSDMNYsQC6cUrs=; 
 b=TF8Z5CFXRkSprlxkOPtwr7fzbT0Sb3lQc9o58vquWKxOOAGJXSSQNdD8yTEB9ai8V84bNP7KM9fwau6SQZ5gEsW/CZzIUY8Hjib3A/P+T4BCHgFYAc4aZgwh1yW/Ff7RWZVpXNd4gGbatjRCUax6ZmIRAQmV/uOHittDDKm9K6Q=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1562400446143600.0466845048052;
 Sat, 6 Jul 2019 01:07:26 -0700 (PDT)
Message-ID: <156240044533.4200.2323994918788274321@c4a48874b076>
In-Reply-To: <1562356239-19391-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pbonzini@redhat.com
Date: Sat, 6 Jul 2019 01:07:26 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-devel] [PULL 00/12] Misc bugfixes for QEMU hard freeze
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

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNTYyMzU2MjM5LTE5MzkxLTEt
Z2l0LXNlbmQtZW1haWwtcGJvbnppbmlAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBm
YWlsZWQgYnVpbGQgdGVzdCBvbiBzMzkweCBob3N0LiBQbGVhc2UgZmluZCB0aGUgZGV0YWlscyBi
ZWxvdy4KCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKIyBUZXN0aW5nIHNj
cmlwdCB3aWxsIGJlIGludm9rZWQgdW5kZXIgdGhlIGdpdCBjaGVja291dCB3aXRoCiMgSEVBRCBw
b2ludGluZyB0byBhIGNvbW1pdCB0aGF0IGhhcyB0aGUgcGF0Y2hlcyBhcHBsaWVkIG9uIHRvcCBv
ZiAiYmFzZSIKIyBicmFuY2gKc2V0IC1lCgplY2hvCmVjaG8gIj09PSBFTlYgPT09IgplbnYKCmVj
aG8KZWNobyAiPT09IFBBQ0tBR0VTID09PSIKcnBtIC1xYQoKZWNobwplY2hvICI9PT0gVU5BTUUg
PT09Igp1bmFtZSAtYQoKQ0M9JEhPTUUvYmluL2NjCklOU1RBTEw9JFBXRC9pbnN0YWxsCkJVSUxE
PSRQV0QvYnVpbGQKbWtkaXIgLXAgJEJVSUxEICRJTlNUQUxMClNSQz0kUFdECmNkICRCVUlMRAok
U1JDL2NvbmZpZ3VyZSAtLWNjPSRDQyAtLXByZWZpeD0kSU5TVEFMTAptYWtlIC1qNAojIFhYWDog
d2UgbmVlZCByZWxpYWJsZSBjbGVhbiB1cAojIG1ha2UgY2hlY2sgLWo0IFY9MQptYWtlIGluc3Rh
bGwKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCgoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUg
YXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMTU2MjM1NjIzOS0xOTM5MS0xLWdpdC1zZW5kLWVt
YWlsLXBib256aW5pQHJlZGhhdC5jb20vdGVzdGluZy5zMzkweC8/dHlwZT1tZXNzYWdlLgotLS0K
RW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3
Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0
LmNvbQ==


