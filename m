Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6491A6ADB11
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 10:53:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZU0g-0003tj-Kr; Tue, 07 Mar 2023 04:53:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZU0e-0003t3-Lc
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:53:28 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZU0d-00078y-29
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:53:28 -0500
Received: by mail-pf1-x42b.google.com with SMTP id cp12so7645060pfb.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 01:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678182804;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6kRtlNHX2cgSpYqPCZspSHnCIoLK9UM5kEo6TmkI1R4=;
 b=P9FKXx3xocp5gFrWX8W3zdMcqAf74hFRVBIhzq/Ypf93To1Ia4EBFIzguRqT4EMfG0
 KUqietzT3WyQOrOdc/oKmDHvhInQTdEJw5TSvs64MWZWGpU0XkZoj9ttaZ1oOhUACdTw
 ILRTUm9XtpzEcOtsGnU4Vf9xXsyIUZ5cAXhFy8Rr+F8T8ze+3dgLiAxl3Ksqhtayp+ao
 eUiTi++kfmqMnnqH6wCyMWV7DpvlYxN4VsmxmFBtLkcXAVUi8OFp/7waPZ8WN/FlJO/Z
 LNf031xGYYHf4JhnFQxO/Jn9Si13VkSSSW6CSEtsAPk6ZtYrcBpmpED6G5zSnX655IcV
 vqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678182804;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6kRtlNHX2cgSpYqPCZspSHnCIoLK9UM5kEo6TmkI1R4=;
 b=MdEjpyqHrRP4NCjAqzGCE+oTvJuqi8WnLwGcQJriWU9AQEOmGEznFpB/HqB6M42Oe5
 r6y3XZ3hRJ/CZHvmcsOJEMl+tF8g24IgbSWdt+NTTnyl4szgVyT9663RS231dH3erZbZ
 t2i04FXzFSuKQvC2be3xUTPVCyjKbwQkevW9X31Egf7Je4N+q9tzNpw6KRPs3VSzLEZc
 y3SkO2DlrYt5KSXt6TYl5Pkbui1pfA1ne9vLYKLzXiq8nyUQRhZCatV877xWzOG4+0YB
 ECXUxePp5hk1Z26AXj0khhzjN+DApHLlCxenM1K+A4OhOl/KAO5OnEDCSSOGR4CAzc0C
 xa5Q==
X-Gm-Message-State: AO0yUKVxZin4TRnwUFereLQ73kEikhG3ZWPgPHFVSnkCDS1J6rgewrVE
 1Gl5jP2U8m0lIQZ3s9Y0cUXP4UBw6SXr1AjEKdVVKr6H8BMycZfR
X-Google-Smtp-Source: AK7set/w6YPgKIyRl6O/A42Z94ttDlIdr1dGuQUGUX0+RVrwc+b3N0d7rCCLcVGQVusi53dqK97NxxMCmicVD9SMXyU=
X-Received: by 2002:a62:ce4c:0:b0:606:63cd:506c with SMTP id
 y73-20020a62ce4c000000b0060663cd506cmr5920627pfg.1.1678182804555; Tue, 07 Mar
 2023 01:53:24 -0800 (PST)
MIME-Version: 1.0
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
 <CAFEAcA_Pf11W3FuaLHvzQ7yrkh6KC556HDfvXpZYaHqN4iMvsg@mail.gmail.com>
In-Reply-To: <CAFEAcA_Pf11W3FuaLHvzQ7yrkh6KC556HDfvXpZYaHqN4iMvsg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Mar 2023 09:53:12 +0000
Message-ID: <CAFEAcA92kLBwgJoAc9HCr4oX=S0V=RmdO4+rOnKPJn32hQAf4Q@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
To: qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
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

T24gU2F0LCA0IE1hciAyMDIzIGF0IDE1OjM5LCBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxs
QGxpbmFyby5vcmc+IHdyb3RlOg0KPg0KPiBPbiBUaHUsIDIgTWFyIDIwMjMgYXQgMTc6MjIsIFBl
dGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBt
aWdyYXRpb24tdGVzdCBoYXMgYmVlbiBmbGFreSBmb3IgYSBsb25nIHRpbWUsIGJvdGggaW4gQ0kg
YW5kDQo+ID4gb3RoZXJ3aXNlOg0KPiA+DQo+DQo+DQo+ID4gSW4gdGhlIGNhc2VzIHdoZXJlIEkn
dmUgbG9va2VkIGF0IHRoZSB1bmRlcmx5aW5nIGxvZywgdGhpcyBzZWVtcyB0bw0KPiA+IGJlIGlu
IHRoZSBtaWdyYXRpb24vbXVsdGlmZC90Y3AvcGxhaW4vY2FuY2VsIHN1YnRlc3QuICBEaXNhYmxl
IHRoYXQNCj4gPiBzcGVjaWZpYyBzdWJ0ZXN0IGJ5IGRlZmF1bHQgdW50aWwgc29tZWJvZHkgY2Fu
IHRyYWNrIGRvd24gdGhlDQo+ID4gdW5kZXJseWluZyBjYXVzZS4gRW50aHVzaWFzdHMgY2FuIG9w
dCBiYWNrIGluIGJ5IHNldHRpbmcNCj4gPiBRRU1VX1RFU1RfRkxBS1lfVEVTVFM9MSBpbiB0aGVp
ciBlbnZpcm9ubWVudC4NCj4NCj4gU28gSSdtIGdvaW5nIHRvIGFwcGx5IHRoaXMsIGJlY2F1c2Ug
aG9wZWZ1bGx5IGl0IHdpbGwgaW1wcm92ZQ0KPiB0aGUgcmVsaWFiaWxpdHkgYSBiaXQsIGJ1dCBp
dCdzIGNsZWFybHkgbm90IGFsbCBvZiB0aGUNCj4gaXNzdWVzIHdpdGggbWlncmF0aW9uLXRlc3Qs
IGJlY2F1c2UgaW4gdGhlIGNvdXJzZSBvZiB0aGUNCj4gcnVuIEkgd2FzIGRvaW5nIHRvIHRlc3Qg
aXQgYmVmb3JlIGFwcGx5aW5nIGl0IEkgZ290IHRoaXMNCj4gZXJyb3IgZnJvbSB0aGUgT3BlbkJT
RCBWTToNCj4NCj4gIDMyLzY0NiBxZW11OnF0ZXN0K3F0ZXN0LWFhcmNoNjQgLyBxdGVzdC1hYXJj
aDY0L21pZ3JhdGlvbi10ZXN0DQo+ICAgICAgICAgICAgRVJST1IgICAgICAgICAgMTM0LjczcyAg
IGtpbGxlZCBieSBzaWduYWwgNiBTSUdBQlJUDQo+IOKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAlSDinIAgIOKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAlQ0KPiBzdGRlcnI6DQo+IHFlbXUtc3lzdGVt
LWFhcmNoNjQ6IG11bHRpZmRfc2VuZF9zeW5jX21haW46IGNoYW5uZWwgMTUgaGFzIGFscmVhZHkg
cXVpdA0KPiBxZW11LXN5c3RlbS1hYXJjaDY0OiBmYWlsZWQgdG8gc2F2ZSBTYXZlU3RhdGVFbnRy
eSB3aXRoIGlkKG5hbWUpOiAyKHJhbSk6IC0xDQo+IHFlbXUtc3lzdGVtLWFhcmNoNjQ6IEZhaWxl
ZCB0byBjb25uZWN0IHRvICcxMjcuMC4wLjE6MTk1ODEnOiBBZGRyZXNzDQo+IGFscmVhZHkgaW4g
dXNlDQo+IHF1ZXJ5LW1pZ3JhdGUgc2hvd3MgZmFpbGVkIG1pZ3JhdGlvbjogRmFpbGVkIHRvIGNv
bm5lY3QgdG8NCj4gJzEyNy4wLjAuMToxOTU4MSc6IEFkZHJlc3MgYWxyZWFkeSBpbiB1c2UNCj4g
KioNCj4gRVJST1I6Li4vc3JjL3Rlc3RzL3F0ZXN0L21pZ3JhdGlvbi1oZWxwZXJzLmM6MTUxOm1p
Z3JhdGVfcXVlcnlfbm90X2ZhaWxlZDoNCj4gYXNzZXJ0aW9uIGZhaWxlZDogKCFnX3N0cl9lcXVh
bChzdGF0dXMsICJmYWlsZWQiKSkNCj4NCj4gKHRlc3QgcHJvZ3JhbSBleGl0ZWQgd2l0aCBzdGF0
dXMgY29kZSAtNikNCg0KR290IGFub3RoZXIgcmVwZWF0IG9mIHRoaXMgb25lIHRvZGF5OyBhZ2Fp
biwgb24gdGhlIE9wZW5CU0QgVk06DQoNCiAzMi82NDYgcWVtdTpxdGVzdCtxdGVzdC1hYXJjaDY0
IC8gcXRlc3QtYWFyY2g2NC9taWdyYXRpb24tdGVzdA0KICAgICAgICAgICBFUlJPUg0KICAxMzEu
MjhzICAga2lsbGVkIGJ5IHNpZ25hbCA2IFNJR0FCUlQNCuKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAlSDinIAgIOKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAlQ0Kc3RkZXJyOg0KcWVtdS1zeXN0ZW0t
YWFyY2g2NDogbXVsdGlmZF9zZW5kX3N5bmNfbWFpbjogY2hhbm5lbCAxNSBoYXMgYWxyZWFkeSBx
dWl0DQpxZW11LXN5c3RlbS1hYXJjaDY0OiBmYWlsZWQgdG8gc2F2ZSBTYXZlU3RhdGVFbnRyeSB3
aXRoIGlkKG5hbWUpOiAyKHJhbSk6IC0xDQpxZW11LXN5c3RlbS1hYXJjaDY0OiBGYWlsZWQgdG8g
Y29ubmVjdCB0byAnMTI3LjAuMC4xOjMwMzEyJzogQWRkcmVzcw0KYWxyZWFkeSBpbiB1c2UNCnF1
ZXJ5LW1pZ3JhdGUgc2hvd3MgZmFpbGVkIG1pZ3JhdGlvbjogRmFpbGVkIHRvIGNvbm5lY3QgdG8N
CicxMjcuMC4wLjE6MzAzMTInOiBBZGRyZXNzIGFscmVhZHkgaQ0KbiB1c2UNCioqDQpFUlJPUjou
Li9zcmMvdGVzdHMvcXRlc3QvbWlncmF0aW9uLWhlbHBlcnMuYzoxNTE6bWlncmF0ZV9xdWVyeV9u
b3RfZmFpbGVkOg0KYXNzZXJ0aW9uIGZhaWxlZDogKCENCmdfc3RyX2VxdWFsKHN0YXR1cywgImZh
aWxlZCIpKQ0KDQoodGVzdCBwcm9ncmFtIGV4aXRlZCB3aXRoIHN0YXR1cyBjb2RlIC02KQ0K4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCVDQoNCi0tIFBNTQ0K

