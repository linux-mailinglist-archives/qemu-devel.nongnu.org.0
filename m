Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C64345DDC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 13:13:04 +0100 (CET)
Received: from localhost ([::1]:59886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOfuA-0006cp-NW
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 08:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lOfs0-00068x-93
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:10:48 -0400
Resent-Date: Tue, 23 Mar 2021 08:10:48 -0400
Resent-Message-Id: <E1lOfs0-00068x-93@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lOfrp-0004lP-4R
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:10:48 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616501389; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YXqLpFvMPbbDAFaf1dcWX4bm5yDooNL1J8t0UmftkjdxLS7Wlzo1PzWWQK0PFb3t/mX1DDhZ7EnsDbpO2FRNozcC3i6zv4Wzx3vj918UtHGtUnU4DUJxAOt/x8bjFGyIQWK3PZSFGWlOSbiXsnx/2YpOs7ncywkrpWDETQgzB3o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1616501389;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=6sm2KDuw+zGeZXN55d44cEmnqcc5ATtAm3nYJ22mvu0=; 
 b=LToxXSNqPqf8Eyr5mMooOOsqKOrhhjNuz3MPPxBak9+BR52bQy/RfJ0C/fHERQKX+4+3isiHrH8lsiP2Ok4HVkViHs+gEhTQEdTlUyGOKVv1aGurn1WcRFsTuMe6UWxLgqmwWXqKF6y07o6dSleSeMQTKV4lebouuTBsdIvxzow=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 16165013854585.303282620057075;
 Tue, 23 Mar 2021 05:09:45 -0700 (PDT)
In-Reply-To: <20210323120439.563855-1-anthony.perard@citrix.com>
Subject: Re: [PULL 0/1] xen queue 2021-03-23
Message-ID: <161650138433.9581.1964473934310510991@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: qemu-devel@nongnu.org
Date: Tue, 23 Mar 2021 05:09:45 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: anthony.perard@citrix.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMyMzEyMDQzOS41NjM4
NTUtMS1hbnRob255LnBlcmFyZEBjaXRyaXguY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1z
IHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9y
Cm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAzMjMxMjA0
MzkuNTYzODU1LTEtYW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbQpTdWJqZWN0OiBbUFVMTCAwLzFd
IHhlbiBxdWV1ZSAyMDIxLTAzLTIzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9i
YXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAt
LWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVz
IFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3Njcmlw
dHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09
PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9t
IGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAg
ICAgICBwYXRjaGV3LzIwMjEwMzIzMTIwNDM5LjU2Mzg1NS0xLWFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20gLT4gcGF0Y2hldy8yMDIxMDMyMzEyMDQzOS41NjM4NTUtMS1hbnRob255LnBlcmFyZEBj
aXRyaXguY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKOTc1MmEzNyB4ZW4tYmxv
Y2s6IEZpeCByZW1vdmFsIG9mIGJhY2tlbmQgaW5zdGFuY2UgdmlhIHhlbnN0b3JlCgo9PT0gT1VU
UFVUIEJFR0lOID09PQpFUlJPUjogQXV0aG9yIGVtYWlsIGFkZHJlc3MgaXMgbWFuZ2xlZCBieSB0
aGUgbWFpbGluZyBsaXN0CiMyOiAKQXV0aG9yOiBBbnRob255IFBFUkFSRCB2aWEgPHFlbXUtZGV2
ZWxAbm9uZ251Lm9yZz4KCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgMTUgbGluZXMgY2hl
Y2tlZAoKQ29tbWl0IDk3NTJhMzc5ZTk5MCAoeGVuLWJsb2NrOiBGaXggcmVtb3ZhbCBvZiBiYWNr
ZW5kIGluc3RhbmNlIHZpYSB4ZW5zdG9yZSkgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2
aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0
aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09
IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBm
dWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAzMjMx
MjA0MzkuNTYzODU1LTEtYW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbS90ZXN0aW5nLmNoZWNrcGF0
Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBh
dGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0
byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

