Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5590C330562
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 01:34:53 +0100 (CET)
Received: from localhost ([::1]:48830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ3rI-0002Up-E0
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 19:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lJ3qb-00025k-Or
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 19:34:09 -0500
Resent-Date: Sun, 07 Mar 2021 19:34:09 -0500
Resent-Message-Id: <E1lJ3qb-00025k-Or@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lJ3qX-000873-Ko
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 19:34:09 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1615163629; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DlBfs4TTY2gFOYJ71lRpnJFnHtmjls46bhOXGmmc2JebmU+ZbTCjsRbxUyUXmbUDXIa6MactIQhv6+1RLxI7HXlmM/hommAxdi5y+6ZKknOCwjEO3FRDSgUJKRJvux0OxvOz563UcdCylrJGP8ISYTPoBT1oEvgEnHziWyh5krU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1615163629;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=O6hcTMn4DuTWMGDhvvDhMWYUoJbFx98gOG/Qh5VgQwM=; 
 b=C4XTdVykuppVfGOPYUpDOveicS+0gnhaGZAfOxT9fIeupE3RF0vXeaxsAMC6AbLNK9KuB2N8XNk52DYgrxNwiH9Nj52S+eOT3rDV0VESzCM9PzMu/1/y99ZlkPjRXsljrMzwW9eI3MJuW5NXm8Cy+40Wzfm6nMLaQphqvN1Dx1w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1615163625577231.69368811150912;
 Sun, 7 Mar 2021 16:33:45 -0800 (PST)
In-Reply-To: <20210308002928.3385275-1-dje@google.com>
Subject: Re: [PATCH] inet_parse: Clarify IPv6 comment and error message
Message-ID: <161516362431.11025.2679751497781286596@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: qemu-devel@nongnu.org
Date: Sun, 7 Mar 2021 16:33:45 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: samuel.thibault@ens-lyon.org, berrange@redhat.com, qemu-devel@nongnu.org,
 dje@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMwODAwMjkyOC4zMzg1
Mjc1LTEtZGplQGdvb2dsZS5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBz
b21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZv
cm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDMwODAwMjkyOC4zMzg1Mjc1
LTEtZGplQGdvb2dsZS5jb20KU3ViamVjdDogW1BBVENIXSBpbmV0X3BhcnNlOiBDbGFyaWZ5IElQ
djYgY29tbWVudCBhbmQgZXJyb3IgbWVzc2FnZQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQoj
IS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBj
b25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
cmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0K
Li9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBU
IEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMz
ODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0
YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDMwODAwMjkyOC4zMzg1Mjc1LTEtZGplQGdvb2dsZS5j
b20gLT4gcGF0Y2hldy8yMDIxMDMwODAwMjkyOC4zMzg1Mjc1LTEtZGplQGdvb2dsZS5jb20KU3dp
dGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo2ZTQyYTQ5IGluZXRfcGFyc2U6IENsYXJpZnkg
SVB2NiBjb21tZW50IGFuZCBlcnJvciBtZXNzYWdlCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJP
UjogQXV0aG9yIGVtYWlsIGFkZHJlc3MgaXMgbWFuZ2xlZCBieSB0aGUgbWFpbGluZyBsaXN0CiMy
OiAKQXV0aG9yOiBEb3VnIEV2YW5zIHZpYSA8cWVtdS1kZXZlbEBub25nbnUub3JnPgoKdG90YWw6
IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAxNCBsaW5lcyBjaGVja2VkCgpDb21taXQgNmU0MmE0OTgx
ODk1IChpbmV0X3BhcnNlOiBDbGFyaWZ5IElQdjYgY29tbWVudCBhbmQgZXJyb3IgbWVzc2FnZSkg
aGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9y
cwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUK
Q0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1h
bmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0
cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAzMDgwMDI5MjguMzM4NTI3NS0xLWRqZUBnb29nbGUu
Y29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVk
IGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ug
c2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

