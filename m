Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639D632F0A7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:05:38 +0100 (CET)
Received: from localhost ([::1]:35888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDtR-0000JH-Dt
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIDjj-0006iF-8a
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:55:35 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:37179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIDjh-0006xU-32
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:55:34 -0500
Received: by mail-wm1-x32f.google.com with SMTP id m1so2061024wml.2
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 08:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iGE0zWMj9g0yxYkyXp2YcNV0B/SXtUYSwHLNYBgKmZw=;
 b=POTZp4OUNTZrNcRn7mH43qlXMVR6phWwhRzIucvQsHq0vPqL/hYmlnNjTu0r5QcTal
 JiRKgwvPB2vWinJ+Jx91kjppDIDTuxKHcPm+CWgH7tIUucWTvVxD3XE+dZevbQ0Tzr7a
 vzTToTU0WZiyil9quk9dzUJWFi+NFU8CUFspNQt8g7ktI+jZOfeNwoPapHaDRjkIKwfU
 P2yOTgsldFu/vtWIV8mOvKwf0CHsgnZceDadmvPp/gcOswayEVLRLC4Ef9n2TBCMyw/4
 GlWoXNgFQxLwu4ZV1JVPBTrimiM8RcCvswJ8f2qgxEGhd/T6vHXOlMSg4MzwmeFsgyzA
 KRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iGE0zWMj9g0yxYkyXp2YcNV0B/SXtUYSwHLNYBgKmZw=;
 b=WHMvzLxFVyatVw2j7ZxVFiCndUta7PZR2GpYhT9/E5kI8EWKlNg6Zdq5syJxRJezj5
 PMaE37cd2lNoyO+A+X5fOUBxgmynxbvPqi2Wo2+Omt9aQCNcjzyJaDJJj8joMcMvLFt+
 HKY4/5VQbSfNmp/zQLQNd3r4dE52RjvIQrM08ZzsR9x2BgN46hTBr6A6yY0ZjkXubGnH
 2HTr+J64xGhFS47tWtafBjuiVT513+ACAkv8wOG6RXQbYzr5+W3pEiy4JgJQMZGuj6Ut
 i2j2gALrtiNUVKwpfpqT78AYcCMrvUPw1V7RT2Ic6Ir9cG9mcGBhjApP/srVX+P5we/b
 MT6Q==
X-Gm-Message-State: AOAM531qED/UyoRILUnjM2aoXki0oUU2GFlBw430Y6Xmeq2HL3UkzDCA
 EdQXMGgArFN3YkMnVbioEGAVw45+3rY=
X-Google-Smtp-Source: ABdhPJztgK4uRLPxoNylzk4E++zZ6f5pi8kVYDN1XNbA8Wf2VBGp+n7ahASBPQGaUPmT9EKdeK9tgA==
X-Received: by 2002:a05:600c:6d4:: with SMTP id
 b20mr9965212wmn.142.1614963328851; 
 Fri, 05 Mar 2021 08:55:28 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a14sm5532221wrg.84.2021.03.05.08.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 08:55:28 -0800 (PST)
Subject: Re: [PATCH v3 00/70] TCI fixes and cleanups
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
 <87zgzheeto.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <07611530-06cb-cb13-b95f-8ee9350660ba@amsat.org>
Date: Fri, 5 Mar 2021 17:55:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87zgzheeto.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMy81LzIxIDU6MzcgUE0sIEFsZXggQmVubsOpZSB3cm90ZToNCj4gDQo+IFJpY2hhcmQg
SGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPiB3cml0ZXM6DQo+IA0K
Pj4gQ2hhbmdlcyBzaW5jZSB2MjoNCj4+ICAgKiAyMC1zb21ldGhpbmcgcGF0Y2hlcyBhcmUg
bm93IHVwc3RyZWFtLg0KPj4gICAqIEluY3JlYXNlIHRlc3RpbmcgdGltZW91dCBmb3IgdGNp
Lg0KPj4gICAqIEdpdGxhYiB0ZXN0aW5nIGZvciB0Y2kgdy8gMzItYml0IGhvc3QuDQo+IA0K
PiBIbW0gdGhhdCBmYWlscyB3aXRoIHRoaXMgYXBwbGllZCBvbiB0aGUgY3VycmVudCBtYXN0
ZXI6DQo+IA0KPiBjYyAtSWxpYnFlbXUtaTM4Ni1saW51eC11c2VyLmZhLnAgLUkuIC1JLi4g
LUl0YXJnZXQvaTM4NiAtSS4uL3RhcmdldC9pMzg2IC1JLi4vbGludXgtdXNlci9ob3N0L2kz
ODYgLUlsaW51eC11c2VyIC1JLi4vbGludXgtdXNlciAtSWxpbnV4LXVzZXIvaTM4NiAtSS4u
L2xpbnV4LXVzZXIvaTM4NiAtSS4uL2NhcHN0b25lL2luY2x1ZGUvY2Fwc3RvbmUgLUl0cmFj
ZSAtSXFhcGkgLUl1aSAtSXVpL3NoYWRlciAtSS91c3IvaW5jbHVkZS9nbGliLTIuMCAtSS91
c3IvbGliL2dsaWItMi4wL2luY2x1ZGUgLWZkaWFnbm9zdGljcy1jb2xvcj1hdXRvIC1waXBl
IC1XYWxsIC1XaW52YWxpZC1wY2ggLVdlcnJvciAtc3RkPWdudTk5IC1PMiAtZyAtaXN5c3Rl
bSAvYnVpbGRzL3N0c3F1YWQvcWVtdS9saW51eC1oZWFkZXJzIC1pc3lzdGVtIGxpbnV4LWhl
YWRlcnMgLWlxdW90ZSAuIC1pcXVvdGUgL2J1aWxkcy9zdHNxdWFkL3FlbXUgLWlxdW90ZSAv
YnVpbGRzL3N0c3F1YWQvcWVtdS9pbmNsdWRlIC1pcXVvdGUgL2J1aWxkcy9zdHNxdWFkL3Fl
bXUvZGlzYXMvbGlidml4bCAtaXF1b3RlIC9idWlsZHMvc3RzcXVhZC9xZW11L3RjZy90Y2kg
LWlxdW90ZSAvYnVpbGRzL3N0c3F1YWQvcWVtdS9hY2NlbC90Y2cgLXB0aHJlYWQgLVVfRk9S
VElGWV9TT1VSQ0UgLURfRk9SVElGWV9TT1VSQ0U9MiAtbTMyIC1EX0dOVV9TT1VSQ0UgLURf
RklMRV9PRkZTRVRfQklUUz02NCAtRF9MQVJHRUZJTEVfU09VUkNFIC1Xc3RyaWN0LXByb3Rv
dHlwZXMgLVdyZWR1bmRhbnQtZGVjbHMgLVd1bmRlZiAtV3dyaXRlLXN0cmluZ3MgLVdtaXNz
aW5nLXByb3RvdHlwZXMgLWZuby1zdHJpY3QtYWxpYXNpbmcgLWZuby1jb21tb24gLWZ3cmFw
diAtbTMyIC1Xb2xkLXN0eWxlLWRlY2xhcmF0aW9uIC1Xb2xkLXN0eWxlLWRlZmluaXRpb24g
LVd0eXBlLWxpbWl0cyAtV2Zvcm1hdC1zZWN1cml0eSAtV2Zvcm1hdC15MmsgLVdpbml0LXNl
bGYgLVdpZ25vcmVkLXF1YWxpZmllcnMgLVdlbXB0eS1ib2R5IC1XbmVzdGVkLWV4dGVybnMg
LVdlbmRpZi1sYWJlbHMgLVdleHBhbnNpb24tdG8tZGVmaW5lZCAtV2ltcGxpY2l0LWZhbGx0
aHJvdWdoPTIgLVduby1taXNzaW5nLWluY2x1ZGUtZGlycyAtV25vLXNoaWZ0LW5lZ2F0aXZl
LXZhbHVlIC1Xbm8tcHNhYmkgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nIC1mUElDIC1pc3lz
dGVtLi4vbGludXgtaGVhZGVycyAtaXN5c3RlbWxpbnV4LWhlYWRlcnMgLURORUVEX0NQVV9I
ICctRENPTkZJR19UQVJHRVQ9ImkzODYtbGludXgtdXNlci1jb25maWctdGFyZ2V0LmgiJyAn
LURDT05GSUdfREVWSUNFUz0iaTM4Ni1saW51eC11c2VyLWNvbmZpZy1kZXZpY2VzLmgiJyAt
TUQgLU1RIGxpYnFlbXUtaTM4Ni1saW51eC11c2VyLmZhLnAvdGNnX3RjaS5jLm8gLU1GIGxp
YnFlbXUtaTM4Ni1saW51eC11c2VyLmZhLnAvdGNnX3RjaS5jLm8uZCAtbyBsaWJxZW11LWkz
ODYtbGludXgtdXNlci5mYS5wL3RjZ190Y2kuYy5vIC1jIC4uL3RjZy90Y2kuYw0KPiAuLi90
Y2cvdGNpLmM6IEluIGZ1bmN0aW9uICd0Y2dfcWVtdV90Yl9leGVjJzoNCj4gLi4vdGNnL3Rj
aS5jOjMxNzozNzogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMSBvZiAnZzJoJyBtYWtlcyBw
b2ludGVyIGZyb20gaW50ZWdlciB3aXRob3V0IGEgY2FzdCBbLVdlcnJvcj1pbnQtY29udmVy
c2lvbl0NCj4gICAzMTcgfCAjIGRlZmluZSBxZW11X2xkX3ViICAgICAgbGR1Yl9wKGcyaCh0
YWRkcikpDQo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xn5+fn4NCj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
DQo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGFyZ2V0
X3Vsb25nIHtha2EgdW5zaWduZWQgaW50fQ0KPiAuLi90Y2cvdGNpLmM6OTIzOjI1OiBub3Rl
OiBpbiBleHBhbnNpb24gb2YgbWFjcm8gJ3FlbXVfbGRfdWInDQo+ICAgOTIzIHwgICAgICAg
ICAgICAgICAgIHRtcDMyID0gcWVtdV9sZF91YjsNCj4gICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICBefn5+fn5+fn5+DQo+IA0KPiBhbmQgbW9yZToNCj4gDQo+IGh0dHBzOi8v
Z2l0bGFiLmNvbS9zdHNxdWFkL3FlbXUvLS9qb2JzLzEwNzYyMzEzMjANCg0KVGhpcyBpcyBm
aXhlZCBpbiB2NCA7KQ0KDQpodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL3FlbXUtZGV2
ZWxAbm9uZ251Lm9yZy9tc2c3ODM0NTIuaHRtbA0K

