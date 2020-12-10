Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5622D68E3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 21:38:50 +0100 (CET)
Received: from localhost ([::1]:50376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knSi9-0002kq-4z
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 15:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1knSgO-0001c1-I5
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 15:37:02 -0500
Resent-Date: Thu, 10 Dec 2020 15:37:00 -0500
Resent-Message-Id: <E1knSgO-0001c1-I5@lists.gnu.org>
Received: from sender4-of-o52.zoho.com ([136.143.188.52]:21212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1knSgK-0000mk-6l
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 15:37:00 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1607632605; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LxJyToMZlI8hCxFAlITRNHu+AeYeQDSJP88gA+TMlHDp4s4UTd2EA3V2kYqbWjDmXUG33rvvx051sqDmRwbAzSFaDe0Pgp2MZXMMT5BmoWr3zG4bulfjQmz3JxY9qhHokQ6wR83AIjJN8/4hR/6UIBMNfk1E339IarzNf/lY+go=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1607632605;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=9lA7Y3wC+Dz4Ev9QmvqvYOPDrhoFIZY+qqDicTWLAeU=; 
 b=IQwKahtUSC1BHl89DLPk26u76afugRABnq8NNN7de3/mMg2XBWwPfQiH6fZExE592c9zSi+aYJaw1bY36H2yF6FiUQT9OVZGbAnOhpqbs2KAyutGrRC5aWxIQi4fYvqxj4vl4YFTRQxHfG+8EEhagHu307P9OLEDk+IgH2A8GEE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1607632604677785.055319624066;
 Thu, 10 Dec 2020 12:36:44 -0800 (PST)
In-Reply-To: <20201210161452.2813491-1-armbru@redhat.com>
Subject: Re: [PATCH 00/10] Fix floating-point -> text conversion precision
Message-ID: <160763260337.10419.687666075184398381@600e7e483b3a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: armbru@redhat.com
Date: Thu, 10 Dec 2020 12:36:44 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.52; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o52.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTIxMDE2MTQ1Mi4yODEz
NDkxLTEtYXJtYnJ1QHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIwMTIxMDE2MTQ1Mi4yODEz
NDkxLTEtYXJtYnJ1QHJlZGhhdC5jb20KU3ViamVjdDogW1BBVENIIDAwLzEwXSBGaXggZmxvYXRp
bmctcG9pbnQgLT4gdGV4dCBjb252ZXJzaW9uIHByZWNpc2lvbgoKPT09IFRFU1QgU0NSSVBUIEJF
R0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhp
dCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxv
Y2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBo
aXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRF
U1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0
YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUK
IC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIwMDkxNjA5NTE1MC43NTU3MTQtMS1zdGVm
YW5oYUByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMDA5MTYwOTUxNTAuNzU1NzE0LTEtc3RlZmFu
aGFAcmVkaGF0LmNvbQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjAxMjEwMTYxNDUy
LjI4MTM0OTEtMS1hcm1icnVAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjAxMjEwMTYxNDUyLjI4
MTM0OTEtMS1hcm1icnVAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3Qn
CmI0ODRkNDEgdGVzdC12aXNpdG9yLXNlcmlhbGl6YXRpb246IENsZWFuIHVwIHRlc3RfcHJpbWl0
aXZlcygpCjIyODRmZDUgdGVzdC12aXNpdG9yLXNlcmlhbGl6YXRpb246IERyb3AgaW5zdWZmaWNp
ZW50IHByZWNpc2lvbiB3b3JrYXJvdW5kCmJlMmU2MDggc3RyaW5nLW91dHB1dC12aXNpdG9yOiBG
aXggdG8gdXNlIHN1ZmZpY2llbnQgcHJlY2lzaW9uCmVmZDJhNTcgdGVzdC1zdHJpbmctb3V0cHV0
LXZpc2l0b3I6IENvdmVyICJ1bnJvdW5kIiBudW1iZXIKOWVkMWVkZCBxb2JqZWN0OiBGaXggcW51
bV90b19zdHJpbmcoKSB0byB1c2Ugc3VmZmljaWVudCBwcmVjaXNpb24KMGNkY2I5NyB0ZXN0cy9j
aGVjay1xbnVtOiBDb3ZlciBxbnVtX3RvX3N0cmluZygpIGZvciAidW5yb3VuZCIgYXJndW1lbnQK
YTM0OWJjMyB0ZXN0cy9jaGVjay1xanNvbjogUmVwbGFjZSByZWR1bmRhbnQgbGFyZ2VfbnVtYmVy
KCkKMDBkYjcxMiB0ZXN0cy9jaGVjay1xanNvbjogQ292ZXIgbnVtYmVyIDJeNjMKNDg3YzIyNiB0
ZXN0cy9jaGVjay1xanNvbjogRXhhbWluZSBRTnVtIG1vcmUgdGhvcm91Z2hseQpiNzgzZGU2IHRl
c3RzL2NoZWNrLXFqc29uOiBEb24ndCBza2lwIGZ1bm55IFFOdW1iZXIgdG8gSlNPTiBjb252ZXJz
aW9ucwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS8xMCBDaGVja2luZyBjb21taXQgYjc4M2RlNjU2
ZTliICh0ZXN0cy9jaGVjay1xanNvbjogRG9uJ3Qgc2tpcCBmdW5ueSBRTnVtYmVyIHRvIEpTT04g
Y29udmVyc2lvbnMpCldBUk5JTkc6IEJsb2NrIGNvbW1lbnRzIHVzZSBhIGxlYWRpbmcgLyogb24g
YSBzZXBhcmF0ZSBsaW5lCiM5NDogRklMRTogdGVzdHMvY2hlY2stcWpzb24uYzo4ODM6CisgICAg
ICAgIHsgIi0zMi4yMGUtMTAiLCAtMzIuMjBlLTEwLCAiLTAiIC8qIEJVRyAqLyB9LAoKRVJST1I6
IHNwYWNlcyByZXF1aXJlZCBhcm91bmQgdGhhdCAnLScgKGN0eDpWeFYpCiM5NDogRklMRTogdGVz
dHMvY2hlY2stcWpzb24uYzo4ODM6CisgICAgICAgIHsgIi0zMi4yMGUtMTAiLCAtMzIuMjBlLTEw
LCAiLTAiIC8qIEJVRyAqLyB9LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KCnRv
dGFsOiAxIGVycm9ycywgMSB3YXJuaW5ncywgOTcgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMS8xMCBo
YXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3Jz
CmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpD
SEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKMi8xMCBDaGVja2luZyBjb21taXQgNDg3YzIyNmM4
MTMyICh0ZXN0cy9jaGVjay1xanNvbjogRXhhbWluZSBRTnVtIG1vcmUgdGhvcm91Z2hseSkKMy8x
MCBDaGVja2luZyBjb21taXQgMDBkYjcxMmUzZDQyICh0ZXN0cy9jaGVjay1xanNvbjogQ292ZXIg
bnVtYmVyIDJeNjMpCjQvMTAgQ2hlY2tpbmcgY29tbWl0IGEzNDliYzNmMmZiNSAodGVzdHMvY2hl
Y2stcWpzb246IFJlcGxhY2UgcmVkdW5kYW50IGxhcmdlX251bWJlcigpKQo1LzEwIENoZWNraW5n
IGNvbW1pdCAwY2RjYjk3MzBkOTAgKHRlc3RzL2NoZWNrLXFudW06IENvdmVyIHFudW1fdG9fc3Ry
aW5nKCkgZm9yICJ1bnJvdW5kIiBhcmd1bWVudCkKNi8xMCBDaGVja2luZyBjb21taXQgOWVkMWVk
ZDJlYjk0IChxb2JqZWN0OiBGaXggcW51bV90b19zdHJpbmcoKSB0byB1c2Ugc3VmZmljaWVudCBw
cmVjaXNpb24pCldBUk5JTkc6IEJsb2NrIGNvbW1lbnRzIHVzZSBhIGxlYWRpbmcgLyogb24gYSBz
ZXBhcmF0ZSBsaW5lCiMxMDQ6IEZJTEU6IHFvYmplY3QvcW51bS5jOjE3MDoKKyAgICAgICAgLyog
RklYTUU6IGdfc3RyZHVwX3ByaW50ZigpIGlzIGxvY2FsZSBkZXBlbmRlbnQ7IGJ1dCBKU09OIHJl
cXVpcmVzCgpFUlJPUjogc3BhY2VzIHJlcXVpcmVkIGFyb3VuZCB0aGF0ICctJyAoY3R4OlZ4VikK
IzE0NDogRklMRTogdGVzdHMvY2hlY2stcWpzb24uYzo4ODY6CisgICAgICAgIHsgIi0zMi4yMGUt
MTAiLCAtMzIuMjBlLTEwLCAiLTMuMjJlLTA5IiB9LAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF4KCnRvdGFsOiAxIGVycm9ycywgMSB3YXJuaW5ncywgNjkgbGluZXMgY2hlY2tlZAoK
UGF0Y2ggNi8xMCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2Yg
dGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50
YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKNy8xMCBDaGVja2luZyBjb21t
aXQgZWZkMmE1N2U1ZDIwICh0ZXN0LXN0cmluZy1vdXRwdXQtdmlzaXRvcjogQ292ZXIgInVucm91
bmQiIG51bWJlcikKOC8xMCBDaGVja2luZyBjb21taXQgYmUyZTYwODBlNWRlIChzdHJpbmctb3V0
cHV0LXZpc2l0b3I6IEZpeCB0byB1c2Ugc3VmZmljaWVudCBwcmVjaXNpb24pCjkvMTAgQ2hlY2tp
bmcgY29tbWl0IDIyODRmZDUyOGIyYyAodGVzdC12aXNpdG9yLXNlcmlhbGl6YXRpb246IERyb3Ag
aW5zdWZmaWNpZW50IHByZWNpc2lvbiB3b3JrYXJvdW5kKQoxMC8xMCBDaGVja2luZyBjb21taXQg
YjQ4NGQ0MTI2ODY1ICh0ZXN0LXZpc2l0b3Itc2VyaWFsaXphdGlvbjogQ2xlYW4gdXAgdGVzdF9w
cmltaXRpdmVzKCkpCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRo
IGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9y
Zy9sb2dzLzIwMjAxMjEwMTYxNDUyLjI4MTM0OTEtMS1hcm1icnVAcmVkaGF0LmNvbS90ZXN0aW5n
LmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNh
bGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBm
ZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

