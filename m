Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 725D364DAAF
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 12:55:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5mod-0007F9-0Q; Thu, 15 Dec 2022 06:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5moZ-0007Ej-Nc
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 06:54:15 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5moX-0006Gn-QB
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 06:54:15 -0500
Received: by mail-pf1-x42e.google.com with SMTP id x66so6535069pfx.3
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 03:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rUiBYmtTyZVEPkYiM2TAFrXcwT7/EdCt0/lFeuwJfvA=;
 b=YtpWo6zk6nz6xuSw8Z1eSUE4bpZp31/CJPaj0xET9j/uqO92UcO5FwfgxFy0KbxPxo
 QDCGJi34+aTWaqsWPTmYtSM91WkSEuxHVQtr8FPirbcUJTPqN10N5eK1Z3adBDlKnavm
 mQIQTN8ChKtkL6tveJ5c7O0k8A1Dmbgc24ZtqlbRjuYIZrljZOQQ8wRK9waf+oz/mlGm
 FzoKYKijTVM+pLYXqxxecmbfoIzehaGYPyKidHN8045jl7RkhNAiUhYBlOEszsGkP2Xq
 U0KbbrifM7YhhhUaCeYp8L3bGL3mpiBCXsBLD52zMMBPmI0l5RQ55E/p5/gWRKBFirwS
 CIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rUiBYmtTyZVEPkYiM2TAFrXcwT7/EdCt0/lFeuwJfvA=;
 b=n6o2eQBlEemum4P5uf5exua7ni/U3VDw6uJXqJy7MVhLa0BPLK8aU98CWsS3Bpb0lq
 dojfjcz4ELXrIiOkkBQRwajHFoxLHwp6BSKn3+fBoA19Habe03OkoJ7qIQQCR6rCT2di
 7nR3oL2UDCRe++2Q9SaOBghR4Rp/0r8madBBdcyujl7bkGTQmxNv6TVKxdRnJK2fdxbJ
 xG1E2c9VYbePkE6aC5djmhlKMPAGh/CpVNOkaFPtXED7VeHUYoxIY3/JKkVVAfWIqoXv
 KsNpGIeoRMXfGOIbaGHUKVlg3Y9QQq1Z8pbTyj4vJpW5RNpCZSeENwDum/yZHVX/3ftN
 MHrA==
X-Gm-Message-State: ANoB5pkdGixmtv864oTH9n07JYHngFn4efHlq5XTuuzpDzNIotTsw/t+
 Coe/05jgFB/Bfpefsc8EvJ+skX5quTU7bspy45uXHw==
X-Google-Smtp-Source: AA0mqf5WWwLDNGCM/Ahi4PJrmS5YShF2T1f70X0YqOWuWCFhDkQcoUgbFH7YXHtkXh0QZ8jK8Nnt8tl8pbQUQYjMgKs=
X-Received: by 2002:a63:c149:0:b0:477:86c1:640f with SMTP id
 p9-20020a63c149000000b0047786c1640fmr1152370pgi.231.1671105251897; Thu, 15
 Dec 2022 03:54:11 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8x_iM3hN2-P9F+huXnXFXy+D6FzE+Leq4erLdg7zkVGw@mail.gmail.com>
 <Y5sHtDP4vyEjhIan@work-vm>
In-Reply-To: <Y5sHtDP4vyEjhIan@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Dec 2022 11:54:00 +0000
Message-ID: <CAFEAcA-PHqcGYMDj9OXKdY40Hb_rHCM9eeuh1rSnFL5-SyTfhg@mail.gmail.com>
Subject: Re: migration qtest failure: "query-migrate shows failed migration:
 Unable to write to socket: Broken pipe"
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

T24gVGh1LCAxNSBEZWMgMjAyMiBhdCAxMTo0MCwgRHIuIERhdmlkIEFsYW4gR2lsYmVydA0KPGRn
aWxiZXJ0QHJlZGhhdC5jb20+IHdyb3RlOg0KPg0KPiAqIFBldGVyIE1heWRlbGwgKHBldGVyLm1h
eWRlbGxAbGluYXJvLm9yZykgd3JvdGU6DQo+ID4gSGk7IEkgc2VlIHRoaXMgbWlncmF0aW9uIHF0
ZXN0IGZhaWx1cmUgb24gbXkgeDg2IG1hY29zIGJveDoNCj4gPg0KPiA+DQo+ID4g4pa2ICAzMi81
OTEgRVJST1I6Li4vLi4vdGVzdHMvcXRlc3QvbWlncmF0aW9uLWhlbHBlcnMuYzoxNTE6bWlncmF0
ZV9xdWVyeV9ub3RfZmFpbGVkOg0KPiA+IGFzc2VydGlvbiBmYWlsDQo+ID4gZWQ6ICghZ19zdHJf
ZXF1YWwoc3RhdHVzLCAiZmFpbGVkIikpIEVSUk9SDQo+ID4gIDMyLzU5MSBxZW11OnF0ZXN0K3F0
ZXN0LWFhcmNoNjQgLyBxdGVzdC1hYXJjaDY0L21pZ3JhdGlvbi10ZXN0DQo+ID4gICAgICAgICAg
ICBFUlJPUiAgICAgICAgICAxNTIuMjdzICAga2lsbGVkIGJ5IHNpZ25hbCA2IFNJR0FCUlQNCj4g
PiDigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJUg
4pyAICDigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJUNCj4gPiBzdGRlcnI6DQo+ID4gcXVlcnktbWlncmF0ZSBzaG93cyBmYWlsZWQgbWlncmF0aW9u
OiBVbmFibGUgdG8gd3JpdGUgdG8gc29ja2V0OiBCcm9rZW4gcGlwZQ0KPiA+ICoqDQo+ID4gRVJS
T1I6Li4vLi4vdGVzdHMvcXRlc3QvbWlncmF0aW9uLWhlbHBlcnMuYzoxNTE6bWlncmF0ZV9xdWVy
eV9ub3RfZmFpbGVkOg0KPiA+IGFzc2VydGlvbiBmYWlsZWQ6ICghZ19zdHJfZXF1YWwoc3RhdHVz
LCAiZmFpbGVkIikpDQo+ID4gQXNzZXJ0aW9uIGZhaWxlZDogKHBpZCA9PSBzLT5xZW11X3BpZCks
IGZ1bmN0aW9uIHF0ZXN0X3dhaXRfcWVtdSwgZmlsZQ0KPiA+IC4uLy4uL3Rlc3RzL3F0ZXN0L2xp
YnF0ZXN0LmMsIGxpbmUgMjA3Lg0KPiA+DQo+ID4gKHRlc3QgcHJvZ3JhbSBleGl0ZWQgd2l0aCBz
dGF0dXMgY29kZSAtNikNCj4gPiDigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJUNCj4gPg0KPiA+IGFuZCBzaW1pbGFybHk6DQo+ID4N
Cj4gPiDilrYgIDM0LzU5MSBFUlJPUjouLi8uLi90ZXN0cy9xdGVzdC9taWdyYXRpb24taGVscGVy
cy5jOjE1MTptaWdyYXRlX3F1ZXJ5X25vdF9mYWlsZWQ6DQo+ID4gYXNzZXJ0aW9uIGZhaWxlZDog
KCFnX3N0cl9lcXVhbChzdGF0dXMsICJmYWlsZWQiKSkgRVJST1INCj4gPiAgMzQvNTkxIHFlbXU6
cXRlc3QrcXRlc3QtaTM4NiAvIHF0ZXN0LWkzODYvbWlncmF0aW9uLXRlc3QNCj4gPiAgICAgICAg
ICAgIEVSUk9SICAgICAgICAgIDE2OS40NHMgICBraWxsZWQgYnkgc2lnbmFsIDYgU0lHQUJSVA0K
PiA+IOKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
lSDinIAgIOKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAlQ0KPiA+IHN0ZGVycjoNCj4gPiBxdWVyeS1taWdyYXRlIHNob3dzIGZhaWxlZCBtaWdyYXRp
b246IFVuYWJsZSB0byB3cml0ZSB0byBzb2NrZXQ6IEJyb2tlbiBwaXBlDQo+ID4gKioNCj4gPiBF
UlJPUjouLi8uLi90ZXN0cy9xdGVzdC9taWdyYXRpb24taGVscGVycy5jOjE1MTptaWdyYXRlX3F1
ZXJ5X25vdF9mYWlsZWQ6DQo+ID4gYXNzZXJ0aW9uIGZhaWxlZDogKCFnX3N0cl9lcXVhbChzdGF0
dXMsICJmYWlsZWQiKSkNCj4gPiBBc3NlcnRpb24gZmFpbGVkOiAocGlkID09IHMtPnFlbXVfcGlk
KSwgZnVuY3Rpb24gcXRlc3Rfd2FpdF9xZW11LCBmaWxlDQo+ID4gLi4vLi4vdGVzdHMvcXRlc3Qv
bGlicXRlc3QuYywgbGluZSAyMDcuDQo+ID4NCj4gPiAodGVzdCBwcm9ncmFtIGV4aXRlZCB3aXRo
IHN0YXR1cyBjb2RlIC02KQ0KPiA+IOKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAlQ0KPiA+DQo+ID4gSXQgc2VlbXMgdG8gYmUgZmFp
cmx5IGNvbnNpc3RlbnQuIEFueSBpZGVhcyB3aGF0IGl0IG1pZ2h0IGJlPw0KPiA+IE1heWJlIHRo
ZSBRRU1VIHByb2Nlc3MgaGFzIGFscmVhZHkgZXhpdGVkIGJlZm9yZSB0aGUgdGVzdCBiaW5hcnkN
Cj4gPiBnZXRzIHJvdW5kIHRvIHF1ZXJ5aW5nIHRoZSBzdGF0dXMgPw0KPg0KPiBZZXMsIGl0IHNv
dW5kcyBsaWtlIGl0LCBjYW4geW91IGdldCBhIGJhY2t0cmFjZSB0byBmaWd1cmUgb3V0IHdoaWNo
IHRlc3QNCj4gaXQgd2FzIGluL3doZXJlIGl0IHdhcyB1cHRvIHdoZW4gaXQgZGllZD8NCg0KVGhl
IGxvZ2ZpbGUgc2F5cyBpdCBoYWQganVzdCBkb25lDQpvayAyMyAvYWFyY2g2NC9taWdyYXRpb24v
bXVsdGlmZC90Y3AvcGxhaW4vbm9uZQ0Kc28gSSB0aGluayB0aGUgb25lIGl0IHdhcyBpbiB0aGUg
bWlkZGxlIG9mIHdoZW4gaXQgZmFpbGVkIHdhcw0KL2FhcmNoNjQvbWlncmF0aW9uL211bHRpZmQv
dGNwL3BsYWluL2NhbmNlbC4NClNpbWlsYXJseSB0aGUgbG9nIHN1Z2dlc3RzIHRoZSB4ODYgZmFp
bHVyZSB3YXMgZm9yDQovaTM4Ni9taWdyYXRpb24vbWlsdGlmZC90Y3AvcGxhaW4vY2FuY2VsLg0K
DQpJdCBkb2Vzbid0IHNlZW0gdG8gcmVwcm8gcnVubmluZyBtYW51YWxseSwgbXkgZ3Vlc3MgaXMg
dGhhdA0KaXQgaGFwcGVucyBiZWNhdXNlIHRoZSBtYWNoaW5lIGlzIGhlYXZpbHkgbG9hZGVkIGRv
aW5nIHRoZQ0Kd2hvbGUgYnVpbGQtYW5kLXRlc3QgY3ljbGUuDQoNCnRoYW5rcw0KLS0gUE1NDQo=

