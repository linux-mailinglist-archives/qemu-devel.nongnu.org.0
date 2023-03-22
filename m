Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689046C5751
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 21:17:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf4sb-0007zV-CU; Wed, 22 Mar 2023 16:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pf4sR-0007yu-W0
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 16:16:08 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pf4sG-0000Jg-I4
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 16:16:07 -0400
Received: by mail-ed1-x52a.google.com with SMTP id b20so44918331edd.1
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 13:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679516147;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4hwCsxHCJYs5dAYU3PbbO1VKe6bXdg1ydDnvBvIkez8=;
 b=UbnzZ3q9VUT2EcuqTHiC6cd3pGkG1ZWnv7l+8zdwTswZ/2I2r3lBz8ktgXVkZ88VYX
 U/prTC1hZdiNfL6TLjFhj7797MDrPeSo4adwKKVGe8/ZJ7hrmFgnF2eOTRt+O9ov9uqW
 4tnFI2mRqJxYbq7C4TDl/Htkgax+SldacIDYqhn8eE07/XlyAERdpyoMoEwCTsh5hZa9
 nTfSlQHeXNkh0HKP8kM9wDi/ycWqoGZwHwFIGk8iLfuQAmeHSLKhP8dz5Hihsi6aoAfO
 KIgLZ6OI/nVBvisN10/jXKrdoMdJvGrAZ6OyaTihjZA7LVkUVe4HK2xsWkJWwqBRsbKQ
 bvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679516147;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4hwCsxHCJYs5dAYU3PbbO1VKe6bXdg1ydDnvBvIkez8=;
 b=lNELyusrWiSVP7b/b1NclXpyS9DrrD9osJuaGLf1a/9pORWJ1RDhnPDv+u4Fdmiafi
 Q+RI3j1UWc9EOyxI8uKJd0jeE2Eq5z5xqxSCWEuqpqg2Zu5UaTcEv6ulj2opfpMQ3MT4
 mfTYgW2jX2CHuq2juNaNTmY19hGgjIR4jE96m/0zQFGF9FuxdELYi43qsiH3Pisy4IRC
 KBzZoNDwcmq5U6s7jDGxIO259gqDMDLbGlc6DWPEKHpzbPusDFupXe7OBz5ROR7euiVX
 r084SA0UxBv6BULgav2R2PD4FARBCbOS52XldwTxVWerGGV9nyoe4RjnHoqUY95yyypj
 pDQQ==
X-Gm-Message-State: AO0yUKWoINZHwKpRkXqd4XKSU1PDZCE+ktS7GSUkLwkEznzYVP/Hk5BL
 ur7V166AmyE1SQFEjTpYahVdzkGnIGy2LNOdRNdU+9xkKMkyGW2F9EE=
X-Google-Smtp-Source: AK7set8jSd7nx27ezkJMMn0A/5WPCJXh6KWvh0iSFVSOsXPBvsPFPSyYjAlC2gukTA5u0ywDwZ4Aj7FNUbekPGqkuYg=
X-Received: by 2002:a50:9990:0:b0:4fb:7e7a:ebf1 with SMTP id
 m16-20020a509990000000b004fb7e7aebf1mr4090212edb.6.1679516146947; Wed, 22 Mar
 2023 13:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
 <CAFEAcA_Pf11W3FuaLHvzQ7yrkh6KC556HDfvXpZYaHqN4iMvsg@mail.gmail.com>
 <CAFEAcA92kLBwgJoAc9HCr4oX=S0V=RmdO4+rOnKPJn32hQAf4Q@mail.gmail.com>
In-Reply-To: <CAFEAcA92kLBwgJoAc9HCr4oX=S0V=RmdO4+rOnKPJn32hQAf4Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Mar 2023 20:15:35 +0000
Message-ID: <CAFEAcA_gGWVqcabvrVC4QGvnBtb=dq41gHWgRfp9Ym2PDTTJ0w@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
To: qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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

T24gVHVlLCA3IE1hciAyMDIzIGF0IDA5OjUzLCBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxs
QGxpbmFyby5vcmc+IHdyb3RlOg0KPg0KPiBPbiBTYXQsIDQgTWFyIDIwMjMgYXQgMTU6MzksIFBl
dGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBP
biBUaHUsIDIgTWFyIDIwMjMgYXQgMTc6MjIsIFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxA
bGluYXJvLm9yZz4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gbWlncmF0aW9uLXRlc3QgaGFzIGJlZW4g
Zmxha3kgZm9yIGEgbG9uZyB0aW1lLCBib3RoIGluIENJIGFuZA0KPiA+ID4gb3RoZXJ3aXNlOg0K
PiA+ID4NCj4gPg0KPiA+DQo+ID4gPiBJbiB0aGUgY2FzZXMgd2hlcmUgSSd2ZSBsb29rZWQgYXQg
dGhlIHVuZGVybHlpbmcgbG9nLCB0aGlzIHNlZW1zIHRvDQo+ID4gPiBiZSBpbiB0aGUgbWlncmF0
aW9uL211bHRpZmQvdGNwL3BsYWluL2NhbmNlbCBzdWJ0ZXN0LiAgRGlzYWJsZSB0aGF0DQo+ID4g
PiBzcGVjaWZpYyBzdWJ0ZXN0IGJ5IGRlZmF1bHQgdW50aWwgc29tZWJvZHkgY2FuIHRyYWNrIGRv
d24gdGhlDQo+ID4gPiB1bmRlcmx5aW5nIGNhdXNlLiBFbnRodXNpYXN0cyBjYW4gb3B0IGJhY2sg
aW4gYnkgc2V0dGluZw0KPiA+ID4gUUVNVV9URVNUX0ZMQUtZX1RFU1RTPTEgaW4gdGhlaXIgZW52
aXJvbm1lbnQuDQo+ID4NCj4gPiBTbyBJJ20gZ29pbmcgdG8gYXBwbHkgdGhpcywgYmVjYXVzZSBo
b3BlZnVsbHkgaXQgd2lsbCBpbXByb3ZlDQo+ID4gdGhlIHJlbGlhYmlsaXR5IGEgYml0LCBidXQg
aXQncyBjbGVhcmx5IG5vdCBhbGwgb2YgdGhlDQo+ID4gaXNzdWVzIHdpdGggbWlncmF0aW9uLXRl
c3QsIGJlY2F1c2UgaW4gdGhlIGNvdXJzZSBvZiB0aGUNCj4gPiBydW4gSSB3YXMgZG9pbmcgdG8g
dGVzdCBpdCBiZWZvcmUgYXBwbHlpbmcgaXQgSSBnb3QgdGhpcw0KPiA+IGVycm9yIGZyb20gdGhl
IE9wZW5CU0QgVk06DQo+ID4NCj4gPiAgMzIvNjQ2IHFlbXU6cXRlc3QrcXRlc3QtYWFyY2g2NCAv
IHF0ZXN0LWFhcmNoNjQvbWlncmF0aW9uLXRlc3QNCj4gPiAgICAgICAgICAgIEVSUk9SICAgICAg
ICAgIDEzNC43M3MgICBraWxsZWQgYnkgc2lnbmFsIDYgU0lHQUJSVA0KPiA+IOKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAlSDinIAgIOKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAlQ0KPiA+IHN0ZGVy
cjoNCj4gPiBxZW11LXN5c3RlbS1hYXJjaDY0OiBtdWx0aWZkX3NlbmRfc3luY19tYWluOiBjaGFu
bmVsIDE1IGhhcyBhbHJlYWR5IHF1aXQNCj4gPiBxZW11LXN5c3RlbS1hYXJjaDY0OiBmYWlsZWQg
dG8gc2F2ZSBTYXZlU3RhdGVFbnRyeSB3aXRoIGlkKG5hbWUpOiAyKHJhbSk6IC0xDQo+ID4gcWVt
dS1zeXN0ZW0tYWFyY2g2NDogRmFpbGVkIHRvIGNvbm5lY3QgdG8gJzEyNy4wLjAuMToxOTU4MSc6
IEFkZHJlc3MNCj4gPiBhbHJlYWR5IGluIHVzZQ0KPiA+IHF1ZXJ5LW1pZ3JhdGUgc2hvd3MgZmFp
bGVkIG1pZ3JhdGlvbjogRmFpbGVkIHRvIGNvbm5lY3QgdG8NCj4gPiAnMTI3LjAuMC4xOjE5NTgx
JzogQWRkcmVzcyBhbHJlYWR5IGluIHVzZQ0KPiA+ICoqDQo+ID4gRVJST1I6Li4vc3JjL3Rlc3Rz
L3F0ZXN0L21pZ3JhdGlvbi1oZWxwZXJzLmM6MTUxOm1pZ3JhdGVfcXVlcnlfbm90X2ZhaWxlZDoN
Cj4gPiBhc3NlcnRpb24gZmFpbGVkOiAoIWdfc3RyX2VxdWFsKHN0YXR1cywgImZhaWxlZCIpKQ0K
PiA+DQo+ID4gKHRlc3QgcHJvZ3JhbSBleGl0ZWQgd2l0aCBzdGF0dXMgY29kZSAtNikNCj4NCj4g
R290IGFub3RoZXIgcmVwZWF0IG9mIHRoaXMgb25lIHRvZGF5OyBhZ2Fpbiwgb24gdGhlIE9wZW5C
U0QgVk06DQo+DQo+ICAzMi82NDYgcWVtdTpxdGVzdCtxdGVzdC1hYXJjaDY0IC8gcXRlc3QtYWFy
Y2g2NC9taWdyYXRpb24tdGVzdA0KPiAgICAgICAgICAgIEVSUk9SDQo+ICAgMTMxLjI4cyAgIGtp
bGxlZCBieSBzaWduYWwgNiBTSUdBQlJUDQo+IOKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAlSDinIAgIOKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAlQ0KPiBzdGRlcnI6DQo+IHFlbXUtc3lzdGVtLWFh
cmNoNjQ6IG11bHRpZmRfc2VuZF9zeW5jX21haW46IGNoYW5uZWwgMTUgaGFzIGFscmVhZHkgcXVp
dA0KPiBxZW11LXN5c3RlbS1hYXJjaDY0OiBmYWlsZWQgdG8gc2F2ZSBTYXZlU3RhdGVFbnRyeSB3
aXRoIGlkKG5hbWUpOiAyKHJhbSk6IC0xDQo+IHFlbXUtc3lzdGVtLWFhcmNoNjQ6IEZhaWxlZCB0
byBjb25uZWN0IHRvICcxMjcuMC4wLjE6MzAzMTInOiBBZGRyZXNzDQo+IGFscmVhZHkgaW4gdXNl
DQo+IHF1ZXJ5LW1pZ3JhdGUgc2hvd3MgZmFpbGVkIG1pZ3JhdGlvbjogRmFpbGVkIHRvIGNvbm5l
Y3QgdG8NCj4gJzEyNy4wLjAuMTozMDMxMic6IEFkZHJlc3MgYWxyZWFkeSBpDQo+IG4gdXNlDQo+
ICoqDQo+IEVSUk9SOi4uL3NyYy90ZXN0cy9xdGVzdC9taWdyYXRpb24taGVscGVycy5jOjE1MTpt
aWdyYXRlX3F1ZXJ5X25vdF9mYWlsZWQ6DQo+IGFzc2VydGlvbiBmYWlsZWQ6ICghDQo+IGdfc3Ry
X2VxdWFsKHN0YXR1cywgImZhaWxlZCIpKQ0KPg0KPiAodGVzdCBwcm9ncmFtIGV4aXRlZCB3aXRo
IHN0YXR1cyBjb2RlIC02KQ0KPiDigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJUNCg0KVGhpcyBvbmUncyBzdGlsbCBoZXJlIChvcGVu
YnNkIFZNIGFnYWluKToNCg0KIDM3Lzc3NCBxZW11OnF0ZXN0K3F0ZXN0LXg4Nl82NCAvIHF0ZXN0
LXg4Nl82NC9taWdyYXRpb24tdGVzdA0KICAgICAgICAgICBFUlJPUiAgICAgICAgICA1NjUuNDJz
ICAga2lsbGVkIGJ5IHNpZ25hbCA2IFNJR0FCUlQNCuKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAlSDinIAgIOKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAlQ0Kc3RkZXJyOg0KcWVtdS1zeXN0ZW0teDg2
XzY0OiBtdWx0aWZkX3NlbmRfc3luY19tYWluOiBjaGFubmVsIDE1IGhhcyBhbHJlYWR5IHF1aXQN
CnFlbXUtc3lzdGVtLXg4Nl82NDogRmFpbGVkIHRvIGNvbm5lY3QgdG8gJzEyNy4wLjAuMTo3ODU2
JzogQWRkcmVzcw0KYWxyZWFkeSBpbiB1c2UNCnF1ZXJ5LW1pZ3JhdGUgc2hvd3MgZmFpbGVkIG1p
Z3JhdGlvbjogRmFpbGVkIHRvIGNvbm5lY3QgdG8NCicxMjcuMC4wLjE6Nzg1Nic6IEFkZHJlc3Mg
YWxyZWFkeSBpbiB1c2UNCioqDQpFUlJPUjouLi9zcmMvdGVzdHMvcXRlc3QvbWlncmF0aW9uLWhl
bHBlcnMuYzoxNTE6bWlncmF0ZV9xdWVyeV9ub3RfZmFpbGVkOg0KYXNzZXJ0aW9uIGZhaWxlZDog
KCFnX3N0cl9lcXVhbChzdGF0dXMsICJmYWlsZWQiKSkNCg0KKHRlc3QgcHJvZ3JhbSBleGl0ZWQg
d2l0aCBzdGF0dXMgY29kZSAtNikNCg0KLS0gUE1NDQo=

