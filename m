Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FE84C3556
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:07:05 +0100 (CET)
Received: from localhost ([::1]:59180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJSC-0001is-AL
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:07:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nNJEN-0000kE-F3
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:52:48 -0500
Received: from [2a00:1450:4864:20::12f] (port=35729
 helo=mail-lf1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nNJEH-0005dF-Ev
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:52:44 -0500
Received: by mail-lf1-x12f.google.com with SMTP id u20so5505647lff.2
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 10:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XEVh0qYl2wjyoSlsQM6sqo6q6J5iBf3QJv+wJFYmofc=;
 b=lsrJ8U+O9rcKG+n8xn80/wvTu+QLPWdfnChWihPL17eYfllBspeVAk0C1jrFId5O6M
 FmLzWfF0/1pGorUyxYnyTEP6y3Ldp7zIhk8/L5CVjyGyBzhqOZcbWIwMaKCjLxYJsGvK
 B7IWHPb/8RnT07tjz3wLqXM30LB1F17PhSNWvpRS45zKSUkXQ82js+1+QcdYMe3T+T0S
 8iw8zyeeTWDmslFAT6NUtdh12osc2Trm0e7CFiv5V2GvpetXRS6GBqpyoEIDlxZnuf2S
 c1Wl1PV2KBuE2FUomLu6BxEeSqK0EiE9GcIJN7yBVmmvZUivyLa1xgmP+9Jh/9gi6Xr0
 apLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XEVh0qYl2wjyoSlsQM6sqo6q6J5iBf3QJv+wJFYmofc=;
 b=GUFJ3m3GuacJhNCI0Yop9+GkHwPvl8WbyWrl7D8nMd7TWc0N/u1f/7+CQimgSy/9D3
 omWc4vO4cbv8geETQZhF4O7FL3fkqkeqrCTxyitDLUq/gzjryVWRj2CM8lDoCI7W+ikk
 FkgGPfZuZCwgq41O4hBG5Dw+ZmP9EPfvpGJNknu6CwegBlIG8YTvNgnwzzRdtS/CdYt/
 u8Hz5Car72W4vFNpW6eSUs2SMnV4N/465NhlfI4q1rLyzyW6a5e3ya0SGkWIVDrRu/MN
 OYD45qANuzhEW/agEhdR2pedaVKGm+KdEuE4oVmaK4S7fsbZFsOmhVVJJ5B27330aeW1
 vYag==
X-Gm-Message-State: AOAM530axhzT5Pe8fWVckBu32by12kL+U+x1xY8z0RZrRp2CA6A5sl/d
 ZyffXknw6oq989Zb1B2gESeQHsNouf9TmdeDiyYqPw==
X-Google-Smtp-Source: ABdhPJzQFoUhJwg2x49uxBQpoIPBG6sMkDR7Pq5TVcTI44amrMxmqOJ7AcLHCqUP3F3OjSdRBGsOfrQ5eqFHc0Fwqe4=
X-Received: by 2002:a19:f519:0:b0:443:e008:3df7 with SMTP id
 j25-20020a19f519000000b00443e0083df7mr2534754lfb.95.1645728756568; Thu, 24
 Feb 2022 10:52:36 -0800 (PST)
MIME-Version: 1.0
References: <20220208181843.4003568-1-venture@google.com>
 <CAFEAcA8m2yhtih_+XCOJPUzAwtLuF2exF+vaa1woC7bYoryVXA@mail.gmail.com>
 <CAFEAcA_zfd=5bSMKwVbSk0LStcWcYxFosazhiGz0nb2z=upSHQ@mail.gmail.com>
 <CAO=notx69LpfY2uHUaPeFSrRyNkoiATZ6-JQQrATT8jXGEfQWw@mail.gmail.com>
In-Reply-To: <CAO=notx69LpfY2uHUaPeFSrRyNkoiATZ6-JQQrATT8jXGEfQWw@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Thu, 24 Feb 2022 10:52:24 -0800
Message-ID: <CAGcCb12Se254JJcKbnfyaMUTf=ym5TqOY41r4YNmvype6ozV-Q@mail.gmail.com>
Subject: Re: [PATCH v3] tests/qtest: add qtests for npcm7xx sdhci
To: Patrick Venture <venture@google.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Shengtan Mao <stmao@google.com>, Chris Rauer <crauer@google.com>
Content-Type: multipart/alternative; boundary="000000000000ef87ac05d8c81582"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -161
X-Spam_score: -16.2
X-Spam_bar: ----------------
X-Spam_report: (-16.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ef87ac05d8c81582
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

VGhlIHByb2JsZW0gaXMgcHJvYmFibHkgYmVjYXVzZSB3ZSByZWFkIGl0IGluIHVzaW5nICJzdHJj
bXAiLiBzdHJjbXANCmNvbXBhcmVzIHR3byBzdHJpbmdzIHRoYXQgZW5kIHdpdGggIlwwIi4gQnV0
IG9uZSBvZiB0aGUgc3RyaW5nIGlzIHJlYWQgaW4NCnVzaW5nIHJlYWQoKSBzbyBpdCBkaWRuJ3Qg
cmVhZCBpbiB0aGUgZW5kaW5nICdcMCcgY2hhcmFjdGVyLg0KDQpXZSBzaG91bGQgdXNlIHN0cm5j
bXAgdG8gY29tcGFyZSB0aGUgdHdvIHN0cmluZ3MuIEl0IHByb2JhYmx5IGF2b2lkcyB0aGUNCmlz
c3VlLg0KDQpPbiBUdWUsIEZlYiAyMiwgMjAyMiBhdCA1OjI4IFBNIFBhdHJpY2sgVmVudHVyZSA8
dmVudHVyZUBnb29nbGUuY29tPiB3cm90ZToNCg0KPg0KPg0KPiBPbiBNb24sIEZlYiAyMSwgMjAy
MiBhdCA1OjMwIEFNIFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4NCj4g
d3JvdGU6DQo+DQo+PiBPbiBXZWQsIDE2IEZlYiAyMDIyIGF0IDE3OjMwLCBQZXRlciBNYXlkZWxs
IDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+DQo+PiB3cm90ZToNCj4+ID4NCj4+ID4gT24gVHVl
LCA4IEZlYiAyMDIyIGF0IDE4OjE4LCBQYXRyaWNrIFZlbnR1cmUgPHZlbnR1cmVAZ29vZ2xlLmNv
bT4NCj4+IHdyb3RlOg0KPj4gPiA+DQo+PiA+ID4gRnJvbTogU2hlbmd0YW4gTWFvIDxzdG1hb0Bn
b29nbGUuY29tPg0KPj4gPiA+DQo+PiA+ID4gUmV2aWV3ZWQtYnk6IEhhbyBXdSA8d3VoYW90c2hA
Z29vZ2xlLmNvbT4NCj4+ID4gPiBSZXZpZXdlZC1ieTogQ2hyaXMgUmF1ZXIgPGNyYXVlckBnb29n
bGUuY29tPg0KPj4gPiA+IFNpZ25lZC1vZmYtYnk6IFNoZW5ndGFuIE1hbyA8c3RtYW9AZ29vZ2xl
LmNvbT4NCj4+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIFZlbnR1cmUgPHZlbnR1cmVAZ29v
Z2xlLmNvbT4NCj4+ID4gPiAtLS0NCj4+ID4NCj4+ID4NCj4+ID4NCj4+ID4gQXBwbGllZCB0byB0
YXJnZXQtYXJtLm5leHQsIHRoYW5rcy4NCj4+DQo+PiBUaGlzIGhpdHMgYXNzZXJ0aW9ucyBpbiBz
b21lIG9mIHRoZSBDSSBqb2JzLCBlZzoNCj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2pl
Y3QvcWVtdS8tL2pvYnMvMjExNjkzMjc2OQ0KPj4NCj4+IDI1OC83MTcgcWVtdTpxdGVzdCtxdGVz
dC1hcm0gLyBxdGVzdC1hcm0vbnBjbTd4eF9zZGhjaS10ZXN0IElOVEVSUlVQVA0KPj4gNjQzLjE2
cyBraWxsZWQgYnkgc2lnbmFsIDYgU0lHQUJSVA0KPj4g4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCVIOKcgA0KPj4g4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCVDQo+PiBzdGRlcnI6DQo+PiAqKiBN
ZXNzYWdlOiAwNjowNjo1MC4yMDU6IC90bXAvc2RoY2lfRjdFVEgxDQo+PiAqKg0KPj4gRVJST1I6
Li4vdGVzdHMvcXRlc3QvbnBjbTd4eF9zZGhjaS10ZXN0LmM6MTAxOnNkd3JpdGVfcmVhZDogYXNz
ZXJ0aW9uDQo+PiBmYWlsZWQ6ICghc3RyY21wKHJtc2csIG1zZykpDQo+Pg0KPj4g4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCVDQo+
PiAuLi50ZXJtaW5hdGVkLg0KPj4NCj4+IHNvIEkndmUgZHJvcHBlZCBpdCBhZ2Fpbi4NCj4+DQo+
DQo+IEknbSBzb3JyeSB0byBoZWFyIHRoYXQsIEknbGwgaGF2ZSB0byBwaWNrIHVwIHNvbWUgY3lj
bGVzIGluIGEgd2VlayBvciBzbw0KPiBhbmQgc2VlIGlmIEkgY2FuIHJlcHJvZHVjZSB0aGUgaXNz
dWUuDQo+DQo+DQo+Pg0KPj4gdGhhbmtzDQo+PiAtLSBQTU0NCj4+DQo+DQo=
--000000000000ef87ac05d8c81582
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The problem is probably because we read it in using &quot;=
strcmp&quot;.=C2=A0<span style=3D"color:rgb(32,33,36);font-family:Roboto,Ar=
ial,sans-serif;font-size:13px;letter-spacing:0.185714px">strcmp compares tw=
o strings that end with &quot;\0&quot;. But one of the string is read in us=
ing read() so it didn&#39;t read in the ending &#39;\0&#39; character.</spa=
n><p style=3D"letter-spacing:0.185714px;font-size:13px;line-height:1.38462;=
margin:0px;border:0px;font-family:Roboto,Arial,sans-serif;vertical-align:ba=
seline;word-break:break-word;outline-width:0px;color:rgb(32,33,36)">We shou=
ld use strncmp to compare the two strings. It probably avoids the issue.</p=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Tue, Feb 22, 2022 at 5:28 PM Patrick Venture &lt;<a href=3D"mailto:vent=
ure@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div d=
ir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Feb 21, 2022 at 5:30 AM Peter Maydell &lt;<a href=
=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Wed, 16 Feb 2022 at 17:30, Peter Maydell &lt;<a href=3D"mailto:peter=
.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wro=
te:<br>
&gt;<br>
&gt; On Tue, 8 Feb 2022 at 18:18, Patrick Venture &lt;<a href=3D"mailto:ven=
ture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Shengtan Mao &lt;<a href=3D"mailto:stmao@google.com" target=
=3D"_blank">stmao@google.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" ta=
rget=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; &gt; Reviewed-by: Chris Rauer &lt;<a href=3D"mailto:crauer@google.com"=
 target=3D"_blank">crauer@google.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Shengtan Mao &lt;<a href=3D"mailto:stmao@google.co=
m" target=3D"_blank">stmao@google.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@goog=
le.com" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Applied to target-arm.next, thanks.<br>
<br>
This hits assertions in some of the CI jobs, eg:<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/2116932769" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/jobs/21=
16932769</a><br>
<br>
258/717 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_sdhci-test INTERRUPT<br>
643.16s killed by signal 6 SIGABRT<br>
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80 =E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95<br>
stderr:<br>
** Message: 06:06:50.205: /tmp/sdhci_F7ETH1<br>
**<br>
ERROR:../tests/qtest/npcm7xx_sdhci-test.c:101:sdwrite_read: assertion<br>
failed: (!strcmp(rmsg, msg))<br>
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95<br>
...terminated.<br>
<br>
so I&#39;ve dropped it again.<br></blockquote><div><br></div><div>I&#39;m s=
orry to hear that, I&#39;ll have to pick up some cycles in a week or so and=
 see if I can reproduce the issue.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>
</blockquote></div>

--000000000000ef87ac05d8c81582--

