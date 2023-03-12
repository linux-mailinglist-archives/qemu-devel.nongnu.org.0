Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA72A6B6715
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 15:08:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbMLN-00033y-2e; Sun, 12 Mar 2023 10:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbMLK-00033f-VH
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 10:06:34 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbMLJ-0004ln-5s
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 10:06:34 -0400
Received: by mail-pf1-x42c.google.com with SMTP id ce7so6186948pfb.9
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 07:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678629990;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=za5LFQc4POW8VtZSyKxav9Ew1iaLpCkv0KRGo66pSGA=;
 b=P341tsrr/pwMlRqtqs7leFCdGkXVFH6Pq/CcrXjoP3YsGIDzZYiI3D8y6dlqBzV2mU
 pgm5la8DlmFPKM/YL92cO4lB/n5EyICYIIVYKHX9PSnQ69Jb7/L6xbRqildJm54Z/4yP
 Y4JBCj3jS6SrGzzB92p1Bdv8ZOuW1GNNIxdbUMpJ+NnDGJoVMgqRuK68w4jlNTbtz4Mo
 0/Uh6OQgoqzuk6F4c+6IjzGVHMEHxECySnqZK+iXm4GzFm/wxmka+btiyK/2xF/p3mt7
 EzNJ23l/2XHtqENsGDEFNbjoImib+4ZxIfdvVW6b86wn2m/ZKmymYuEt6UxWDdsQ/sGc
 39gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678629990;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=za5LFQc4POW8VtZSyKxav9Ew1iaLpCkv0KRGo66pSGA=;
 b=CUr360FIk3FNeu8dYVgUYXjdvuKsZd3uRzdzRIGSBpawX2fafzk/PnLaQnSCVE0WTO
 Ip5bpKTlWQ+8/SWBA0jGeM2DTllp/YTytLui4CKcDMTR29qNLpYJPhzqiK+Q+tcWsFpe
 001s66rlNxh0n266MfyEcu9hHbip94SoTj2bFdIDy1LmZRZSdz8SGtbb1rdWu07bmeO0
 piBsTQMayxecwB1OAGykZi40+vES4qB2tsAbziFyy09xQM50MiZiMzWo/JljsWqe3Ey+
 jYd0OMOl0f2f/DrigZk8/7YbIdlv4kRwwzTB3EGld/W/e7w1a7uX7hlAGkS7ZpWokTG7
 TlVQ==
X-Gm-Message-State: AO0yUKW58zqhuRjVdG8CPjFu17rIj4lNF/LSgD9J9CtuMVRDcgqCBPeT
 9BstDlOLlnwVSP+PikAePakN9kBmrMmx/ihPBEkfSFA6pDyIS8hWDK4=
X-Google-Smtp-Source: AK7set/9s50tSiNC2O5UgI76C8mlynKcDzh25fYPxLhlKn4+cH4HChyzo6Guw1Uq5RSfkY/scOY+OsxfX/9SNcWehUE=
X-Received: by 2002:a63:f0a:0:b0:502:f5c8:a00c with SMTP id
 e10-20020a630f0a000000b00502f5c8a00cmr10062698pgl.9.1678629990203; Sun, 12
 Mar 2023 07:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
 <CAFEAcA_Pf11W3FuaLHvzQ7yrkh6KC556HDfvXpZYaHqN4iMvsg@mail.gmail.com>
 <CAFEAcA92kLBwgJoAc9HCr4oX=S0V=RmdO4+rOnKPJn32hQAf4Q@mail.gmail.com>
In-Reply-To: <CAFEAcA92kLBwgJoAc9HCr4oX=S0V=RmdO4+rOnKPJn32hQAf4Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 12 Mar 2023 14:06:18 +0000
Message-ID: <CAFEAcA-UaJsoA-rqmwEqh1j6xcCc=ifCctvN-jaW40VckRdp9Q@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
To: qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42c.google.com
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
c3QNCg0KSGVyZSdzIGFub3RoZXIgb25lLCBvbiB0aGUgczM5MHggQ0kgcnVubmVyOg0KaHR0cHM6
Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11Ly0vam9icy8zOTE3NTg3OTk0DQoNCjMxLzY1
OCBxZW11OnF0ZXN0K3F0ZXN0LWkzODYgLyBxdGVzdC1pMzg2L21pZ3JhdGlvbi10ZXN0IEVSUk9S
IDM0LjM2cw0Ka2lsbGVkIGJ5IHNpZ25hbCA2IFNJR0FCUlQNCj4+PiBRVEVTVF9RRU1VX1NUT1JB
R0VfREFFTU9OX0JJTkFSWT0uL3N0b3JhZ2UtZGFlbW9uL3FlbXUtc3RvcmFnZS1kYWVtb24gUVRF
U1RfUUVNVV9JTUc9Li9xZW11LWltZyBRVEVTVF9RRU1VX0JJTkFSWT0uL3FlbXUtc3lzdGVtLWkz
ODYgR19URVNUX0RCVVNfREFFTU9OPS9ob21lL2dpdGxhYi1ydW5uZXIvYnVpbGRzL0ZMYVprZHQx
LzAvcWVtdS1wcm9qZWN0L3FlbXUvdGVzdHMvZGJ1cy12bXN0YXRlLWRhZW1vbi5zaCBNQUxMT0Nf
UEVSVFVSQl89MTU0IC9ob21lL2dpdGxhYi1ydW5uZXIvYnVpbGRzL0ZMYVprZHQxLzAvcWVtdS1w
cm9qZWN0L3FlbXUvYnVpbGQvdGVzdHMvcXRlc3QvbWlncmF0aW9uLXRlc3QgLS10YXAgLWsNCuKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAlSDinIAg
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCVDQpz
dGRlcnI6DQpCcm9rZW4gcGlwZQ0KLi4vdGVzdHMvcXRlc3QvbGlicXRlc3QuYzoxOTM6IGtpbGxf
cWVtdSgpIGRldGVjdGVkIFFFTVUgZGVhdGggZnJvbQ0Kc2lnbmFsIDExIChTZWdtZW50YXRpb24g
ZmF1bHQpIChjb3JlIGR1bXBlZCkNClRBUCBwYXJzaW5nIGVycm9yOiBUb28gZmV3IHRlc3RzIHJ1
biAoZXhwZWN0ZWQgNDAsIGdvdCAxMSkNCih0ZXN0IHByb2dyYW0gZXhpdGVkIHdpdGggc3RhdHVz
IGNvZGUgLTYpDQrigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJUNCg0KDQpEbyB5b3UgZm9sa3MgaGF2ZSBhIGNvbmNyZXRlIHByb3Bv
c2FsIGZvciB0cmFja2luZyBkb3duIGFuZA0KZml4aW5nIHRoZSBmbGFraW5lc3MgaW4gdGhpcyB0
ZXN0PyBJZiBub3QsIHdlJ2xsIGhhdmUgdG8NCmp1c3QgZGlzYWJsZSBpdCBlbnRpcmVseSwgSSB0
aGluay4NCg0KdGhhbmtzDQotLSBQTU0NCg==

