Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0041969C81A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:57:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2ut-0003G9-9c; Mon, 20 Feb 2023 04:57:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU2ui-0003AG-Vn
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:56:53 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU2ug-0006Ld-Qi
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:56:52 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l25so67144wrb.3
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IZg3lKf2HbHV9AnZrOA5Vd5RB7p1R/QroPj+TVl+N24=;
 b=iIXOV2TZi19jJXa9d76rBJhnYUh1cp0Y/6siNE4V+Wx5qjBpzceyd6374WlB1O/RDc
 4TUx+1pUmhNOn06myh9vZNg4veII4NVlctQ49eMF3qnFQ3ylFbk2GE5tGL3WhGyOrpj+
 nvZ5ZiUoapV0yNmGVmgPJu96Sk1UjUinyH6U9qohBh0VQTFT8kuGPv1XfYjOicn1jBNB
 /11ZmVTfg3gw65r3KbgHZLz4M/1enwUETJ7TnuAQh0KeeW+Ki9EXDs93ncaMuOkUsqqY
 4CnazMfEnePzP1+HjnQmz4LquEztmD0d2WLECoOXKROmyKbLqx9nXN6ie3Qgt/XZO2GW
 OkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IZg3lKf2HbHV9AnZrOA5Vd5RB7p1R/QroPj+TVl+N24=;
 b=2iHDo7voap1nAvTqSCg/t7+DMA8rNlfQ+Pu+Fa5Hkj3za3Qicc8h3pP4KaTX56FEv+
 qKCai3eNnoWLvDdMc5tvAv3ylgCJgzTdzdDcN5UIrSmxyC56OvxqVNEE21iiSEjwrf/f
 2/MmkAPISI7jF7O1FBIyAl6Pmhz9XxrsXC5QbX678D+7tLvcwOxrL2qaYKFTV1cPxi9Q
 i1ZZ8ndWmYcb+XXTSeO31vrtqSA0y6cZH2zgGkJlI4x63DhBjiRgtDwrDhSdZZjWLvBK
 mp1W4ykkEdSkbBTz8zyBaonjmjBu3gRf4HwGxKmVVGpy6PpiHc60I64g6BNCkFLDYdUh
 OMjw==
X-Gm-Message-State: AO0yUKVh0PdVokD+IF9L58/+5Hoq5N7ABlXXQ+5t+KelTRsh3ekcDTem
 QZlF/T8ll+2ft30JTeGi0Yh7Cw==
X-Google-Smtp-Source: AK7set84uwKYQNVRn4hlXodc7rXzdqnTJw7xUGTc40gT5Wdr3yscmdOlDQEEGn+zSIgUwyt+hrJyZw==
X-Received: by 2002:a5d:404e:0:b0:2c5:5890:36a0 with SMTP id
 w14-20020a5d404e000000b002c5589036a0mr1114702wrp.27.1676887009283; 
 Mon, 20 Feb 2023 01:56:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5cc:caa0:de33:fc7:48d9:9d12?
 ([2a01:e0a:5cc:caa0:de33:fc7:48d9:9d12])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a5d4f81000000b002c5526234d2sm439812wru.8.2023.02.20.01.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 01:56:48 -0800 (PST)
Message-ID: <e20d6871-09bc-390c-c319-47049c5ab189@linaro.org>
Date: Mon, 20 Feb 2023 10:56:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 4/4] target/ppc: fix warning with clang-15
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20230216134911.6803-1-pierrick.bouvier@linaro.org>
 <20230216134911.6803-5-pierrick.bouvier@linaro.org>
 <fa58c710-d362-c472-2858-b6bbe75fbcec@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <fa58c710-d362-c472-2858-b6bbe75fbcec@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

T24gMi8xNy8yMyAxODoyMywgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDE2LzIvMjMgMTQ6NDksIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBXaGVuIGNvbXBp
bGluZyBmb3Igd2luZG93cy1hcm02NCB1c2luZyBjbGFuZy0xNSwgaXQgcmVwb3J0cyBhIHNv
bWV0aW1lcw0KPj4gdW5pbml0aWFsaXplZCB2YXJpYWJsZS4gVGhpcyBzZWVtcyB0byBiZSBh
IGZhbHNlIHBvc2l0aXZlLCBhcyBhIGRlZmF1bHQNCj4+IGNhc2UgZ3VhcmRzIHN3aXRjaCBl
eHByZXNzaW9ucywgcHJldmVudGluZyB0byByZXR1cm4gYW4gdW5pbml0aWFsaXplZA0KPj4g
dmFsdWUsIGJ1dCBjbGFuZyBzZWVtcyB1bmhhcHB5IHdpdGggYXNzZXJ0KDApIGRlZmluaXRp
b24uDQo+Pg0KPj4gQ2hhbmdlIGNvZGUgdG8gZ19hc3NlcnRfbm90X3JlYWNoZWQoKSBmaXgg
dGhlIHdhcm5pbmcuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogUGllcnJpY2sgQm91dmllciA8
cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0KPj4gLS0tDQo+PiAgICB0YXJnZXQvcHBj
L2RmcF9oZWxwZXIuYyB8IDQgKystLQ0KPj4gICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Bw
Yy9kZnBfaGVscGVyLmMgYi90YXJnZXQvcHBjL2RmcF9oZWxwZXIuYw0KPj4gaW5kZXggY2Mw
MjQzMTZkNS4uMGE0MGJjZmVlMyAxMDA2NDQNCj4+IC0tLSBhL3RhcmdldC9wcGMvZGZwX2hl
bHBlci5jDQo+PiArKysgYi90YXJnZXQvcHBjL2RmcF9oZWxwZXIuYw0KPj4gQEAgLTEyMSw3
ICsxMjEsNyBAQCBzdGF0aWMgdm9pZCBkZnBfc2V0X3JvdW5kX21vZGVfZnJvbV9pbW1lZGlh
dGUodWludDhfdCByLCB1aW50OF90IHJtYywNCj4+ICAgICAgICAgICAgY2FzZSAzOiAvKiB1
c2UgRlBTQ1Igcm91bmRpbmcgbW9kZSAqLw0KPj4gICAgICAgICAgICAgICAgcmV0dXJuOw0K
Pj4gICAgICAgICAgICBkZWZhdWx0Og0KPj4gLSAgICAgICAgICAgIGFzc2VydCgwKTsgLyog
Y2Fubm90IGdldCBoZXJlICovDQo+PiArICAgICAgICAgICAgZ19hc3NlcnRfbm90X3JlYWNo
ZWQoKTsgLyogY2Fubm90IGdldCBoZXJlICovDQo+IA0KPiBJZiB5b3UgcmVzcGluIHRvIHVw
ZGF0ZSB0aGUgY29tbWVudHMgdG8gbWF0Y2ggUUVNVSBzdHlsZSAoYWxzbw0KPiB0aGUgLy8g
aW4gY29uZmlndXJlKSwgcGxlYXNlIHJlbW92ZSB0aGlzIHBvaW50bGVzcyBjb21tZW50IGhl
cmUuDQoNClN1cmUsIHdpbGwgZG8uDQo=

