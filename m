Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E393252B0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 16:48:29 +0100 (CET)
Received: from localhost ([::1]:52890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFIsO-00025a-UU
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 10:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lFIq0-0000fS-U2
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:46:00 -0500
Resent-Date: Thu, 25 Feb 2021 10:46:00 -0500
Resent-Message-Id: <E1lFIq0-0000fS-U2@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lFIpx-0004vx-OU
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:46:00 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1614267949; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OTFdos/Ikk1VRmypipopAakdPaUHYOkXSCeJTQ488y6aozWmjsPXQrUSK+O8pGFYtnNa0It3sjesow7XjZeEDwcRvzmhVbpNFYDDEh/TtDoEm+k8CfhQt0jSx1SvZug3a+hS71GavyF8MNsZYYp8tSiYB5TRBvWuGNgjNnSSfIg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1614267949;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=gGhumPAWhbSYg2VHK0EbUNVHIKzHbSwRfCY8oXUWrq8=; 
 b=GtNjP681eQiUDcfRpqpGBLF96bB72IQr/DL96L4LfI9lZDw+up2W4wjv/Ma8RBQXU7inpcN4NvOQBgij95Y1Qx8xLY/YFVSbNtcoYslaEcH3W1iKrBXlSRDwvLTJI0F73BpEL9vgVQlMSAyORWIvcd/jNOgLsnPzcI7J8NfNQkY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1614267946902816.6862140826674;
 Thu, 25 Feb 2021 07:45:46 -0800 (PST)
In-Reply-To: <20210224165811.11567-1-alex.bennee@linaro.org>
Subject: Re: [RFC PATCH  0/5] Experimenting with tb-lookup tweaks
Message-ID: <161426794575.1906.6485972182754444411@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alex.bennee@linaro.org
Date: Thu, 25 Feb 2021 07:45:46 -0800 (PST)
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
Cc: alex.bennee@linaro.org, cota@braap.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIyNDE2NTgxMS4xMTU2
Ny0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8g
aGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9y
ZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDIyNDE2NTgxMS4x
MTU2Ny0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcKU3ViamVjdDogW1JGQyBQQVRDSCAgMC81XSBF
eHBlcmltZW50aW5nIHdpdGggdGItbG9va3VwIHR3ZWFrcwoKPT09IFRFU1QgU0NSSVBUIEJFR0lO
ID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAw
CmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2Fs
IGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0
b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1Qg
U0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4
ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIC0g
W3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDIxODIwMTUyOC4xMjcwOTktMS1lYmxha2VA
cmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwMjE4MjAxNTI4LjEyNzA5OS0xLWVibGFrZUByZWRo
YXQuY29tCiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTAyMjQwNTU0MDEuNDkyNDA3
LTEtamFzb3dhbmdAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwMjI0MDU1NDAxLjQ5MjQwNy0x
LWphc293YW5nQHJlZGhhdC5jb20KICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDIy
NDE2NTgxMS4xMTU2Ny0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcgLT4gcGF0Y2hldy8yMDIxMDIy
NDE2NTgxMS4xMTU2Ny0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcKICogW25ldyB0YWddICAgICAg
ICAgcGF0Y2hldy8yMDIxMDIyNDE2NTgzNy4yMTk4My0xLXZnb3lhbEByZWRoYXQuY29tIC0+IHBh
dGNoZXcvMjAyMTAyMjQxNjU4MzcuMjE5ODMtMS12Z295YWxAcmVkaGF0LmNvbQogLSBbdGFnIHVw
ZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwMjI1MDMyMzM1LjY0MjQ1LTEtYWlrQG96bGFicy5ydSAt
PiBwYXRjaGV3LzIwMjEwMjI1MDMyMzM1LjY0MjQ1LTEtYWlrQG96bGFicy5ydQogKiBbbmV3IHRh
Z10gICAgICAgICBwYXRjaGV3LzIwMjEwMjI1MDU0NzU2LjM1OTYyLTEtbGludXhtYWtlckAxNjMu
Y29tIC0+IHBhdGNoZXcvMjAyMTAyMjUwNTQ3NTYuMzU5NjItMS1saW51eG1ha2VyQDE2My5jb20K
IC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDIyNTEzMTMxNi42MzE5NDAtMS1wYm9u
emluaUByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTAyMjUxMzEzMTYuNjMxOTQwLTEtcGJvbnpp
bmlAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjBiZTU0YjQgaW5j
bHVkZS9leGVjL3RiLWxvb2t1cDogdHJ5IGFuZCByZWR1Y2UgYnJhbmNoIHByZWRpY3Rpb24gaXNz
dWVzCmM2MjMzZGUgaW5jbHVkZS9leGVjOiBsaWdodGx5IHJlLWFycmFuZ2UgVHJhbnNsYXRpb25C
bG9jawoxODUzNGJmIGFjY2VsL3RjZzogZHJvcCB0aGUgdXNlIG9mIENGX0hBU0hfTUFTSyBhbmQg
cmVuYW1lIHBhcmFtcwozYTMwY2FmIGFjY2VsL3RjZzogbW92ZSBDRl9DTFVTVEVSIGNhbGN1bGF0
aW9uIHRvIGN1cnJfY2ZsYWdzCmExMzViZWEgYWNjZWwvdGNnOiByZW5hbWUgdGJfbG9va3VwX19j
cHVfc3RhdGUgYW5kIGhvaXN0IHN0YXRlIGV4dHJhY3Rpb24KCj09PSBPVVRQVVQgQkVHSU4gPT09
CjEvNSBDaGVja2luZyBjb21taXQgYTEzNWJlYTM2MzY2IChhY2NlbC90Y2c6IHJlbmFtZSB0Yl9s
b29rdXBfX2NwdV9zdGF0ZSBhbmQgaG9pc3Qgc3RhdGUgZXh0cmFjdGlvbikKRVJST1I6ICJmb28g
KiBiYXIiIHNob3VsZCBiZSAiZm9vICpiYXIiCiM4NDogRklMRTogaW5jbHVkZS9leGVjL3RiLWxv
b2t1cC5oOjIwOgorc3RhdGljIGlubGluZSBUcmFuc2xhdGlvbkJsb2NrICogdGJfbG9va3VwKENQ
VVN0YXRlICpjcHUsCgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojODU6IEZJTEU6
IGluY2x1ZGUvZXhlYy90Yi1sb29rdXAuaDoyMToKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB0YXJnZXRfdWxvbmcgcGMsIHRhcmdldF91bG9uZyBjc19iYXNlLAoK
dG90YWw6IDEgZXJyb3JzLCAxIHdhcm5pbmdzLCA4MCBsaW5lcyBjaGVja2VkCgpQYXRjaCAxLzUg
aGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9y
cwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUK
Q0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCjIvNSBDaGVja2luZyBjb21taXQgM2EzMGNhZjVm
NDdkIChhY2NlbC90Y2c6IG1vdmUgQ0ZfQ0xVU1RFUiBjYWxjdWxhdGlvbiB0byBjdXJyX2NmbGFn
cykKMy81IENoZWNraW5nIGNvbW1pdCAxODUzNGJmZjBmMWYgKGFjY2VsL3RjZzogZHJvcCB0aGUg
dXNlIG9mIENGX0hBU0hfTUFTSyBhbmQgcmVuYW1lIHBhcmFtcykKNC81IENoZWNraW5nIGNvbW1p
dCBjNjIzM2RlODMyNjMgKGluY2x1ZGUvZXhlYzogbGlnaHRseSByZS1hcnJhbmdlIFRyYW5zbGF0
aW9uQmxvY2spCldBUk5JTkc6IEJsb2NrIGNvbW1lbnRzIHVzZSBhIGxlYWRpbmcgLyogb24gYSBz
ZXBhcmF0ZSBsaW5lCiMzNTogRklMRTogaW5jbHVkZS9leGVjL2V4ZWMtYWxsLmg6NDY1OgorICAg
IHVpbnQxNl90IHNpemU7ICAgICAgLyogc2l6ZSBvZiB0YXJnZXQgY29kZSBmb3IgdGhpcyBibG9j
ayAoMSA8PQoKV0FSTklORzogQmxvY2sgY29tbWVudHMgdXNlICogb24gc3Vic2VxdWVudCBsaW5l
cwojMzY6IEZJTEU6IGluY2x1ZGUvZXhlYy9leGVjLWFsbC5oOjQ2NjoKKyAgICB1aW50MTZfdCBz
aXplOyAgICAgIC8qIHNpemUgb2YgdGFyZ2V0IGNvZGUgZm9yIHRoaXMgYmxvY2sgKDEgPD0KKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHNpemUgPD0gVEFSR0VUX1BBR0VfU0laRSkgKi8KCldB
Uk5JTkc6IEJsb2NrIGNvbW1lbnRzIHVzZSBhIHRyYWlsaW5nICovIG9uIGEgc2VwYXJhdGUgbGlu
ZQojMzY6IEZJTEU6IGluY2x1ZGUvZXhlYy9leGVjLWFsbC5oOjQ2NjoKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHNpemUgPD0gVEFSR0VUX1BBR0VfU0laRSkgKi8KCnRvdGFsOiAwIGVycm9y
cywgMyB3YXJuaW5ncywgMjAgbGluZXMgY2hlY2tlZAoKUGF0Y2ggNC81IGhhcyBzdHlsZSBwcm9i
bGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBv
c2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4g
TUFJTlRBSU5FUlMuCjUvNSBDaGVja2luZyBjb21taXQgMGJlNTRiNGVlMTQ2IChpbmNsdWRlL2V4
ZWMvdGItbG9va3VwOiB0cnkgYW5kIHJlZHVjZSBicmFuY2ggcHJlZGljdGlvbiBpc3N1ZXMpCj09
PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUg
ZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwMjI0
MTY1ODExLjExNTY3LTEtYWxleC5iZW5uZWVAbGluYXJvLm9yZy90ZXN0aW5nLmNoZWNrcGF0Y2gv
P3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNo
ZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBw
YXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

