Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E4E39553B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 08:08:29 +0200 (CEST)
Received: from localhost ([::1]:46964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnb6B-0003Mi-UC
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 02:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lnb5Q-0002DL-Lq
 for qemu-devel@nongnu.org; Mon, 31 May 2021 02:07:40 -0400
Resent-Date: Mon, 31 May 2021 02:07:40 -0400
Resent-Message-Id: <E1lnb5Q-0002DL-Lq@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lnb5M-0006s0-LU
 for qemu-devel@nongnu.org; Mon, 31 May 2021 02:07:40 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1622441248; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=djNshghXq65EY1bSzpK81ytzA/oYyS+qGGpF8as4B/xAwnxk5unhuJcQzBKzB+KMxrephV3kiQv7Jss2cl69Oc9lumHTR0nuVofkJ/nUdAq6gkZUB/uJu23gow6wn6N/sfwJuaO7cTHzuOlzwq/zsIetbZD8xZ0qAKoNqVIO61A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1622441248;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=LcBfvyy7S5axvtlq6VE5M82XzocfiM/oFFxKbWLya74=; 
 b=mRH1xA5VpuogDTPe5MuxvsiMP98PQYL0bsFgEre6xq9jdUSqdvWwNCh7W/6x2eULNVO5iT/FNJHNiftJjhnWKJKjPIiOWien+EPs9cHVen22QO81X6EhWCDWuRD4P4fPMD0ktJyYP1C7oHQKoZoACZBWpfTV4UoW65rNIwhF2+w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 162244124554343.136891291114125;
 Sun, 30 May 2021 23:07:25 -0700 (PDT)
In-Reply-To: <20210531055019.10149-1-yamamoto@midokura.com>
Subject: Re: [PATCH v2 00/11] linux-user changes to run docker
Message-ID: <162244124398.30167.9625522115700719754@0addf061776e>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: yamamoto@midokura.com
Date: Sun, 30 May 2021 23:07:25 -0700 (PDT)
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
Cc: qemu-devel@nongnu.org, yamamoto@midokura.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUzMTA1NTAxOS4xMDE0
OS0xLXlhbWFtb3RvQG1pZG9rdXJhLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNTMxMDU1MDE5LjEw
MTQ5LTEteWFtYW1vdG9AbWlkb2t1cmEuY29tClN1YmplY3Q6IFtQQVRDSCB2MiAwMC8xMV0gbGlu
dXgtdXNlciBjaGFuZ2VzIHRvIHJ1biBkb2NrZXIKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0K
IyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFt
Ci4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQ
VCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEz
Mzg0ClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKOTI2NjAzMyBsaW51eC11c2VyOiBh
bHdheXMgYXNzdW1lIHByZXNlcnZlX2FyZ3YwIGZvciBub3cgWyFNRVJHRV0KYzQ3ZTVmNyBsaW51
eC11c2VyOiBhIGNydWRlIGhhY2sgZm9yIGxpYmNvbnRhaW5lciAoQ0xPTkVfUEFSRU5UKSBbIU1F
UkdFXQozOTE4ZTFiIGxpbnV4LXVzZXI6IE1ha2UgdGhlIHFlbXUgZGV0ZWN0aW9uIGZvciAvcHJv
Yy8kcGlkL2V4ZSBhIGJpdCBjb25zZXJ2YXRpdmUKYzA4NWZkYyBsaW51eC11c2VyOiBJbXBsZW1l
bnQgZXhlYyBvZiAvcHJvYy8kcGlkL2V4ZSBvZiBxZW11IHByb2Nlc3MKMTE4M2JmOSBsaW51eC11
c2VyOiBzaW1wbGlmeSBpc19wcm9jX215c2VsZgozZDJlMjZkIGxpbnV4LXVzZXI6IGFkZCBnZXRf
ZXhlX3BhdGgKNDQ2OGY2OCBsaW51eC11c2VyOiBJbXBsZW1lbnQgcGl2b3Rfcm9vdAo0MjI0MmNj
IGxpbnV4LXVzZXI6IG1ha2UgZXhlY19wYXRoIHJlYWxwYXRoCjA1N2U3ZTQgbGludXgtdXNlcjog
ZHVwIHRoZSBleGVjZmQgb24gc3RhcnQgdXAKMTg3ZDZkMiBsaW51eC11c2VyOiBGaXggdGhlIGV4
ZWNmZCBjYXNlIG9mIC9wcm9jL3NlbGYvZXhlIG9wZW4KMDJlZjVlNSBsaW51eC11c2VyOiBoYW5k
bGUgL3Byb2Mvc2VsZi9leGUgZm9yIGV4ZWN2ZQoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS8xMSBD
aGVja2luZyBjb21taXQgMDJlZjVlNWQ5ZTUwIChsaW51eC11c2VyOiBoYW5kbGUgL3Byb2Mvc2Vs
Zi9leGUgZm9yIGV4ZWN2ZSkKMi8xMSBDaGVja2luZyBjb21taXQgMTg3ZDZkMjlkNDg4IChsaW51
eC11c2VyOiBGaXggdGhlIGV4ZWNmZCBjYXNlIG9mIC9wcm9jL3NlbGYvZXhlIG9wZW4pCjMvMTEg
Q2hlY2tpbmcgY29tbWl0IDA1N2U3ZTQ5ZDRmZSAobGludXgtdXNlcjogZHVwIHRoZSBleGVjZmQg
b24gc3RhcnQgdXApCjQvMTEgQ2hlY2tpbmcgY29tbWl0IDQyMjQyY2MwNTEzYiAobGludXgtdXNl
cjogbWFrZSBleGVjX3BhdGggcmVhbHBhdGgpCjUvMTEgQ2hlY2tpbmcgY29tbWl0IDQ0NjhmNjg0
ODBmMyAobGludXgtdXNlcjogSW1wbGVtZW50IHBpdm90X3Jvb3QpCldBUk5JTkc6IGFyY2hpdGVj
dHVyZSBzcGVjaWZpYyBkZWZpbmVzIHNob3VsZCBiZSBhdm9pZGVkCiMyMzogRklMRTogbGludXgt
dXNlci9zeXNjYWxsLmM6ODI1NzoKKyNpZiBkZWZpbmVkKFRBUkdFVF9OUl9waXZvdF9yb290KSAm
JiBkZWZpbmVkKF9fTlJfcGl2b3Rfcm9vdCkKCnRvdGFsOiAwIGVycm9ycywgMSB3YXJuaW5ncywg
MzMgbGluZXMgY2hlY2tlZAoKUGF0Y2ggNS8xMSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSBy
ZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0
IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo2
LzExIENoZWNraW5nIGNvbW1pdCAzZDJlMjZkYWE4MmUgKGxpbnV4LXVzZXI6IGFkZCBnZXRfZXhl
X3BhdGgpCjcvMTEgQ2hlY2tpbmcgY29tbWl0IDExODNiZjk3MDJjYiAobGludXgtdXNlcjogc2lt
cGxpZnkgaXNfcHJvY19teXNlbGYpCjgvMTEgQ2hlY2tpbmcgY29tbWl0IGMwODVmZGM4OWM3YyAo
bGludXgtdXNlcjogSW1wbGVtZW50IGV4ZWMgb2YgL3Byb2MvJHBpZC9leGUgb2YgcWVtdSBwcm9j
ZXNzKQo5LzExIENoZWNraW5nIGNvbW1pdCAzOTE4ZTFiN2VlZTUgKGxpbnV4LXVzZXI6IE1ha2Ug
dGhlIHFlbXUgZGV0ZWN0aW9uIGZvciAvcHJvYy8kcGlkL2V4ZSBhIGJpdCBjb25zZXJ2YXRpdmUp
CjEwLzExIENoZWNraW5nIGNvbW1pdCBjNDdlNWY3N2VmMDcgKGxpbnV4LXVzZXI6IGEgY3J1ZGUg
aGFjayBmb3IgbGliY29udGFpbmVyIChDTE9ORV9QQVJFTlQpIFshTUVSR0VdKQoxMS8xMSBDaGVj
a2luZyBjb21taXQgOTI2NjAzM2U0N2NiIChsaW51eC11c2VyOiBhbHdheXMgYXNzdW1lIHByZXNl
cnZlX2FyZ3YwIGZvciBub3cgWyFNRVJHRV0pCkVSUk9SOiBpZiB0aGlzIGNvZGUgaXMgcmVkdW5k
YW50IGNvbnNpZGVyIHJlbW92aW5nIGl0CiMyNjogRklMRTogbGludXgtdXNlci9tYWluLmM6NzI5
OgorI2lmIDAKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgMzggbGluZXMgY2hlY2tlZAoK
UGF0Y2ggMTEvMTEgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9m
IHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWlu
dGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQVVQgRU5EID09
PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZh
aWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwNTMxMDU1MDE5LjEwMTQ5LTEt
eWFtYW1vdG9AbWlkb2t1cmEuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgot
LS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRj
aGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVk
aGF0LmNvbQ==

