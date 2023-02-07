Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE4E68D201
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 10:04:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJt9-0002QN-Rx; Tue, 07 Feb 2023 04:03:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPJss-0002KK-Mu
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:03:41 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPJsi-0007i8-8R
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:03:21 -0500
Received: by mail-wr1-x42d.google.com with SMTP id m14so12774258wrg.13
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 01:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2K9wOv9j6s8eqdpCEXFS6oOeEHU8I7OS39RePsCVcw8=;
 b=rsVzqiz51DGQGq1Q8OJDuygR660t2PWV6VgvPyprIJ3ZOJTzm7TWmqIOBr+dgRM+hT
 cjwXsmozetavCcfYS1m1LqL3BJJRKXD0S9U81sdExyyjudV9EYfzCIUU9sDcoqgXVx+R
 Yf4rlSO6eWsKCOMID3zVIlTTCYiVxgwmC2dcjtvR02AkwmLeZr8Y3q0g02Bul6JG+MSF
 /HqDemz5rpHKJPXsrWyRrol/1F71aIRFncnJhdqzZzQyayP7G+S/qL25NTofEVetVj9T
 /0pN3aMJmUjZnWYOem4dSyey6VmBCDKhKAWiKFKf6VgU1YHPiQFo03jPIZFOKd8nx6q+
 6iiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2K9wOv9j6s8eqdpCEXFS6oOeEHU8I7OS39RePsCVcw8=;
 b=Zf2Jbi2XYMroQim65J4lLtCPuwHTsmIlbZEc68kkfXVoLPNEigXNee0PjFK4yA4p0/
 +/OZfgOFmkQ/ai041qAEKiDdPYPgS5GqZumUegYKBcIV+QKN7OS0+nTfjkS51gqFHhlS
 cTByiegW4xbKgXSSt7LWWeKJqQr6+sICg++jJ8eaLVxJKYztf6g1wtHItLyqtWT9TRtN
 vwWQyYHyKJa58/NjP7KxZ6KGItY6Ol8WECwXsmaXb79x8BQhjMdiTXb795FumfYQj8T1
 m/W6GwNcfw5Pvml1t0h9LHNCblg22+EdFvtlApCmg/eBr9JjsFnLnc6OKwjuWvGBxW0z
 sebA==
X-Gm-Message-State: AO0yUKUl0niUf2F1K7p659IuMnCUTIshVG4khT5YSueETflycsc83NZY
 Fl7XVWpVmsahdCbrZnPycR4Q+g==
X-Google-Smtp-Source: AK7set/V5LagvxBVubsIZrp6v8Aapx8XScfdvDG6SsZH/dSlqzcVXz7qLVONN2bS1tVN77GLqnL6JQ==
X-Received: by 2002:a5d:6b4b:0:b0:2bf:b41c:61dc with SMTP id
 x11-20020a5d6b4b000000b002bfb41c61dcmr1793135wrw.36.1675760593684; 
 Tue, 07 Feb 2023 01:03:13 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l4-20020adff484000000b002c3ed120cf8sm3379867wro.61.2023.02.07.01.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 01:03:13 -0800 (PST)
Message-ID: <1a57d82f-fc3b-3108-f5e0-fbe2e8f91dda@linaro.org>
Date: Tue, 7 Feb 2023 10:03:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 07/10] hw/ide/piix: Require an ISABus only for
 user-created instances
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230126211740.66874-1-shentey@gmail.com>
 <20230126211740.66874-8-shentey@gmail.com>
 <fb287888-c88c-60b1-20a4-1e50ddbf1daf@ilande.co.uk>
 <alpine.LMD.2.03.2302052308460.32269@eik.bme.hu>
 <935ae2a8-4327-53c6-1649-36698a00901d@ilande.co.uk>
 <00D45BF9-CA37-42FF-BDE1-F742B04F60F4@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <00D45BF9-CA37-42FF-BDE1-F742B04F60F4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

T24gNy8yLzIzIDAwOjQwLCBCZXJuaGFyZCBCZXNjaG93IHdyb3RlOg0KPiBBbSA1LiBGZWJy
dWFyIDIwMjMgMjI6MzI6MDMgVVRDIHNjaHJpZWIgTWFyayBDYXZlLUF5bGFuZCA8bWFyay5j
YXZlLWF5bGFuZEBpbGFuZGUuY28udWs+Og0KPj4gT24gMDUvMDIvMjAyMyAyMjoyMSwgQkFM
QVRPTiBab2x0YW4gd3JvdGU6DQo+Pj4gT24gU3VuLCA1IEZlYiAyMDIzLCBNYXJrIENhdmUt
QXlsYW5kIHdyb3RlOg0KPj4+PiBPbiAyNi8wMS8yMDIzIDIxOjE3LCBCZXJuaGFyZCBCZXNj
aG93IHdyb3RlOg0KPj4+Pj4gSW50ZXJuYWwgaW5zdGFuY2VzIG5vdyBkZWZlciBpbnRlcnJ1
cHQgd2lyaW5nIHRvIHRoZSBjYWxsZXIgd2hpY2gNCj4+Pj4+IGRlY291cGxlcyB0aGVtIGZy
b20gdGhlIElTQUJ1cy4gVXNlci1jcmVhdGVkIGRldmljZXMgc3RpbGwgZmlzaCBvdXQgdGhl
DQo+Pj4+PiBJU0FCdXMgZnJvbSB0aGUgUU9NIHRyZWUgYW5kIHRoZSBpbnRlcnJ1cHQgd2ly
aW5nIHJlbWFpbnMgaW4gUElJWCBJREUuDQo+Pj4+PiBUaGUgbGF0dGVyIG1lY2hhbmlzbSBp
cyBjb25zaWRlcmVkIGEgd29ya2Fyb3VuZCBhbmQgaW50ZW5kZWQgdG8gYmUNCj4+Pj4+IHJl
bW92ZWQgb25jZSBhIGRlcHJlY2F0aW9uIHBlcmlvZCBmb3IgdXNlci1jcmVhdGVkIFBJSVgg
SURFIGRldmljZXMgaXMNCj4+Pj4+IG92ZXIuDQo+Pj4+Pg0KPj4+Pj4gU2lnbmVkLW9mZi1i
eTogQmVybmhhcmQgQmVzY2hvdyA8c2hlbnRleUBnbWFpbC5jb20+DQo+Pj4+PiAtLS0NCj4+
Pj4+ICDCoCBpbmNsdWRlL2h3L2lkZS9wY2kuaCB8wqAgMSArDQo+Pj4+PiAgwqAgaHcvaWRl
L3BpaXguY8KgwqDCoMKgwqDCoMKgIHwgNjQgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0NCj4+Pj4+ICDCoCBody9pc2EvcGlpeC5jwqDCoMKgwqDCoMKg
wqAgfMKgIDUgKysrKw0KPj4+Pj4gIMKgIDMgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9u
cygrKSwgMTQgZGVsZXRpb25zKC0pDQoNCj4+Pj4gSSBoYXZlbid0IGNoZWNrZWQgdGhlIGRh
dGFzaGVldCwgYnV0IEkgc3VzcGVjdCB0aGlzIHdpbGwgYmUgc2ltaWxhciB0byB0aGUgY21k
NjQ2L3ZpYSBQQ0ktSURFIGludGVyZmFjZXMgaW4gdGhhdCB0aGVyZSB3aWxsIGJlIGEgUENJ
IGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIgdGhhdCB3aWxsIHN3aXRjaCBiZXR3ZWVuIElTQSBj
b21wYXRpYmlsaXR5IG1vZGUgKGFuZCBJU0EgaXJxcykgYW5kIFBDSSBtb2RlICh3aXRoIFBD
SSBJUlFzKS4gU28gaXQgd291bGQgYmUgdGhlIGRldmljZSBjb25maWd1cmF0aW9uIHRoYXQg
d291bGQgc3BlY2lmeSBQQ0kgb3IgSVNBIG1vZGUsIHJhdGhlciB0aGFuIHRoZSBwcmVzZW5j
ZSBvZiBhbiBJU0FCdXMuDQo+Pj4NCj4+PiBJIGZvcmdvdCBhYm91dCB0aGlzIHRvcGljIGFs
cmVhZHkgYW5kIGhhdmVuJ3QgZm9sbHdlZCB0aGlzIHNlcmllcyBlaXRoZXIgc28gd2hhdCBJ
IHNheSBtYXkgbm90IGZ1bGx5IG1ha2Ugc2Vuc2UgYnV0IEkgdGhpbmsgQ01ENjQ2IGFuZCB2
aWEtaWRlIGFyZSBkaWZmZXJlbnQuIENNRDY0NiBpcyBhIFBDSSBkZXZpY2UgYW5kIHNob3Vs
ZCB1c2UgUENJIGludGVycnVwdHMgd2hpbGUgdmlhLWlkZSBpcyBwYXJ0IG9mIGEgc291dGhi
cmlkZ2Uvc3VwZXJpbyBjb21wbGV4IGFuZCBjb25uZWN0ZWQgdG8gdGhlIElTQSBQSUNzIHdp
dGhpbiB0aGF0IHNvdXRoYnJpZGUsIHNvIEkgdGhpbmsgdmlhLWlkZSBhbHdheXMgdXNlcyBJ
U0EgSVJRcyBhbmQgdGhlIElTQSBidGlkZ2Ugd2l0aGluIHRoZSBzYW1lIGNoaXAgbWF5IGNv
bnZlcnQgdGhhdCB0byBQQ0kgSVJRcyBvciBub3QgKHRoYXQgcGFydCBpcyB3aGVyZSBJJ20g
bG9zdCBhbHNvIGJlY2F1c2Ugd2UgbWF5IG5vdCBhY3R1YWxseSBtb2RlbCBpdCB0aGF0IHdh
eSkuIEFmdGVyIGEgbG9uZyBkZWJhdGUgd2UgbWFuYWdlZCB0byBmaW5kIGEgc29sdXRpb24g
YmFjayB0aGVuIHRoYXQgd29ya3MgZm9yIGV2ZXJ5IGd1ZXN0IHdlIHVzZSBpdCBmb3Igbm93
IHNvIEkgdGhpbmsgd2UgZG9uJ3Qgd2FudCB0byB0b3VjaCBpdCBub3cgdW50aWwgc29tZSBy
ZWFsIG5lZWQgYXJpc2VzLiBJdCBkb2VzIG5vdCB3b3J0aCB0aGUgdHJvdWJsZSBhbmQgYWRk
ZWQgY29tcGxleGl0eSB0byBtb2RlbCBzb21ldGhpbmcgdGhhdCBpcyBub3QgdXNlZCBqdXN0
IGZvciB0aGUgc2FrZSBvZiBjb3JyZWN0bmVzcy4gQnkgdGhlIHRpbWUgd2UgZmluZCBhIHVz
ZSBmb3IgdGhhdCwgdGhlIElTQSBlbXVsYXRpb24gbWF5IGV2b2x2ZSBzbyBpdCdzIGVhc2ll
ciB0byBpbXBsZW1lbnQgdGhlIG1pc3Npbmcgc3dpdGNoaW5nIGJldHdlZW4gaXNhIGFuZCBu
YXRpdmUgbW9kZSBvciB3ZSBtYXkgd2FudCB0byBkbyBpdCBkaWZmZXJlbnRseSAoc3VjaCBh
cyB3ZSBkbyB0aGluZ3MgZGlmZmVyZW50bHkgbm93IGNvbXBhcmVkIHRvIHdoYXQgd2UgZGlk
IHllYXJzIGFnbykuIFNvIEkgdGhpbmsgaXQgZG9lcyBub3Qgd29ydGgga2VlcGluZyB0aGUg
SVNBIG1vZGVsIGZyb20gYmVpbmcgc2ltcGxpZmllZCBmb3Igc29tZSB0aGVvcmV0aWNhbCB1
c2VzIGluIHRoZSBmdXR1cmUgd2hpY2ggd2UgbWF5IG5vdCBhY3R1YWxseSBkbyBhbnkgdGlt
ZSBzb29uLiBCdXQgSSBkb24ndCB3YW50IHRvIGdldCBpbnRvIHRoaXMgYWdhaW4gc28ganVz
dCBzaGFyZWQgbXkgdGhvdWdodHMgYW5kIGZlZWwgZnJlZSB0byBpZ25vcmUgaXQuIEkgZG9u
J3QgY2FyZSB3aGVyZSB0aGVzZSBwYXRjaGVzIGdvIGFzIGxvbmcgYXMgdGhlIFZJQSBtb2Rl
bCBrZWVwcyB3b3JraW5nIGZvciBtZS4NCj4+DQo+PiBJIGhhdmUgYSB2YWd1ZSBtZW1vcnkg
dGhhdCBJU0EgY29tcGF0aWJpbGl0eSBtb2RlIHdhcyBwYXJ0IG9mIHRoZSBvcmlnaW5hbCBQ
Q0ktQk1ETUEgc3BlY2lmaWNhdGlvbiwgYnV0IGl0IGhhcyBiZWVuIGEgd2hpbGUgc2luY2Ug
SSBsYXN0IGxvb2tlZC4NCj4+DQo+PiBCZXJuaGFyZCwgaXMgdGhlcmUgYW55IG1lbnRpb24g
b2YgdGhpcyBpbiB0aGUgUElJWCBkYXRhc2hlZXQocyk/IEZvciByZWZlcmVuY2UgdGhlIGNt
ZDY0NiBkYXRhc2hlZXQgc3BlY2lmaWVzIHRoYXQgSVNBIG1vZGUgb3IgUENJIG1vZGUgaXMg
ZGV0ZXJtaW5lZCBieSByZWdpc3RlciBQUk9HX0lGICgweDkpIGluIFBDSSBjb25maWd1cmF0
aW9uIHNwYWNlLg0KPiANCj4gSSd2ZSBmb3VuZCB0aGUgZm9sbG93aW5nOg0KPiANCj4gICAg
Ik9ubHkgUENJIG1hc3RlcnMgaGF2ZSBhY2Nlc3MgdG8gdGhlIElERSBwb3J0LiBJU0EgQnVz
IG1hc3RlcnMgY2Fubm90IGFjY2VzcyB0aGUgSURFIEkvTyBwb3J0IGFkZHJlc3Nlcy4gTWVt
b3J5IHRhcmdldGVkIGJ5IHRoZSBJREUgaW50ZXJmYWNlIGFjdGluZyBhcyBhIFBDSSBCdXMg
bWFzdGVyIG9uIGJlaGFsZiBvZiBJREUgRE1BIHNsYXZlcyBtdXN0IHJlc2lkZSBvbiBQQ0ks
IHVzdWFsbHkgbWFpbiBtZW1vcnkgaW1wbGVtZW50ZWQgYnkgdGhlIGhvc3QtdG8tUENJIGJy
aWRnZS4iDQo+IA0KPiBBbmQ6DQo+IA0KPiAgICAiUElJWDQgY2FuIGFjdCBhcyBhIFBDSSBC
dXMgbWFzdGVyIG9uIGJlaGFsZiBvZiBhbiBJREUgc2xhdmUgZGV2aWNlLiINCj4gDQo+IERv
ZXMgdGhpcyBwZXJoYXBzIG1lYW4gdGhhdCBwaWl4LWlkZSBkb2VzIGluZGVlZCBoYXZlIG5v
IElTQSBidXM/DQoNClllcyA6KQ0KDQo=

