Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC952F085B
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 17:19:26 +0100 (CET)
Received: from localhost ([::1]:47244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kydR7-0003ha-DT
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 11:19:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kydP5-0003Cv-Oo
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 11:17:19 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kydP1-0003jP-0M
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 11:17:16 -0500
Received: by mail-wm1-x329.google.com with SMTP id c133so11848771wme.4
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 08:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CVnZTec4Ng2pni4Fo3OZbsZkGjfJJrTIto13n2yjGnw=;
 b=sIFfH2eqgmPOJgmq/KYkHGLP1FjOGkKdWPv9g8s2q0bD3+iGrlM0/sNJFYWrqjPLKQ
 RmMvJxL6MT4NklGDMOL0GCfE5KWNssMbr+wRi6HruYmBmumMAtCAacEA9V0FmWV95DGM
 xRtvCFJrRtx0mXEMJB5dOFN9n/21AmCSfYUqZbzWi9NAOWCbUyW0ZLOK9xh+Q3kNoKid
 OHkc1HNDwc+q/5upl+kSsByEyyg0pHalDvgfUYr9qZGssx0hl9cEnEUSX1rSpipA2JSb
 fgGz+zwz8sXS6CB79SvrUfsjlBaWkL3ECd8dHbrciJlGkyKMqIiMENCbwhM+3i8/Z2tO
 UYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CVnZTec4Ng2pni4Fo3OZbsZkGjfJJrTIto13n2yjGnw=;
 b=lM6/hNaP3WoQDL5DOzFHpuFdyFOfqx1ZQ3N5SQxLxd+6YZR//N5PS0FtQ5N4MsiN9v
 e2LRsrQcF1DrOHgmo8yOldvwD13sLb7JLXixG4xsB/HebkxEa4u/t1vHegGVsnsp/2Gm
 blXV6p0mEONyDL3mgY6IyNYk7ntMaNS/qf1bAy/YsHAe8GERvLQiDJx5WoKZlKmkdot1
 FbmOU3TErERBAiLbJYyvHyIa9A71sTfF5hHvLU9CLqdX6UxvwiuJ95Fu29+sxbyfEZfI
 dKWhFPL1y1kLAHKJnpDeovse0a8QXm21m/cE0iq6NP/tVY8rDEI+C+M16zPg2NhAp3kc
 Gb3A==
X-Gm-Message-State: AOAM5316zJBLkret1EhICNIRqPpf6AvR5HZgPud8vHYwXvHahx/1CU1I
 V+5xcItYzGb80aOTxvitqf+wNQ+vvR4=
X-Google-Smtp-Source: ABdhPJzmLT0R+Z66xT9OuJFHBcT/4MJfLOHOGtNmgAkbjp3XHbIkRG4hARtJPDC2kqVCewDS/iDyUg==
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr11641202wmj.148.1610295433363; 
 Sun, 10 Jan 2021 08:17:13 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id n3sm20489500wrw.61.2021.01.10.08.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jan 2021 08:17:12 -0800 (PST)
Subject: Re: [PATCH] tcg: Remove unused tcg_out_dupi_vec() stub
To: Wataru Ashihara <wataash@wataash.com>, Stefan Weil <sw@weilnetz.de>
References: <20210110041039.512225-1-wataash@wataash.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dab09234-8bff-f29f-ff16-402dc2a559c3@amsat.org>
Date: Sun, 10 Jan 2021 17:17:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210110041039.512225-1-wataash@wataash.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.012,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Q2MnaW5nIFN0ZWZhbi4NCg0KT24gMS8xMC8yMSA1OjEwIEFNLCBXYXRhcnUgQXNoaWhhcmEg
d3JvdGU6DQo+IFRoaXMgZml4ZXMgdGhlIGJ1aWxkIHdpdGggLS1lbmFibGUtdGNnLWludGVy
cHJldGVyOg0KPiANCj4gICBjbGFuZyAtSWxpYnFlbXUtYXJtLXNvZnRtbXUuZmEucCAtSS4g
LUkuLiAtSXRhcmdldC9hcm0gLUkuLi90YXJnZXQvYXJtIC1JLi4vZHRjL2xpYmZkdCAtSS4u
L2NhcHN0b25lL2luY2x1ZGUvY2Fwc3RvbmUgLUlxYXBpIC1JdHJhY2UgLUl1aSAtSXVpL3No
YWRlciAtSS91c3IvaW5jbHVkZS9waXhtYW4tMSAtSS91c3IvaW5jbHVkZS9nbGliLTIuMCAt
SS91c3IvbGliL3g4Nl82NC1saW51eC1nbnUvZ2xpYi0yLjAvaW5jbHVkZSAtWGNsYW5nIC1m
Y29sb3ItZGlhZ25vc3RpY3MgLXBpcGUgLVdhbGwgLVdpbnZhbGlkLXBjaCAtV2Vycm9yIC1z
dGQ9Z251OTkgLWcgLW02NCAtbWN4MTYgLURfR05VX1NPVVJDRSAtRF9GSUxFX09GRlNFVF9C
SVRTPTY0IC1EX0xBUkdFRklMRV9TT1VSQ0UgLVdzdHJpY3QtcHJvdG90eXBlcyAtV3JlZHVu
ZGFudC1kZWNscyAtV3VuZGVmIC1Xd3JpdGUtc3RyaW5ncyAtV21pc3NpbmctcHJvdG90eXBl
cyAtZm5vLXN0cmljdC1hbGlhc2luZyAtZm5vLWNvbW1vbiAtZndyYXB2IC1Xb2xkLXN0eWxl
LWRlZmluaXRpb24gLVd0eXBlLWxpbWl0cyAtV2Zvcm1hdC1zZWN1cml0eSAtV2Zvcm1hdC15
MmsgLVdpbml0LXNlbGYgLVdpZ25vcmVkLXF1YWxpZmllcnMgLVdlbXB0eS1ib2R5IC1XbmVz
dGVkLWV4dGVybnMgLVdlbmRpZi1sYWJlbHMgLVdleHBhbnNpb24tdG8tZGVmaW5lZCAtV25v
LWluaXRpYWxpemVyLW92ZXJyaWRlcyAtV25vLW1pc3NpbmctaW5jbHVkZS1kaXJzIC1Xbm8t
c2hpZnQtbmVnYXRpdmUtdmFsdWUgLVduby1zdHJpbmctcGx1cy1pbnQgLVduby10eXBlZGVm
LXJlZGVmaW5pdGlvbiAtV25vLXRhdXRvbG9naWNhbC10eXBlLWxpbWl0LWNvbXBhcmUgLWZz
dGFjay1wcm90ZWN0b3Itc3Ryb25nIC1pc3lzdGVtIC9ob21lL3dzaC9xYy9xZW11L2xpbnV4
LWhlYWRlcnMgLWlzeXN0ZW0gbGludXgtaGVhZGVycyAtaXF1b3RlIC9ob21lL3dzaC9xYy9x
ZW11L3RjZy90Y2kgLWlxdW90ZSAuIC1pcXVvdGUgL2hvbWUvd3NoL3FjL3FlbXUgLWlxdW90
ZSAvaG9tZS93c2gvcWMvcWVtdS9hY2NlbC90Y2cgLWlxdW90ZSAvaG9tZS93c2gvcWMvcWVt
dS9pbmNsdWRlIC1pcXVvdGUgL2hvbWUvd3NoL3FjL3FlbXUvZGlzYXMvbGlidml4bCAtcHRo
cmVhZCAtZlBJQyAtaXN5c3RlbS4uL2xpbnV4LWhlYWRlcnMgLWlzeXN0ZW1saW51eC1oZWFk
ZXJzIC1ETkVFRF9DUFVfSCAnLURDT05GSUdfVEFSR0VUPSJhcm0tc29mdG1tdS1jb25maWct
dGFyZ2V0LmgiJyAnLURDT05GSUdfREVWSUNFUz0iYXJtLXNvZnRtbXUtY29uZmlnLWRldmlj
ZXMuaCInIC1NRCAtTVEgbGlicWVtdS1hcm0tc29mdG1tdS5mYS5wL3RjZ190Y2cuYy5vIC1N
RiBsaWJxZW11LWFybS1zb2Z0bW11LmZhLnAvdGNnX3RjZy5jLm8uZCAtbyBsaWJxZW11LWFy
bS1zb2Z0bW11LmZhLnAvdGNnX3RjZy5jLm8gLWMgLi4vdGNnL3RjZy5jDQo+ICAgLi4vdGNn
L3RjZy5jOjEzNjoyMDogZXJyb3I6IHVudXNlZCBmdW5jdGlvbiAndGNnX291dF9kdXBpX3Zl
YycgWy1XZXJyb3IsLVd1bnVzZWQtZnVuY3Rpb25dDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBX
YXRhcnUgQXNoaWhhcmEgPHdhdGFhc2hAd2F0YWFzaC5jb20+DQo+IC0tLQ0KPiAgdGNnL3Rj
Zy5jIHwgNyAtLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS90Y2cvdGNnLmMgYi90Y2cvdGNnLmMNCj4gaW5kZXggNDcyYmYx
NzU1Yi4uMzJkZjE0OWIxMiAxMDA2NDQNCj4gLS0tIGEvdGNnL3RjZy5jDQo+ICsrKyBiL3Rj
Zy90Y2cuYw0KPiBAQCAtMTE3LDggKzExNyw2IEBAIHN0YXRpYyBib29sIHRjZ19vdXRfZHVw
X3ZlYyhUQ0dDb250ZXh0ICpzLCBUQ0dUeXBlIHR5cGUsIHVuc2lnbmVkIHZlY2UsDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgVENHUmVnIGRzdCwgVENHUmVnIHNyYyk7DQo+
ICBzdGF0aWMgYm9vbCB0Y2dfb3V0X2R1cG1fdmVjKFRDR0NvbnRleHQgKnMsIFRDR1R5cGUg
dHlwZSwgdW5zaWduZWQgdmVjZSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
VENHUmVnIGRzdCwgVENHUmVnIGJhc2UsIGludHB0cl90IG9mZnNldCk7DQo+IC1zdGF0aWMg
dm9pZCB0Y2dfb3V0X2R1cGlfdmVjKFRDR0NvbnRleHQgKnMsIFRDR1R5cGUgdHlwZSwNCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVENHUmVnIGRzdCwgdGNnX3RhcmdldF9s
b25nIGFyZyk7DQo+ICBzdGF0aWMgdm9pZCB0Y2dfb3V0X3ZlY19vcChUQ0dDb250ZXh0ICpz
LCBUQ0dPcGNvZGUgb3BjLCB1bnNpZ25lZCB2ZWNsLA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgdmVjZSwgY29uc3QgVENHQXJnICphcmdzLA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3QgaW50ICpjb25zdF9hcmdzKTsNCj4gQEAgLTEz
MywxMSArMTMxLDYgQEAgc3RhdGljIGlubGluZSBib29sIHRjZ19vdXRfZHVwbV92ZWMoVENH
Q29udGV4dCAqcywgVENHVHlwZSB0eXBlLCB1bnNpZ25lZCB2ZWNlLA0KPiAgew0KPiAgICAg
IGdfYXNzZXJ0X25vdF9yZWFjaGVkKCk7DQo+ICB9DQo+IC1zdGF0aWMgaW5saW5lIHZvaWQg
dGNnX291dF9kdXBpX3ZlYyhUQ0dDb250ZXh0ICpzLCBUQ0dUeXBlIHR5cGUsDQo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUQ0dSZWcgZHN0LCB0Y2dfdGFyZ2V0
X2xvbmcgYXJnKQ0KPiAtew0KPiAtICAgIGdfYXNzZXJ0X25vdF9yZWFjaGVkKCk7DQo+IC19
DQo+ICBzdGF0aWMgaW5saW5lIHZvaWQgdGNnX291dF92ZWNfb3AoVENHQ29udGV4dCAqcywg
VENHT3Bjb2RlIG9wYywgdW5zaWduZWQgdmVjbCwNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCB2ZWNlLCBjb25zdCBUQ0dBcmcgKmFyZ3MsDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgaW50ICpjb25zdF9hcmdz
KQ0KDQpBRkFJSyBUQ0kgZG9lcyBub3Qgc3VwcG9ydCB2ZWN0b3JzLCB1c2luZyB0aGVtIHdv
dWxkIHRyaWdnZXINCnRjZ19kZWJ1Z19hc3NlcnQodHlwZSA9PSBUQ0dfVFlQRV9JNjQpIGlu
IHRjZ19vdXRfbW92aSgpLg0KDQpBcyB5b3VyIGFwcHJvYWNoIG1pZ2h0IGJyZWFrIG90aGVy
IGJhY2tlbmRzLCBJJ20gZ29pbmcgdG8NCnNlbmQgYW4gYWx0ZXJuYXRlIHBhdGNoIHVzaW5n
IF9fYXR0cmlidXRlX18oKHVudXNlZCkpLg0KDQpUaGFua3MgZm9yIHJlcG9ydGluZyB0aGlz
LA0KDQpQaGlsLg0K

