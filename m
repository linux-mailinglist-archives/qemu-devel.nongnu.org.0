Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B7F69E129
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 14:17:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUSW1-0004il-CJ; Tue, 21 Feb 2023 08:17:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUSVv-0004gU-PZ
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 08:16:59 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUSVt-00056L-OE
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 08:16:59 -0500
Received: by mail-wr1-x433.google.com with SMTP id bo30so3834581wrb.0
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 05:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T07PiXgs0jWA/EFYhOb/JOBxEhxwM5QkreCvrI2fshA=;
 b=pKjQW2wUnLc9uzdgprV1YP3Ee8Sw+rWJzDQIwkNmHNZ0adD9mT77Zyj7kyxN2ZGnTG
 CIO8rtSIxCMX4K8D11vvYljwXF598ls8ndft18/qhkFcz4OV3wPAKdgY8OMxgOyWWsb+
 UygHQ6dMsXUN/ucA1ZxkQcvqF9hm7maBtK1qljVEIbgV9U7VW81ZMGjWRQuWUQps2+Zf
 Fwcm0DMl7jRdE6l5gFg/XVdL5dJh8bcbPGxrJS1NWtq/k0kTTjmpTpJStZ9tn/HRyuXm
 yhz1acgWs9gLLul9rQ1G4XdvEcDgMleyD+Nyjogodpw+RE1jiwda50xgSai1Gnmx1APB
 Viiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T07PiXgs0jWA/EFYhOb/JOBxEhxwM5QkreCvrI2fshA=;
 b=AzpnD6oD5hEDT1STDxwbbNSgHimxillHjHXHnoKEHvPhbnkSo8/5QVeT/PKIdKhUoW
 fMrMnKvb0LCxCycxelUTs2H29uew7QZ8m06vAHkBgtTih3wUFhBMReVGPeYm45CaPHgq
 tp+pK5Xkn955yYWqzoueUdfiL1RMxpBceFpOmOYB/ApSojBWTsX3DLvU3hrtMu73zT6L
 8YoXevA5wE5SzwPD1SqbCE72FeHbIxn+2W5/Pi+lEyBrcjB7o07vuqCBVQJMB28gmD5h
 WuSpLs0iIKi25US0CRamCw0rANY7xedkvSPFI2F6/iFeYae3LusVCNCJPp2hbt/8nR4+
 N49A==
X-Gm-Message-State: AO0yUKWAiQ2JLtlhirHr/3qaQ+OBJ2zUZB7HFUtXvFZObpb/9ZL4BLK/
 4Ju55ZzTk3v5xLc4YUsrGL6DZw==
X-Google-Smtp-Source: AK7set8Z0zVXeQIEGaQCbn+Cs0yobPh5n9m618gVqWOUKhG9HgiclSyZtdk80BKqNSYoLAE6gtfmyw==
X-Received: by 2002:adf:f082:0:b0:2c5:8736:c022 with SMTP id
 n2-20020adff082000000b002c58736c022mr3833883wro.62.1676985415031; 
 Tue, 21 Feb 2023 05:16:55 -0800 (PST)
Received: from [192.168.10.97] ([31.32.81.187])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c4fc600b003dd8feea827sm15103954wmq.4.2023.02.21.05.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 05:16:54 -0800 (PST)
Message-ID: <188d479a-7b54-d16c-3fe2-2e952ff1c8d1@linaro.org>
Date: Tue, 21 Feb 2023 14:16:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/4] sysemu/os-win32: fix setjmp/longjmp on
 windows-arm64
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20230220111215.27471-1-pierrick.bouvier@linaro.org>
 <20230220111215.27471-3-pierrick.bouvier@linaro.org>
 <6de4e5b4-aeb1-3888-0979-01e4778eba93@linaro.org>
 <eb3116cf-dd6d-6a50-19cd-53614105e5de@linaro.org>
 <c09dcebd-9a23-9641-da7e-91fca4589607@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <c09dcebd-9a23-9641-da7e-91fca4589607@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

T24gMi8yMS8yMyAxMTozMywgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDIxLzIvMjMgMTA6NDcsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBAUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6ksIGlzIHRoYXQgdmVyc2lvbiBzYXRpc2Z5aW5nIGZvciB5b3UsIHJl
Z2FyZGluZw0KPj4geW91ciBpbml0aWFsIGNvbW1lbnRzIGFib3V0IHNldGptcC9sb25nam1w
IGRldGVjdGlvbiBpbiBtZXNvbj8NCj4gDQo+IFllcywgdGhlIG1lc29uIGNoZWNrIGlzIHdo
YXQgSSBoYWQgaW4gbWluZC4NCj4gDQo+PiBJIGNhbiBpbnRlZ3JhdGUgbW9yZSBjaGFuZ2Vz
IGlmIG5lZWRlZC4NCj4+DQo+PiBUaGFua3MsDQo+PiBQaWVycmljaw0KPj4NCj4+IE9uIDIv
MjAvMjMgMTY6MTYsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+Pj4gQWNrZWQtYnk6IFJp
Y2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KPj4+DQo+
Pj4gT24gMi8yMC8yMyAxMjoxMiwgUGllcnJpY2sgQm91dmllciB3cm90ZToNCj4+Pj4gV2lu
ZG93cyBpbXBsZW1lbnRhdGlvbiBvZiBzZXRqbXAvbG9uZ2ptcCBpcyBkb25lIGluDQo+Pj4+
IEM6L1dJTkRPV1Mvc3lzdGVtMzIvdWNydGJhc2UuZGxsLiBBbGFzLCBvbiBhcm02NCwgaXQg
c2VlbXMgdG8gKmFsd2F5cyoNCj4+Pj4gcGVyZm9ybSBzdGFjayB1bndpbmRpbmcsIHdoaWNo
IGNyYXNoZXMgZnJvbSBnZW5lcmF0ZWQgY29kZS4NCj4+Pj4NCj4+Pj4gQnkgdXNpbmcgYWx0
ZXJuYXRpdmUgaW1wbGVtZW50YXRpb24gYnVpbHQgaW4gbWluZ3csIHdlIGF2b2lkIGRvaW5n
IHN0YWNrDQo+Pj4+IHVud2luZGluZyBhbmQgdGhpcyBmaXhlcyBjcmFzaCB3aGVuIGNhbGxp
bmcgbG9uZ2ptcC4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogUGllcnJpY2sgQm91dmll
ciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0KPj4+PiAtLS0NCj4+Pj4gIMKgwqAg
aW5jbHVkZS9zeXNlbXUvb3Mtd2luMzIuaCB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysr
LS0NCj4+Pj4gIMKgwqAgbWVzb24uYnVpbGTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+ICDCoMKgIDIgZmlsZXMgY2hh
bmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvc3lzZW11L29zLXdpbjMyLmggYi9pbmNsdWRlL3N5c2VtdS9v
cy13aW4zMi5oDQo+Pj4+IGluZGV4IDViMzhjN2JkMDQuLjFmNmMxNDFkMzkgMTAwNjQ0DQo+
Pj4+IC0tLSBhL2luY2x1ZGUvc3lzZW11L29zLXdpbjMyLmgNCj4+Pj4gKysrIGIvaW5jbHVk
ZS9zeXNlbXUvb3Mtd2luMzIuaA0KPj4+PiBAQCAtNTEsMTQgKzUxLDM1IEBAIHR5cGVkZWYg
c3RydWN0IHNvY2thZGRyX3VuIHsNCj4+Pj4gIMKgwqAgZXh0ZXJuICJDIiB7DQo+Pj4+ICDC
oMKgICNlbmRpZg0KPj4+PiAtI2lmIGRlZmluZWQoX1dJTjY0KQ0KPj4+PiArI2lmIGRlZmlu
ZWQoX19hYXJjaDY0X18pDQo+Pj4+ICsjaWZuZGVmIENPTkZJR19NSU5HVzY0X0hBU19TRVRK
TVBfTE9OR0pNUA0KPj4+PiArI2Vycm9yIG1pbmd3IG11c3QgcHJvdmlkZSBzZXRqbXAvbG9u
Z2ptcCBmb3Igd2luZG93cy1hcm02NA0KPiANCj4gUGVyIHRoZSBtZXNvbiBlcnJvciBbKl0s
IHRoaXMgbm93IHNlZW1zIGltcG9zc2libGUsIHRodXMgd2UgY2FuDQo+IHNpbXBseSBkcm9w
IHRoZSBDT05GSUdfTUlOR1c2NF9IQVNfU0VUSk1QX0xPTkdKTVAgZGVmaW5pdGlvbj8NCj4N
Cg0KSSB0aGluayBpdCdzIHJlZHVuZGFudCB0b28uDQoNCj4+Pj4gKyNlbmRpZg0KPj4+PiAr
LyoNCj4+Pj4gKyAqIE9uIHdpbmRvd3MtYXJtNjQsIHNldGptcCBpcyBhdmFpbGFibGUgaW4g
b25seSBvbmUgdmFyaWFudCwgYW5kDQo+Pj4+IGxvbmdqbXAgYWx3YXlzDQo+Pj4+ICsgKiBk
b2VzIHN0YWNrIHVud2luZGluZy4gVGhpcyBjcmFzaCB3aXRoIGdlbmVyYXRlZCBjb2RlLg0K
Pj4+PiArICogVGh1cywgd2UgdXNlIGFub3RoZXIgaW1wbGVtZW50YXRpb24gb2Ygc2V0am1w
IChub3Qgd2luZG93cyBvbmUpLA0KPj4+PiBjb21pbmcgZnJvbQ0KPj4+PiArICogbWluZ3cs
IHdoaWNoIG5ldmVyIHBlcmZvcm1zIHN0YWNrIHVud2luZGluZy4NCj4+Pj4gKyAqLw0KPj4+
PiArI3VuZGVmIHNldGptcA0KPj4+PiArI3VuZGVmIGxvbmdqbXANCj4+Pj4gKy8qDQo+Pj4+
ICsgKiBUaGVzZSBmdW5jdGlvbnMgYXJlIG5vdCBkZWNsYXJlZCBpbiBzZXRqbXAuaCBiZWNh
dXNlIF9fYWFyY2g2NF9fDQo+Pj4+IGRlZmluZXMNCj4+Pj4gKyAqIHNldGptcCB0byBfc2V0
am1wZXggaW5zdGVhZC4gSG93ZXZlciwgdGhleSBhcmUgc3RpbGwgZGVmaW5lZCBpbg0KPj4+
PiBsaWJtaW5nd2V4LmEsDQo+Pj4+ICsgKiB3aGljaCBnZXRzIGxpbmtlZCBhdXRvbWF0aWNh
bGx5Lg0KPj4+PiArICovDQo+Pj4+ICtleHRlcm4gaW50IF9fbWluZ3dfc2V0am1wKGptcF9i
dWYpOw0KPj4+PiArZXh0ZXJuIHZvaWQgX19hdHRyaWJ1dGVfXygobm9yZXR1cm4pKSBfX21p
bmd3X2xvbmdqbXAoam1wX2J1ZiwgaW50KTsNCj4+Pj4gKyNkZWZpbmUgc2V0am1wKGVudikg
X19taW5nd19zZXRqbXAoZW52KQ0KPj4+PiArI2RlZmluZSBsb25nam1wKGVudiwgdmFsKSBf
X21pbmd3X2xvbmdqbXAoZW52LCB2YWwpDQo+Pj4+ICsjZWxpZiBkZWZpbmVkKF9XSU42NCkN
Cj4+Pj4gIMKgwqAgLyogT24gdzY0LCBzZXRqbXAgaXMgaW1wbGVtZW50ZWQgYnkgX3NldGpt
cCB3aGljaCBuZWVkcyBhIHNlY29uZA0KPj4+PiBwYXJhbWV0ZXIuDQo+Pj4+ICDCoMKgwqAg
KiBJZiB0aGlzIHBhcmFtZXRlciBpcyBOVUxMLCBsb25nanVtcCBkb2VzIG5vIHN0YWNrIHVu
d2luZGluZy4NCj4+Pj4gIMKgwqDCoCAqIFRoYXQgaXMgd2hhdCB3ZSBuZWVkIGZvciBRRU1V
LiBQYXNzaW5nIHRoZSB2YWx1ZSBvZiByZWdpc3Rlcg0KPj4+PiByc3AgKGRlZmF1bHQpDQo+
Pj4+ICDCoMKgwqAgKiBsZXRzIGxvbmdqbXAgdHJ5IGEgc3RhY2sgdW53aW5kaW5nIHdoaWNo
IHdpbGwgY3Jhc2ggd2l0aA0KPj4+PiBnZW5lcmF0ZWQgY29kZS4gKi8NCj4+Pj4gIMKgwqAg
IyB1bmRlZiBzZXRqbXANCj4+Pj4gIMKgwqAgIyBkZWZpbmUgc2V0am1wKGVudikgX3NldGpt
cChlbnYsIE5VTEwpDQo+Pj4+IC0jZW5kaWYNCj4+Pj4gKyNlbmRpZiAvKiBfX2FhcmNoNjRf
XyAqLw0KPiANCj4gVGhpcyBjb21tZW50IGRvZXNuJ3Qgc2VlbSBhY2N1cmF0ZS4gTWF5YmUg
IjY0LWJpdCI/DQo+IA0KDQpJJ2QgbGlrZSB0byB1c2Ugd2luZG93cy14NjQuIElNSE8sICBp
dCdzIGNsZWFyZXIgYW5kIG9uIHBhciB3aXRoIA0Kd2luZG93cy1hcm02NC4gQnV0IEkga25v
dyBzb21lIHBlb3BsZSBkb24ndCBsaWtlIHg2NCBub21lbmNsYXR1cmUuDQoNCkFsYXMsIHNl
dmVyYWwgcHJvamVjdHMgYXJlIHVzaW5nIHczMiBhbmQgdzY0IG5hbWVzLCBhbmQgdGhlcmUg
aXMgbm8gDQpjb25zZW5zdXMgeWV0IG9uIGhvdyB3aW4tYXJtNjQgc2hvdWxkIGJlIG5hbWVk
Lg0KDQo+Pj4+ICDCoMKgIC8qIFFFTVUgdXNlcyBzaWdzZXRqbXAoKS9zaWdsb25nam1wKCkg
YXMgdGhlIHBvcnRhYmxlIHdheSB0byBzcGVjaWZ5DQo+Pj4+ICDCoMKgwqAgKiAibG9uZ2pt
cCBhbmQgZG9uJ3QgdG91Y2ggdGhlIHNpZ25hbCBtYXNrcyIuIFNpbmNlIHdlIGtub3cgdGhh
dCB0aGUNCj4+Pj4gIMKgwqDCoCAqIHNhdmVtYXNrIHBhcmFtZXRlciB3aWxsIGFsd2F5cyBi
ZSB6ZXJvIHdlIGNhbiBzYWZlbHkgZGVmaW5lIHRoZXNlDQo+Pj4+IGRpZmYgLS1naXQgYS9t
ZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkDQo+Pj4+IGluZGV4IDRiYTNiZjM0MzEuLmU5Njhl
ZDllN2EgMTAwNjQ0DQo+Pj4+IC0tLSBhL21lc29uLmJ1aWxkDQo+Pj4+ICsrKyBiL21lc29u
LmJ1aWxkDQo+Pj4+IEBAIC0yNDUwLDYgKzI0NTAsMzAgQEAgaWYgdGFyZ2V0b3MgPT0gJ3dp
bmRvd3MnDQo+Pj4+ICDCoMKgwqDCoMKgwqAgfScnJywgbmFtZTogJ19sb2NrX2ZpbGUgYW5k
IF91bmxvY2tfZmlsZScpKQ0KPj4+PiAgwqDCoCBlbmRpZg0KPj4+PiAraWYgdGFyZ2V0b3Mg
PT0gJ3dpbmRvd3MnDQo+Pj4+ICvCoCBtaW5nd19oYXNfc2V0am1wX2xvbmdqbXAgPSBjYy5s
aW5rcygnJycNCj4+Pj4gK8KgwqDCoCAjaW5jbHVkZSA8c2V0am1wLmg+DQo+Pj4+ICvCoMKg
wqAgaW50IG1haW4odm9pZCkgew0KPj4+PiArwqDCoMKgwqDCoCAvKg0KPj4+PiArwqDCoMKg
wqDCoMKgICogVGhlc2UgZnVuY3Rpb25zIGFyZSBub3QgYXZhaWxhYmxlIGluIHNldGptcCBo
ZWFkZXIsIGJ1dCBtYXkgYmUNCj4+Pj4gK8KgwqDCoMKgwqDCoCAqIGF2YWlsYWJsZSBhdCBs
aW5rIHRpbWUsIGZyb20gbGlibWluZ3dleC5hLg0KPj4+PiArwqDCoMKgwqDCoMKgICovDQo+
Pj4+ICvCoMKgwqDCoMKgIGV4dGVybiBpbnQgX19taW5nd19zZXRqbXAoam1wX2J1Zik7DQo+
Pj4+ICvCoMKgwqDCoMKgIGV4dGVybiB2b2lkIF9fYXR0cmlidXRlX18oKG5vcmV0dXJuKSkg
X19taW5nd19sb25nam1wKGptcF9idWYsDQo+Pj4+IGludCk7DQo+Pj4+ICvCoMKgwqDCoMKg
IGptcF9idWYgZW52Ow0KPj4+PiArwqDCoMKgwqDCoCBfX21pbmd3X3NldGptcChlbnYpOw0K
Pj4+PiArwqDCoMKgwqDCoCBfX21pbmd3X2xvbmdqbXAoZW52LCAwKTsNCj4+Pj4gK8KgwqDC
oCB9DQo+Pj4+ICvCoCAnJycsIG5hbWU6ICdtaW5ndyBzZXRqbXAgYW5kIGxvbmdqbXAnKQ0K
Pj4+PiArDQo+Pj4+ICvCoCBjb25maWdfaG9zdF9kYXRhLnNldCgnQ09ORklHX01JTkdXNjRf
SEFTX1NFVEpNUF9MT05HSk1QJywNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIG1pbmd3X2hhc19zZXRqbXBfbG9uZ2ptcCkNCj4+Pj4gKw0K
Pj4+PiArwqAgaWYgY3B1ID09ICdhYXJjaDY0JyBhbmQgbm90IG1pbmd3X2hhc19zZXRqbXBf
bG9uZ2ptcA0KPj4+PiArwqDCoMKgIGVycm9yKCdtaW5ndyBtdXN0IHByb3ZpZGUgc2V0am1w
L2xvbmdqbXAgZm9yIHdpbmRvd3MtYXJtNjQnKQ0KPiANCj4gKFRoaXMgaXMgdGhlIFsqXSBl
cnJvciBJIG1lbnRpb25lZCBlYXJsaWVyKS4NCj4gDQo+Pj4+ICvCoCBlbmRpZg0KPj4+PiAr
ZW5kaWYNCj4+Pj4gKw0KPj4+PiAgwqDCoCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4+
Pj4gIMKgwqAgIyBUYXJnZXQgY29uZmlndXJhdGlvbiAjDQo+Pj4+ICDCoMKgICMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIw0KPiANCg==

