Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5AD32E51F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:44:52 +0100 (CET)
Received: from localhost ([::1]:42796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI70t-0002CL-VA
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lI6zn-0001BF-MG
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:43:43 -0500
Resent-Date: Fri, 05 Mar 2021 04:43:43 -0500
Resent-Message-Id: <E1lI6zn-0001BF-MG@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lI6zl-00077y-6V
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:43:43 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1614937373; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OpSq0GfGim/LyHJezUPbgOilKWGc9zHqJ4R+e9/pyRD3z9y48pQJrDRMtIxRX6XLeX962/xf4wMYRz6buncEtXrQUb8YilrO3Igal7z1UyFmnXBz1Gziep5P/ZsWUrdgTTm1yaylVv1Bmfkjy6QeiY4vENzhxSfvXpUWIMqT1z8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1614937373;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=atbBkO22Fv/fxBiCXHvK22dtG7XvKHP8xC2zRDYn3PQ=; 
 b=UItmS6/bDlHiF1o5uGKKlQ/b27nIg0lPsfB3/KW6jdF3sE3EhNkMb06RVYMDe0IrVikF+F9uSS3vrcBnWa34+CN5UkgPH/fEQEMyhtbN+ZNitTQRKAmbrciH1SWmO1rjPnfsJJyRjai0kdE96x3b5UL1j3dx54co/uuxNLx2hWk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1614937368591554.2858608814275;
 Fri, 5 Mar 2021 01:42:48 -0800 (PST)
In-Reply-To: <20210305092328.31792-1-alex.bennee@linaro.org>
Subject: Re: [PATCH  v1 0/9] testing/next (docs, hexagon, cfi, docker)
Message-ID: <161493736686.6754.14815478211111589668@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alex.bennee@linaro.org
Date: Fri, 5 Mar 2021 01:42:48 -0800 (PST)
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
Cc: fam@euphon.net, berrange@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 alex.bennee@linaro.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMwNTA5MjMyOC4zMTc5
Mi0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8g
aGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9y
ZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDMwNTA5MjMyOC4z
MTc5Mi0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcKU3ViamVjdDogW1BBVENIICB2MSAwLzldIHRl
c3RpbmcvbmV4dCAoZG9jcywgaGV4YWdvbiwgY2ZpLCBkb2NrZXIpCgo9PT0gVEVTVCBTQ1JJUFQg
QkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBl
eGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0t
bG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGht
IGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0g
VEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdm
NDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVt
dQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwMzA1MDkyMzI4LjMxNzkyLTEtYWxl
eC5iZW5uZWVAbGluYXJvLm9yZyAtPiBwYXRjaGV3LzIwMjEwMzA1MDkyMzI4LjMxNzkyLTEtYWxl
eC5iZW5uZWVAbGluYXJvLm9yZwpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjkxYTdl
ZjEgdGVzdHMvZG9ja2VyOiBVc2UgLS1hcmNoLW9ubHkgd2hlbiBidWlsZGluZyBEZWJpYW4gY3Jv
c3MgaW1hZ2UKZTBhOTVkYSBnaXRsYWItY2kueW1sOiBBZGQgam9icyB0byB0ZXN0IENGSSBmbGFn
cwozNjBjNWVlIGdpdGxhYi1jaS55bWw6IEFsbG93IGN1c3RvbSAjIG9mIHBhcmFsbGVsIGxpbmtl
cnMKMjIyYTI2OSBnaXRsYWI6IGFkZCBidWlsZC11c2VyLWhleGFnb24gdGVzdAplMjI2OTUzIHRl
c3RzL3RjZzogVXNlIEhleGFnb24gRG9ja2VyIGltYWdlCmZmYTU5OWMgZG9ja2VyOiBBZGQgSGV4
YWdvbiBpbWFnZQoxNGZmNjIxIHRlc3RzL2RvY2tlcjogYWRkIGEgdGVzdC10Y2cgZm9yIGJ1aWxk
aW5nIHRoZW4gcnVubmluZyBjaGVjay10Y2cKYzU0MGVkOSBkb2NzL3N5c3RlbTogYWRkIGEgZ2Vu
dGxlIHByb21wdCBmb3IgdGhlIGNvbXBsZXhpdHkgdG8gY29tZQphMTkwZjg0IGRvY3MvZGV2ZWw6
IHJlLW9yZ2FuaXNlIHRoZSBkZXZlbG9wZXJzIGd1aWRlIGludG8gc2VjdGlvbnMKCj09PSBPVVRQ
VVQgQkVHSU4gPT09CjEvOSBDaGVja2luZyBjb21taXQgYTE5MGY4NGE3NjA3IChkb2NzL2RldmVs
OiByZS1vcmdhbmlzZSB0aGUgZGV2ZWxvcGVycyBndWlkZSBpbnRvIHNlY3Rpb25zKQpVc2Ugb2Yg
dW5pbml0aWFsaXplZCB2YWx1ZSAkYWNwaV90ZXN0ZXhwZWN0ZWQgaW4gc3RyaW5nIGVxIGF0IC4v
c2NyaXB0cy9jaGVja3BhdGNoLnBsIGxpbmUgMTUyOS4KV0FSTklORzogYWRkZWQsIG1vdmVkIG9y
IGRlbGV0ZWQgZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVkIHVwZGF0aW5nPwojODk6IApu
ZXcgZmlsZSBtb2RlIDEwMDY0NAoKdG90YWw6IDAgZXJyb3JzLCAxIHdhcm5pbmdzLCAxNjcgbGlu
ZXMgY2hlY2tlZAoKUGF0Y2ggMS85IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4g
IElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0
byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCjIvOSBDaGVj
a2luZyBjb21taXQgYzU0MGVkOWM2MjIyIChkb2NzL3N5c3RlbTogYWRkIGEgZ2VudGxlIHByb21w
dCBmb3IgdGhlIGNvbXBsZXhpdHkgdG8gY29tZSkKMy85IENoZWNraW5nIGNvbW1pdCAxNGZmNjIx
NGFiZGYgKHRlc3RzL2RvY2tlcjogYWRkIGEgdGVzdC10Y2cgZm9yIGJ1aWxkaW5nIHRoZW4gcnVu
bmluZyBjaGVjay10Y2cpClVzZSBvZiB1bmluaXRpYWxpemVkIHZhbHVlICRhY3BpX3Rlc3RleHBl
Y3RlZCBpbiBzdHJpbmcgZXEgYXQgLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgbGluZSAxNTI5LgpX
QVJOSU5HOiBhZGRlZCwgbW92ZWQgb3IgZGVsZXRlZCBmaWxlKHMpLCBkb2VzIE1BSU5UQUlORVJT
IG5lZWQgdXBkYXRpbmc/CiMxNzogCm5ldyBmaWxlIG1vZGUgMTAwNzU1Cgp0b3RhbDogMCBlcnJv
cnMsIDEgd2FybmluZ3MsIDIyIGxpbmVzIGNoZWNrZWQKClBhdGNoIDMvOSBoYXMgc3R5bGUgcHJv
YmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBw
b3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGlu
IE1BSU5UQUlORVJTLgo0LzkgQ2hlY2tpbmcgY29tbWl0IGZmYTU5OWMzOTQ2ZiAoZG9ja2VyOiBB
ZGQgSGV4YWdvbiBpbWFnZSkKV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzE1Mjog
RklMRTogdGVzdHMvZG9ja2VyL2RvY2tlcmZpbGVzL2RlYmlhbi1oZXhhZ29uLWNyb3NzLmRvY2tl
ci5kL2J1aWxkLXRvb2xjaGFpbi5zaDo2MzoKKyAgICAtRENNQUtFX0FTTV9GTEFHUz0iLUcwIC1t
bG9uZy1jYWxscyAtZm5vLXBpYyAtLXRhcmdldD1oZXhhZ29uLXVua25vd24tbGludXgtbXVzbCAi
IFwKCkVSUk9SOiBsaW5lIG92ZXIgOTAgY2hhcmFjdGVycwojMTc5OiBGSUxFOiB0ZXN0cy9kb2Nr
ZXIvZG9ja2VyZmlsZXMvZGViaWFuLWhleGFnb24tY3Jvc3MuZG9ja2VyLmQvYnVpbGQtdG9vbGNo
YWluLnNoOjkwOgorICAgIENST1NTX0NGTEFHUz0iLUcwIC1PMCAtbXY2NSAtZm5vLWJ1aWx0aW4g
LWZuby1yb3VuZGluZy1tYXRoIC0tdGFyZ2V0PWhleGFnb24tdW5rbm93bi1saW51eC1tdXNsIiBc
CgpFUlJPUjogbGluZSBvdmVyIDkwIGNoYXJhY3RlcnMKIzIxNjogRklMRTogdGVzdHMvZG9ja2Vy
L2RvY2tlcmZpbGVzL2RlYmlhbi1oZXhhZ29uLWNyb3NzLmRvY2tlci5kL2J1aWxkLXRvb2xjaGFp
bi5zaDoxMjc6CisgICAgQ0ZMQUdTPSItRzAgLU8wIC1tdjY1IC1mbm8tYnVpbHRpbiAtZm5vLXJv
dW5kaW5nLW1hdGggLS10YXJnZXQ9aGV4YWdvbi11bmtub3duLWxpbnV4LW11c2wiIFwKCnRvdGFs
OiAyIGVycm9ycywgMSB3YXJuaW5ncywgMTg0IGxpbmVzIGNoZWNrZWQKClBhdGNoIDQvOSBoYXMg
c3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFy
ZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVD
S1BBVENIIGluIE1BSU5UQUlORVJTLgoKNS85IENoZWNraW5nIGNvbW1pdCBlMjI2OTUzOWY3MTIg
KHRlc3RzL3RjZzogVXNlIEhleGFnb24gRG9ja2VyIGltYWdlKQo2LzkgQ2hlY2tpbmcgY29tbWl0
IDIyMmEyNjlhN2JmOSAoZ2l0bGFiOiBhZGQgYnVpbGQtdXNlci1oZXhhZ29uIHRlc3QpCjcvOSBD
aGVja2luZyBjb21taXQgMzYwYzVlZTAxOTNkIChnaXRsYWItY2kueW1sOiBBbGxvdyBjdXN0b20g
IyBvZiBwYXJhbGxlbCBsaW5rZXJzKQo4LzkgQ2hlY2tpbmcgY29tbWl0IGUwYTk1ZGFhMzRkOSAo
Z2l0bGFiLWNpLnltbDogQWRkIGpvYnMgdG8gdGVzdCBDRkkgZmxhZ3MpCjkvOSBDaGVja2luZyBj
b21taXQgOTFhN2VmMTljNmMxICh0ZXN0cy9kb2NrZXI6IFVzZSAtLWFyY2gtb25seSB3aGVuIGJ1
aWxkaW5nIERlYmlhbiBjcm9zcyBpbWFnZSkKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1h
bmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0
cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAzMDUwOTIzMjguMzE3OTItMS1hbGV4LmJlbm5lZUBs
aW5hcm8ub3JnL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2Vu
ZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQ
bGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

