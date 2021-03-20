Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD5B342D31
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 14:57:40 +0100 (CET)
Received: from localhost ([::1]:58490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNc6l-0004Eb-M8
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 09:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lNc4X-0002ui-D4
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:55:22 -0400
Resent-Date: Sat, 20 Mar 2021 09:55:21 -0400
Resent-Message-Id: <E1lNc4X-0002ui-D4@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lNc4D-00055r-Ka
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:55:17 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616248492; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ht6tPJwV7bR1hDUQtSnuqMAF+UCxt76Y1mSnTY7MBKJTvPIs34pfkB+dpcHApf3GMC69w+wkolvXYBN/f+4wwAgjpiAU787z95TlNbdcuvchGkdMiDPGZiDu5IynqFLWknzRoBSS8ti6y182I3n816bw+dHsYZR2CoaV5rxkjD4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1616248492;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=0dL9PRe+otK24lgZxvKxaeS6G4iML4Zgw0fEjEmHN+w=; 
 b=l58YDWBSc3EhSlHvLigQPge+pS+2aFrwVEy8vOQJqFLPqqDVMHnNgoJEsabTQAZGoEts1IlI7Ua1rBopUQeX5FO+7jkuozLzkcIgUfyesR4kKD1l8PAY+ZXr+ncC6zu2YHKEJYBC5U/A6S4STlcdcm4M9kTSOpnNJermYoCbzNY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 16162484892801.4870592131926514;
 Sat, 20 Mar 2021 06:54:49 -0700 (PDT)
In-Reply-To: <20210320133706.21475-1-alex.bennee@linaro.org>
Subject: Re: [PATCH for 6.0 v1 00/14] fixes for rc1 (kernel-doc, semihosting,
 testing)
Message-ID: <161624848805.105.9797950267207753502@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alex.bennee@linaro.org
Date: Sat, 20 Mar 2021 06:54:49 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMyMDEzMzcwNi4yMTQ3
NS0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8g
aGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9y
ZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDMyMDEzMzcwNi4y
MTQ3NS0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcKU3ViamVjdDogW1BBVENIIGZvciA2LjAgdjEg
MDAvMTRdIGZpeGVzIGZvciByYzEgKGtlcm5lbC1kb2MsIHNlbWlob3N0aW5nLCB0ZXN0aW5nKQoK
PT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2Ug
PiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0
IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWls
YmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIx
ZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0
Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDMyMDEz
MzcwNi4yMTQ3NS0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcgLT4gcGF0Y2hldy8yMDIxMDMyMDEz
MzcwNi4yMTQ3NS0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcKU3dpdGNoZWQgdG8gYSBuZXcgYnJh
bmNoICd0ZXN0JwoyZmUwNWNhIHV0aWxzOiBXb3JrIGFyb3VuZCBtaW5ndyBzdHJ0bypsIGJ1ZyB3
aXRoIDB4CmM3OTE1ODAgdXRpbHM6IFRpZ2h0ZXIgdGVzdHMgZm9yIHFlbXVfc3RydG9zegoyYjMw
MDkxIGNpcnJ1cy55bWw6IFVwZGF0ZSB0aGUgRnJlZUJTRCB0YXNrIHRvIHZlcnNpb24gMTIuMgo5
YTMyZjkyIGNvbmZpZ3VyZTogRG9uJ3QgdXNlIHRoZSBfX2F0b21pY18qXzE2IGZ1bmN0aW9ucyBm
b3IgdGVzdGluZyAxMjgtYml0IHN1cHBvcnQKNDExZjU4YyBnaXRsYWItY2kueW1sOiBNZXJnZSB0
aGUgdHJhY2UtYmFja2VuZCB0ZXN0aW5nIGludG8gb3RoZXIgam9icwpmOTAwOGVkIHRlc3RzL3Rj
ZzogYWRkIEhlYXBJbmZvIGNoZWNraW5nIHRvIHNlbWlob3N0aW5nIHRlc3QKYzdmYzQ5OCBsaW51
eC11c2VyL3Jpc2N2OiBpbml0aWFsaXNlIHRoZSBUYXNrU3RhdGUgaGVhcC9zdGFjayBpbmZvCjY0
Zjg4NTAgc2VtaWhvc3RpbmcvYXJtLWNvbXBhdC1zZW1pOiBkb24ndCB1c2UgU0VUX0FSRyB0byBy
ZXBvcnQgU1lTX0hFQVBJTkZPCjQzNDY5OTEgc2VtaWhvc3RpbmcvYXJtLWNvbXBhdC1zZW1pOiB1
bmlmeSBHRVQvU0VUX0FSRyBoZWxwZXJzCjczNmM1OTUgc2VtaWhvc3Rpbmc6IG1vdmUgc2VtaWhv
c3RpbmcgdGVzdHMgdG8gbXVsdGlhcmNoCjUyMTAzOGEgdG9vbHMvdmlydGlvZnNkOiBpbmNsdWRl
IC0tc29ja2V0LWdyb3VwIGluIGhlbHAKN2E5ZjVmYyBkb2NzL2RldmVsOiBleHBhbmQgc3R5bGUg
c2VjdGlvbiBvZiBtZW1vcnkgbWFuYWdlbWVudAoyZDdjMzYxIGRvY3MvZGV2ZWw6IGluY2x1ZGUg
dGhlIHBsdWdpbiBBUEkgaW5mb3JtYXRpb24gZnJvbSB0aGUgaGVhZGVycwpmNGZlZDljIHNjcmlw
dHMva2VybmVsLWRvYzogc3RyaXAgUUVNVV8gZnJvbSBmdW5jdGlvbiBkZWZpbml0aW9ucwoKPT09
IE9VVFBVVCBCRUdJTiA9PT0KMS8xNCBDaGVja2luZyBjb21taXQgZjRmZWQ5YzJiNGVhIChzY3Jp
cHRzL2tlcm5lbC1kb2M6IHN0cmlwIFFFTVVfIGZyb20gZnVuY3Rpb24gZGVmaW5pdGlvbnMpCjIv
MTQgQ2hlY2tpbmcgY29tbWl0IDJkN2MzNjEwOGNiYSAoZG9jcy9kZXZlbDogaW5jbHVkZSB0aGUg
cGx1Z2luIEFQSSBpbmZvcm1hdGlvbiBmcm9tIHRoZSBoZWFkZXJzKQozLzE0IENoZWNraW5nIGNv
bW1pdCA3YTlmNWZjY2U4ZDkgKGRvY3MvZGV2ZWw6IGV4cGFuZCBzdHlsZSBzZWN0aW9uIG9mIG1l
bW9yeSBtYW5hZ2VtZW50KQo0LzE0IENoZWNraW5nIGNvbW1pdCA1MjEwMzhhNGIzMDQgKHRvb2xz
L3ZpcnRpb2ZzZDogaW5jbHVkZSAtLXNvY2tldC1ncm91cCBpbiBoZWxwKQo1LzE0IENoZWNraW5n
IGNvbW1pdCA3MzZjNTk1NjRhZWEgKHNlbWlob3N0aW5nOiBtb3ZlIHNlbWlob3N0aW5nIHRlc3Rz
IHRvIG11bHRpYXJjaCkKNi8xNCBDaGVja2luZyBjb21taXQgNDM0Njk5MWY2MzMwIChzZW1paG9z
dGluZy9hcm0tY29tcGF0LXNlbWk6IHVuaWZ5IEdFVC9TRVRfQVJHIGhlbHBlcnMpCjcvMTQgQ2hl
Y2tpbmcgY29tbWl0IDY0Zjg4NTAwNWJjYyAoc2VtaWhvc3RpbmcvYXJtLWNvbXBhdC1zZW1pOiBk
b24ndCB1c2UgU0VUX0FSRyB0byByZXBvcnQgU1lTX0hFQVBJTkZPKQo4LzE0IENoZWNraW5nIGNv
bW1pdCBjN2ZjNDk4NDgzZGUgKGxpbnV4LXVzZXIvcmlzY3Y6IGluaXRpYWxpc2UgdGhlIFRhc2tT
dGF0ZSBoZWFwL3N0YWNrIGluZm8pCjkvMTQgQ2hlY2tpbmcgY29tbWl0IGY5MDA4ZWRmZTg4NyAo
dGVzdHMvdGNnOiBhZGQgSGVhcEluZm8gY2hlY2tpbmcgdG8gc2VtaWhvc3RpbmcgdGVzdCkKMTAv
MTQgQ2hlY2tpbmcgY29tbWl0IDQxMWY1OGM3ODQyZiAoZ2l0bGFiLWNpLnltbDogTWVyZ2UgdGhl
IHRyYWNlLWJhY2tlbmQgdGVzdGluZyBpbnRvIG90aGVyIGpvYnMpCjExLzE0IENoZWNraW5nIGNv
bW1pdCA5YTMyZjkyN2I5MTMgKGNvbmZpZ3VyZTogRG9uJ3QgdXNlIHRoZSBfX2F0b21pY18qXzE2
IGZ1bmN0aW9ucyBmb3IgdGVzdGluZyAxMjgtYml0IHN1cHBvcnQpCjEyLzE0IENoZWNraW5nIGNv
bW1pdCAyYjMwMDkxYzNjNzMgKGNpcnJ1cy55bWw6IFVwZGF0ZSB0aGUgRnJlZUJTRCB0YXNrIHRv
IHZlcnNpb24gMTIuMikKMTMvMTQgQ2hlY2tpbmcgY29tbWl0IGM3OTE1ODA0ZjQ2YiAodXRpbHM6
IFRpZ2h0ZXIgdGVzdHMgZm9yIHFlbXVfc3RydG9zeikKMTQvMTQgQ2hlY2tpbmcgY29tbWl0IDJm
ZTA1Y2E0MjU4ZSAodXRpbHM6IFdvcmsgYXJvdW5kIG1pbmd3IHN0cnRvKmwgYnVnIHdpdGggMHgp
CkVSUk9SOiBjb25zaWRlciB1c2luZyBxZW11X3N0cnRvbCBpbiBwcmVmZXJlbmNlIHRvIHN0cnRv
bAojMTQ0OiBGSUxFOiB1dGlsL2N1dGlscy5jOjQwOToKKyAgICAgICAgaWYgKHN0cnRvbChucHRy
LCAmdG1wLCAxMCkgPT0gMCAmJiBlcnJubyA9PSAwICYmCgp0b3RhbDogMSBlcnJvcnMsIDAgd2Fy
bmluZ3MsIDE2OSBsaW5lcyBjaGVja2VkCgpQYXRjaCAxNC8xNCBoYXMgc3R5bGUgcHJvYmxlbXMs
IHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2
ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5U
QUlORVJTLgoKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29k
ZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xv
Z3MvMjAyMTAzMjAxMzM3MDYuMjE0NzUtMS1hbGV4LmJlbm5lZUBsaW5hcm8ub3JnL3Rlc3Rpbmcu
Y2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2Fs
bHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZl
ZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

