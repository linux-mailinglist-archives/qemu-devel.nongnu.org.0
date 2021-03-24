Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695313472AF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 08:32:23 +0100 (CET)
Received: from localhost ([::1]:43194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOy06-0005GX-9v
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 03:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lOxz9-0004fL-Qh; Wed, 24 Mar 2021 03:31:23 -0400
Resent-Date: Wed, 24 Mar 2021 03:31:23 -0400
Resent-Message-Id: <E1lOxz9-0004fL-Qh@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lOxz7-0004Py-3W; Wed, 24 Mar 2021 03:31:23 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616571052; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IJxR4VrKVfMfGUuWp9n0pHnpknjlYMlEpOitsllC3QHi2M/uuGbrxP3s0pORUVdhqqTSlVPAkQViuNAhgFX3ImZOFvUflxf81T17v02S/HXOZ/588RNYHQBMi+eV3GZDdtrVftRiCJQ/+J2xG7ZHOQkCw9LUOg7WRhQwlAjsdDw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1616571052;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=nMt3SRLXNgVrvb1s0aiKKR62ZTp97DV7kEtnDa/ja48=; 
 b=Ts2Re14JtLL7UJFe64j6foXnXYf77pr+VpyuEYdXNNs1pBxyd2nNfU/Tap/9UIp9Q7//2T4p7dZleAnaRbcRCZNBJcj4/3pyT0/rYSUopz4LQ0paBkufKFKbw5MU2Xl14utuEDwLL/IwS3Gs3+aDjrQaB+aVu6/UHxDFFrU/hzc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1616571050006709.3541462791587;
 Wed, 24 Mar 2021 00:30:50 -0700 (PDT)
In-Reply-To: <20210324070955.125941-1-joel@jms.id.au>
Subject: Re: [PATCH v4 0/3] hw/misc: Model ASPEED hash and crypto engine
Message-ID: <161657104880.22034.9311450853562432648@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: joel@jms.id.au
Date: Wed, 24 Mar 2021 00:30:50 -0700 (PDT)
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
Cc: peter.maydell@linaro.org, andrew@aj.id.au, qemu-devel@nongnu.org,
 f4bug@amsat.org, qemu-arm@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMyNDA3MDk1NS4xMjU5
NDEtMS1qb2VsQGptcy5pZC5hdS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNv
bWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9y
bWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMzI0MDcwOTU1LjEyNTk0MS0x
LWpvZWxAam1zLmlkLmF1ClN1YmplY3Q6IFtQQVRDSCB2NCAwLzNdIGh3L21pc2M6IE1vZGVsIEFT
UEVFRCBoYXNoIGFuZCBjcnlwdG8gZW5naW5lCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMh
L2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5y
ZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQou
L3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQg
RU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4
NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRh
Z10gICAgICAgICBwYXRjaGV3LzIwMjEwMzI0MDcwOTU1LjEyNTk0MS0xLWpvZWxAam1zLmlkLmF1
IC0+IHBhdGNoZXcvMjAyMTAzMjQwNzA5NTUuMTI1OTQxLTEtam9lbEBqbXMuaWQuYXUKU3dpdGNo
ZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo1ZWJjMmM1IHRlc3RzL3F0ZXN0OiBBZGQgdGVzdCBm
b3IgQXNwZWVkIEhBQ0UKNmZjMTk0NiBhc3BlZWQ6IEludGVncmF0ZSBIQUNFCmZhM2JiYWUgaHc6
IE1vZGVsIEFTUEVFRCdzIEhhc2ggYW5kIENyeXB0byBFbmdpbmUKCj09PSBPVVRQVVQgQkVHSU4g
PT09CjEvMyBDaGVja2luZyBjb21taXQgZmEzYmJhZTcxZGQ1IChodzogTW9kZWwgQVNQRUVEJ3Mg
SGFzaCBhbmQgQ3J5cHRvIEVuZ2luZSkKVXNlIG9mIHVuaW5pdGlhbGl6ZWQgdmFsdWUgJGFjcGlf
dGVzdGV4cGVjdGVkIGluIHN0cmluZyBlcSBhdCAuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCBsaW5l
IDE1MjkuCldBUk5JTkc6IGFkZGVkLCBtb3ZlZCBvciBkZWxldGVkIGZpbGUocyksIGRvZXMgTUFJ
TlRBSU5FUlMgbmVlZCB1cGRhdGluZz8KIzIyOiAKbmV3IGZpbGUgbW9kZSAxMDA2NDQKCldBUk5J
Tkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiM5NTogRklMRTogaHcvbWlzYy9hc3BlZWRfaGFj
ZS5jOjY5OgorICAgIHsgSEFTSF9BTEdPX1NIQTUxMl9TRVJJRVMgfCBIQVNIX0FMR09fU0hBNTEy
X1NIQTUxMiwgUUNSWVBUT19IQVNIX0FMR19TSEE1MTIgfSwKCldBUk5JTkc6IGxpbmUgb3ZlciA4
MCBjaGFyYWN0ZXJzCiM5NjogRklMRTogaHcvbWlzYy9hc3BlZWRfaGFjZS5jOjcwOgorICAgIHsg
SEFTSF9BTEdPX1NIQTUxMl9TRVJJRVMgfCBIQVNIX0FMR09fU0hBNTEyX1NIQTM4NCwgUUNSWVBU
T19IQVNIX0FMR19TSEEzODQgfSwKCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiM5
NzogRklMRTogaHcvbWlzYy9hc3BlZWRfaGFjZS5jOjcxOgorICAgIHsgSEFTSF9BTEdPX1NIQTUx
Ml9TRVJJRVMgfCBIQVNIX0FMR09fU0hBNTEyX1NIQTI1NiwgUUNSWVBUT19IQVNIX0FMR19TSEEy
NTYgfSwKCkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBmb3IgYWxsIGFybXMgb2YgdGhp
cyBzdGF0ZW1lbnQKIzEwNTogRklMRTogaHcvbWlzYy9hc3BlZWRfaGFjZS5jOjc5OgorICAgICAg
ICBpZiAobWFzayA9PSBoYXNoX2FsZ29fbWFwW2ldLm1hc2spClsuLi5dCgpXQVJOSU5HOiBsaW5l
IG92ZXIgODAgY2hhcmFjdGVycwojMjEyOiBGSUxFOiBody9taXNjL2FzcGVlZF9oYWNlLmM6MTg2
OgorICAgICAgICAgICAgICAgICAgICAgICAgICAiJXM6IEhNQUMgZW5naW5lIGNvbW1hbmQgbW9k
ZSAlIlBSSXg2NCIgbm90IGltcGxlbWVudGVkIiwKCnRvdGFsOiAxIGVycm9ycywgNSB3YXJuaW5n
cywgNDA4IGxpbmVzIGNoZWNrZWQKClBhdGNoIDEvMyBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFz
ZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVw
b3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJT
LgoKMi8zIENoZWNraW5nIGNvbW1pdCA2ZmMxOTQ2MDFlMWIgKGFzcGVlZDogSW50ZWdyYXRlIEhB
Q0UpCjMvMyBDaGVja2luZyBjb21taXQgNWViYzJjNTY0MmRhICh0ZXN0cy9xdGVzdDogQWRkIHRl
c3QgZm9yIEFzcGVlZCBIQUNFKQpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojMTMw
OiBGSUxFOiB0ZXN0cy9xdGVzdC9hc3BlZWRfaGFjZS10ZXN0LmM6OTE6CisgICAgd3JpdGVfcmVn
cyhzLCBiYXNlLCBzcmNfYWRkciwgc2l6ZW9mKHRlc3RfdmVjdG9yKSwgZGlnZXN0X2FkZHIsIEhB
Q0VfQUxHT19NRDUpOwoKV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzE2MTogRklM
RTogdGVzdHMvcXRlc3QvYXNwZWVkX2hhY2UtdGVzdC5jOjEyMjoKKyAgICB3cml0ZV9yZWdzKHMs
IGJhc2UsIHNyY19hZGRyLCBzaXplb2YodGVzdF92ZWN0b3IpLCBkaWdlc3RfYWRkciwgSEFDRV9B
TEdPX1NIQTI1Nik7CgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojMTkyOiBGSUxF
OiB0ZXN0cy9xdGVzdC9hc3BlZWRfaGFjZS10ZXN0LmM6MTUzOgorICAgIHdyaXRlX3JlZ3Mocywg
YmFzZSwgc3JjX2FkZHIsIHNpemVvZih0ZXN0X3ZlY3RvciksIGRpZ2VzdF9hZGRyLCBIQUNFX0FM
R09fU0hBNTEyKTsKCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiMyNTM6IEZJTEU6
IHRlc3RzL3F0ZXN0L2FzcGVlZF9oYWNlLXRlc3QuYzoyMTQ6CisgICAgZ19hc3NlcnRfY21waGV4
KHF0ZXN0X3JlYWRsKHMsIGJhc2UgKyBIQUNFX0hBU0hfRElHRVNUKSwgPT0sIGV4cGVjdGVkLT5k
ZXN0KTsKCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiMyNTY6IEZJTEU6IHRlc3Rz
L3F0ZXN0L2FzcGVlZF9oYWNlLXRlc3QuYzoyMTc6CisgICAgZ19hc3NlcnRfY21waGV4KHF0ZXN0
X3JlYWRsKHMsIGJhc2UgKyBIQUNFX0hBU0hfREFUQV9MRU4pLCA9PSwgZXhwZWN0ZWQtPmxlbik7
Cgp0b3RhbDogMCBlcnJvcnMsIDUgd2FybmluZ3MsIDMzNSBsaW5lcyBjaGVja2VkCgpQYXRjaCAz
LzMgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVy
cm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBz
ZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNv
bW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQK
aHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAzMjQwNzA5NTUuMTI1OTQxLTEtam9lbEBqbXMu
aWQuYXUvdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0
ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFz
ZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

