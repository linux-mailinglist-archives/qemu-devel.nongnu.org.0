Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CBD612678
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 01:20:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oov7K-0008RI-Lu; Sat, 29 Oct 2022 19:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oov7J-0008Qw-FW
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 19:19:53 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oov7H-0001LZ-Ku
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 19:19:53 -0400
Received: by mail-wr1-x432.google.com with SMTP id k4so1624886wri.9
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 16:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cpdu0IxEdSgva/y6NuJ59xA6I7HLkrRuGWmPaNmvci0=;
 b=kRpNLDuZqtnmJFG79cBr8BP0m+a+UjZZvhNKNhkBxzNx9T3LLMpzWvR8V51fivTJ7/
 ZYw3boPd5GUzkJm8w1xESAPgjkpmob9fGI9C+BQtnJMdCwsy3Yro/j1kmJ72FIfvvdp4
 sS7TYj+5qsfUmlXUvaYkP4KSgxQO8ToQHs9DtGGuTvnQeAV/KczDlMsaZGAFuLcbVurN
 RI6BkROtZYzqqVn69fbjjsIu2dMZ0OPyBoiL6wR1tCerVW4tFEnMG3HwTHfDdSqRSdX9
 jN15dXmgWdn88b6GGEHkQkHSzVCX3S6P1ofuVpdLO0QY8aXldUZq98T/AJF/htoiN6QB
 gEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cpdu0IxEdSgva/y6NuJ59xA6I7HLkrRuGWmPaNmvci0=;
 b=yLZBYWwyMfFwlRkQ6q/aFU97G1qDWrxrvPetrJuFialxgvMql50V4EZ3fbYeDwP1cH
 MxhWMv1Bapz9sHS5dArVMkZ+qOHhjYI2BxirsLViucg4XhWy9TfKrMsn6g2H6peqyncl
 xqwf0STmt5Ftkhz+vXVkmDDZjRvUe6DET5ZApl5BYp8xYRmrA2vPl+rfBfobH/WxxSxI
 bhjY3k7wUTpQWWfTvszcCVyFVD1E06aIDg7cJ63ctaddMheUx2k7EibtVd7j1GyF3WG/
 8/uoy1LM6B6SbMCYNe/pTotaeM8m2g4AVoAWKd5mxKDnQrMwFCCFRK5iK9q80lVgLMmJ
 iGTA==
X-Gm-Message-State: ACrzQf3UpBMbdfYpCXwCKYCpfe/qY9KAMAgxJOEjAZkx9QLbcguRHhOM
 /QkRIxYawy/oDk7Rp9bdlZxEKg==
X-Google-Smtp-Source: AMsMyM6Uc7PvDgoPlx3CvbQatVuYISJB0Ndj0N38/jiFY9vG766z4aND9a+Fak//E5QQFTic5L7Ocg==
X-Received: by 2002:a5d:584e:0:b0:236:6f0f:9d8 with SMTP id
 i14-20020a5d584e000000b002366f0f09d8mr3407775wrf.701.1667085589862; 
 Sat, 29 Oct 2022 16:19:49 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c190700b003b47e8a5d22sm3286866wmq.23.2022.10.29.16.19.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Oct 2022 16:19:49 -0700 (PDT)
Message-ID: <f924f4c8-3e57-c412-874e-51ff8c578d59@linaro.org>
Date: Sun, 30 Oct 2022 01:19:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 1/3] target/mips: Set CP0St_{KX, SX, UX} for Loongson-2F
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, pavel.dovgalyuk@ispras.ru
References: <20221029020030.13936-1-jiaxun.yang@flygoat.com>
 <20221029020030.13936-2-jiaxun.yang@flygoat.com>
 <5101ed53-5138-d40e-559e-1a3fd76a8c94@linaro.org>
 <2999BC9E-D7B6-4D17-9A28-E441B2C06E63@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <2999BC9E-D7B6-4D17-9A28-E441B2C06E63@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

T24gMjkvMTAvMjIgMjE6NTAsIEppYXh1biBZYW5nIHdyb3RlOg0KPiANCj4gDQo+PiAyMDIy
5bm0MTDmnIgyOeaXpSAxODo0NO+8jFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRA
bGluYXJvLm9yZz4g5YaZ6YGT77yaDQo+Pg0KPj4gT24gMjkvMTAvMjIgMDQ6MDAsIEppYXh1
biBZYW5nIHdyb3RlOg0KPj4+IEFzIHBlciAiTG9vbmdzb24tMkYgcHJvY2Vzc29yIHVzZXIg
bWFudWFsIiwgQ1AwU3Rfe0tYLCBTWCwgVVh9DQo+Pj4gc2hvdWxkIGlzIG5vdCB3cml0ZWFi
bGUgYW5kIGhhcmRjb2RlZCB0byAxLg0KPj4+IFdpdGhvdXQgdGhvc2UgYml0cyBzZXQsIGtl
cm5lbCBpcyB1bmFibGUgdG8gYWNjZXNzIFhLUEhZUyBhZGRyZXNzDQo+Pj4gc2VnbWFudC4g
U28ganVzdCBzZXQgdGhlbSB1cCBvbiBDUFUgcmVzZXQuDQo+Pj4gU2lnbmVkLW9mZi1ieTog
SmlheHVuIFlhbmcgPGppYXh1bi55YW5nQGZseWdvYXQuY29tPg0KPj4+IC0tLQ0KPj4+ICAg
dGFyZ2V0L21pcHMvY3B1LmMgfCA2ICsrKysrKw0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQ0KPj4+IGRpZmYgLS1naXQgYS90YXJnZXQvbWlwcy9jcHUuYyBiL3Rh
cmdldC9taXBzL2NwdS5jDQo+Pj4gaW5kZXggZDBhNzZiOTVmNy4uYTg3MDkwMWJmYSAxMDA2
NDQNCj4+PiAtLS0gYS90YXJnZXQvbWlwcy9jcHUuYw0KPj4+ICsrKyBiL3RhcmdldC9taXBz
L2NwdS5jDQo+Pj4gQEAgLTMwNCw2ICszMDQsMTIgQEAgc3RhdGljIHZvaWQgbWlwc19jcHVf
cmVzZXQoRGV2aWNlU3RhdGUgKmRldikNCj4+PiAgICAgICBlbnYtPkNQMF9FbnRyeUhpX0FT
SURfbWFzayA9IChlbnYtPkNQMF9Db25maWc1ICYgKDEgPDwgQ1AwQzVfTUkpKSA/DQo+Pj4g
ICAgICAgICAgICAgICAweDAgOiAoZW52LT5DUDBfQ29uZmlnNCAmICgxIDw8IENQMEM0X0FF
KSkgPyAweDNmZiA6IDB4ZmY7DQo+Pj4gICAgICAgZW52LT5DUDBfU3RhdHVzID0gKDEgPDwg
Q1AwU3RfQkVWKSB8ICgxIDw8IENQMFN0X0VSTCk7DQo+Pj4gKyAgICBpZiAoZW52LT5pbnNu
X2ZsYWdzICYgSU5TTl9MT09OR1NPTjJGKSB7DQo+Pj4gKyAgICAgICAgLyogTG9vbmdzb24t
MkYgaGFzIHRob3NlIGJpdHMgaGFyZGNvZGVkIHRvIDEgKi8NCj4+PiArICAgICAgICBlbnYt
PkNQMF9TdGF0dXMgfD0gKDEgPDwgQ1AwU3RfS1gpIHwgKDEgPDwgQ1AwU3RfU1gpIHwNCj4+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICgxIDw8IENQMFN0X1VYKTsNCj4+PiAr
ICAgIH0NCj4+DQo+PiBEb24ndCB3ZSB3YW50IHRvIHVwZGF0ZSBDUDBfU3RhdHVzX3J3X2Jp
dG1hc2sgaW4gTG9vbmdzb24tMkYNCj4+IGVudHJ5IGluIG1pcHNfZGVmc1tdIGluc3RlYWQ/
DQo+IA0KPiBXcml0ZSB0byB0aG9zZSBiaXRzIGlzIGFscmVhZHkgZGlzYWJsZWQgYnkgQ1Aw
X1N0YXR1c19yd19iaXRtYXNrLiBIb3dldmVyIHJlYWwgaGFyZHdhcmUNCj4gaGFkIHRob3Nl
IGJpdHMgc2V0IHRvIDEgYnV0IFFFTVUgZGVmYXVsdCB0aGVtIHRvIDDigKYNCj4gDQo+IEVu
YWJsZSB3cml0aW5nIHRvIHRob3NlIGJpdHMgY2FuIGFsc28gbWFrZSBrZXJuZWwgd29yayBi
dXQgaXQgbWlzbWF0Y2hlcyBhY3R1YWwgaGFyZHdhcmUNCj4gYmVoYXZpb3IuDQoNCk9uICLp
vpnoiq8gMkYg5aSE55CG5Zmo55So5oi35omL5YaMICgwLjEg54mILCAyMDA3IOW5tCA4IOac
iAAAKSINClNlY3Rpb24gNS4xMCBTdGF0dXMg5a+E5a2Y5ZmoKDEyKSAocGFnZSA1NyksDQpD
UDBfU3RhdHVzIGJpdHMgNS4uNyBhcmUgMC4NCg0KQ2FuIHlvdSBzaGFyZSB5b3VyICJMb29u
Z3Nvbi0yRiBwcm9jZXNzb3IgdXNlciBtYW51YWwiIGRvYz8NCg==

