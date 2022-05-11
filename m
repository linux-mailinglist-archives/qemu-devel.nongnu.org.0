Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB715523093
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 12:19:41 +0200 (CEST)
Received: from localhost ([::1]:54686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nojRU-0002lS-UA
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 06:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rashmica.g@gmail.com>)
 id 1nojKl-0006A2-Nx; Wed, 11 May 2022 06:12:43 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:46916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rashmica.g@gmail.com>)
 id 1nojKk-0007GS-4d; Wed, 11 May 2022 06:12:43 -0400
Received: by mail-pg1-x52f.google.com with SMTP id l11so1361879pgt.13;
 Wed, 11 May 2022 03:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version;
 bh=n948Fp/OWP23Uggqer+1Dui8mpZ1w9qcHe6pTjU+b3o=;
 b=HOsqoQ5HoPhxhItRqzbR1KbecqfrXIOO8Dh2voWa3JhV8owzwcydz5h94IGAF+t4da
 o/5Ou8kEn/10G0g4nlnJHDw7clXPAjA8MLmipobkFq3gi9qNQa1FQNJuyP1Q7s+zSYli
 FVWS0fUqXvafrdHUz4WA7bX/EqxlqF6abwGyIdSNStkmX8XF9eS+7G9qb0Vy1NiLK8Qc
 cwp1ZC6HnUAWWZhK4F5VwFbYbDGjq8H2xRuqDs3Q+k414q0AG5+Evh3SjwJMVICpqwLA
 wAZZhBuB21ikK1xhYUraZrp9b6BW4HkFPE6XDXJ/NTtl562W/RJSUfZP7zuIZfmWs7PA
 h0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version;
 bh=n948Fp/OWP23Uggqer+1Dui8mpZ1w9qcHe6pTjU+b3o=;
 b=myypAoE5SEuome9U2BbBNvI2wGxLAHZhFy/prktRAFU/dh7DfIcgONDFezhJ+q+lQ3
 OtTycBvg1py7m0+CQNFkAmJudbdBPYx+LIGY9PtMqpBPOSNMrEoo3V126OIT3oI/Fg8p
 Hlb7k+YeySF6yXzGH2ZbZXfAFNAMKDE29pzgqYwp1Pqw0WzzH3mystYzSjVoXLnE12pA
 CKrW71dYwikOAmF96ioeK0dRp/U1N7jso/+nhLTG2yCos1AI4PxHlFAkAMWNIRMmNkWX
 kJeowLWNeEe7YKg4QUc5Ron1jV9SxcYCN11k8gc4cUGu9+l8qmCZm/XbQKC+P1oNydBg
 jNhw==
X-Gm-Message-State: AOAM533OhC9dWOOlDjUli6iv+iqnBzJVRmnO+VSh+I9ykkl7JPcvPGT1
 idwrVvv93ztSKGwiqIGGGM4=
X-Google-Smtp-Source: ABdhPJxdtVnqV4JQ/eFGUEO2OsSqQepZ7i2NINV/oKFyiyGA/fA7eEhyGzv5A0PukQw4veVRJvhtkg==
X-Received: by 2002:a63:6a88:0:b0:3c1:4a6c:be3 with SMTP id
 f130-20020a636a88000000b003c14a6c0be3mr19836590pgc.13.1652263960601; 
 Wed, 11 May 2022 03:12:40 -0700 (PDT)
Received: from [10.0.30.13] (116-255-17-40.ip4.superloop.com. [116.255.17.40])
 by smtp.googlemail.com with ESMTPSA id
 3-20020a17090a018300b001cb978f906esm1443631pjc.0.2022.05.11.03.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 03:12:39 -0700 (PDT)
Message-ID: <2257b48007dc62d21140bf7c1a5859823fe4dfa5.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] target/ppc: Rename sfprf to sfifprf where it's
 also used as set fi flag
From: Rashmica Gupta <rashmica.g@gmail.com>
To: =?ISO-8859-1?Q?V=EDctor?= Colombo <victor.colombo@eldorado.org.br>, 
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au, 
 groug@kaod.org, richard.henderson@linaro.org
Date: Wed, 11 May 2022 20:12:34 +1000
In-Reply-To: <20220510204610.100867-4-victor.colombo@eldorado.org.br>
References: <20220510204610.100867-1-victor.colombo@eldorado.org.br>
 <20220510204610.100867-4-victor.colombo@eldorado.org.br>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-17upIEHWyLwY8Pp5TNym"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=rashmica.g@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--=-17upIEHWyLwY8Pp5TNym
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIyLTA1LTEwIGF0IDE3OjQ2IC0wMzAwLCBWw61jdG9yIENvbG9tYm8gd3JvdGU6
Cj4gVGhlIGJpdCBGSSBmaXggdXNlZCB0aGUgc2ZwcmYgZmxhZyBhcyBhIGZsYWcgZm9yIHRoZSBz
ZXRfZmkgcGFyYW1ldGVyCj4gaW4gZG9fZmxvYXRfY2hlY2tfc3RhdHVzIHdoZXJlIGFwcGxpY2Fi
bGUuIE5vdywgdGhpcyBwYXRjaCByZW5hbWUKPiB0aGlzCj4gZmxhZyB0byBzZmlmcHJmIHRvIHN0
YXRlIHRoaXMgZHVhbCB1c2FnZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWw61jdG9yIENvbG9tYm8g
PHZpY3Rvci5jb2xvbWJvQGVsZG9yYWRvLm9yZy5icj4KPiAKPiAtLS0KPiAKPiB2MjogQWRkIHRo
aXMgcGF0Y2gKPiAtLS0KPiDCoHRhcmdldC9wcGMvZnB1X2hlbHBlci5jIHwgMTEyICsrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4gLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA1
NiBpbnNlcnRpb25zKCspLCA1NiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0
L3BwYy9mcHVfaGVscGVyLmMgYi90YXJnZXQvcHBjL2ZwdV9oZWxwZXIuYwo+IGluZGV4IDg4Zjll
NzU2YTUuLjcyMDkxNTBkMWEgMTAwNjQ0Cj4gLS0tIGEvdGFyZ2V0L3BwYy9mcHVfaGVscGVyLmMK
PiArKysgYi90YXJnZXQvcHBjL2ZwdV9oZWxwZXIuYwo+IEBAIC0xNjkzLDkgKzE2OTMsOSBAQCB1
aW50MzJfdCBoZWxwZXJfZWZkY21wZXEoQ1BVUFBDU3RhdGUgKmVudiwKPiB1aW50NjRfdCBvcDEs
IHVpbnQ2NF90IG9wMikKPiDCoCAqwqDCoCBuZWxzwqAgLSBudW1iZXIgb2YgZWxlbWVudHMgKDEs
IDIgb3IgNCkKPiDCoCAqwqDCoCB0cMKgwqDCoCAtIHR5cGUgKGZsb2F0MzIgb3IgZmxvYXQ2NCkK
PiDCoCAqwqDCoCBmbGTCoMKgIC0gdnNyX3QgZmllbGQgKFZzckQoKikgb3IgVnNyVygqKSkKPiAt
ICrCoMKgIHNmcHJmIC0gc2V0IEZQUkYKPiArICrCoMKgIHNmaWZwcmYgLSBzZXQgRkkgYW5kIEZQ
UkYKPiDCoCAqLwo+IC0jZGVmaW5lIFZTWF9BRERfU1VCKG5hbWUsIG9wLCBuZWxzLCB0cCwgZmxk
LCBzZnByZiwKPiByMnNwKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwK
PiArI2RlZmluZSBWU1hfQUREX1NVQihuYW1lLCBvcCwgbmVscywgdHAsIGZsZCwgc2ZpZnByZiwK
PiByMnNwKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+IMKgdm9pZCBoZWxw
ZXJfIyNuYW1lKENQVVBQQ1N0YXRlICplbnYsIHBwY192c3JfdAo+ICp4dCzCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHBjX3Zzcl90ICp4YSwgcHBjX3Zzcl90Cj4gKnhiKcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwK
PiDCoHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+IMKgwqDCoMKgwqDCoMKgwqAgXAouLi7CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gQEAgLTI3NjcsOSAr
Mjc2Nyw5IEBAIFZTWF9DVlRfRlBfVE9fRlBfVkVDVE9SKHhzY3ZkcHFwLCAxLCBmbG9hdDY0LAo+
IGZsb2F0MTI4LCBWc3JEKDApLCBmMTI4LCAxKQo+IMKgICrCoMKgIHR0cMKgwqAgLSB0YXJnZXQg
dHlwZQo+IMKgICrCoMKgIHNmbGTCoCAtIHNvdXJjZSB2c3JfdCBmaWVsZAo+IMKgICrCoMKgIHRm
bGTCoCAtIHRhcmdldCB2c3JfdCBmaWVsZAo+IC0gKsKgwqAgc2ZwcmYgLSBzZXQgRlBSRgo+ICsg
KsKgwqAgc2ZpZnByZiAtIHNldCBGUFJGCgpzZXQgRkkgYW5kIEZQUkY/CgpvdGhlcndpc2UsIFJl
dmlld2VkLWJ5OiBSYXNobWljYSBHdXB0YSA8cmFzaG1pY2EuZ0BnbWFpbC5jb20+Cg==


--=-17upIEHWyLwY8Pp5TNym
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEERkA2etWI6dXQfX34cbqTfKjlEScFAmJ7jBIACgkQcbqTfKjl
ESenugf/VCUtKhVamQPPi02MQhM6Bjsx79KQiNwQ5riw0h5KKexCMfi/3rQrHV/I
T23aSIiHub9DGTQG1Mi7icmeU9wUdvD5t7ZBg4kKcuBD3gEftnJJFVfZTvcMXpeU
2dM9ehdjd+gFyeFzO3t7bb9AbSQ0aQSdvvj9tO8ypK/Qn3KeH9ypUQmMOpsDHrrn
i6dD2A36FovSQyHEPOSfd11Pv1hWN+8Jbla+IgLy3w69boK30jq8w21mH/eDmmoj
4yB6uLVzaYR+VF1q/CWEMjO8hX+33nZzkvusmKDDhXDnDT67oEcR0oH+tbajFBbI
G+yXzI1Hwl3+G+5oPnUivPrrYHVzww==
=3ZjT
-----END PGP SIGNATURE-----

--=-17upIEHWyLwY8Pp5TNym--

