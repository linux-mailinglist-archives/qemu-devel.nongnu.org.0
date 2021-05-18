Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D733879D7
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 15:25:01 +0200 (CEST)
Received: from localhost ([::1]:46796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liziW-0003uF-P1
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 09:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lizfl-0001k7-5S
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:22:09 -0400
Resent-Date: Tue, 18 May 2021 09:22:09 -0400
Resent-Message-Id: <E1lizfl-0001k7-5S@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lizfh-0003Sy-UL
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:22:08 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1621344115; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=M17GXqbxM0qiAHXUQ6GK99bcydsB7mwkgGENBC5ZCsdto5Q0kikij8HTO39NCA3S17nux3ewvbSgTzJ0kOoVwUK3Erin7Wq0DqLr5PHOAO6V38GGTIyG0xIhIsnuYQkT+NHFx8Ygm0ND1XVh+hnUL62B9AvYpj1IqyNaUKwK++4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1621344115;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=guEMkP1gxfdSxvyDBNcelOYq6yHuv7L3Q/nCIGdW0o0=; 
 b=lcBh/8PSUIAZevrCRxAXJ5T1IzUvgT9ZdVRS7P906eZrPzLCTIQjKZ0ht4UbpcZvf9iBQnJJwitSRTnfpVKVJWGlVlrwh2YcPvQGInz5lWqqZn1CQmygz07VEyfyAFGT8lKVNHcCnhG8ak6FAJpPJS1NlW35sqijsgxT7bmC3Fs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1621344105490822.2455088365971;
 Tue, 18 May 2021 06:21:45 -0700 (PDT)
In-Reply-To: <20210518131542.2941207-1-pbonzini@redhat.com>
Subject: Re: [PATCH] qemu-config: load modules when instantiating option groups
Message-ID: <162134410432.134.5452197159711443809@0addf061776e>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pbonzini@redhat.com
Date: Tue, 18 May 2021 06:21:45 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUxODEzMTU0Mi4yOTQx
MjA3LTEtcGJvbnppbmlAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNTE4MTMxNTQyLjI5
NDEyMDctMS1wYm9uemluaUByZWRoYXQuY29tClN1YmplY3Q6IFtQQVRDSF0gcWVtdS1jb25maWc6
IGxvYWQgbW9kdWxlcyB3aGVuIGluc3RhbnRpYXRpbmcgb3B0aW9uIGdyb3VwcwoKPT09IFRFU1Qg
U0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251
bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFs
Z29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNl
Li4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0
ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9q
ZWN0L3FlbXUKICAgOGUyMmIyNy4uMTVlMTQ3YiAgbWFzdGVyICAgICAtPiBtYXN0ZXIKIC0gW3Rh
ZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDUxNzA2NDQyOC4xNjIyMy0xLXZzZW1lbnRzb3ZA
dmlydHVvenpvLmNvbSAtPiBwYXRjaGV3LzIwMjEwNTE3MDY0NDI4LjE2MjIzLTEtdnNlbWVudHNv
dkB2aXJ0dW96em8uY29tCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTA1MTgxMzE1
NDIuMjk0MTIwNy0xLXBib256aW5pQHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDIxMDUxODEzMTU0
Mi4yOTQxMjA3LTEtcGJvbnppbmlAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2gg
J3Rlc3QnCmNhZWI1NmIgcWVtdS1jb25maWc6IGxvYWQgbW9kdWxlcyB3aGVuIGluc3RhbnRpYXRp
bmcgb3B0aW9uIGdyb3VwcwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6IGRvIG5vdCBpbml0
aWFsaXNlIHN0YXRpY3MgdG8gMCBvciBOVUxMCiM1MTogRklMRTogc29mdG1tdS92bC5jOjI2MjA6
CisgICAgc3RhdGljIGJvb2wgc3BpY2VfdHJpZWQgPSBmYWxzZTsKCkVSUk9SOiBkbyBub3QgaW5p
dGlhbGlzZSBzdGF0aWNzIHRvIDAgb3IgTlVMTAojNTc6IEZJTEU6IHNvZnRtbXUvdmwuYzoyNjI2
OgorICAgIHN0YXRpYyBib29sIGlzY3NpX3RyaWVkID0gZmFsc2U7CgpXQVJOSU5HOiBhZGRlZCwg
bW92ZWQgb3IgZGVsZXRlZCBmaWxlKHMpLCBkb2VzIE1BSU5UQUlORVJTIG5lZWQgdXBkYXRpbmc/
CiM5MjogCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cgp0b3RhbDogMiBlcnJvcnMsIDEgd2FybmluZ3Ms
IDYxIGxpbmVzIGNoZWNrZWQKCkNvbW1pdCBjYWViNTZiMGUwNWYgKHFlbXUtY29uZmlnOiBsb2Fk
IG1vZHVsZXMgd2hlbiBpbnN0YW50aWF0aW5nIG9wdGlvbiBncm91cHMpIGhhcyBzdHlsZSBwcm9i
bGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBv
c2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4g
TUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRo
IGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9y
Zy9sb2dzLzIwMjEwNTE4MTMxNTQyLjI5NDEyMDctMS1wYm9uemluaUByZWRoYXQuY29tL3Rlc3Rp
bmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRp
Y2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3Vy
IGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

